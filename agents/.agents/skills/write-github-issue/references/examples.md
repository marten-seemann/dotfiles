# Issue examples

These are writing references, not recommendations about today's APIs. Read the entries that match the new issue. Short examples include their complete title and body; longer ones have a labeled excerpt and a link to the full issue. Preserve the new issue's facts rather than copying old facts or phrasing mechanically.

Dates are creation dates. The examples below from before 2023 have no recorded body edits after 2022. Whitespace is normalized, and the log excerpt is de-indented.

## Bug: condition and evidence

Source: [quic-go#1701](https://github.com/quic-go/quic-go/issues/1701), 2019-01-01. Complete title and body:

**panic when the received packet is too small to take the sample**

> slice bounds out of range:
> https://github.com/lucas-clemente/quic-go/blob/8b2eb76b75921c947fa020d714d775b2f367fc4c/packet_unpacker.go#L62-L68

The title supplies the triggering condition. The body adds the diagnostic and exact code location. There is no need to surround this with a bug-report template.

Source: [quic-go#2941](https://github.com/quic-go/quic-go/issues/2941), 2020-12-16. Complete title and opening excerpt:

**run loop is blocked by sending packets**

> `WriteTo` comes with no guarantees when it will unblock.

The rest follows the consequences: a blocked write stops packet reception, fills the receive queue, and eventually drops packets. This is a compact causal explanation, without prescribing a fix.

## Bug: cut it down to the trigger and the failure

Source: [quic-go#5996](https://github.com/quic-go/quic-go/issues/5996), 2026-10-27. Rejected first draft:

> If writing a DATA frame fails partway, e.g. because the write deadline expired, the next write starts a new DATA frame. The peer then parses the new frame header as payload of the incomplete frame. This affects both `responseWriter.Write` ([code](…)) and `Stream.Write` ([code](…)): they write the frame header and the payload separately, and don't keep track of what was written.
>
> The same happens when the handler returns: the server closes the stream ([code](…)) instead of resetting it, so the response ends with a truncated DATA frame.
>
> #5993 fixes this for the HEADERS frame, which is owned by the response writer. DATA frames are harder, since the payload belongs to the caller: we'd need to track how many payload bytes the current frame is still missing.

Complete title and body as filed:

**http3: writing after a partially written DATA frame corrupts the stream**

> For example, when `ResponseWriter.Write` or `Stream.Write` hits the write deadline and is retried, the retry starts a new DATA frame.

The filed version keeps only the trigger and the failure. Everything that was cut was accurate: the mechanism, links to functions already named in the text, a secondary consequence, a related PR, and what a fix would need. Being accurate isn't a reason to keep a sentence.

## Feature: the capability in the title, the reason in the body

Source: [quic-go#2573](https://github.com/quic-go/quic-go/issues/2573), 2020-05-27. Complete title and body:

**allow users to set a key used to encrypt tokens**

> Otherwise NEW_TOKEN tokens won't survive a server restart.

The body adds exactly the reason that the title doesn't contain.

Source: [webtransport-go#39](https://github.com/quic-go/webtransport-go/issues/39), 2022-10-25. Complete title and body:

**use HTTP/3 capsules for closing the connection**

> This will allow us to transmit the error code.

The protocol mechanism is named directly; its useful consequence is one sentence.

## API: a small proposal can stay small

Source: [masque-go#14](https://github.com/quic-go/masque-go/issues/14), 2024-05-06. Complete title and body:

**consider exposing the URI template as a string**

> Then using this particular URI template library would remain an implementation detail.

The tentative title and one concrete design benefit are sufficient. An API label does not imply a full design document.

## API: a substantive proposal needs substantive detail

Source: [quic-go#3494](https://github.com/quic-go/quic-go/issues/3494), 2022-08-03. Complete title and excerpt:

**redesign the Retry Token API**

> I suggest replacing the `AcceptToken` callback with 3 config options:

The full issue first enumerates concrete problems with the existing callback. It then defines the replacement controls, their invocation conditions, defaults and rationale, and address-validation behavior. It ends with specific unresolved use cases. The detail exists to settle semantics; there is no generic benefits section or ceremonial conclusion.

For a larger pre-2023 example, read [quic-go#2067](https://github.com/quic-go/quic-go/issues/2067): it connects a protocol constraint to incorrect current behavior, proposes an API, and spells out application responsibilities and state handling. Its sections help organize distinct reasoning.

For an exceptional change spanning several APIs, [quic-go#3727](https://github.com/quic-go/quic-go/issues/3727), from 2023, includes concrete declarations and a migration guide. Do not copy its length for ordinary API requests.

## API: leave an unresolved design unresolved

Source: [connect-ip-go#16](https://github.com/quic-go/connect-ip-go/issues/16), 2024-11-09. Complete title and closing excerpt:

**optimistic connection setup**

> At this point, I don't have a concrete API proposal.

The preceding sentences explain the capability and the application's need to observe acceptance or rejection. It records a useful requirement without pretending that a design has been settled.

Another example is [quic-go#3145](https://github.com/quic-go/quic-go/issues/3145), from 2021: a concrete application need, the API limitation preventing it, and a focused request for design advice.

## Flaky test: show the failure

Source: [webtransport-go#11](https://github.com/quic-go/webtransport-go/issues/11), 2022-06-25. Complete title and a diagnostic excerpt:

**flaky TestStreamsImmediateReset**

```text
Error: Received unexpected error:
Application error 0x105: received HTTP/3 frame on bidirectional stream
```

The original body consists of failure output. The test name and actual diagnostic carry the issue; an invented root cause would weaken it. Include a failing-run link when one is available.

## Performance: state the missing behavior

Source: [qpack#8](https://github.com/quic-go/qpack/issues/8), 2019-09-10. Complete title and body:

**use the static table**

> We currently only use the static table for decoding, but not for encoding.

One precise implementation gap is more useful than a general paragraph about improving performance.

## Cleanup: list only the scope that needs clarification

Source: [quic-go#1277](https://github.com/quic-go/quic-go/issues/1277), 2018-04-03. Complete title and body:

**use in-place decryption when unpacking**

> This applies to:
>
> * the packet unpacker
> * the unpacker for TLS Initial packets

The list names two affected paths. It is scope information, not a standard checklist.

## Standards: a title and the authoritative reference

Source: [quic-go#3522](https://github.com/quic-go/quic-go/issues/3522), 2022-08-24. Complete title and body:

**http3: implement HTTP Datagrams and Capsules (RFC 9297)**

> https://www.rfc-editor.org/rfc/rfc9297.html

The title states the task and subsystem; the linked specification supplies the details. Avoid restating the specification when there is no implementation-specific question to add.

## Documentation: record the useful open thought

Source: [docs#21](https://github.com/quic-go/docs/issues/21), 2024-03-29. Complete title and body:

**improve description of stream states**

> Maybe even a diagram? Not sure how that would look like though.

The note distinguishes a possible presentation idea from an agreed plan. Don't turn it into a mandatory diagram or an invented documentation outline.

## Dependency tracking: just name the blocker

Source: [masque-go#22](https://github.com/quic-go/masque-go/issues/22), 2024-05-10. Complete title and body:

**implement write deadlines**

> Blocked on https://github.com/quic-go/quic-go/issues/4505.

The title states the work and the body records the dependency. Nothing else is needed unless there is additional context.

## A title can be sufficient

Source: [webtransport-go#19](https://github.com/quic-go/webtransport-go/issues/19), 2022-06-28. Complete title:

**make it possible to set a quic.Config for the Dialer**

The original body is empty. This works because the requested capability is already concrete. It is not permission to omit the conditions or evidence needed to understand a new bug.
