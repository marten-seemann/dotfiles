if [ `which rbenv` 2> /dev/null ]; then
  eval "$(rbenv init - zsh)"

  export RUBY_HEAP_MIN_SLOTS=1000000
  export RUBY_HEAP_SLOTS_INCREMENT=1000000
  export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
  export RUBY_GC_MALLOC_LIMIT=1000000000
  export RUBY_HEAP_FREE_MIN=500000
fi
