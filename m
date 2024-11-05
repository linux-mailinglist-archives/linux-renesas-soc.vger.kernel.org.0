Return-Path: <linux-renesas-soc+bounces-10304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826D59BCE1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 14:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12D24B21F27
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 13:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EFC1D63D7;
	Tue,  5 Nov 2024 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lFcqKKdi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AhjAeOcT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6F11D5176;
	Tue,  5 Nov 2024 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730813960; cv=none; b=oNbZhx6Uhj/1Z+VP1ensztqh+Xc5cIFPM1poD18oA5HtPt4ehVsQnAEEkKykI+WilQVCXPpmWb7F1ap/KWSRgpY6Tq1jYj8clGiKTwdtooI01BI1gu0wtYMfZ+65oZiS3wv0lhCMQ4QzzKp3hqRpzqdM4JOeU0NlfhhUGOirNws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730813960; c=relaxed/simple;
	bh=2UuFLZVFr0KQaPKzzpf546l104yrOgfjF/fsIXj9oGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SfY0fQcVtiQfqE1w3/rP9EeS5vsL9Hb0/TXJVaVDg0NAoKw43/MqTkdpAlNNO7/kM/EODmxU/CrakeCNDH2eHn+DCLjOb0en1TQvLNBXSQJ8D7VJM9+3fSSsaoGP4HXHDa2IjgXKzbfn8u17fe+LSdqWNYbdj9iUv8vWv5YkRgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lFcqKKdi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AhjAeOcT; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6617811401DF;
	Tue,  5 Nov 2024 08:39:17 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 05 Nov 2024 08:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1730813957; x=1730900357; bh=tv
	G6gD7gC0Pgt6fxO6W0SvAD0vbyJtNou8zuvjw8qRI=; b=lFcqKKdignAnl0x/eN
	zdRp+qyrF/gT1OtNDO6XUqgd0ATGz0v+ktLnmiOjrunhXlClu/anQ3b0+HatVM5O
	nlpyBTuNoE3av/Oe4BTL7eOuJhIRl0DzFGU10rHw1mAA13vOlwntVb0Mcl1sdt0J
	lgQRCM8JheMcqGNFsEI96aSbWEt+F0OkSVAlQIGkQ3Gw5GELdnN5KnBJMmcGXtGL
	YEFdDOtmn2ac42+BaEpkcfAeYYQHhZPgbYerLvFoQXIC3vGIkXz/HYgijNjhIECL
	3fOie5vlER3U7EuegaSOaFh5C6rkyldlgqVrOUtXzohmEfv5grEev5t+p29KHvxy
	2Tpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730813957; x=1730900357; bh=tvG6gD7gC0Pgt6fxO6W0SvAD0vby
	JtNou8zuvjw8qRI=; b=AhjAeOcTeq70nzuxSoORZZKWZUy6IFaTVH0cF4zfKqiM
	XVEt5Z4lNOV9qh7yOf+3QJjRix073FMk5QoK4Mu8uDMHSyvMwfPTQafT/FJGAK4H
	1l5aEawhvYxB0gLZjOuXLURsd2cODnwcn+K/LVE3Kr+BG+ddOUbMmujqsBAMv3jO
	/8ISfyLukdTMmhVDGQE+wV+pAw3gr+SQzT3XrO/cN6Y0gzRFGynfVIWEmEEb19WS
	qlqbyEnoaO60Wb6I/TVCJoKKbGuJubr0XU4fUQtKFJxK3ORtVVs6dOZ7r5M6lUPr
	Np5KnTA3M2lHZtdmWYf22aInJpox9w4/RbFS5F51jA==
X-ME-Sender: <xms:BCAqZ6nnF_-_OTASNUMK9zfw2LRZG_vLZSQOT8LiRXWhfBV9RsxBEA>
    <xme:BCAqZx2VEX1QqZAs1e3Dju2sLuZJFkgeA_rJygW2u_VZ1bslaPV1F8P_HLKd07sc-
    -1MnVpn7BGCwcIVDO8>
X-ME-Received: <xmr:BCAqZ4rjkKAGUEay-rMzlXT9821wcRzhs18irEEjrL4UaaaMqPMe3UOhYWEFIuvaOWdQ32xqIBJD26CEVzERoPCYhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddtgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfh
    rhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlh
    hunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghr
    nhepveekheeghfekgeegfffhkeduhfegjeffgfekgfdtjeelheekvdfhtdffueekledtne
    cuffhomhgrihhnpeguthhsrdhinhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprh
    hosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshes
    rhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:BCAqZ-lJOj7IYDErsHt7QDz6EdjzkV8muyywkkr14lQPADIys_N2AQ>
    <xmx:BCAqZ42SSErfa8SiggDa-1-CnzE3wpjliune_ufBYDeugoGyBV881w>
    <xmx:BCAqZ1uwc7XDduC0jomR9EaX4rIfvqrGjjPIvyiFseE_93xB7xr4SQ>
    <xmx:BCAqZ0VqNSPnGNyNjNguh5avIS5KwIC6KcPNZ15a92WizUlzeE-QSA>
    <xmx:BSAqZ5mgLkjYfhWYeBZ4MXhZliWxLjO8YeG--A52FO2rRko0mxgp7ssf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Nov 2024 08:39:16 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] arm64: dts: renesas: gray-hawk: Wire up MAX96724
Date: Tue,  5 Nov 2024 14:38:22 +0100
Message-ID: <20241105133824.788688-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

This series wires up the MAX96724 on Gray-Hawk. All dependencies in 
bindings and drivers are now in the media next tree.

This targets the single board schematics but I opted to keep this in a 
separate DTSI file as we do have a ID eeprom similar to what we have 
setups where multiple boards. If you truly dislike this I can move it 
into the 8a779h0-gray-hawk-single.dts. In that case would you prefers me 
to drop the ID eeprom?

Niklas Söderlund (2):
  arm64: dts: renesas: gray-hawk: Create separate CSI/DSI sub-board
  arm64: dts: renesas: gray-hawk-csi-dsi: Add and connect MAX96724

 .../boot/dts/renesas/gray-hawk-csi-dsi.dtsi   | 201 ++++++++++++++++++
 .../dts/renesas/r8a779h0-gray-hawk-single.dts |   8 +-
 2 files changed, 202 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi

-- 
2.47.0


