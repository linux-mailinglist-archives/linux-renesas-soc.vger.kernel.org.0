Return-Path: <linux-renesas-soc+bounces-5930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE388FF365
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 19:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81907B25C31
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 17:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171DB198E70;
	Thu,  6 Jun 2024 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="0+qexqTN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iK+uQbzY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7B1198A24;
	Thu,  6 Jun 2024 17:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693784; cv=none; b=HrbOiHmADTOuk5TYvV0//T3l5yLfbxmPv8Dj7tWIrBrjM3xvyqGs3OSAvYWuLHoAhow7d4wa9HiYDdAlK0PksK3+Gv5UQlpj8mhVhzJqyZPt8uiU09hb+XbewA/y4WjsersCJ1YBQr+I26TKwBRJRY5SNjAGqJMdgQ/Ef5VNeu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693784; c=relaxed/simple;
	bh=NyDTMWjqq76gtV68Xg6Wx97ZWAT/9bfulqWfS0agPIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L7hxuxiARskm0VG5AH55gEj6pASfP+GWOS+alZ1rut9v0lW3TpjtPxxJz89Rf3UxQ+XI9foiyda/Y9c0WJYiOLwsx5G2I7+RG1ozOOysuVL6bwbNfzPuoM4vWabO9oOxAyCOD4OydJrW3Fj0eKBBx3adenrwVYDDnHoGT2yboTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=0+qexqTN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iK+uQbzY; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4B50F13800E3;
	Thu,  6 Jun 2024 13:09:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 06 Jun 2024 13:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1717693777; x=1717780177; bh=uh
	+BX1wYIP+G0aosdwsgzf1m796E5yae5OCKa3pMPNE=; b=0+qexqTNhodlaWXVOh
	ytZleR6ERq7J1FAC3IpKi+N3IGqkWkJoGjCZ5NRBtyU81dfxoV534aSYwVa6YO/0
	S+d33d8L2he/76QEYpjACv10LvvbFp/ftJKVrRJCJGq07EQ0jKHKteN3OqD6ykag
	94uSQ0ei7Wba4+G2rVc+GGrGLMQkBmc69iUG5zMpiKQjIRDoH1k+2WdnExZkn9VD
	evD725ZxpOxXYQ2uEwwetOMrkNaLCDoyGkQmjg6LyeuIJlimr/1tOxBiMASiDQCi
	z0oDANWNfg3BFFJMBthh86BGXyRThp0Pr2aglyBsKqxsiDvjl0nag5KNPU2dtUjE
	rC5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1717693777; x=1717780177; bh=uh+BX1wYIP+G0
	aosdwsgzf1m796E5yae5OCKa3pMPNE=; b=iK+uQbzYL0MmGCeBNkD7Oz8P164kW
	6ck03LPYX8wb6nY4ExEIl6/sK9anyRF0EgnYtpIKJmxX6ad3ic9p3R0ENMkNEL6A
	OIq0JZ8cTqWxf7M0jrw5cbOTBeNPIe6y7/CUm8rPgKfcufC32e+5N16IFhWQ9ksu
	AEFZnc32XAhCGEvv6dBDAnFy/FFyXfjkNWN+oagXUT8ZurbxiFKOcn/zAxGQomdv
	Pije3mtmC5S6XuFMHn2btbeI5din3frxG5g7b1FECdXb31tIz9ydAV0MBxQeyK5w
	vAXDrnDEhjlHZuMs9wKClvg4CKxKoTrt3MIvOTJBrxbr4FZJ4FLUenFmA==
X-ME-Sender: <xms:Ue1hZh5NLzs65hm4ZkrQsuWh5WK4_9V6uDeKZbpQcn8pyzNmlqQeoQ>
    <xme:Ue1hZu7lCha8NneT8d4ZTQlRgFzY6OW0Kk7G5S_qRz3K_CTuwZfd3fMdL_aEbg-rT
    PIIFDdFhY_hQ984j3c>
X-ME-Received: <xmr:Ue1hZocSAICcUnOpMiy6jWcSBfBlfPNWbE_88qHnAWx5-4upwVeW4HCxFhq-2Nu6991WyGDG9qtyleAMMedqglEizMWpfv2JR2Ro>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelkedguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofggtgfgsehtke
    ertdertdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgr
    shdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenuc
    ggtffrrghtthgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheel
    tddvvefhfeetgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrght
    vggthhdrshgv
X-ME-Proxy: <xmx:Ue1hZqKZBPyk683EdVogLOsmz76IpArya6bgcWgP-80NWUlIbLRftA>
    <xmx:Ue1hZlK6mMkWrWsip7ZFEmdLwpTDRGBQ6FvmxSc5XI5-3pNuLFfS8g>
    <xmx:Ue1hZjyd620M_rqZmSxfh58RlWlrgsjbNk486y9pHM6yYShkn8wpTw>
    <xmx:Ue1hZhJsg-pobhmzrECEu6wZVEYW9zDBMXlicxV2jQiJ6saVHXzo5A>
    <xmx:Ue1hZiGrm_xBvMRA9wdN7BHlAwwfL2X3v_WT-E3bqmJChcFaReLw5TJz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Jun 2024 13:09:36 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] clk: renesas: r8a779h0: Add VIN clocks
Date: Thu,  6 Jun 2024 19:08:58 +0200
Message-ID: <20240606170858.1694652-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the VIN module clocks, which are used by the VIN modules on the
Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Fix names for first 8 VIN clocks, should be vin0[0-7] not vin[0-7].
- Fix parent clock to S0D4_VIO.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 034e375f31fe..5ca1b14a6d60 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -208,6 +208,22 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("tmu2",		715,	R8A779H0_CLK_SASYNCPERD2),
 	DEF_MOD("tmu3",		716,	R8A779H0_CLK_SASYNCPERD2),
 	DEF_MOD("tmu4",		717,	R8A779H0_CLK_SASYNCPERD2),
+	DEF_MOD("vin00",	730,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin01",	731,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin02",	800,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin03",	801,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin04",	802,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin05",	803,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin06",	804,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin07",	805,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin10",	806,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin11",	807,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin12",	808,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin13",	809,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin14",	810,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin15",	811,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin16",	812,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vin17",	813,	R8A779H0_CLK_S0D4_VIO),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
 	DEF_MOD("cmt0",		910,	R8A779H0_CLK_R),
 	DEF_MOD("cmt1",		911,	R8A779H0_CLK_R),
-- 
2.45.1


