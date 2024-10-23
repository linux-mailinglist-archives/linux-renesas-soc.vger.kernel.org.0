Return-Path: <linux-renesas-soc+bounces-10003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E52E9ACF4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 17:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D23851F25547
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 15:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B391CB506;
	Wed, 23 Oct 2024 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Rq7UGLhI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fQPLC3q/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84D01459F6;
	Wed, 23 Oct 2024 15:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729698422; cv=none; b=L1t1UpjOsP6Aau8jCTgjYLzkxjBqBY2bUt0kYx13DmGM3IPbLCkyfol3uEtuKSEu3qwTGO+1G5Q+zWe8rKui+Hjevsn7DjchMQsITu3/2czI99PutKS+Mhj0PfHYcONT83+wS/l6ZoGNK8n5/J+veksB1RmvwqUR/MHCXF27Lew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729698422; c=relaxed/simple;
	bh=ZZwU4NFC91wMgN4c7lkp6TocHvXTpLhtn1odQHi+ipU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kKABil70/FWmfrJ9+MBa7hfib2Qbk0NYeuxWGOE0z1Thd5ABuHfZCZlZOHsKUkXkdb+PMPGppaqwNGFXkK5TGs+BUomZMfbHOFCkYthTl5GMA5aP+RzL1kPR1E2WnTpv9H2JDpGKeQ0BXKzBUlqQDcYTHbNWAwpBb9UUB1Es/KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Rq7UGLhI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fQPLC3q/; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9C97C2540109;
	Wed, 23 Oct 2024 11:46:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 23 Oct 2024 11:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1729698418; x=1729784818; bh=IG
	T5U0hFJ5zQwBJxWSQZ5zevqrZ00gLykqZ8O2zCm20=; b=Rq7UGLhI2quFopPwHu
	PWEgqc0k1UvRsYZMwWjTv153zux7sYUyGT64gjXF3YwRtDlXCIEQiEbwXWmQFYdq
	6wG9W900qx35j842BhOAzFDV2BCJTFzjsK7eeEASKlNHQz91Ahl8C/HGZUIgjYlE
	9eNisy0fTAVtfUugH1unkeMx7vBxw0nYzQjkadBywhOQZtc22KWsOAfPYNGBLhRK
	dDFhZWwx45Umztd7B0zZbOcNGcNZIBdxcOAQtz5w/vDiAXxGZrmjxVEtuILgqbaH
	ak3xyQvF3s0KmKhteu8ETPvdTCcch4lKW3cGGtzeXkT4MRZhYF9NQWvwKDnN1J+m
	GskA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1729698418; x=1729784818; bh=IGT5U0hFJ5zQw
	BJxWSQZ5zevqrZ00gLykqZ8O2zCm20=; b=fQPLC3q/gdU9VJNddKPGCABkja1Tx
	cPuM1ZdqNWKi7q3F+JQXsuxsLAmA0a0AcuQ8d3cZn87IPTaZA+VGUx7939RZRFCF
	f2KRzOQ8LIFhtOaT52WYQk3wmxTAoVIMMhpU9n/IE98sjilQ2KUnk6EF0ybqQZi7
	TTdwejVCsRowMYtl7c9cXV0k3EQF0W4hGMJfqP9eb1KgBgVagGcIJpzG5bFTGciw
	k8rTTjhyOKIDezFbClo1nE0aRgXYyXEUW1uuX2+C0floN7c55GW9byWJ6sgAU2Fg
	M4nHEUR4IHCwHwiBRIDYxx4HzHEhRiiAMlHCxyC0oS+S+p8Hz2u+/iE3w==
X-ME-Sender: <xms:choZZ80cEVfsHrHe8eUNWIAaABjzbEB5c8i0YIk1kmyHl-u8YvjEDQ>
    <xme:choZZ3GNGw2kFFqHRR2Cw5o_VmPet99y6S6RJDesyUZcQXfAUK6mGdzPig65O_vvf
    9YhLLR_jl5Hw7gS7As>
X-ME-Received: <xmr:choZZ04XW68NVL3923zlFcdQHfgDPWWwRrQdfq2Z2L8hx3bzh0EQPnTsuQP4-srxFCBGZ5p2jbghSF3SEh6Ph19CLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeijedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghs
    rghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnh
    gvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghv
    ihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:choZZ11shOUT36kmwJVSHFlmWKFYMn05dgF_BcpjXRNjOM958q283w>
    <xmx:choZZ_F1vXoI7kPRN6zSCSp_nS3SiWb_NjejQ6HGdoZs4jBK3NH5-g>
    <xmx:choZZ-9ZtLNMB9IkglJdyPTYRPDkVcvVa0BT52k8w-0F4byAvOTGYA>
    <xmx:choZZ0mWiCnblRRmEVmqcz92skskrjlHkftA01u7Dr6wXdmQAVeAng>
    <xmx:choZZ-1Vt_QQFkjOa0mgz6blVP4s3SoUfEMxEiqXPaSKRExPfp7ngCzH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 11:46:57 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] arm64: dts: renesas: falcon: Wire-up Ethernet breakout board
Date: Wed, 23 Oct 2024 17:46:41 +0200
Message-ID: <20241023154643.4025941-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

This small series wires up the Marvell 88Q2110 PHYs found on the Falcon
Ethernet breakout board. With this applied all five PHYs are probed
correctly.

    mv88q2110 e6810000.ethernet-ffffffff:07: attached PHY driver (mii_bus:phy_addr=e6810000.ethernet-ffffffff:07, irq=POLL)
    mv88q2110 e6820000.ethernet-ffffffff:07: attached PHY driver (mii_bus:phy_addr=e6820000.ethernet-ffffffff:07, irq=POLL)
    mv88q2110 e6830000.ethernet-ffffffff:07: attached PHY driver (mii_bus:phy_addr=e6830000.ethernet-ffffffff:07, irq=POLL)
    mv88q2110 e6840000.ethernet-ffffffff:07: attached PHY driver (mii_bus:phy_addr=e6840000.ethernet-ffffffff:07, irq=POLL)
    mv88q2110 e6850000.ethernet-ffffffff:07: attached PHY driver (mii_bus:phy_addr=e6850000.ethernet-ffffffff:07, irq=POLL)

The wire-up works fine with unbind/bind cycles of the device and the PHY 
can properly be probed again.

The primary issue we had with this in the past was due to an incorrect
PHY address. After studying the schematics (v100) I found the PHYs
address pins are wired differently on Falcon compared to other Gen4
boards. On Falcon they are pulled-down, while on other Gen4 boards they
are left unconnected and subjected to the PHYs internal pull-ups. This
gives the PHY an address where the lower 3 bits of the address is
inverted for Falcon.

Patch 1/2 is a simple preparation patch removing properties that should
not be set in the base SoC include and will produce warnings once the
mdio node is added. Patch 2/2 wires up the PHYs.

Most likely the change in 1/2 should be applied to AVB0 also, but
pending our discussion in a different patch about where to place the
reset-gpio property for mdio nodes that don't strictly need it I left
AVB0 as is.

See individual patches for changelog.

Niklas Söderlund (2):
  arm64: dts: renesas: r8a779a0: Remove address- and size-cells from
    AVB[1-5]
  arm64: dts: renesas: falcon: ethernet: Describe PHYs connected on the
    breakout board

 .../dts/renesas/r8a779a0-falcon-ethernet.dtsi | 242 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |  10 -
 2 files changed, 242 insertions(+), 10 deletions(-)

-- 
2.46.2


