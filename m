Return-Path: <linux-renesas-soc+bounces-5503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE328D0117
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 15:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99BD1285C12
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 13:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA58315ECD3;
	Mon, 27 May 2024 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uaY/f91B";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Vt3R6N06"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D9515E5CC;
	Mon, 27 May 2024 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716815789; cv=none; b=fTyWmJ1bU0wwg0IBSUjQ3T2gFoyEmA2/wPmAPkcIM9wbY9tpkLK637ZZMFldxpnrFwxkNrFS0ERPVvstvDvGCPeP5kDmvZav2df4vHk6Qj+5mTREgNLqsF6ky7UankQ5p0lQE9EFGs2HGDexdat45dbGeE6njdvvrFDG7k9DUnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716815789; c=relaxed/simple;
	bh=pfkKwfAesPjbPA+DBzyvxysbqVrN9XtLL6+6ng0tEFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lbVOS565FJpWqDpc5Xba3tBUJgc+qiW/VVnCZ8DurSHFI0NxMq5Re9MP9yeDBsNgwW2ZBYmPU530hc4VJiAwe3zcKDiOk06JBvVXH8EpZ94VyFmjAjKPJOasMJe6jbje6nREmACCCYsCrtUtAjfEbz6AG3Umcz9MJj2OhDfkMOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uaY/f91B; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Vt3R6N06; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id C6E0D1800099;
	Mon, 27 May 2024 09:16:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Mon, 27 May 2024 09:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716815786;
	 x=1716902186; bh=SBSHWsmn9JeFH4nhKYMj/9WTMloqHuXESttUyxbxUns=; b=
	uaY/f91BsiG/GHh8WwW2pDnVC/izi1xRBdlVsUfRDBfZOuSMk/pgOL2D41fmDN+v
	G8mq6QSxgPB67UYtjhfPw5nOGy2eU0hw768ALu8bSy9DQ4MGrZmrElv88UyuEQ4Z
	Sa9jZoEI6NuuVLcG7zgvfbYPtomQ/8qRbturCigl3RWrUdBFMPLEStLa8rWPPDhu
	K/DpJ2ZO0zGEuk3zzeXbFKuE/PZThx8fIgxq8/Qj4/1nAN+JET7a1H8szHYzK1vj
	iW8ndiBt455z2zO0UvKEF9jq/n8rwlbYn5cAPTJzLXX27U/lp3EFmTbhfZ2xFSG3
	eVl6UzfX5Wa8UMCw5seTJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716815786; x=
	1716902186; bh=SBSHWsmn9JeFH4nhKYMj/9WTMloqHuXESttUyxbxUns=; b=V
	t3R6N06+132pfeq5WykDzc77RqsW5DtANX69O7m6iAb1fFshc8HDQl8pu8l/C9w0
	erUyQTT2u+LbH+7ssrsZySWkQCVFfjW6tmKCSp+igzzx0NRcRAybhhXSvR02zDPh
	mdRfnhsrJRILzdCjww1ESfYrzYjChMK5rB8KJZg53LIxAjru5ixAtwSTejk8y5Jt
	qg9lxakOk601shm60BEjg6O5VJ1KosBsjjRhF8WCd1apvoc8q3XOqCr9yebaVeJL
	+0u2qYBe/GokYe0sH4ZuvMjd/lbb37+5+bPb+q/gM2nzgftVAEAhLgfQzhxWfYtZ
	hFbJrgg/znintsbyrKHXA==
X-ME-Sender: <xms:qodUZvnPPucq4cT9b9ei3tMRB8Au7ZK30MJnF9mQVy53ymbHexzeZg>
    <xme:qodUZi1fGtQxLA2hVddq9lgdaAQ-paInmVz1ibxbJR8Iy-xA2W5JYNEVk6TbL4nXP
    LHPzjE5UGc9ogoxeaE>
X-ME-Received: <xmr:qodUZlpMmbv9xH6WW-Ml1OZZT9S6u98lKr11cHW0UJj0pt0Ak09xCjavVr7v703v7ZYDu9NNaY5OXbZ7o_RgZODVg2g_rzJJjP4b>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
    ekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhl
    rghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqne
    cuggftrfgrthhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffh
    jeffgfegffelfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgr
    thgvtghhrdhsvg
X-ME-Proxy: <xmx:qodUZnnKuU44cHBCy-9kHJBCMg7MP19RESWty20qZBzB6GI5usGngA>
    <xmx:qodUZt2v00IJj9Y_Nze0VBiFztjcemkY-HkTtvOrfu-CX8fruFLIcA>
    <xmx:qodUZmsLxeo-3-bHOlsOdgg-f3knqdg3x0EEq0EJv4sVJZVgRmEHAg>
    <xmx:qodUZhWQacERfUUhuV4OzS7nt1OjTqn6-qwGCLYQaQsvO0vjOkww4w>
    <xmx:qodUZoQsE7LITnWGG-x4zNzSkTXYLRlYAeJfUq-qaB8d2D5cRXnd1i2H>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:16:25 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] clk: renesas: r8a779h0: Add CSI-2 clocks
Date: Mon, 27 May 2024 15:15:41 +0200
Message-ID: <20240527131541.1676525-4-niklas.soderlund+renesas@ragnatech.se>
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

Add the CSI40 and CSI41 module clocks, which are used by the CSI-2
interfaces on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 7f8e0e71a8b4..b3cc86bb36ec 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -176,6 +176,8 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("avb0:rgmii0",	211,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb1:rgmii1",	212,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb2:rgmii2",	213,	R8A779H0_CLK_S0D8_HSC),
+	DEF_MOD("csi40",	331,	R8A779H0_CLK_CSI),
+	DEF_MOD("csi41",	400,	R8A779H0_CLK_CSI),
 	DEF_MOD("hscif0",	514,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
-- 
2.45.1


