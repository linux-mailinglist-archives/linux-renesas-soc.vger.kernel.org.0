Return-Path: <linux-renesas-soc+bounces-18957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08F8AEF674
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9680F3AEAA2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 11:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E294426B96E;
	Tue,  1 Jul 2025 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="S56lf6dQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KTwz/CYd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B471DF987;
	Tue,  1 Jul 2025 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369194; cv=none; b=GUOj9ZzdkLLM/6+ZdcPT8wj/f2TUk9vmtR9ssCtGDQoibjOUs7x2oKWL/6vkkT4EfzxGSFIXKE3AIyQVJQ8eefTVzwQPM4xk5j6k+pvCDEA3cSr4NIQF0wMR2Jw/5YpUpPJ3AKwrrjKUsqUjvHT5P3zpanZV+ASDngyoUwB10Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369194; c=relaxed/simple;
	bh=8RmQ9TvGt6uSLl0wfq/UrOuHVd17N2KtKHuU9D0gOic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FR6TJxxNCEi36wwxezCPAM1asQ9OfAANPk5CTStrXbKt44R5tSeiacNjqJcND7M5G5/lSIwEG/iIMgVnp12LhSTxPblm+ZOMz7Kn+0WQ1l0D3spj6bxqmNh19vu8ojb7Fie90KcbwrLt7jGV3bIDyd93YQf6uG6P7N8Ri5bwP0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=S56lf6dQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KTwz/CYd; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4C8ED1400396;
	Tue,  1 Jul 2025 07:26:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 01 Jul 2025 07:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751369191; x=1751455591; bh=tK
	vWXw6c6hZH0DIPiOzcim5TBx0aqWBYnU6dQFkzuP8=; b=S56lf6dQk/E9gTQ1yo
	Gl3SKqtp6p5LIEL+iVek3bXRpjChNjaHUoqWcLOUgNtztvsOn8CGfzQ9W+V6ZQ94
	eh7ToMQT2Pdkow3R/or0xSktR0C5oycQ/Pzwy4ss6R0W9HQgi2pizzEgJeWlDyy1
	0gHoosZW8x6mY5XpcTQ/jk8BF8GzrldDx3qdboiS/leUjl7egOgwXvQuB3Saa6Zf
	vkSu8SdRi3eDKc1KKlYv8bRWc0eMq5OT5tYmhw/gfK+8nTCXmC1+kiPA3+FYVz97
	VVaXAwctCCMQ5cCOQYfVnJAzLFRTzICyfQ8B1+yo8qAWBTTBqdx2MbqpTdSN5yQt
	jkOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751369191; x=1751455591; bh=tKvWXw6c6hZH0DIPiOzcim5TBx0a
	qWBYnU6dQFkzuP8=; b=KTwz/CYdFgwHyEX6H+CiAripL9mIBUUTfD5zaab+jIVB
	mzvbLc5+Kl2hHnYKaN6zQFTINcIaa/4Ehmkh5c9eFqaquNeE1XFqt8mXy2E4MPem
	yMIyUUELHwAl+GNb8+El670qt3/SpzUD5qDQl0QUovqyFYgnNATGiiTHSjniFs2N
	JKVNqOoMr2+17AaoIgr28SOqLdSblQxMJ71MVDE2aUDPI1RJf7nkn7Tq4pTr2iPm
	yl9ZbEJhPACAWL9PSnSZXWap6TNGQjBUih65APhM2k7ISKVj4Ei1xeFkV1pMl/+J
	S7dZRLmJK2VWBKkQDLMJXDKzCvaPTmTF411u3sVXMA==
X-ME-Sender: <xms:5sVjaBbNBOd4Gx4VKHXZ3jPfcfJwVqAD3ZTPN1mZddrXIdGyVpWO1g>
    <xme:5sVjaIYyixnQBYaiu_CKadDfAvuNzLOWZVyjkALNyUjpc1MWlI-81TD-AQnxxzIaB
    XIbQaHcohgwIvLUKOY>
X-ME-Received: <xmr:5sVjaD8_ka5hA3x7aon02QQY3cdXynIIpztw0lz692zLys-jC_uzFpbmXzIpUVXfA9_k35DF59KSywZmMWcQ6p5RSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdp
    rhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkod
    gutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrg
    hilhgsohigrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:5sVjaPrzoQc254DigFG2d7hk5IDOsRTvRjHGkwFmj41YHq8xOgNTpg>
    <xmx:5sVjaMpB47P7NvtkdsrVHNt6dDBZ7p5iLMRHAGDQQ8zAsSxvgBYJNg>
    <xmx:5sVjaFQb_RcnZWVJ7JkZjIz5lIGGgQ64eUR1oQpjTwXSLLsKhimg5A>
    <xmx:5sVjaEqsXxlcf6QBEdF5VpZMOh0UyAdXMJFGorEdK4U8vW42fcTLow>
    <xmx:58VjaM4EouAy8woQCKrVv5axEGTmPWvytd787iBYqtLQS2xglcBQ5QGW>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jul 2025 07:26:30 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/5] arm64: dts: renesas: sparrow-hawk: Add overlays for camera sensors
Date: Tue,  1 Jul 2025 13:26:07 +0200
Message-ID: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series adds a couple of overlays to verify the two CSI-2 busses
exposed on the V4H Sparrow Hawk board. The two busses are exposed on two
connectors labeled J1 and J2 on the board.

The first set adds overlays for the IMX219 camera sensor, one for each
connector (patch 2/5 and 3/5). A Raspberry Pi Camera Module 2 have been
used to verify the proper operation of the overlays.

The second sets adds overlays for the IMX462 camera sensors, also one
for each connector (patch 4/5 and 5/5). A DFM 36SX462-ML camera module
have been used to verify the proper operation of the overlays.

The reason two sets of overlays are needed is that the IMX219 uses
2-lanes CSI-2 D-PHY bus, while the IMX462 uses a 4-lane CSI-2 D-PHY bus.
To be able to properly test both situations on the board each sensor
needs to be able to connected to each of the two external busses.

Obviously only one sensor can be connected to J1, and one to J2 at any
given time.

Patch 1/5 is a drive-by fix that adds an missing install target for an
existing sparrow-hawk overlay. It could have been posted as a separate
patch but could have caused potential conflicts so I kept it in this
series.

Niklas Söderlund (5):
  arm64: dts: renesas: r8a779g3-sparrow-hawk-fan-pwm: Add missing
    install target
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J1
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J2
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2

 arch/arm64/boot/dts/renesas/Makefile          |  13 ++
 ...8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 118 +++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 119 ++++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 118 +++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 119 ++++++++++++++++++
 5 files changed, 487 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso

-- 
2.50.0


