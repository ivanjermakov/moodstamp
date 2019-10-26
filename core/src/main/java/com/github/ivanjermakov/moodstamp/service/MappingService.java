package com.github.ivanjermakov.moodstamp.service;

import org.modelmapper.ModelMapper;
import org.modelmapper.config.Configuration;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class MappingService {

	private final ModelMapper modelMapper;

	public MappingService() {
		modelMapper = new ModelMapper();
		modelMapper
				.getConfiguration()
				.setFieldMatchingEnabled(true)
				.setMethodAccessLevel(Configuration.AccessLevel.PUBLIC);
	}

	public <S, T> T map(S source, Class<T> targetClass) {
		return modelMapper.map(source, targetClass);
	}

	public <S, T> List<T> mapAll(Collection<? extends S> sourceList, Class<T> targetClass) {
		return sourceList.stream()
				.map(e -> map(e, targetClass))
				.collect(Collectors.toList());
	}

}
