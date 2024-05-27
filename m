Return-Path: <linux-renesas-soc+bounces-5501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 742048D0112
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 15:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30FB5285B54
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 13:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD7A15E5DD;
	Mon, 27 May 2024 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="pam8VO7L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="q0CtPvsu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A0428EB;
	Mon, 27 May 2024 13:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716815787; cv=none; b=jQMI4F3J8j2YnJMaYz+Jh3jENmv4GoW1pEFtTOmTm2F7DH05rT2pCxJckPSceVZOF7TYhtmh2PY56tLAFBELdIFjxgaRie5kXxqtPHiWIlguEjbi9RvrvCNyXeZDJh0YXXVgpLLFi+l1qBdDI3NU2wq1IZi9EK+iftwfjcIzMGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716815787; c=relaxed/simple;
	bh=zXfHyKKNCRmUm2aqzN1ZvQ+Ju0JzixyhmSOTqcgklnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GGiXQ/R0Eahxbu3xNA/nDI9lD+iTS1DTjjg+r+42oBgvL2nM4ZzQ0et3yz6a/3XRPmq/BSiUTOMQiiECDmK8plMjCa1Tlni7VA/Mj0diWNXxqP69SZcXqv8JSup9jmGLPZNn6QtPN2ws9arGj1eHZae5x4CSYOdjRO8+Lwuym/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=pam8VO7L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=q0CtPvsu; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id D924A18000B6;
	Mon, 27 May 2024 09:16:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 27 May 2024 09:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716815782;
	 x=1716902182; bh=VBT2u7Qi8MHrqBQ9pYUzIVFhyCFKobJtn1JLF8EjpGE=; b=
	pam8VO7LKWq8EXQ2T2rEijclbeDrF7ApayeBV9spsQYz7+STCtNMPL/9waT5SD0M
	XztLocF/2Nmf8tFKWB4cmPO6Qv0wE7pL93LVd0Yr8jK0zOktK0Gp9eFy4pvthwps
	XrXR021kpnDEYgtsKvmQ4G0Lx9/0P0puc6VRWNz18JKOq5QAvh72UpH0yCo3OVzI
	rQv2+mkY49mD7qauxmh3pHQw/gHaZtFd6PjQIofO2Xf/6pj91en6cQCv/87RPcl/
	Ezs7EUKSImxO2sTKcFjfTvbI8F6oWeSZ38Ntgyahg3XfINjlK8/EsaYF+6daDL9R
	4E6DLXDy3gDPQaF7R5yUpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716815782; x=
	1716902182; bh=VBT2u7Qi8MHrqBQ9pYUzIVFhyCFKobJtn1JLF8EjpGE=; b=q
	0CtPvsuh0rm71fkekJSD2ZUi3ClkVcPxvcLOhe7TqhN0DpcSU9BHBLUpIKN+JlVr
	qLiSdsSXmUIi42LyIEzTT/XphO91F22lq36A9lc6/mR29KPjO2meU3wdxjxzkX0g
	4mXpHpMj26rIvj9QH9+Oxw0voe4JAOh/DARN7eLEMr7N6VitktMNx92fulANjc36
	/yRXcfkpGS9DAsD3AnbNyqZ7h/A73nNxpCRfZnqEA2bH5I5mwBlOwcUp9wQojQiM
	DVJvyiy6+UQPTuwiWX9wz1jGdmP1ogsemWF99QK0s7fNW5aZwOmY0F07vhShofEr
	QjfkpsuuSoNemynFYd4rw==
X-ME-Sender: <xms:podUZjnKCyokBggBrx0nbhdxByhTGhUa76AEBMhZL8gfRYl0f9gKpQ>
    <xme:podUZm1sNqGUkCI0Y5m3irHCdakEjE8_Qj9xSiEFCYl3rXhPHcJIsjkIvzG4g6Esc
    Yfp9mf5r6zeqpzgIXs>
X-ME-Received: <xmr:podUZppwcvtYrZsqbtnsJV4_K9_CWhIET3HY4J3O9-3KnsiWlM0YQhOsnsBjm__0T0vQW-jCHeoh88uAGRM9DjFHP0ufvvJl5Wkn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
    ekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhl
    rghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqne
    cuggftrfgrthhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffh
    jeffgfegffelfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgr
    thgvtghhrdhsvg
X-ME-Proxy: <xmx:podUZrm5v38T0xXnN1VaeCeZuqs6fQ7KdGuUAsQ1AhInLxj3n-L8og>
    <xmx:podUZh0OTobocJVxC2hvQVHBpjFiecR2DCdL8aBAn4uzZGdutcJxLQ>
    <xmx:podUZqusjPmf2DO3FLQzg_dQsNjyl7Pq7StBdYKb4upL7CxIVIq4nA>
    <xmx:podUZlW4SI69GmGTAq2NdflYx3lZm2gzPsvIFdro_5gjB8EsNVv2Uw>
    <xmx:podUZsQcF0ZlbsNs_Tz9STyGP4ZAUXO5SZXH4ktpYD3o6c1NLfXhc_Ww>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:16:21 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] clk: renesas: r8a779h0: Add VIN clocks
Date: Mon, 27 May 2024 15:15:39 +0200
Message-ID: <20240527131541.1676525-2-niklas.soderlund+renesas@ragnatech.se>
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

Add the VIN module clocks, which are used by the VIN modules on the
Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 71f67a1c86d8..2b9c65959de6 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -188,6 +188,22 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("sdhi0",	706,	R8A779H0_CLK_SD0),
 	DEF_MOD("sydm1",	709,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("sydm2",	710,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("vin0",		730,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin1",		731,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin2",		800,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin3",		801,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin4",		802,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin5",		803,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin6",		804,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin7",		805,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin10",	806,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin11",	807,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin12",	808,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin13",	809,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin14",	810,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin15",	811,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin16",	812,	R8A779H0_CLK_S0D1_VIO),
+	DEF_MOD("vin17",	813,	R8A779H0_CLK_S0D1_VIO),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
-- 
2.45.1


