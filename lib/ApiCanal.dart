class Canal {
	String kind;
	String etag;
	String regionCode;
	PageInfo pageInfo;
	List<Items> items;

	Canal({this.kind, this.etag, this.regionCode, this.pageInfo, this.items});

	Canal.fromJson(Map<String, dynamic> json) {
		kind = json['kind'];
		etag = json['etag'];
		regionCode = json['regionCode'];
		pageInfo = json['pageInfo'] != null ? new PageInfo.fromJson(json['pageInfo']) : null;
		if (json['items'] != null) {
			items = new List<Items>();
			json['items'].forEach((v) { items.add(new Items.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['kind'] = this.kind;
		data['etag'] = this.etag;
		data['regionCode'] = this.regionCode;
		if (this.pageInfo != null) {
      data['pageInfo'] = this.pageInfo.toJson();
    }
		if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class PageInfo {
	int totalResults;
	int resultsPerPage;

	PageInfo({this.totalResults, this.resultsPerPage});

	PageInfo.fromJson(Map<String, dynamic> json) {
		totalResults = json['totalResults'];
		resultsPerPage = json['resultsPerPage'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['totalResults'] = this.totalResults;
		data['resultsPerPage'] = this.resultsPerPage;
		return data;
	}
}

class Items {
	String kind;
	String etag;
	Id id;
	Snippet snippet;

	Items({this.kind, this.etag, this.id, this.snippet});

	Items.fromJson(Map<String, dynamic> json) {
		kind = json['kind'];
		etag = json['etag'];
		id = json['id'] != null ? new Id.fromJson(json['id']) : null;
		snippet = json['snippet'] != null ? new Snippet.fromJson(json['snippet']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['kind'] = this.kind;
		data['etag'] = this.etag;
		if (this.id != null) {
      data['id'] = this.id.toJson();
    }
		if (this.snippet != null) {
      data['snippet'] = this.snippet.toJson();
    }
		return data;
	}
}

class Id {
	String kind;
	String channelId;

	Id({this.kind, this.channelId});

	Id.fromJson(Map<String, dynamic> json) {
		kind = json['kind'];
		channelId = json['channelId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['kind'] = this.kind;
		data['channelId'] = this.channelId;
		return data;
	}
}

class Snippet {
	String publishedAt;
	String channelId;
	String title;
	String description;
	Thumbnail thumbnails;
	String channelTitle;
	String liveBroadcastContent;

	Snippet({this.publishedAt, this.channelId, this.title, this.description, this.thumbnails, this.channelTitle, this.liveBroadcastContent});

	Snippet.fromJson(Map<String, dynamic> json) {
		publishedAt = json['publishedAt'];
		channelId = json['channelId'];
		title = json['title'];
		description = json['description'];
		thumbnails = json['thumbnails'] != null ? new Thumbnail.fromJson(json['thumbnails']) : null;
		channelTitle = json['channelTitle'];
		liveBroadcastContent = json['liveBroadcastContent'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['publishedAt'] = this.publishedAt;
		data['channelId'] = this.channelId;
		data['title'] = this.title;
		data['description'] = this.description;
		if (this.thumbnails != null) {
      data['thumbnails'] = this.thumbnails.toJson();
    }
		data['channelTitle'] = this.channelTitle;
		data['liveBroadcastContent'] = this.liveBroadcastContent;
		return data;
	}
}

class Thumbnail {
	Default defaul;
	Default medium;
	Default high;

	Thumbnail({this.defaul, this.medium, this.high});

	Thumbnail.fromJson(Map<String, dynamic> json) {
		defaul = json['default'] != null ? new Default.fromJson(json['default']) : null;
		medium = json['medium'] != null ? new Default.fromJson(json['medium']) : null;
		high = json['high'] != null ? new Default.fromJson(json['high']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.defaul != null) {
      data['default'] = this.defaul.toJson();
    }
		if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
		if (this.high != null) {
      data['high'] = this.high.toJson();
    }
		return data;
	}
}

class Default {
	String url;

	Default({this.url});

	Default.fromJson(Map<String, dynamic> json) {
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['url'] = this.url;
		return data;
	}
}

class Thumbnails {
	Default defaul;
	Default medium;
	Default high;

	Thumbnails({this.defaul, this.medium, this.high});

	Thumbnails.fromJson(Map<String, dynamic> json) {
		defaul = json['default'] != null ? new Default.fromJson(json['default']) : null;
		medium = json['medium'] != null ? new Default.fromJson(json['medium']) : null;
		high = json['high'] != null ? new Default.fromJson(json['high']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.defaul != null) {
      data['default'] = this.defaul.toJson();
    }
		if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
		if (this.high != null) {
      data['high'] = this.high.toJson();
    }
		return data;
	}
}