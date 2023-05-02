# POSIX: eliminate duplicate paths without changing their order.
#
unique_paths() {
   set -- $(echo "$1" | tr ':' ' ')
   added_paths=""
   unique_path=""
   for curpath; do
      normalized_path="${curpath%/}"
      case "$added_paths" in
         *"$normalized_path"*) ;;
         *) if [ -z "$unique_path" ]; then
            unique_path="$normalized_path"
         else
            unique_path="$unique_path:$normalized_path"
         fi
         added_paths="$added_paths:$normalized_path"
         ;;
      esac
   done
   echo "$unique_path"
   }
