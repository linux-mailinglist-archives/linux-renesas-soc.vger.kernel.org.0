Return-Path: <linux-renesas-soc+bounces-33443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1optI68uH2rYiQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:27:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B93631656
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:27:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ld2Vlz3k;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12D82300A3AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 19:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA583DA5CC;
	Tue,  2 Jun 2026 19:26:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494C034B19A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:26:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428371; cv=none; b=ZSnnAT3pho0cuny+tgo+3TV31YQH1nKKFNEnSp/DzUyJplE94SjFi1opd8QgGwkDtV29yZnuQ5/kdikO8nssQZ8m66Wq7+dePYLk3yVUWB7i/Qee379DUVyQVU7mvmepoSTXX+Y2tkmUdpJ87wT/OlWNOLiM7sV5/sj/15zwaDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428371; c=relaxed/simple;
	bh=Rr8JzWohT1tJsTGXm2ibqCRdqbA1on/DZn4rk+VclDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGsi9FpGyzgPjTc+iHsKwwDyUWqWl//V7U4svr9poDcskm+5zHDiUh2md+nokFVOZ8ZoLBSPj3MGpiIhoyy5H6UGp2AW13/x/F7oaDwlmbTgWcExentqZJ9miPYWo4SJDsrT8LgXp4rlzB3Sra9XfR1YHAfQvBg/1bdzgxhimsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ld2Vlz3k; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490afc47455so9629895e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780428369; x=1781033169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gz9Gm1t+wb2XGdBfPNWvyntpJxCorkDCnuo7sD8+Tmc=;
        b=Ld2Vlz3kElhVFbe9t/6Bbc81i8nhWuwVt6NJGqBnRJITR98uaiikfHxJw4BTEqNp9A
         vxbETM2FcG3jzONh14FE8cRC8YgmqEtolIp76RQv5VLlsCjL5KsQuNiIbZfdY2WdkAn6
         1Yo6zZ+Kli4XhkI1W2ixLVut07uVWwqx4zuEb09GPsW0jsv9N/9tNY3TxlNQwEEnGhOS
         3XLgiNqypufgkdx3gFHZ5N9vp4x33hImUvmIzmrX73DU5fWNjPO3UOe9V0ahA1uibdtV
         Iz35smpoKktR4t4J2gTUx2Sd39Ng6hb1ivNtX1jrABYgppkueWyd6SKRD0Pd8ywxkYjR
         ojdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428369; x=1781033169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gz9Gm1t+wb2XGdBfPNWvyntpJxCorkDCnuo7sD8+Tmc=;
        b=gdjSbl8zxehGs6ff8dvJmfO4KZXWFbRwbUQVFPYL379YPhQH9njSvDWi053hazLLoh
         sp16Nxs0+WQh05k2Dqty1M1o/DVYMW7MLL7rqxMX5r8Tgi4Um3VBOKELZ1QJVh0Eco6y
         gt2Itjuattdi5vcLNfz0J5M9XV+WPokNs8CvLC/B0L4g7mKfUhs3repn+PxVsGsI1RVq
         IbudSSY52NQ6OTbd4NFMfgpi0OmhdLYnh8bFRqEZVktrpgWjdt8tCIUKV3M8dYKC9M2z
         Ojs6xfsbIMETz3z8JqV2UmLiwyOSnHT+14NjJ/BjLhM3oJzeX8SlQU/EU16gEOIjfRW2
         TuGw==
X-Gm-Message-State: AOJu0YwVR3jdmIE8yTHRB0GHEBUk28vFrs9p5exRBdPfywbZdlCZJobX
	oC1wk5KQj8w8gvl4/kLdg78qOPjMlyqjmfmSPiD01uDDN7fxDRlvjT+6
X-Gm-Gg: Acq92OGYiuQSp3sD8ZIO+mjlJY+a3oBCRdfs3xmstho201iK4QNmHg+fn+M2wZgoT7V
	i3Hc4KQFhbPDm3z0oXi6Q3nSmg/YU13L3TGYkiQJSEmIzKUYgmI64r8a0groju/Ta5QcorI24f/
	qfm/Z58Y5eMsxLLw4L+lGozk2JGiZeX4/OTkvLak7VaknkUZCE+NML8b9KxPlnk2HcNgDB5si6e
	bXjzxK0OBDN/uoTS+Zm9zPXPYaVumvjwDh6Gbqjkx7gLL9vBMs1fV3E3vrw5jQoJWM9ccRGyxuG
	N67htG86143iaNORQDp/8dh8BOZcSkKe4bpEt78G/bpa+fCtD40NKhnOSvqiUN1h1rSFApMiG1e
	s0WvNiwY8EWTirxftjuyONmp7r74rHb7Uw38QWcLcb5qRAAQsfg/hkkjBJSwOFJ3xszAer2/8ty
	n/kWelHv7fwPHE4hd0AGeUppjLTbsNa3qr/K+3raHH6Nh52pMYF1uUlq/9HuJyZbOG86SaJyG3g
	YsSu8EPXjEx5eaf4vYa7JmLXrDBOBno/qpdoOt/x82vhLddesYTMiV3
X-Received: by 2002:a05:600c:8a0c:10b0:490:9d5c:a3e0 with SMTP id 5b1f17b1804b1-490b5e8982bmr2280875e9.9.1780428368805;
        Tue, 02 Jun 2026 12:26:08 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm1473364f8f.3.2026.06.02.12.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:26:08 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/5] rtc: renesas-rtca3: Fix PIE clear polling condition in alarm setup error path
Date: Tue,  2 Jun 2026 20:25:55 +0100
Message-ID: <20260602192559.1791344-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33443-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:stable@vger.kernel.org,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33B93631656

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In rtca3_set_alarm(), the setup_failed path attempts to disable the
Periodic Interrupt Enable (PIE) bit and wait until it is cleared.
However, the polling condition passed to readb_poll_timeout_atomic()
uses an incorrect expression:

    !(tmp & ~RTCA3_RCR1_PIE)

As ~RTCA3_RCR1_PIE evaluates to a mask of all bits except PIE, the
condition effectively waits for all non-PIE bits to become zero, which
is unrelated to the intended operation and is unlikely to ever be true.
This causes the poll to time out unnecessarily.

Fix the condition to check for the PIE bit itself being cleared:

    !(tmp & RTCA3_RCR1_PIE)

This correctly waits until PIE is deasserted after being cleared.

Fixes: d4488377609e3 ("rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index cbabaa4dc96a..2dc080d0eb6c 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -455,7 +455,7 @@ static int rtca3_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 		 * specified timeout for setup.
 		 */
 		writeb(rcr1 & ~RTCA3_RCR1_PIE, priv->base + RTCA3_RCR1);
-		readb_poll_timeout_atomic(priv->base + RTCA3_RCR1, tmp, !(tmp & ~RTCA3_RCR1_PIE),
+		readb_poll_timeout_atomic(priv->base + RTCA3_RCR1, tmp, !(tmp & RTCA3_RCR1_PIE),
 					  10, RTCA3_DEFAULT_TIMEOUT_US);
 		atomic_set(&priv->alrm_sstep, RTCA3_ALRM_SSTEP_DONE);
 	}
-- 
2.54.0


