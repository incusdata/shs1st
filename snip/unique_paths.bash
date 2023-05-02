# BASH & ZSH: eliminate duplicate paths without changing their order.
# This makes use of Bash and Zsh array variables. Even then, there are
# incompatibilities between the two regarding array syntax and `read`.
#
unique_paths() {
   if [ -n "$BASH_VERSION" ]; then
      IFS=: read -r -a path_array <<< "$1"
   else
      path_array=("${(@s/:/)1}")
   fi
   declare -A added_paths
   unique_path=""
   for path in "${path_array[@]}"; do
      normalized_path="${path%/}"
      if [ -z "${added_paths[$normalized_path]}" ]; then
         if [ -z "$unique_path" ]; then
            unique_path="$normalized_path"
         else
            unique_path="$unique_path:$normalized_path"
         fi
         added_paths[$normalized_path]=1
      fi
   done

   if [ -n "$unique_path" ]; then
      echo "$unique_path"
   fi
   }
