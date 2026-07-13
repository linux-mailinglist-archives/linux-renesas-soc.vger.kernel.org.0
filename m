Return-Path: <linux-renesas-soc+bounces-35112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CGD/IwvjVGr0gQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:07:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EB774B4A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:07:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=gmJMNhF0;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 452A73046B25
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E878416D03;
	Mon, 13 Jul 2026 13:05:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80430414DEE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:05:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947956; cv=none; b=KAHYxx4XC30oOsYDJxWuOo2rVHLkNdDwyxeevyGVR/IPw9HQ8PPqrq8FuckDTvxpT95HQoAV8CDs6cEANcfXVRN0V0mR2bh7eq2A9/t04W+ShY+DQfA7VPFPmtpIVBqi1Ib8sbvBEjtdrKraCqy1+kVIoX9VMIkNtxo96DR3bI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947956; c=relaxed/simple;
	bh=FtnknuqUHzlJVSz5DKvAQlnk/GzeCzKCShgoXUtLKYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyxNgEHaTqhOwqM1p9qJzMx4t9OgxaQyT4DDYF9CupL/8t6FJPOxY/+X8o3xTC2wFefm0osP8z5Dp3lPFNts88PaAsxAT7GFwd5lDyaXbVM582MaIgawFNWTdVXGIK0U05+wJAzEzI7W0UcbmPPENvayVqR2vWesF+TDPuFQ4lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gmJMNhF0; arc=none smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f365afc5aso705769f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947953; x=1784552753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH5mcedIpIiZlH9zrS1BV7uvFaa9p7I+Dq7Nzg++u6k=;
        b=gmJMNhF0L4T1eiXPGKWMkSCEnshbF828m7t+8yD/Q4kaLhDXSD/Y/HdUcLsqNpC+vm
         fICNwkkmmM+Z3sasDeiZC5exJAggoQP3FTWYf22ZihuGi8piS2CRZb0AkZN0Hl1G7orr
         6IbHMD64565T35KkOWeIeV/8oxnbgBfQ2kMO6woJLR0pNZPcHLCsMmmtGUwmbDGojTQr
         RE/NW1djMR/H06AKoSyHNVM1OafQUZd+haOXxut4+T4DtE2sCSP3clA3MyYnV07DwQAD
         gm6K8vYsON9EvNIJ2nXVH+kCa/yglw8eUXLzRfOw6lXi+0bv4/CCem/8Ol1M0hLWmkvZ
         3DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947953; x=1784552753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UH5mcedIpIiZlH9zrS1BV7uvFaa9p7I+Dq7Nzg++u6k=;
        b=lXZrWQdA7ADb8jFsaK1ylgZ4sn1ep/3Fu5F5zB/bLzW3MXg8uccvFtePpB3Xp/nIkS
         XYAR0rGx9uaOyX64KsDHL4sdW7FLuYHS4TSenPmB1+6kois/Ooqlzt4c/k5PNYAb7VA6
         LdnEIv/ezA23hz4cIHje6CLy4pePfGP26GGFRqrAuqwjKw8PiU3Ba3Xx37pb23iUm3/H
         KCGxXwrD/OScqZBQr/hUv3VIMbK8nvhoPn63Ugc4KXWXeQVxe1iExeDj+w491AiwW2G7
         MRXSINXy6Lz81Fuz4hkg8AOrewz5U5oJkVtcaTNk2U0w9oqVOMFOdurVcD0wSsYTm25A
         3RdA==
X-Forwarded-Encrypted: i=1; AHgh+RpcUtQbrMyOyh9jwgooTgrFTzsBGepjON/M7yLIR6cvosXsj6IGLSI9aF2QCBgpyuz5PQ0WvEVfbIUHrElQROHEjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy52rBW7RnjeTaPgoyXsWk7isuhGo/zJSmL1qJcgYYqNZIkmS2h
	nFcJ9XiqWkr55A0CqWPT724GAwnnVRHstrOXv98+MNknyqz0gspHARb7B22Q1cNdPPw=
X-Gm-Gg: AfdE7clkmhyVIgZj2pSwlZ2PDlAAXIo/yoX3F45pQzYTsZ/qbjo4bSCLoOh2jJfGLpi
	Y0hh/yB0bFgyBOhS4cKOIDheWeZ74bPG0qTivReCL5mqEcd7gDHFflf3k+QuV+lZlJ1U51IPLt6
	jy1+KOzRm0Qtgk5Psre28941UDlKjc9wx4AUjw2Bf3PLUSWrMpKlOEr2FZS95PtJeXZQ/wgMMiy
	DwVWXTPlFLYSSTM/H40s1jGFhn54WCRqWWxwAZM4v0nFNoAThPfMxGRVQm4Y9cI0C/FgEBZTLkO
	AYeIP72bKT7KrcUmQCpeAg9tqsn2dbifIaZRQ5VI8F6x+q49os37ckliROekyY1WsvGlaazFWXo
	Jm0jANNnck6Yv/UGy517dThyYP3ZKFwAYVG2AgxqOtETF3314oUWMfrgL+5Bnw2Lgv6fX7ntE95
	fcm8r/E6iO2hsDmO03/vHQSs/2RiAbZfoJd3JE6bGnWPpOKOqIGwCz4rOIHhLkxLuoJa6wmY8=
X-Received: by 2002:a05:6000:2209:b0:47e:4b03:1aac with SMTP id ffacd0b85a97d-47f2dcc657bmr9421634f8f.38.1783947952926;
        Mon, 13 Jul 2026 06:05:52 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:52 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 02/17] i3c: renesas: Restore STDBR and EXTBR registers on resume
Date: Mon, 13 Jul 2026 16:05:30 +0300
Message-ID: <20260713130545.568657-3-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35112-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,renesas.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29EB774B4A3

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S supports a power saving state where power to the most
SoC componentes (including I3C) is lost.

The STDBR and EXTBR are configured in initialization phase though the
struct i3c_master_controller_ops::bus_init. Set them on resume function
as well to keep the same state of the controller after a suspend with
power loss and a similar initialization sequence as in bus_init.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 38b8428f464c..cd9928649c7f 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -260,6 +260,7 @@ struct renesas_i3c {
 	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
+	u32 extbr;
 	unsigned long rate;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
@@ -622,10 +623,9 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
 
 	/* Extended Bit Rate setting */
-	renesas_writel(i3c->regs, EXTBR, EXTBR_EBRLO(od_low_ticks) |
-					   EXTBR_EBRHO(od_high_ticks) |
-					   EXTBR_EBRLP(pp_low_ticks) |
-					   EXTBR_EBRHP(pp_high_ticks));
+	i3c->extbr = EXTBR_EBRLO(od_low_ticks) | EXTBR_EBRHO(od_high_ticks) |
+		     EXTBR_EBRLP(pp_low_ticks) | EXTBR_EBRHP(pp_high_ticks);
+	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
 
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
 	i3c->refclk_div = cks;
@@ -1468,6 +1468,8 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 		goto err_tresetn;
 
 	/* Re-store I3C registers value. */
+	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
+	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
 	renesas_writel(i3c->regs, REFCKCTL,
 		       REFCKCTL_IREFCKS(i3c->refclk_div));
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
-- 
2.43.0


