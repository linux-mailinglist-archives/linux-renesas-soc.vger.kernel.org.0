Return-Path: <linux-renesas-soc+bounces-5521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AD98D01F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 15:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72A8F1F29546
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 13:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0425415ECE7;
	Mon, 27 May 2024 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kNk1sejW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UttSIhgN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9171815DBDD;
	Mon, 27 May 2024 13:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817306; cv=none; b=PpN9HaQdHfyUFXb5592HaQSkPa5oOYrhLpyqCgnWkVFWHlZJvWu5Srze9f3xkvWJAyt8e4XOnN1hgMx2eGcCylIkX5bkej4qoXlbXl10wqlzCYNJgqF5UcT6nHRL87Aek3MLRdHRtv7kijnnMTnM5is8h0LyO/lvr8j7ZMMdgoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817306; c=relaxed/simple;
	bh=WzVU9PIoOshReO0MCV1N1jKZLnrydo8XPEfmAgKd0Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KET3ba2gy/0DLlc1vRzXeXf1FvMv+WN/lmJWqudeQjyTE8oVmXwTXceTDbJSw/qcJbqkjuyMyz8wjI8sWTJATZoL4frXLOHXEse4IXinBAUAREmUXTbpXN9Sao21AAMNqWFzh/enOint9UoDccS/Tq6RLRuRBwwQKtqLJaU36rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kNk1sejW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UttSIhgN; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 81DD618000AA;
	Mon, 27 May 2024 09:41:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 27 May 2024 09:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1716817304; x=1716903704; bh=oM
	t6fguTndhazqVb76NTrYgiSior/wNV901yQg81jwc=; b=kNk1sejWWvIDCHhWNJ
	60/wI/xgJw/RFUch8Eh3agbBmkIWGsBLf2koffjmAvioOQBAEdnIDdjVpuTE+OZC
	nckS5bhJopDtjWF8upTbikEAl8ZGo8hTtDTe+nCMTpNua5XoxxR44sadjXOI4oeT
	4JOd8WIV67qqKrjeqjOF7c6AyPRn58EPwhdAtlc7Be/D/ZDBLID1maN2Py7SZA3K
	zkvSnM0JgoGzEDc+7tKprbpjRrOXcvmXG9rh1ZonxMvmXo10J6kPWT9lOC8U2VY6
	cYmDS7aaHHpFoPWz2bLCjaLjS/78tsDRfBZJDjliGAoULuvzH2eAthzFJ1Eax4bX
	DmYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716817304; x=1716903704; bh=oMt6fguTndhaz
	qVb76NTrYgiSior/wNV901yQg81jwc=; b=UttSIhgNOVGfa/HbD99ZooqC5bXyx
	PgVe2vf30gfliTq+U+OBFVj9MSWythMNydONTy19U6PbnUliuKQIGdWh3/FauKsR
	PY2gkIhFqapkPnkEDCTK0ydZjvBO6iTMFw3q9pLWCBoIJdeOUHcIFuw1r4E7Brkl
	vLpmgOURJ3bh7sXEVYjugOwoD1WSeu1W4WF5VmHlzg4gHpUw8dWSJXa6+6Oxr6CZ
	d1WdQdj4y5cNgxa1ib3pO/PoDSvOcrMlWwfrKTOq16yv9sJ2dW32lG8cKl65qUNL
	zMzwWxmd30Pqj8cMm9bCXYB45lWXN8Qz2tqMPqBCEwoW3ks1LcdtEoYaQ==
X-ME-Sender: <xms:l41UZlBebQW52PNaAIA2qUEi8LUxqlhFglobHDZHTpHaqT2eZ6lmrw>
    <xme:l41UZjgkAywFVY9XNFpULlgLK_amab9s8dvvxgbGXhuS2v8cWukR7OwgklXT5017L
    Jup1wMx0m6YAq04QO8>
X-ME-Received: <xmr:l41UZgkU4Xps1z9ry1S_p1tZu4ifJ7OdnT87mKhZXViquBaZSfD6zLNwIa_n7RLeIJ87X0wn3ET61neaI88EHi5bGOuk-htIhWUn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:mI1UZvwJBRVBUbIGo92EixIIaMuwP6ipG0w4PzDjKcVFvkAtePXfcA>
    <xmx:mI1UZqRssXKjwH_ftPN2Y-OhH3JUzsfnnm78gBBm7ERu_z7MiEghNw>
    <xmx:mI1UZiY2PR065e2_ISC2YV9mBQc9LybVi5M0to0PrZA_rPVFE08cPw>
    <xmx:mI1UZrTDW8NFt0VmFKZ-Lhty2bD7s9-6LCPTVMkJBVrun_jQT1FUfw>
    <xmx:mI1UZnQs3o4AcztcFjxeU87rG2PkrlDEV0Wu6ZY6nFbEEU_yIc-zIuST>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:41:42 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] arm64: dts: renesas: gray-hawk: Add video capture pipeline
Date: Mon, 27 May 2024 15:41:26 +0200
Message-ID: <20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Geert,

This series adds support for video capture on V4M.

I only have schematics for the gray-hawk single board but I opted to 
keep the structure from white-hawk and create a dedicated DTSI file for 
the CSI-2 and DSI sub-board.

Patch 1 adds the IP nodes for VIN, ISPCS and CSI-2. While patch 2 and 3 
creates and wires up the sub-board to the two MAX96724 CSI-2 
transmitters.

Niklas Söderlund (3):
  arm64: dts: renesas: r8a779h0: Add video capture nodes
  arm64: dts: renesas: gray-hawk: Create separate CSI/DSI sub-board
  arm64: dts: renesas: gray-hawk-csi-dsi: Add and connect MAX96724

 .../boot/dts/renesas/gray-hawk-csi-dsi.dtsi   | 201 ++++++
 .../dts/renesas/r8a779h0-gray-hawk-single.dts |   8 +-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 666 ++++++++++++++++++
 3 files changed, 868 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi

-- 
2.45.1


