Return-Path: <linux-renesas-soc+bounces-18886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67295AECA6C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 23:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0A657AC1EF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 21:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F37F2206BF;
	Sat, 28 Jun 2025 21:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bh3eY0m/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HVQernpK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBE221CC47;
	Sat, 28 Jun 2025 21:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751147787; cv=none; b=qkmV43EjemqhzIcbQfdqtwvunvcf6qz2Oyr+Mq1z1iLR32KRXYOSXbRV/7uYGXzTEe63K8+MjxCl4ZkHOb0AuErqhvch/oxeOvyJAIXREMBKr28dTT8VwoMIuaTYqtSGXGzqwFbKmSBdph2lWYg+92uxQKKPphQzJqfk4WPZ7rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751147787; c=relaxed/simple;
	bh=KtDw9xhCr3xNfmWMn1qG5RKQPrAnZ4Y8iiWH/eZaF2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MdZ4rWxiX+dVyZ+RKFvK/RMZ/FyfqQj1cLu+ErO74BCD+NxeGsttpOygWAwF1cmHJZkxDzRV9hnhO4VcWQzRSIEk0G9t6fDPECce06z7ta3dgc9rYYkdj2xXlq9g7fAmOMmTstxjiBwteISuCywQeBRANbMJ3+LCeGQ93fCEsS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bh3eY0m/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HVQernpK; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 631ED1D00113;
	Sat, 28 Jun 2025 17:56:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sat, 28 Jun 2025 17:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751147783; x=1751234183; bh=2s
	/GwcoHaziRaQTSksyHYQjPlr49XsFM3Jgr5lVRadQ=; b=bh3eY0m/Vc4jyYjfaD
	Ph91JG9URSPGAgqZNtEDJBs+y2XVDEScfOQIzQI4vgHWvLE3Aaqd6I+lYKeCLkdN
	P8J7Rp4Eu/dBi9HRyoW/JH3KCcSCdTEEmR2JIWdWY+HqknB1OrhprlsVDnhidaAL
	DXHdfdUFUPMzWPdimCX3NO/rNJ/90DDVUtEP9TQIAz3MXPrW/qF7PzQ2q1LZ+zTh
	zXCSSxe8VEtNr+IRXZHxHQTufu3srXdkMZNtrjviQl6GHTyRY5lDY2n0s8beiGzj
	TixF7ysqncBK7TqYRyUE8pmjKdMZrVSLGJ7nRKhw0NhpS2o5NxCIoa7Yppg5/hgQ
	8ZwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751147783; x=1751234183; bh=2s/GwcoHaziRaQTSksyHYQjPlr49
	XsFM3Jgr5lVRadQ=; b=HVQernpK/4WDvAiJtP7Eq5txo5ZEDJmKo43LNwEP3WHY
	D3lierfO2MvqP/+rT6+F/1mx0Wh2QwOVcf4qkQEVJRR4BRF4vYi4W+J6TQp90bUl
	r5uDkcVXrqqMdLFaVBnaR+oZVblqnahUecYrE7mEwYKqpm+J81SarY/JNRu+dGCi
	Ej//sqKdzsKJbairbePzGdHT1oRIb7M026makvCNnu9BiuTJGFk4bKNRV6o7tOyj
	E5wRd2k0itIcJ/9ai0m8R1wK8y6410B1LOUFyMWte2uUt8UVwGBRjLzyXio5NapH
	VWminCh25jFPMMDN7fmQwB48cbp22Wghu8uSl0/iXQ==
X-ME-Sender: <xms:BmVgaG0gXiG6CRHHvju3DdbZu7mZ8cilhfsdnnLTB1RPzxMN0q41kg>
    <xme:BmVgaJHYp3irHDeXqeSWcKOC4LQrhRwd8rMFO2wqV3xOTIk7JO8YVssTwJx18XxO5
    p0fnujW-fbstVlpN1s>
X-ME-Received: <xmr:BmVgaO7TFYezyPAbredQO4bfAGYpsHwVmj0gqur-f6uCZzSey4zAys6vorarAXlarih7jBeAxAjs00HB3tsCG4lg9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpn
    uggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrh
    grghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffefudef
    uedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnuges
    rhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhr
    tghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrih
    hlsghogidrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:BmVgaH18_ihOKS9CH-gIktcZmO3XTq0hKKMHoLb_naPLRKTIntB2CQ>
    <xmx:BmVgaJETs31mBvEU13WU2ByO_a5WY-jFQFFnsvGLHzF1om7yfKPM_A>
    <xmx:BmVgaA83ZrGQKglAgWOA68uH4OCVJwq5KBlODWt7BXVqLJutFXAqZw>
    <xmx:BmVgaOl8bpRlKPWDTUB0thbs8Z9oFdjsTX8F3f8Q4hIju6Qm8xe_UA>
    <xmx:B2VgaApyH0_YqvhNtAY-AeLyeD480cExtodyMnGQ6fOSzReTBU424a86>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jun 2025 17:56:22 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/5] arm64: dts: renesas: sparrow-hawk: Add overlays for camera sensors
Date: Sat, 28 Jun 2025 23:53:32 +0200
Message-ID: <20250628215337.1688969-1-niklas.soderlund+renesas@ragnatech.se>
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
 ...8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 120 +++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 121 ++++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 120 +++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 121 ++++++++++++++++++
 5 files changed, 495 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso

-- 
2.50.0


