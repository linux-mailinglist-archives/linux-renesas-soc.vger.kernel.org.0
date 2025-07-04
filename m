Return-Path: <linux-renesas-soc+bounces-19202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E7AF8F76
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 12:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADA7F3BAF75
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 10:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3536D2BE7AB;
	Fri,  4 Jul 2025 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="J4NS9aZW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VszdXqLw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA5325228C;
	Fri,  4 Jul 2025 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623720; cv=none; b=AmlOO9NELCFPECC2ueCwirvNn6AK70OmLzrcO5z/jxWHOaMkmUKH29YidGhUlmLbV3wB7urYvhtV6PZLm/y9uNe5+ROavOnIC2t5zyrC/aGP/i+ACgFXEOcqnwQr43sur+WfYMf4OdWA7JKlW3jkK7OPpsnufoe2qV0tSRxOrAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623720; c=relaxed/simple;
	bh=ICzVLU0NVW69UQ4cEPFCTFbn6mA43gvspSSQ/Nw9cms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kG8UuRKub+3fM7i47sO51s4zizJ/BXgmVGUpc2HSB8WvXIQ+v5lFALdGmVQGHt914H+8pRnDRr/EXS7QRCgj3MrGMvZsA3xF/ONeWFJtbYL9Vx5jMq0ba3pp7G7KeHAOzj/eNPvtZ9EPbT+FkJd9ylkPnSqkLWnNdo2ctqcLU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=J4NS9aZW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VszdXqLw; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CA1907A0071;
	Fri,  4 Jul 2025 06:08:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 04 Jul 2025 06:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751623716; x=1751710116; bh=S+
	nKbPGI0YrzkrG63yT/hn5B9TV/L1LM/sdnULBqurQ=; b=J4NS9aZWNOxpItjOE8
	Vzqu7zT5+URSLiX+fRqijLf7bOzTScFuTuiaxyniB/EZE9VwbzhTOLqCiFTHbp5r
	XsxS7Fb0mROaqMRxvjh/jNglAEcemz5W3K6FeiqIssYIMxvsj3vEwpfXZUR0qoMl
	zXrQ9OrBhXyefLDJ80E+JIt7hKNNumBTWUy35PPY2TeYiu1PNQ1tx11CiD8XpZJD
	OXnon/Sn5jc5EXDmjIU3/o3NhArKnX6gF1fSmBUrQ7ESe31O06918rLrl9BZS7ai
	RGhfJ2YASEbBnzbVRcbumEyyRPVe1Bg+TzNvswhtGXPPaQkYGoHxw2rLYccAvndb
	11qQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751623716; x=1751710116; bh=S+nKbPGI0YrzkrG63yT/hn5B9TV/
	L1LM/sdnULBqurQ=; b=VszdXqLwDAWKYWCH3CwTc3poTzQ7ewHFxj1oTSfYMs3s
	La1Tjer66a4WSFzdSSi6GL/mm8hqc0OyFutTAw6dyrZfJl7Z8l88irjbpxSkNOrK
	pCk3DT6xn6zDRncthd+IYUjV9mLu+N1RNZcWlFHDrAUYSYjeTbZYDy/CBY+l1Xz1
	UC0vUczjriWkxA6jt4vftf+ZIIWSRvbO2Ll2nUlIEJ7yBRTfj5GwwUDIp1ckdgrq
	hXs2LzuolnwG0XNBA3LRQ2gyx8pkVpWJPXcaF4bA3sDkPT/7dkiuCVP5Wn2TIxKY
	gkhQmaUg71ALLjLzqxFCyFgxaILpaTsrx7e74wRm+A==
X-ME-Sender: <xms:JKhnaOIdfErU8iXsx4GiPnZ5wiKqiwc_vgfEKr_LZTmwCrAYsuWiww>
    <xme:JKhnaGLh_wn4U037ZqO-mshRCoJk566unnZc-YbGqmfjnaUdl3Hf-9X7Yp030UHxU
    nwEB4yqdNZZHS_pcUU>
X-ME-Received: <xmr:JKhnaOtaKeBlfE9j2llJC2nVfWWJEU712hbwub8kqq2_tZzqKre2nwM3Fwpu306zwsCWiyZKNDZAS7YE6hj8EQEAOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdp
    rhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkod
    gutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrg
    hilhgsohigrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehi
    uggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrg
    hsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggv
    thhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrd
    hsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:JKhnaDZE0nhRJEvLcBWwYcglVkW3c4BU2b_2_NhMs24hAAhZyS7F4A>
    <xmx:JKhnaFZT20w6X-HIGhYcAdSp7cf3GE6Ekv6kdhSBGB9_X-pI7s23AQ>
    <xmx:JKhnaPBbcK7_8U5LOZxQXWuO7GNCuGfZx4AEJ5aQVXY2ogeJgFapww>
    <xmx:JKhnaLZWTox0TN_UVYhS-L2dm1XpKYW-Nj3liSIrzsBr1NbOK7PvcA>
    <xmx:JKhnaJxmGQGs3VCmrxaEsBE0DxY0aAQZwmbmLhqlZawyu3gU4s3UHz8P>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jul 2025 06:08:35 -0400 (EDT)
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
Subject: [PATCH v3 0/5] arm64: dts: renesas: sparrow-hawk: Add overlays for camera sensors
Date: Fri,  4 Jul 2025 12:07:29 +0200
Message-ID: <20250704100734.3387856-1-niklas.soderlund+renesas@ragnatech.se>
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

See individual patches for changelog.

Niklas Söderlund (5):
  arm64: dts: renesas: r8a779g3-sparrow-hawk-fan-pwm: Add missing
    install target
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J1
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J2
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2

 arch/arm64/boot/dts/renesas/Makefile          |  13 ++
 ...8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 111 +++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 112 ++++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 111 +++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 112 ++++++++++++++++++
 5 files changed, 459 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso

-- 
2.50.0


