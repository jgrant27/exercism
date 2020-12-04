object ResistorColor {

    val colors = listOf("black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white")

    fun colorCode(input: String): Int {
        return colors.indexOf(input)
    }

    fun colors(): List<String> {
        return colors
    }

}
