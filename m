Return-Path: <linux-renesas-soc+bounces-35120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BPv6JNHkVGqjggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:14:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D87D774B69C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:14:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=aSgpNSjA;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7650530F3D86
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE2B420E88;
	Mon, 13 Jul 2026 13:06:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C1641734A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947969; cv=none; b=L/mHnT4VT05r63MxJ2vaBmkeIBUnTOtHGTiriNPBXlVLNvYoCoRzUnxk4Py9uflbT2pYiny9e544xRHnp3NNgBJFnMsDRr/xaxatqPAhpD3GzPXxJHwjTJvdmsqQ0uZhMPD/HZMnGS7RpkL/EYBG4tE7/81N4bN6H/ApxR3njII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947969; c=relaxed/simple;
	bh=n3eJ6/R5BH4Z2+H1pHPid6pm9TWqV82/I5IepPg9sA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLibEKq12FMf46pRmf3MlWx3WABx4/Sch0tCEF92HLHcU0x58BdsdDfyGjlpbkjG9PilXMMuh5im9Lu+43DBGL1fUTrnB6m5fW6UEo+aDR3Xnl5jc7LSY1k2PETebo+mLrzH7BRZJ35CR9ufzDWkBQGO57gMeA191Mpa6IZ01Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aSgpNSjA; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2695583f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947966; x=1784552766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxph0gA4T5d+Jhqpx0Ou1LFlebFELoaRVUc+1WxHvCw=;
        b=aSgpNSjAZqtuyLTSdplBvGKElVQmw2c1YqKGMlh1vi9m5jIrXqEQruQVmsleXBS3un
         nvspc4mAJqNlBF7jW1zjLz/RJqbsS6ulu31ijVACkQtSHDhJkb+8ZAPP7V8qA42xaGy6
         nx0fV/h/5wBVzF1/7iDer3bSz38acbyC2M33bic7YjjIeRDWE+ctdmdTsphhawtD646l
         jjLGozpkGqkNJLlUJW7TnfxAwPhabxVn9fiv+mWC7PGvFYC+hk2wbzBBdO83KMZ/FSet
         S63F0m+5dG9G72CcTHONfF7a2i3ZVM7pHzy73640sgHMZbyOHLAJcS1gu7gekwGIVhgR
         g54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947966; x=1784552766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxph0gA4T5d+Jhqpx0Ou1LFlebFELoaRVUc+1WxHvCw=;
        b=UCnpcCyQu7dMz7NVj4A/x7M2bnplPiznzahMUQ/+OGzGkhEE+GZ7SvErdN9NdjVKt4
         hu/YzPblToDSw4QK1l+sZEKFxV9w2z+zR/LxZIBgcxe554ekSxn5Gv/JChASG/+SvJCN
         BTGQ3CaZ17j2bgx5fXIFxHiYfw6zti/Dhf4PMnzRTG7AVUs+i8uhrQ0ms8fXzNXn0QUH
         yuS5wSW56PhoohZB2SycM0GpKw1ByZGM3OWzIKtsGd8TDZlm0oRpsvBopi8/e3iTLqRe
         oVBstMcBLLXTExtjAu0bTdPT9AW3Fd2JQN46hY3CPr8RHsaIWpri+3Em6lmRFpJbEwmo
         thpg==
X-Forwarded-Encrypted: i=1; AHgh+RqSOSWv+rptneMgakIcC8dk5WOJn0DHgXB2hoXTVtiojIJXcggSR0DtP0uf0VhjGG6SO1gi30zijyJraO7h2I05pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdloC9HRBIn5TPfLnAIdNQPehdhA9pkbYlDfLekv8zre1hpnEX
	6arIF5Fr0g6eLgR9btXmObzgJbog64NCHkwa/QwRkYWnZh5Dh1tSEpHYQq8jc5SnOHg=
X-Gm-Gg: AfdE7ckoB96te1q1oM7XxAR1d+wio/i0qJeN+VY3ang4p/R3WcsB0g07x4180M5y0rJ
	p/oAJOUPvBQuyknAOCRUZADZU3mmu+NbEgw+WTdn7iU96Mn+r8K7XQ/qpKj70btyHZHVz1wcfrT
	GMBmFmTlk5NX144Fttfam8YzYq1QvBbDQjrwFGsbZGnSEMoG013uM7UHl/7x+1jEwNM/oUaeMGy
	uksO2zN86LKrr0YunAEBYD0h182IBb3lmTzwGeh1qmVvYruk9zSRxag2c8jhXWMwueGdsLfwaT2
	VSpKlmHQi+QXOI3C6gwvdntpYAeNi948j4sfrDZYXxoyCCI9PjnP0yVsI9/UtMTOge+CdS2Puff
	66glgt2MQgH06mNMOMOdiDF6hcNnL0pntq8wBKqWyBd7+hbQKAjsn3FZhFN9HkNuJssuiDN9oqz
	WQLnPErP4SrDUhUq9slDwO4vQuRnK0wfixY9B5bMavqfmyFVH43myWWQo0r1bXcHhhapKh00k=
X-Received: by 2002:a05:6000:268a:b0:47d:fc45:ab38 with SMTP id ffacd0b85a97d-47f2dd2b622mr10557777f8f.40.1783947966327;
        Mon, 13 Jul 2026 06:06:06 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:05 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 10/17] i3c: renesas: Return immediately if there is no transfer
Date: Mon, 13 Jul 2026 16:05:38 +0300
Message-ID: <20260713130545.568657-11-claudiu.beznea+renesas@tuxon.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35120-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,vger.kernel.org:from_smtp,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D87D774B69C

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to allocate a transfer structure when i2c_nxfers is zero.
Return immediately instead of unnecessarily allocating memory.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- updated patch title

 drivers/i3c/master/renesas-i3c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 915090d0ad37..9a3613220034 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -957,13 +957,13 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	u8 start_bit = CNDCTL_STCND;
 	int i;
 
+	if (!i2c_nxfers)
+		return 0;
+
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
 		return -ENOMEM;
 
-	if (!i2c_nxfers)
-		return 0;
-
 	renesas_i3c_bus_enable(m, false);
 
 	init_completion(&xfer->comp);
-- 
2.43.0


