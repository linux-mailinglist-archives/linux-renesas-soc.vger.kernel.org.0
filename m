Return-Path: <linux-renesas-soc+bounces-35123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sCueKuTjVGpJggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:11:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC8C74B5AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:11:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=qUVJVP2U;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66B0B3044E53
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2864229CF;
	Mon, 13 Jul 2026 13:06:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C234D414DFC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947975; cv=none; b=PDtz+1KbsI4Im3pwmdbjGRnyeS//zcuWPLPmmF/lCjEN96gGvnples0+nw6n0yWqpaVYMwzEpfHJORS/X1WmnlJloAnGrYpjZig6XyPap3iaZFz3BIUnXMkB/9P+K1yP1CXPNz6Q3QeSbQoZ2SpsKoQFKBdGJMiRCGkNzFdEoIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947975; c=relaxed/simple;
	bh=ZGgKB3N9sqiQyUjmf5+04gGQszZyGDZ+W3cavW5NxxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QukdIGBYVDUAxf9WpE9TxDJ4JgGZmKGay+RKgyG098X5I+xLgFMgM3Ms0lc9s+8MmxHs1BJ8YCzQhEc1gaj/cBRIFujKELdxpOBDy2ydHWN/d1Q/hrTFnaIcNOwOQiRgzueSeSsW1Kns68iH8TaqF1JFkRVC/h0HSm/e60dR1dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qUVJVP2U; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493f0ae9572so12330025e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947972; x=1784552772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QIMAhS3NtIYTLeRVHRa3qf70Dj3A156a3x/QO7iYik=;
        b=qUVJVP2Uo7C4Nisc3YaaOtIg4syWSuCeG8QvQUuTR2pSjB9qKl/D7a67G9lDKNDjkR
         bP3CUvrSr6/58/lFD+mBzywVwRi3SwHebDI+QAxq3Ecq94bzGyOKpZWXMhZurV1k945A
         KNR1OBUFkebD9NT21IW+uSXR0BaL54XzNJM+M4YI2IY4S4YkluG3e8NJsOA1OravBfa8
         uyIF70p8tRo2mDuDPME3WvF/9cKFvwbsIQUCmBTv/Bf39THR8d8Cn0ILFH1SjKU9KKri
         miXlIfXmReRVCQu5xHG2Bb4WjIm7TCPdRgP0uN8FwmQd8QZ8fVDS6PYjdfqAmBPT840w
         QWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947972; x=1784552772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QIMAhS3NtIYTLeRVHRa3qf70Dj3A156a3x/QO7iYik=;
        b=WmoDUInP8tocTMO25Hjjpt0xTjP5eKEjaPOB+TqQ/eVfj0LgTABfIQKgrQ3Pva4iXQ
         7PiFeDjrT6e7jFgjH/vQ5FyKLDAClqZtimMqDbDa9grNlmWbufpmBuKldxUdOlw1Edvz
         nigEgF/LFZfgfemOO0EJ+y9I6HlSzGuSVyf7Y9j5dmJDlAILMJC4kO6M/akCIa4gNATn
         6ZRtK6CWbKFxoVpOAJd0FLapVJ9oZCWsSPF2v7BMka2+f6cB1Xw0RJJfNNI/SHxmMidT
         mSqJamoF5R1aALfjyam2MV2ak53wYvFPrTqD9F3SLUr2/QPOePNz+w5h6mmw3rTeq7wQ
         ya8A==
X-Forwarded-Encrypted: i=1; AHgh+RqeClM3WGIzbgkIt6jiSgptI/y+wlE/RnrE4g/EyTRCbzwdlW8rqzy0nrIB2enOcP8s1tpEEsOlSfaeXMPRdFjFbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEafoKGKcIoFSnqVq6nLMq5LYUDvI0o9oBYOrmbV8XmIKwlv7s
	UgydTEz34FWpvkYWayIzdjb7bhysLjOoQoKH+FBDx/dqoZWkGNxc8HcGOwVah77d85k=
