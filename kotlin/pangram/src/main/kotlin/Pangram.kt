import kotlin.collections.*

object Pangram {

    fun isPangram(input: String): Boolean {
        return input.toLowerCase().toSet().filter{ it.isLetter() }
            .count() == 26
    }

}
