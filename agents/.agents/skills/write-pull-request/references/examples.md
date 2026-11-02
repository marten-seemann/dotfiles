# Pull request examples

These are writing references, not recommendations about today's APIs. Read the entries that match the new pull request. Short examples include their complete title and body; longer ones have a labeled excerpt and a link to the full PR. Preserve the new PR's facts rather than copying old facts or phrasing mechanically.

Dates are creation dates. Bot-generated summaries (CodeRabbit, Macroscope) are omitted.

## A link can be the whole body

Source: [webtransport-go#20](https://github.com/quic-go/webtransport-go/pull/20), 2022-06-28. Complete title and body:

**make the quic.Config on the Dialer configurable**

> Fixes #19.

The issue already explains the need, and the title says what the PR does. Most PRs that fix a filed issue need nothing more.

Source: [webtransport-go#172](https://github.com/quic-go/webtransport-go/pull/172), 2025-06-16. Complete title and body:

**avoid using mocks in tests**

> ~~Depends on #171.~~

The dependency was struck through once it merged, rather than deleted, so the history stays readable.

## Trivial refactor: no functional change

Source: [quic-go#5889](https://github.com/quic-go/quic-go/pull/5889), 2026-10-02. Complete title and body:

**congestion: move MinPacingDelay constant from the protocol package**

> No functional change expected.

Moving a constant obviously can't change behavior, so the phrase is the whole body. For a refactor where that isn't obvious, such as removing code that looks necessary, leave the phrase out and explain in a sentence why the code was redundant.

## Why, when the title doesn't say it

Source: [masque-go#45](https://github.com/quic-go/masque-go/pull/45), 2024-06-30. Complete title and body:

**don't embed a http3.Server in the Proxy**

> The proxy isn't doing anything with the `http3.Server`. There's no reason to embed it.

Source: [connect-ip-go#43](https://github.com/quic-go/connect-ip-go/pull/43), 2025-06-30. Complete title and body:

**work around Docker’s non-deterministic network interface assignment**

> The proxy is set up with two Docker networks. This creates two network interfaces, eth0 and eth1, in the proxy container. However, the setup is not deterministic: We don't know which interface will be assigned to which network.
>
> To restore determinism, we therefore need to determine if eth0 is facing the client and eth1 is facing the server, or vice versa.

The problem and the approach, in prose. Nothing about which files or functions changed.

## Spec work: state what's deliberately left out

Source: [masque-go#71](https://github.com/quic-go/masque-go/pull/71), 2024-09-28. Complete title and body:

**implement parsing of the CONNECT-IP request**

> Part of #63. Depends on #70.
>
> This intentionally omits requests that define URI template variables, since we don't support IP flow forwarding yet.

Relationships first, then the scope limit a reviewer would otherwise flag as a bug.

## API change: consequences and rejected alternatives

Source: [masque-go#80](https://github.com/quic-go/masque-go/pull/80), 2024-12-03. Complete title and body:

**introduce a basic tracer**

> Resolves #59, in a more useful way than #62. Specifically, it allows the application to get an instantaneous notification about every proxied packet, not only an aggregate at the end of the connection.
>
> Unfortunately, this is quite an annoying API change. The alternative would be to have a single `Tracer` on the `Proxy`, but this is way less powerful: it would only be possible to get the sum of all proxied connections.
>
> ---
>
> **TODO**: add a few basic tests

It says why this design beats the competing PR, admits the cost, names the alternative and why it lost, and marks what's unfinished.

Source: [masque-go#50](https://github.com/quic-go/masque-go/pull/50), 2024-07-04. Complete title and opening excerpt:

**add a DialAddr method to the client**

> Fixes #49.
>
> This change means that we don't have anything meaningful to return from `proxiedConn.RemoteAddr`, since we never learn the target's IP address.

The rest explains why there's no good fix and what a future feature could and couldn't improve. A consequence the diff doesn't make visible is exactly what the body is for.

## Design tradeoff in a simplification

Source: [webtransport-go#230](https://github.com/quic-go/webtransport-go/pull/230), 2026-01-06. Complete title and body:

**simplify stream buffering logic in the session manager**

> Due to packet reordering, streams might be received for a session that was not yet established. In that case, we buffer them for a limited amount of time.
>
> This change adjusts the timer logic. Instead of running a timer per stream, we now run one timer per (unestablished) session. This means that streams might potentially be buffered for a longer time, but it simplifies the logic. It's not a security risk, since the total number is still limited by the stream limit on the QUIC layer.

One sentence of context, then the behavior change, its downside, and why the downside is acceptable.

## Open uncertainty, in first person

Source: [masque-go#19](https://github.com/quic-go/masque-go/pull/19), 2024-05-09. Complete title and opening sentence:

**introduce a connect-udp address type**

> I'm not sure if this is the right thing to do.

The body goes on to link the exact quic-go line the change works around and asks whether that check should go. Real doubt is stated up front instead of being hidden behind confident prose.

## Dependency on an unreleased version

Source: [webtransport-go#138](https://github.com/quic-go/webtransport-go/pull/138), 2024-04-11. Complete title and body:

**update quic-go, use the new HTTP/3 API**

> This PR is updating quic-go to the current `master` of quic-go. Usually, we'd wait for the final release, but these are pretty dramatic changes, so it pays off to get them in now. There will be more changes to quic-go's http3 package before the v0.43 release.
>
> We'll need to do another update before we cut the next webtransport-go release.

## Performance: real numbers, good or bad

Source: [quic-go#5459](https://github.com/quic-go/quic-go/pull/5459), 2025-11-24. Complete title and body:

**handshake: pass cipherSuite by value instead of pointer**

> Part of #3663.
>
> This saves 5 allocations per handshake (per side):
> ```
> name          old time/op    new time/op    delta
> Handshake-16     598µs ± 3%     598µs ± 1%    ~     (p=0.905 n=10+9)
>
> name          old alloc/op   new alloc/op   delta
> Handshake-16     236kB ± 0%     236kB ± 0%  -0.14%  (p=0.000 n=10+10)
>
> name          old allocs/op  new allocs/op  delta
> Handshake-16     2.19k ± 0%     2.18k ± 0%  -0.40%  (p=0.000 n=10+10)
> ```

Source: [quic-go#5461](https://github.com/quic-go/quic-go/pull/5461), 2025-11-25. Complete title and opening sentence:

**handshake: switch to crypto/hkdf instead of golang.org/x/crypto/hkdf**

> Unfortunately, this allocates more than the existing version:

It's followed by the full benchstat output. A regression is reported as directly as an improvement would be.

## Work in progress: a checklist of what's missing

Source: [webtransport-go#142](https://github.com/quic-go/webtransport-go/pull/142), 2024-04-21. Complete title and body:

**add support for datagrams**

> Fixes #8. Closes #99.
>
> To get this merged:
> - [x] merge https://github.com/quic-go/quic-go/pull/4452
> - [x] add tests

## Rejected: narrating the diff and the test run

Source: [quic-go#5837](https://github.com/quic-go/quic-go/pull/5837), 2026-09-01, closed. Agent-written excerpt:

> This adds integration coverage comparing incoming requests parsed by the standard library HTTP/2 server and the quic-go HTTP/3 server. It covers GET, HEAD, POST with a body and trailer, escaped paths, OPTIONS *, and regular CONNECT, and compares the protocol-independent request fields.
>
> […]
>
> Tests:
> - go test ./http3 -count=1
> - go test ./integrationtests/self -run ^TestHTTPServerRequestParsing$ -count=1 -version=1

Its replacement, [quic-go#5839](https://github.com/quic-go/quic-go/pull/5839). Complete title and body:

**http3: parse requests like net/http**

> This PR effectively reverts changes we made earlier this year, in particular #5554. @qiulaidongfeng @pjebs
>
> While I don't think that these changes were wrong, there are arguably multiple ways we can fill out an `http.Request`, with no one way being more or less correct than the other. We should therefore strive to replicate what the standard library does as much as possible.
>
> This PR adds an integration test that compares request parsing between HTTP/2 and HTTP/3.

The rejected version lists test cases and commands. The kept version says what it reverts, notifies the people who made the earlier change, and explains the principle behind it. The test gets one sentence.

## Rejected: validation notes and attribution

Source: [quic-go#6096](https://github.com/quic-go/quic-go/pull/6096), 2026-11-01. First draft:

> Allocate the final salt-prefixed token buffer before sealing, avoiding the temporary ciphertext allocation. The token format and key derivation stay the same.
>
> For a 32-byte payload, `BenchmarkTokenProtectorNewToken` drops from 21 to 20 allocs/op and from 2,681 to 2,617 B/op. Validated empty, short, and long token roundtrips and the handshake package on Go 1.26.5 and 1.27, including relevant FIPS tests.
>
> Refs #3663. Implemented with Codex.

Revised:

> Seal directly into the salt buffer instead of sealing into a temporary slice and appending. The token format is unchanged.
>
> Saves one allocation per token (21 → 20 allocs/op for a 32-byte payload).
>
> Refs #3663. Implemented with Codex.

The revision drops the list of what was tested and states the mechanism and the saving in plain words. The attribution line it kept is no longer wanted, and `Part of #3663.` is the usual wording for a tracking issue.

Source: [quic-go#6065](https://github.com/quic-go/quic-go/pull/6065), 2026-10-31. First draft:

> Log the required headers array, including an empty array, instead of header_fields. Encode invalid names and binary or invalid values using name_bytes and value_bytes; existing redaction still runs before encoding.
>
> Validation: `go test ./http3/qlog`.
>
> Authored by Codex.

Revised:

> HEADERS frames now always log a `headers` array. Header validation flags invalid names and values, which are logged as `name_bytes` / `value_bytes`, as are non-UTF-8 ones. Redacted values are logged as strings.

The revision describes the resulting behavior rather than a sequence of edits, puts identifiers in backticks, and drops the validation and attribution lines.

## Accuracy: every claim must match the final diff

Source: [quic-go#6116](https://github.com/quic-go/quic-go/pull/6116), 2026-11-02. Complete title and final body:

**interop: cross-compile the Docker image instead of building under QEMU**

> The arm64 image was compiled under QEMU emulation. The builder stage now runs on the build platform and cross-compiles via `GOOS`/`GOARCH`. With the last `RUN` in the final stage replaced by `COPY --chmod`, nothing runs emulated, so QEMU is dropped from the workflow.
>
> Building the image takes ~1 min instead of ~5 min.

The first draft said only that the arm64 build took "~5 minutes per CI run" and that it now cross-compiles. The revision adds the `COPY --chmod` step that makes QEMU unnecessary, and the measured result.

In [quic-go#6060](https://github.com/quic-go/quic-go/pull/6060), a later commit reverted logging time-threshold loss timers as `loss_timeout`, and the sentence describing it was removed from the body right after. Check each sentence against the final diff before returning the draft, and again after every push that changes the approach.
