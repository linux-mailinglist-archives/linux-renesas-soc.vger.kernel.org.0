Return-Path: <linux-renesas-soc+bounces-9970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3503C9AB620
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 20:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8343BB219A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 18:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5481C9EBC;
	Tue, 22 Oct 2024 18:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="W0vTNcg+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PFRguorf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B1A13AD26;
	Tue, 22 Oct 2024 18:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729622916; cv=none; b=DHUFcS9LhTmGG4CxZWNUGyRYrfvCzteDyncY4Evu6/bRdFNvT5nqGJRiRmrCXERZRBjlfex/YKuxpYPIGZ/ft7Ftf/r3PrHIyRncaxp4c3LEjbvY5xgiF2dx6WlJxdPnLWGHAa7Jf+7xWHoTkwL1VjXg/J8wruJA9Y5LcMKRYEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729622916; c=relaxed/simple;
	bh=/tpHn874q5GbBFhkawH2P49IEacQQAE+dBctshCLDrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WLUItGjNZAtTQhMmBLmKb4mPQsqs4R6JEgrugTqnZAnHwPML+SoZ6tRLIOAzFOBC+P6EXVFcCitYTe9gdfOowZJVmVxv5wexAXnReoPp+AcvH4gWqk7KZVObCJfnfGuvhwg4e49Xt6QkBtxR6Knm5OP7G5Bofv1uWteDy5IpYr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=W0vTNcg+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PFRguorf; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id B23651380261;
	Tue, 22 Oct 2024 14:48:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 22 Oct 2024 14:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1729622911; x=1729709311; bh=Ll
	6nRLfZ/hi7tKt/PUpw+qyzDdvK8VVh4Cs42gjOPE0=; b=W0vTNcg+wx918o0xVt
	9Z8zGhGUVhtt2Ch1qp03AMW5RcrAbENbq/z2XnH7g1zkzEJhOR4Tl6fyt0i+XWUk
	VLjOsMWNCTXlVn4QQeajSzd2k6ZRDduQ/FNAN30ffA5Jnc9GWJ9pB14vtjTgsY8h
	bEqWrAoxW7cKKGOq7p83ZI7nOo+RSeM9xv9kYj1MgaZRtgO6qAFC4HJ/34rJBDr8
	r67WyMSQPu/edVS+92SepD05H/I+LT6kjqX4307t/kkUjoDe+2QwL5LF7rT/h+pi
	UfG++YubKsVrQTdVVMZ7aBwksPzOoX0xsEq6ifJ0GgIlZ0CGqyPyDuM44fRDxD53
	TTXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1729622911; x=1729709311; bh=Ll6nRLfZ/hi7t
	Kt/PUpw+qyzDdvK8VVh4Cs42gjOPE0=; b=PFRguorfh1R/hYvPlnE/Op5wyJoDS
	7B60m+tOYRx01o4CU62UosXj2vxhdCFf/fF5YPV1k5GaGZX37p7lzRyDvUSgkohV
	MP1Zslwo2R2hjTQ88b0uFmJ2IwSOGYxUCeQSB3LV/DdBukXxQt2BQIEmIfoOXsnc
	XrF3ibY2LhcC85aGuGPTWr13ibJIG+mWnmvVFBLcXN5oAGR4/QSDo4JoAD7u9qha
	cd4mFHPoL7wBrh6n8iJyTpIF0gpaeqFkGgs/1GyD65KbZDtzUuYgQDwW2A0JqXTA
	zc5f76ebFNHQYVrUvBf1KEDbVzF/cCCG/o42qlsIpkzcQuZfCERCsxPvg==
X-ME-Sender: <xms:f_MXZ2UTKljBgh7hs6F-OFRPjk397KIcc1P7ZjJrq3nf-rv0Gab8ig>
    <xme:f_MXZykcaRbCNEMj5aQRoFjBw80oDSPR5sWCTX3jpaVJP8S7clxjML_bM1kSJP8tj
    RO9MpDYKDijFmB9VU4>
X-ME-Received: <xmr:f_MXZ6YrOnVyLWSH5vOhP00wFMgGcLr1xRpKQBF-tpQ9vK8OeR6PydH5mCOvRz43gHu6Ea4pjNjiD5OYiX1aU-15mQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeihedguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgv
    shgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    tghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvg
    hnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggv
    vhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikh
    hlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:f_MXZ9Ul56KZt6KR846Rx1YGqEb2z3Q2iuLJ9wbPbBLutPeD7fBQ4Q>
    <xmx:f_MXZwk-CNuBU1vpjhxi5MD_TSmXdsFGlcRC6fGSsRE_ChXz10FWcw>
    <xmx:f_MXZycccSnPflCyy419196wag2XQ-wMr0-cv5asrVdH-7gZypgV0g>
    <xmx:f_MXZyGYBX0zKdtv4WPMUTOc2vI436XIuaQWiMT0Y0xB_ZVrvJoi-w>
    <xmx:f_MXZ6UC5pdDhoqLePRRQDFKueud0CuCXh2vKGtRFyqGzMPZuvOyF9SU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Oct 2024 14:48:30 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: renesas: falcon: Wire-up Ethernet breakout board
Date: Tue, 22 Oct 2024 20:47:25 +0200
Message-ID: <20241022184727.3206180-1-niklas.soderlund+renesas@ragnatech.se>
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

They can be auto detected with just the compatible 
"ethernet-phy-ieee802.3-c45", but to keep the style currently used I 
have added the specific compatible for the 88Q2110 as done for other 
SoCs.

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

Niklas Söderlund (2):
  arm64: dts: renesas: r8a779a0: Remove address- and size-cells from
    AVB[1-5]
  arm64: dts: renesas: falcon: ethernet: Describe PHYs connected on the
    breakout board

 .../dts/renesas/r8a779a0-falcon-ethernet.dtsi | 248 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |  10 -
 2 files changed, 248 insertions(+), 10 deletions(-)

-- 
2.46.2


