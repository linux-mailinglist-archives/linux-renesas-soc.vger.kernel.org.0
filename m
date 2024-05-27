Return-Path: <linux-renesas-soc+bounces-5502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E99048D0114
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 15:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0632285C0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 13:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A047A15ECC4;
	Mon, 27 May 2024 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cMqYw0mV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BmnA1ClF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC69515DBC1;
	Mon, 27 May 2024 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716815787; cv=none; b=czktrsjAa7acwLsuSEEVpLFuO0tkOt2Iup+S8l5xoE26mOFwDdrPor9N7ZICEFjUsCzaptvVLUPvk3SOfMh3xWewCnpIbKeNm3kSczuAUPV0TM8x/TNBMJvojykjex2AOCR70iShvHQCfGK3TKDp27eV+6vopC/GCt6VxoEs2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716815787; c=relaxed/simple;
	bh=qAqEESrsaY2x87CRgb3wGUMNihDw8hNvUx3lboBGQkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YdLdoQamJbTbY9J782cnGE1mt7FZDKuI6WpgBwxsnoWM15OwqA2S81tdkuIqSSpMqFh+D8VdPaRXaSobNof+XCdQpYee0rext90v5cMe4qkjIZ6ulgXjQknEdidWr7GLuk7aJJSk/hAFS058zmeH60jWZpDUeoDpHYWMIwBMIw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cMqYw0mV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BmnA1ClF; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id CBC491800093;
	Mon, 27 May 2024 09:16:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 27 May 2024 09:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716815784;
	 x=1716902184; bh=2XfG3bxqSA/HPmdKSgPThK5J4u1RbGsLfXXdI3V7YPU=; b=
	cMqYw0mVhxMJF+cI7B4qv3Kou1Wxp38dpm5MJ3XJ2LwwcbYUvFCLxldRwV8MD8CI
	j9vCVR6bwkDwimBKUs9lGQCrCYPj877LHETMBbD3k4uOI0AnJFlVbzW01YYG9CG3
	4Ol6hcRc3KYuUiQEbEISjMGP1/BXg/q9MmdCQjEwRWAKDo4fGhHu/NG+iNVYRJDd
	mg2xaaIvWVDap40ALRy3PUa2GaS9SEABUI4jGW58fMTuc8sW7GS7QRMG6d8en0NU
	9Cnwrds0amFA6FZq53O9il/9FlFlcXJXVDI6BnpUStlbiEitf4V6DkJWQr7Dw9Fj
	502797a3yWK+0nHVIqTL5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716815784; x=
	1716902184; bh=2XfG3bxqSA/HPmdKSgPThK5J4u1RbGsLfXXdI3V7YPU=; b=B
	mnA1ClFOxSI6jyo3kntpyT68D+xhv8YVlt3PAjwx4NnJZF6iychrbl5S/7fwBfIF
	0GkK57nxZUFI9RXGqVft6Flh5O7WvLfET8PLLur/DUHrHLDkvWEBPHe01eff7eRl
	FQy5L//r9+zK/mmFh4u9GpWeBKAQ2wS/8GuR5XxkNw8f/GRjMnE6MjwW1WHMNeDw
	v2QK4+3wjTSxWcT1nvvQ7lfVMPLOTlPgCH03NZNpKf9bSQ7fKboW5SxH1JSnBLcl
	yxYkoQza5o0NZHTeSb1gboUQo1GAySSYovguJSUj5WVvSQycYmeg83tyPcAy6N8U
	zMHtww81JANfmHKwJTKiQ==
X-ME-Sender: <xms:qIdUZvRmpWnRbqMUEPrhwYNS5yGKiRoD78f0aM_XY6Kzs1n8xClHEw>
    <xme:qIdUZgwq0l4SwJ8s4FI7Wkb-f1wqFIg7kb0o0Nb1MMlryzDaD0oxb9XykoAePsCkq
    T78ohh4Ep9AUSjW8sA>
X-ME-Received: <xmr:qIdUZk0Hs1PQ3LtLqY4j1dgw5TBKn6SeNVRX9n38P4QSJFAuaj8Q5p9Uo0Tr2PQT-j0Zr5oAhngnm0ug36-BPDT89g7tJrIZms1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
    ekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhl
    rghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqne
    cuggftrfgrthhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffh
    jeffgfegffelfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgr
    thgvtghhrdhsvg
X-ME-Proxy: <xmx:qIdUZvC1qEEffvUyJWNZIjHccULYtR4dGiPXvfQBLibbQRdA8qkbZQ>
    <xmx:qIdUZojbzp2EbkZQ1kYQ6lNwY30fpAecDSshMU50ih7WSanjXvLHyA>
    <xmx:qIdUZjpFltwheUTqO1KdpZvc8o64c-zG1196gUph5_52LTlXsWVSiA>
    <xmx:qIdUZjgnQ37Gj9kkBcVYnvF_3lr9CYA0JPw9y9SOnhClYqQjxWAcQQ>
    <xmx:qIdUZgdlDcTdXL80_mF6iDTmYr_CuqB7CbXkBXJiBrzCQk1ALOiEl62q>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:16:23 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] clk: renesas: r8a779h0: Add ISPCS clocks
Date: Mon, 27 May 2024 15:15:40 +0200
Message-ID: <20240527131541.1676525-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527131541.1676525-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240527131541.1676525-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the ISPCS0 and ISPCS1 module clocks, which are used by the ISPCS
modules on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 2b9c65959de6..7f8e0e71a8b4 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -184,6 +184,8 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("i2c1",		519,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("i2c2",		520,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("i2c3",		521,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("ispcs0",	612,	R8A779H0_CLK_S0D2_VIO),
+	DEF_MOD("ispcs1",	613,	R8A779H0_CLK_S0D2_VIO),
 	DEF_MOD("rpc-if",	629,	R8A779H0_CLK_RPCD2),
 	DEF_MOD("sdhi0",	706,	R8A779H0_CLK_SD0),
 	DEF_MOD("sydm1",	709,	R8A779H0_CLK_S0D6_PER),
-- 
2.45.1


