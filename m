Return-Path: <linux-renesas-soc+bounces-20996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9766B38E44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 00:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2872D3A9EF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 22:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469F72D97AF;
	Wed, 27 Aug 2025 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="EkAZ3ZYg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VBgPeuom"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27D30F956;
	Wed, 27 Aug 2025 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756332902; cv=none; b=IQKjByXf9e8AvDZrLgNrNTd8e924GbvFOxTPEXJ5y6/AsBK6KAvds5MxKXO3ky+x8buErbRCe1AFgNs7G2CqlSxNGMsnM1h1/Hkg8IVPvt6TqMZwkyKOuAuyb650jl52yLSjjfvWo4LOIW1mc1ePTCXfmZy1r/13IF56WmD6x/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756332902; c=relaxed/simple;
	bh=ivsbKQBh8RLLT4Cus1G5aXePlD0oj9exdgeSIL6OQBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nmHSphm6dx1PjYdO6QGyFR2PVH0F39CyonqlrkpJFxbi3+bfsT4a4P8s35iemQPWYDmq9y29n4QT7e7s4Nl4FOyF/2Fvk5u6KW9vAyZDtwZttnHVhu4S/RSkW7bT7hgkucpMulqotNc8eTvSjZaUHHrEceG2DgVHvqRHVjH82go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=EkAZ3ZYg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VBgPeuom; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 49C0E7A01BE;
	Wed, 27 Aug 2025 18:14:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 27 Aug 2025 18:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1756332898; x=1756419298; bh=WM
	faFZZgYvtLLgw3k0SV7cOVi4XNMlOsrKyaxIr5M0k=; b=EkAZ3ZYgHETZo8dUpg
	CRwKKsvERk3uAdCNKrbWP1nyE2CdCHckLhqPtx5ZIf4LDIlmc2kig50QJhf1COd6
	y2kubUxgLXFCSJ51R6D6z1qyPDWBoePwThwjLJkG/0vk+nlocHuodSXhLCDoOTVe
	SFV37Z47W/QGPttILLZLftS4+uul0Z2uGKBpLggn80bMz90yEWAOEpV09s1jb66z
	rRIl4AuVWsGaQQA3vZCWfkBSv7IWMpYxP9uQwBn/MXhlzSpWRf1orh9gdRIKGjgb
	79BdWqURelcXlofrNkvlHDBuzrlmXWpl7yMe4p8ZJziyjMbvWQd4VbQlIf60Lw5e
	YRUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1756332898; x=1756419298; bh=WMfaFZZgYvtLLgw3k0SV7cOVi4XN
	MlOsrKyaxIr5M0k=; b=VBgPeuomO76mEXO1PV6t5FLAANcjUiOoFjhqMcewcXPQ
	46XHnLc/4VDGmUnEU3gCt4q0F+k7HgwcXS8cPqWsjy6T9gOtHEHz0mRFbxlkwUTH
	8FHcsaxP2h3HLJsnIHK0bVlho4joJ9Z/bpOWY1uKk8IgOVBvJ8NogbIzj4onm2zS
	DBb0hV/JahbR1FaImFyPN6hx5yo0frmtB3hC4mdUdOrcdkY0+EgHb7g2/MbZ/f+a
	ZMz0CoBT4dHuSvHqhn9sd+A3IJQhKu8YUNLtNlo83hP+djm/URCwIvNE1/lbyfKa
	bYyTZYvq4Fqvij/HYMbrUsPtW6JMLVvvjp3XZeRg0w==
X-ME-Sender: <xms:YYOvaJX_SGNVJ3WWhD9IuXymDzIdj0fjLVtoYLUBy1YjMMyZfmNgIg>
    <xme:YYOvaEPgkDDBSupQiWFe6tFBWylMvlISjNqfvS69cxj5N0S3xAQuziFc7GheuOLyh
    47TjzEAhiYXJb3lXdE>
X-ME-Received: <xmr:YYOvaLZkkcB4nCkvfo5-VTdVQe_oBJZzsyixYCtUzsir14zygDwtQ9Ggjdr1ScO9MwbsnpoVy8sy9xapUsGKRjjd7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeelfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmh
    grihhlsghogidrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvsh
    grshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgt
    vghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrsh
    drshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:YYOvaL9hMhPrllz7yc7JmNU46egPjdOwpxz3NMyHcs_Zh8ppH7ncSg>
    <xmx:YYOvaEQfJaZWJ8ioX_VAvGKq9XFp_7zugiBjJQVSzo1tlB74afuIMw>
    <xmx:YYOvaNegO1Z2Lvs3jQvK04zhzMo7elp5f8zMGBCyYfB5y0tX8fhiKg>
    <xmx:YYOvaOSmjTLR2zCULv25fcsgDicwp08fvtC8-eEdiGfB-oOhfgWlrw>
    <xmx:YoOvaLMa0PUk75VY1mOwJRIWnbA7uCDk00V1byo564J-TLjfYnwJ71Jf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Aug 2025 18:14:56 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 0/4] arm64: dts: renesas: sparrow-hawk: Add overlays for camera sensors
Date: Thu, 28 Aug 2025 00:14:20 +0200
Message-ID: <20250827221424.640770-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
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
connector (patch 1/4 and 2/4). A Raspberry Pi Camera Module 2 have been
used to verify the proper operation of the overlays.

The second sets adds overlays for the IMX462 camera sensors, also one
for each connector (patch 4/5 and 4/4). A DFM 36SX462-ML camera module
have been used to verify the proper operation of the overlays.

The reason two sets of overlays are needed is that the IMX219 uses
2-lanes CSI-2 D-PHY bus, while the IMX462 uses a 4-lane CSI-2 D-PHY bus.
To be able to properly test both situations on the board each sensor
needs to be able to connected to each of the two external busses.

Obviously only one sensor can be connected to J1, and one to J2 at any
given time.

See individual patches for changelog.

Niklas Söderlund (4):
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J1
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J2
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2

 arch/arm64/boot/dts/renesas/Makefile          |  12 ++
 ...8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 116 +++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 117 ++++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 116 +++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 117 ++++++++++++++++++
 5 files changed, 478 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso

-- 
2.51.0


