Return-Path: <linux-renesas-soc+bounces-11930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B9FA0455B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 17:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 996B73A24C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 16:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DE61F2C41;
	Tue,  7 Jan 2025 16:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="AeercKJv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="weutAHrn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F39F1F3D5E;
	Tue,  7 Jan 2025 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265719; cv=none; b=Y6L0J9wGxA5FSJDdGFfCSqFmYidt5HzOI+GecPAExdBmo8HOwSWmYR4zOdGUjfatmD1fhH3dvXDV8TtLOtD1mgbYl7zK5I9oaTNRwSZXliwcxGI9lW1h/3rK2pSfbWTDTbw2YN5gLDdfYxKjAXLFr3mtgSdc7WtLYpg18tU7R9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265719; c=relaxed/simple;
	bh=DigKA+vStn/3zCWaPcIYaeHdLK1EYRvFRsWN5zQvkQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hupDt1l/Q9eZaAAO7eOjG5i437POpRsf6VlNCVW0qL+NDSRpso6C0+0vXLPCeKp6MWP8Zc/h2A70SI3eb4WJhFNoVKhOfJOFoeoQ3a9TX5lDhLFnQLy/tKxr/JvVOlLCNFbczqw9rY5eG74e2aK6OJEIJrSyJEt4ueOkYJSuGiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=AeercKJv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=weutAHrn; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 9067A13800E8;
	Tue,  7 Jan 2025 11:01:49 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 07 Jan 2025 11:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1736265709; x=1736352109; bh=Zx
	WVXNdMSRCmfo4D1cTwjKHeBk9PMy+LTtpAiUGUQJ0=; b=AeercKJvPRX/RkYDvC
	+wPtkAk4tQid0NQ6aiExQlZINf1WxFhMzMtZYFHaLV4v/JQ/eSmG5/gZwBdHtxLk
	n1x+SsJMeMzfUw7wgqhcEi47RNiYLtwygq72NzNncSsCpSIW5lFZJtq0HpnIjhyl
	KhTt57DcgkS+U7RqcA3GdRgBQNOhTbZBMcVq4QACLH9SZZGqgiiVGqMq66e9FZfF
	4UgH6eEwx/GAQXwyr1FqtJYYFAo4fF0fSHMu/FvLdcI7h/utpPglj29MKKJFQlJs
	xjyY6Y85iM+CSQOyOUePHScvDbeArfueCUUkpcfedZS3obH7KIRDE3d4cuQYk6C3
	NM+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736265709; x=1736352109; bh=ZxWVXNdMSRCmfo4D1cTwjKHeBk9P
	My+LTtpAiUGUQJ0=; b=weutAHrnn+Jo52czYzxkJacdVe6aoJ2bqLRR2gHeOJT9
	75KQOt9MZP28sjeeMtChhG/ImWIlehlxleoOXiDF0FuktKjQRS4UeQUNj7lpufGc
	pXuyjjd9JqcOLevxaaF0sLCy0lMYdV6dpRgowDllTR+Oq02IWmJPDH6bJxN7S47b
	XhYk8jjZSpETjASchc223DrausJwm9wShQjp+DXtN56/GXrws4im7wVMaj2gdrqF
	H1NiLA8l04m48FcIg7A5I2QnNgBKnTugkB5Wb2Pyd+9JrxiekPVz8JPgQo3ak+lP
	/CSKFNLo/BOlmd5Nj+qk+bytWWCNS2Si55bC53RlhA==
X-ME-Sender: <xms:7E99Z1HBlUSxdlNOOe2earQL8LZ_y7Xh81TmITWipYaL2DN6iPPNOQ>
    <xme:7E99Z6UxFHzm3dhgoea5BVWkt2gmTePf9Sl_7Jt8EZXM9kZEKhhJsDDrDhpYN3hp4
    -Y58qEEb94D-Wxj-Cs>
X-ME-Received: <xmr:7E99Z3K5r8p4VmmJydgw2HM1eXK4HCC_E96Mk9tteJprufeaHB_gq57ITwDEr2uYh0gn_xxSAm1GqlWv2RYmV6m1UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegvddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhu
    nhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedufeeuvdejiedv
    kefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthho
    pehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvg
X-ME-Proxy: <xmx:7U99Z7HNaUOl3T1qNaWRWf3itk-dK03GGfdup4N95NbT1iZjGX4rgw>
    <xmx:7U99Z7VeSRxpR4uAoaf-XVLRNJIELVwJplb0eM9mMCtkkSYPoc0fbg>
    <xmx:7U99Z2ONFrxPnqBe6MKw1sFZKtsdhMtA2ksgsAgE1c6DmTxNUjME8A>
    <xmx:7U99Z622gvxPdGLVMBslHkJiAFwShAiElSsC3lpBV0I_jBVGkYU7jw>
    <xmx:7U99ZxyOQet68p-SzMUq97vUy1NxMzxYFJHoVrdBkS5s2BCxkFTFvRPT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jan 2025 11:01:48 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: renesas: gray-hawk-single: Describe Marvell 88Q2110 PHYs
Date: Tue,  7 Jan 2025 17:01:25 +0100
Message-ID: <20250107160127.528933-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

This series describes the two Marvell 88Q2110 PHYs connected to AVB1 and 
AVB2 found on the Gray Hawk Single board.

Patch 1/2 is a small cleanup patch preparing for the addition of the 
88Q2110 PHYs which require the use of an MDIO node as the bus needs to 
be reset before the PHY can be probed.

While not strictly needed I also rework AVB0 to have a MDIO node for 
consistency. Please note I do not move where the PHY is reset so the 
controversy debated in [1] is not in play here. If that ever gets 
positively resolved this will need to be updated as well.

While patch 2/2 enables AVB1 and AVB2 and describe the two 88Q2110 PHYs.

With this series applied all three AVB instances probe and can attach to 
their respective PHY.

  Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=67)
  mv88q2110 e6810000.ethernet-ffffffff:00: attached PHY driver (mii_bus:phy_addr=e6810000.ethernet-ffffffff:00, irq=POLL)
  mv88q2110 e6820000.ethernet-ffffffff:00: attached PHY driver (mii_bus:phy_addr=e6820000.ethernet-ffffffff:00, irq=POLL)

Niklas Söderlund (2):
  arm64: dts: renesas: r8a779h0: Remove address- and size-cells from
    AVB[0-2]
  arm64: dts: renesas: gray-hawk-single: Describe AVB1 and AVB2

 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 115 ++++++++++++++++--
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     |   6 -
 2 files changed, 107 insertions(+), 14 deletions(-)

-- 
2.47.1


