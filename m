Return-Path: <linux-renesas-soc+bounces-32014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCnEC9OZ+Wnq+AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:18:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DE54C7C51
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF27630531D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 07:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8CB3DC4A8;
	Tue,  5 May 2026 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTt07ZAz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1361E3DA7C4
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965351; cv=none; b=A8NjbKgU4WF6uv7VSAqmD5nYRWQNra9GI8ERrYnBQSRoz7KnAzwr7TgIU8hCO4pMjqlnLOqiweyDInQnQkCcfWW17cHHESKsWIdxLyFLLvpp8cfBzv1AjoHjGWLOeqNwYzyAzraRkroxPmaSU1AxYpwXPA8MKOWOKZILO0+fwy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965351; c=relaxed/simple;
	bh=O+jmM/1DtBlYXnLwaUl3+IQL7SmnVc61m01RH3U7Lt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjzAyM+94txNRJM1gg1STDANb+XRZFDdo4Zpba6jLl7PbscDhI8+iDhtCf/Mnz/J7DrnSwWjnTnW+eGYcKbSdctVAPv5CHUt6gFt6qSPOQGn3TO+X2yun/tgevf3/2paJue2AsvXWXIGkE8nVt+LsPwSRe8tm072QolIe7Wu8HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTt07ZAz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so32386055e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777965348; x=1778570148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHHQLlXmhtLnUN5SiBk+UZqYx5arQwWhlujA9Yj/KcI=;
        b=jTt07ZAz0fNowM7wvuDiDQiBjzuJVjwCHRrQhRwp6ZRYeDp303+XQXYyOh4xzzE9oF
         p5LdhggywEFkhJQVUGKFyawdqTiZIdlLMR1B6fRk761GNX4AuaVUoNDqUI0X663alsdU
         o/jbqok6I+JsKIdMwgHTy1PxmneIIzlODJE2xuEnvJZMr0ImCG04AxzM4jSxtJTt4GLb
         nfDnfFaXBC4tz6vHsVYIAxuDU7gQuQerrAZf7ce59cILqkEiSIK/beS8Syu/zBGv8uK5
         u/igyCOyldxwgBL0eYbPBeepjXBr8Lrkgkm8Cz0c0ziMF2CFutGEMEw85x1L8SJ977a7
         HG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777965348; x=1778570148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHHQLlXmhtLnUN5SiBk+UZqYx5arQwWhlujA9Yj/KcI=;
        b=slNakyRD5STQztWL8OA6GWePAmmLy8lbY+9q2BzsxEqgPD3IB2TQT3wadghHM0x2F4
         E1NIv11ESa4tSuTvH/5OW0R54QxaXKjnSrQx1rC/cSyfLLSh8NM3jLdBEVZCEzoV5fpc
         KCJ2NIeym9pqd1IEBfOV6DmC7OpRDBm+xfiYdhPXTkOfOp8WGCqsgkKDHXqCLcJyN6pY
         GdA7dVUUPSKZXaFsYAMxiyoV7YDM8rmJlLhLOWchAuREdobb9SeSlXghA5vv8aFdJFw3
         k3seFEzXjEeifd6G86IKxO8YRNRWKOx6gOV0wz18WIZMtyrl15Eqx3RVRriRzmJFLxni
         P3Aw==
X-Forwarded-Encrypted: i=1; AFNElJ+kUNhhJcuoZHtwl33s455QAgScsP4dStRYeCS4VS+182+uGJ+Y/b98B+fLyLWOTYDTCW8u4pjOrbaIkTMCnXaDBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYDnZ7KUU4IGPnvSNV6TeoGJXwqkblQNYrDjYPGMZYla8ycUXH
	32G1t7upbShzzQ2MzLHdSwIE7xjWeizx7VSDV57hcpg6I5ZC1njuSbPa
