Return-Path: <linux-renesas-soc+bounces-33444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mK/7NVkuH2rNiQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:26:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74989631630
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:26:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B3vq3ao7;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA7D5302C817
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 19:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043073FAE11;
	Tue,  2 Jun 2026 19:26:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F693A3E79
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:26:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428372; cv=none; b=atvuy8cjGzkaMJgyRwoj/33gd8hCMa0bn/rokaIS6L5f6dle7cW+M+3qnWitifj3t8POpG24CzcvMkf3QGqC+iHzUef7m36QCMk3n5l/EINIhpGYR03lG3AoYCsXZBfItHrDhtMUs0yxKvgT4dT/RVWMJAF0hgbkSftOesZpvAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428372; c=relaxed/simple;
	bh=vhJ8WlfT/UQKh+30bwKCtTBDLTkgAU6sbYcOm2fZ/iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLQ9SI6dkmGr54vhR13DfnvwCslgzmnkVN7xxWzRr1fxVkY0H9CTPPV/DavkgASQJrFMeNKbSfmDvzBajjkax9C1QLkSZ0JW3k2q3QBY5QkzsrBrCLWuJQ6HWm+o3oVwAuYdhWQxzifFNDeMJwTE6zVPtbZQ81XCFevhGxFmcBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3vq3ao7; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49050bfe053so88576855e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780428369; x=1781033169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcNCGawN55HsRcrqYdjNNvHCWY847Taw/F366F1svkU=;
        b=B3vq3ao7tj3+HgchqDNa1Umtn55nJkVqy6UkOAKPo7e289WRrZf4gv+w5+zIC+xXWO
         vaPgadYZ8Rf47QJqzl8ee5WBbKWCe39tfaE9l35/+dGk9V3mkfnLcsSEp3tutzkI5xpr
         K1atyATMHpS1sf0SjHlVzndcHMyd0FgmfvAyecVVBi9IBv/Q5C0pIZY/W9uv/DOvejL2
         LZrpPsB38oSCImRkWUAIBU4HUhjoGyBujzGaRD6qBwQCgowL64WDegEFW7bJnKum6xKn
         OqRcPyRRlinChdMuBQOhVCaxl9E5JmY5bkzM/fAcZqrrsc1duIkSazVxXVTkWSh7Dpqr
         wh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428369; x=1781033169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NcNCGawN55HsRcrqYdjNNvHCWY847Taw/F366F1svkU=;
        b=GBLYOpcM0TYRcQq2YswZUwgmPW8vSuDD7Tks6OLXNUXBQVT60RRtxMlByCMMVDQRuL
         BhY2nHqdYph9lfof/N2TgdTGgkL7wJ2TSzRWsDhNXtas+OTQEyOJNCwYp3Rn2r7dbh84
         cdSRHaY4npeFyUxZT6DIKtJxqGVvx/73wzquikbxI7VbgAntCocsxIGk+wgXAYwWfAho
         rEfS7FUM6m8X7db8xkRRUzjXx1Ozl9wi+ukAcsbnWVFiyrLq2ohQ3pUDCsWQNWM/8oOk
         29+NVvu/o5FgQj9OkCxlPYn3+UiUp7byX5u/VaGnnARjifl0dDPjeUYa60zqcZVhMbVJ
         1A2g==
X-Gm-Message-State: AOJu0Yzsx07AF+Pvy5Easv6j6dWKvsVjllttGLAFjREL8YErPZQvNFCB
	xD2gmA+gXm0v5mccyCyq16oFumQ4vterz6f8JuZ0lGr5beutSOPHaQqg
X-Gm-Gg: Acq92OEcCG6iZGxLCxDS8trKZzYhrYQ9dMgoSuwnopfUNQ8StLv2z4s908Gfnfk79AX
	28pukQ3IW3j0omALxMxF0O33KJ9+q4sbmEfKFQCf38gH4+SQqFHbXfiT5THJglzBUXnUf48FjFf
	BXsDHnrQHdTKc8uEz2liXl4LiOH1pjVLfmOssV8WkxTG476akfHC6icCmiC8Pv/YPydpOZSCxch
	3X4ADUucHYU3bnqkx2won9ZZQFGUcyMtAb76hzEXC5nC+NvzWL4Beiq4j/Ry9AsI6vDBGQW4sfa
	sXItP38XBCCd8W3yPIuvVn5ZEuYe0yXV8yqNRfwXtes4g50hDWWFCoaL6/MHdKcDuDuf+m+5fcJ
	ApcmvVfdg6z6s+d0G0ucVER/kzkfUfB79XbB5KxqTMrO7OF2DjtZ+FYOFGFZ5/zsUaWh2hknRuI
	pQcUmNIxBdEIkvoAEOe7HsD+AB7S1cY7g/6/augqQPe0mmYYNTm/CwrIltqEIFe460+YTboCRUL
	i3i2UIGatTCotrDlX+E55bcXq/uVyGdghbGvq5tm+3axitDFm3e61+mr9STZEtw7dU=
X-Received: by 2002:a05:600c:3113:b0:490:388f:1c0d with SMTP id 5b1f17b1804b1-490b5e94d56mr2872955e9.5.1780428369407;
        Tue, 02 Jun 2026 12:26:09 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm1473364f8f.3.2026.06.02.12.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:26:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-rtc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/5] rtc: renesas-rtca3: Check RADJ poll result during initial setup
Date: Tue,  2 Jun 2026 20:25:56 +0100
Message-ID: <20260602192559.1791344-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33444-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74989631630

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In rtca3_initial_setup(), the driver clears the RTCA3_RADJ register and
waits for it to reach zero using readb_poll_timeout(). Check the return
value of readb_poll_timeout() and propagate the error if the poll fails.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index 2dc080d0eb6c..af2a3878289e 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -634,6 +634,8 @@ static int rtca3_initial_setup(struct clk *clk, struct rtca3_priv *priv)
 	writeb(0, priv->base + RTCA3_RADJ);
 	ret = readb_poll_timeout(priv->base + RTCA3_RADJ, tmp, !tmp, 10,
 				 RTCA3_DEFAULT_TIMEOUT_US);
+	if (ret)
+		return ret;
 
 	/* Start the RTC and enable automatic time error adjustment. */
 	mask = RTCA3_RCR2_START | RTCA3_RCR2_AADJE;
-- 
2.54.0


