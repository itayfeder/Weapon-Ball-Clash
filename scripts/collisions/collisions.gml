function reflect(_vector_x, _vector_y, _normal_x, _normal_y) {
	var dp = _vector_x * _normal_x + _vector_y * _normal_y;
	reflected_x = _vector_x - 2 * dp * _normal_x
	reflected_y = _vector_y - 2 * dp * _normal_y
	return [reflected_x, reflected_y]
}