X-Gm-Gg: AfdE7cmg4esvpyvBDHh5R3DBA82tHc3Rs5ifzghPJ25pTo9ltknZzP8u3fY7eVe5OsN
	9KsHckOej69LbJG3czPaYSId6Hxr/DvQC96U1GLx3udzEdGe+NydhRLF+Dw4/5awgQLw/PqC5nf
	DkunYBauD2TzEtJMTLksyqs0TiY+E4AE1R8ytzanANF/uVQ6Aodij59j7TnaeAHuVxzPSnExU0O
	0B1YqLx37xz84bsI8xp3Sbd9QiIaQQEFctJyjCBhoqxTqaBYiw+7VCg/MgXopmtVYsk/idlEhle
	QKG7/weZM2h6kwsyJJTzliIg6lo8VjcufoEzubPm+IwCts8JfW8H6q5TBw9+g9aLj5gh5DcT07d
	7lsWhzr1ajq7mcEsUHxEmRfRTnaBHWsbJmbApfm2Omo8J1WpYiCiwYYINiOo4fXpUr4ZXiqMGmI
	dPBY/7IDHhHp5bkuqpQKgxT2iqyGLwvVDS0FJWyvYSYTkMvG5Iy7dXyK6Fd/yq9WHLRHW/ujg=
X-Received: by 2002:a7b:cc88:0:b0:493:bed6:85e6 with SMTP id 5b1f17b1804b1-493f87ebed4mr60792215e9.15.1783947972176;
        Mon, 13 Jul 2026 06:06:12 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:11 -0700 (PDT)
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
Subject: [PATCH v5 13/17] i3c: renesas: Update HW registers after SW computations are done
Date: Mon, 13 Jul 2026 16:05:41 +0300
Message-ID: <20260713130545.568657-14-claudiu.beznea+renesas@tuxon.dev>
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
	TAGGED_FROM(0.00)[bounces-35123-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,nxp.com:email,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BC8C74B5AD

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

renesas_i3c_bus_init() performs a number of computations and software
cache updates, interleaving them with hardware register writes. While
this works today, it makes it harder to minimize the time the controller
must remain powered when runtime PM is introduced.

Perform all software computations and cache updates first, then update
the hardware registers. This prepares for future runtime PM support.

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

 drivers/i3c/master/renesas-i3c.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 52f09d966651..2cff7c6ae369 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -565,10 +565,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	if (!i3c->rate)
 		return -EINVAL;
 
-	ret = renesas_i3c_reset(i3c);
-	if (ret)
-		return ret;
-
 	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
 	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
 
@@ -619,27 +615,31 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			STDBR_SBRHO(double_SBR, od_high_ticks) |
 			STDBR_SBRLP(pp_low_ticks) |
 			STDBR_SBRHP(pp_high_ticks);
-	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
 
 	/* Extended Bit Rate setting */
 	i3c->extbr = EXTBR_EBRLO(od_low_ticks) | EXTBR_EBRHO(od_high_ticks) |
 		     EXTBR_EBRLP(pp_low_ticks) | EXTBR_EBRHP(pp_high_ticks);
-	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
-
-	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
-	i3c->refclk_div = cks;
-
-	/* I3C hw init*/
-	renesas_i3c_hw_init(i3c);
 
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
 		return ret;
 
+	info.dyn_addr = ret;
 	i3c->dyn_addr = ret;
-	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
+	i3c->refclk_div = cks;
+
+	ret = renesas_i3c_reset(i3c);
+	if (ret)
+		return ret;
+
+	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
+	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
+	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
+	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(i3c->dyn_addr) | MSDVAD_MDYADV);
+
+	/* I3C hw init*/
+	renesas_i3c_hw_init(i3c);
 
-	info.dyn_addr = ret;
 	return i3c_master_set_info(&i3c->base, &info);
 }
 
-- 
2.43.0