X-Gm-Gg: AeBDievohbVo6cLWW5x7EXtQoNQxIZOQchnyVfAWDobn6Deu9kXaE2Ekg+Z5wC+r13P
	16KJTy09DJ1F4r3WNTmfKRMmk06oSl65+SWjiMZUaOPn2uUVxnDYiZbPMP4EkmmDzksyW65Z/vU
	SHhEdK2UsXaSaOctjk5jFtPZDirSSS+6yCqj+fH4rGWLSscGFD7NnEBlnChlpjQzpsBNDwWhh/1
	ntrqxgfrWZc/sLcwAUvSBi6UXvj5kU7V0x0CEoGZsqNd5c3jL/6tb+Li8A+w3U+bxDcpoev8a4S
	+I7DbFZCTaZmSCtHQ+DW5rl5e+qu5se67GJFwUtXXOSHLlPkKdGtqTBx5dJ562Hnv7vWNZUcr7r
	U/jSd7M3k7Ha/ozAIP8NTIzEwktkRwpGQCYTivK5nNRGHsoIUM4YJQeS1qkbQixdYz+2QOy1Yx4
	nzBimwkqrKzenMlAxbECnQEfa7y7SEqaMnGvKhjEJvGsK4YPuo7NL6zMvHKW4=
X-Received: by 2002:a05:600c:4e16:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48d1425b450mr38870795e9.10.1777965348227;
        Tue, 05 May 2026 00:15:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm352005845e9.3.2026.05.05.00.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:15:47 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/3] clk: renesas: r9a08g046: Add SSIF-2 clock and reset entries
Date: Tue,  5 May 2026 08:15:38 +0100
Message-ID: <20260505071544.8965-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E4DE54C7C51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32014-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add SSIF-2 clock and reset entries in CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 3a04db4196a6..d843629ffe47 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -266,6 +266,22 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_REG0, BIT(0))),
 	DEF_MOD("wdt0_clk",		R9A08G046_WDT0_CLK, R9A08G046_OSCCLK, 0x548, 1,
 					MSTOP(BUS_REG0, BIT(0))),
+	DEF_MOD("ssi0_pclk2",		R9A08G046_SSI0_PCLK2, R9A08G046_CLK_P0,	0x570, 0,
+					MSTOP(BUS_MCPU1, BIT(10))),
+	DEF_MOD("ssi0_pclk_sfr",	R9A08G046_SSI0_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 1,
+					MSTOP(BUS_MCPU1, BIT(10))),
+	DEF_MOD("ssi1_pclk2",		R9A08G046_SSI1_PCLK2, R9A08G046_CLK_P0, 0x570, 2,
+					MSTOP(BUS_MCPU1, BIT(11))),
+	DEF_MOD("ssi1_pclk_sfr",	R9A08G046_SSI1_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 3,
+					MSTOP(BUS_MCPU1, BIT(11))),
+	DEF_MOD("ssi2_pclk2",		R9A08G046_SSI2_PCLK2, R9A08G046_CLK_P0,	0x570, 4,
+					MSTOP(BUS_MCPU1, BIT(12))),
+	DEF_MOD("ssi2_pclk_sfr",	R9A08G046_SSI2_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 5,
+					MSTOP(BUS_MCPU1, BIT(12))),
+	DEF_MOD("ssi3_pclk2",		R9A08G046_SSI3_PCLK2, R9A08G046_CLK_P0,	0x570, 6,
+					MSTOP(BUS_MCPU1, BIT(13))),
+	DEF_MOD("ssi3_pclk_sfr",	R9A08G046_SSI3_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 7,
+					MSTOP(BUS_MCPU1, BIT(13))),
 	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
@@ -353,6 +369,10 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
 	DEF_RST(R9A08G046_WDT0_PRESETN, 0x848, 0),
+	DEF_RST(R9A08G046_SSI0_RST_M2_REG, 0x870, 0),
+	DEF_RST(R9A08G046_SSI1_RST_M2_REG, 0x870, 1),
+	DEF_RST(R9A08G046_SSI2_RST_M2_REG, 0x870, 2),
+	DEF_RST(R9A08G046_SSI3_RST_M2_REG, 0x870, 3),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_I2C0_MRST, 0x880, 0),
-- 
2.43.0


