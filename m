Return-Path: <linux-renesas-soc+bounces-12181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54311A12A87
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 19:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E8D2163B23
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 18:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53D61A8F7D;
	Wed, 15 Jan 2025 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mkFSHwzL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wUzSpoSs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7524A7E8;
	Wed, 15 Jan 2025 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736964685; cv=none; b=pH46lomyoFtLL9F1RJX+Y5K4uZpcXFMn7xO4qqHOYmMuxL5zqCS2Y3cD71BuPW+3FN5OD3oFOAmnPGHFJryUbC7SirNcsjQHxsl4ztLHa0Ov/ad9r6YPYIv5eAZ0hm7VbNvkvWRSEoD6BqW8/Yw+8A6m5S3TG3A5zk4Yz86S/T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736964685; c=relaxed/simple;
	bh=3Zxzq9OZLP+baCdQt6xMq9cFSPDSnsoobU2c7z+QdnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GYy5KsVJHZFkm5Tur4lI6Nx6eAU66udPUa/oMPJGOigC2wfksnwktuRaYl//+EftkLT5lyyu6jPu6mOabT6I13nFmho9Dgre7m1yxVzsZE45CDnTyiC0oqFRioQmsIeR0zD1i+PBfKtuuuy7UxUq3P3BoW13hSD25W7eEoce7uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mkFSHwzL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wUzSpoSs; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id E11511380169;
	Wed, 15 Jan 2025 13:11:22 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 15 Jan 2025 13:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1736964682; x=1737051082; bh=QD
	t4+CaFj1pUb2HxPoa0QxqimwQciiAjB4MU2FCvhco=; b=mkFSHwzLIpDvvpm0xi
	c7KjVX23If4/YSmIpXc0N/THQbCxyfG3846CtZQRG90p3D7w6CerQ52J1jQxsFE9
	SZVMBrJ3QqKE7ds79YMJfzulDyLhdsV129aBCWlPsJPWkoAXIe8ZYmyWWfmVt0S4
	VEBHLlmgOQHcY5tdXoaz9XCnyNit++VuNvfLk8o25L8rsCcY8QpNQkrOIF0+C4aE
	5+cZP7OfbAK5bG2TAR/bi2Hl+4ETqdKnv3wen3PWydpBbcxSBLaw2tXA7WroqldU
	Nra8sRAN9U8f6nNfFo4VoB3XwxJSEarNh5vv2uEFH9Ci+pXvd3xQPARe5RK6w8VP
	ycvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736964682; x=1737051082; bh=QDt4+CaFj1pUb2HxPoa0QxqimwQc
	iiAjB4MU2FCvhco=; b=wUzSpoSs4AvPM5umTwkjyZXd8Sa/PnZQ62hWI2IrruEw
	nwZzZkyx86cCynxsUTc/iACzZtErmVkepraLD2UPEqwsq7o+7bx7lsNBGRZYMWzV
	DBr4GxBJNMX5d2ZjUOiKRtdJv4AwO0SfUGQxr/GTkk8spHj2R+3S6bFqXMusHLqf
	vizqYuOI0GGQEXcML8Y/mj2Nwcfgsmnx1vdb45oXBYQ0K81bSszJvmbadD45A3JE
	rtdbVCV7qCjIjYhOLnQDBP/91ML6Z2OVWDLd8zX+dB/+SK9ApK+Ily9tlESYav1V
	/7t6a0HVLX7tOv9DS/Je2tdAhLT6Xjdt5gSvUx4H0Q==
X-ME-Sender: <xms:SvqHZ3ttwp5qnya6G9MerlBsLIURRb6igkBSDiBW11qWY8W7MHgyTw>
    <xme:SvqHZ4c7fybs7u37MeQbJ92vTBjPrjleN9cbNRkaULNiqAXJbzy7IG1B0CvzoQUrQ
    j1HhSu5JHvk6fJMC90>
X-ME-Received: <xmr:SvqHZ6z6e53fEjumWtA2XRnECW-iU-A1FZQyfm0ouVZ45VeapyDu3dkfpHi7ti_lAdVpJwV8XPMPmHkzQz9N5MPhqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgkeefucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:SvqHZ2Ovc_SSQAWAkRH5Bup855xjBzix6eCvi82SE9_yDqrAPFRsgg>
    <xmx:SvqHZ39jXMoW53jE6GM4kOhx9lApDdup3hoh_GDBG9Wdt7PetY4Zwg>
    <xmx:SvqHZ2UTtYZqvJWNAVsIcFH9cBZDWgyeba08q6W_cHpM7sKv0VKRBg>
    <xmx:SvqHZ4eRP_Rvp7dEZiiGL23ZJbY6X_DNebJqEe7QnQPuOqNCSwO4eg>
    <xmx:SvqHZzYqCS6lNEEAZpfGUYzorAJ7YiE-FeepiLoEXQHwSPEvvQ-1678o>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 13:11:22 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779h0: Add FCPVX and VSPX
Date: Wed, 15 Jan 2025 19:10:48 +0100
Message-ID: <20250115181050.3728275-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

This series describe the single FCPVX and single VSPX blocks found on 
V4M. Worth noting is that the V4M do have two ISP blocks, but only the 
first one have a ISP core + channel selector while the second only have 
the channel selector. This only one FCPVX and VSPX is needed.

Niklas Söderlund (2):
  arm64: dts: renesas: r8a779h0: Add FCPVX instance
  arm64: dts: renesas: r8a779h0: Add VSPX instance

 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

-- 
2.48.0


