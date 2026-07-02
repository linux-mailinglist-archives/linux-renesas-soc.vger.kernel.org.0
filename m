Return-Path: <linux-renesas-soc+bounces-34669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CHvUE+eQRmrBYgsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 18:25:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CDC6FA256
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 18:25:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dhhGXzKf;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AE8E03004CBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 16:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AE530C354;
	Thu,  2 Jul 2026 16:05:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D65340416
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 16:05:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008316; cv=none; b=CvIT5Zm6/BXiiXwkMSo5Ba98WwFPNjKCVrHJOLDHu9ekRqb/d4tVrTffwPixhgzbIo2N66blywLpvzw6Zh1SKpjD4+85fSYMCV0jAlRFX69+fnvR+4aGrTaZucOOHolcr1PnkbIMUfoLbPwVW3ka8POR/Gd2YaVWis0tmMF5Yeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008316; c=relaxed/simple;
	bh=U1yr0rmZWpngaJ/BudO4/jmhPQiRqYk79Fyt/OQ0N5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQvnycKyhe7NeYCSIyoNIKaCBfN9qEKos21urS9TUCuBtqeJTdS4V0GlrbROI25NT+SSCJc3dBmsAyHPxquXOp09er4N4cPh3Ni24pDpshNrYfGqq4CuyDJfXLD9vQBIVvJEX5TlPcE9AI1CZYTX0n5gtvXDFFWUSKQGYBMrzFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhhGXzKf; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so13784655e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783008313; x=1783613113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FziwhrrBaAoQlQIWrQ6Wv9jX6eR8Vhyo1gV1RAx6nac=;
        b=dhhGXzKfSBKc5YAA7v+Yu2TuelJ+or0V76gy5/7W1MFmzLwjuZlR6AhqsrZvDeAyf/
         0MRvroTHcJsaE33RsZ/MM1k/BAf6nLmzCOx4K0zfUOZ32ZhiYLaRPzex7mBqlkqF7+Tg
         vG9A0YUxa/DRBxj+gWndwoJGhdl75l4XL1cMH91wgpMLU0mtoasY/BjFeceOfKrIj3KA
         CFgTpozDGcx1DenU9wW8dlRxH1xKNMHTSeaPSOszPAVOBsDhfTzt3WZ91yV4uVfLHULO
         64CpPjCJQZjPVLij7M5CrTqjkv+6dN1qOcxaOncVEqSFhuHd9RiA88u3/IEyg/8Lf52M
         T5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783008313; x=1783613113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FziwhrrBaAoQlQIWrQ6Wv9jX6eR8Vhyo1gV1RAx6nac=;
        b=KjLEcbpKoSYvUHi/+Lt+/M+NAYVLooZb2djABjgtxplembfpIu3pnxhZdBIR0W+3Uo
         neKF+nHBs0Mn2sD//aF11gdr6X3bTWo7FhpTXVg2y5z4xvAY37CKC8/CaKhR6tTQk3nW
         j3yPITY5nFURoQQYG0SHy7KfVe7U1N8PJG7wrZeeEekencjbWQh9lDoXAEL8VD6ELF+d
         ZTBNcWjt5+OMiQ3UCHIPRmptMZ7JjMzXNdeRZ9S7wwDJ9QhEIX6CY1gl2VhCUtgk2whM
         2hqW9BIGuPAhoh7Pcyh9Y4q0jmIhDMVmN0i+dUQGTjL1ftoTiMOV1BrOVlu1mddJV5Ga
         L7kQ==
X-Forwarded-Encrypted: i=1; AFNElJ9leoTMZpsdJPTHzZtX/rnN1F7s8NcLcbGMe2Mk0cqP2RvmJxh3xrngFE5zPrKKyUToRF8s4LlpiOT+06FjChNMCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfJrMcPydrTJLDUq7J/ZhO621J9vxZq1no6njvwEDbKsVZ6h1G
	0OLvY5S/e8rYCuqq0bSWwCvWNnmyLfB4w3aLGSs7uxz5DZ/0pq+foWCC
X-Gm-Gg: AfdE7cm+27pNiA+q0KMGulT3O2acerXm+hNMfwzYHD1JeDvo/jIkVhnjgD0ivMp3hlr
	lcN8gMijfDxhoiLmiuDbIlQXHRlxigoTh8ClytL8vBhgFXdfye+0AS+Hc0pgXyHzOC5ouh10+KW
	dQU+0GwOOV6CEEoHtqUvObYX53kKClxCIk7r5vV/wZE6nEwBu8mFarf7tz++RsS2csVRlNprwoc
	Ari8XBcuSE0vawwK9l71RO0ImJzVzfM1qfRteLh/sHnHWOnVPEoRilK2x+LNFtUv8ppoFyt1MSC
	n/qZuLoghoHQfllb1BNfyQvqPOiSFNLIUIraxsEnEfEjX5e/bgM8ekgzPYIgYlSMkYcL7dTLz6g
	w1M9SVkmhYgLNYPcpJa+GZKDIhPzfKa/lbJE2bqyLHTnZLAQA+qemNwLfzXuD8X99wlh4V6AYu6
	NAmew6q+f3a5+k52yKcZGr2iMmJdTR+1UaxHN01IcaRl4CTlurIbz5/9VH/sul/mLbFmP1Zvtr6
	6KYM9fNcscixhkaz9wopWQO9mI=
X-Received: by 2002:a05:600c:c4b7:b0:493:c785:e0d7 with SMTP id 5b1f17b1804b1-493c785e283mr37402085e9.28.1783008313040;
        Thu, 02 Jul 2026 09:05:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm85444715e9.7.2026.07.02.09.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:05:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-watchdog@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] watchdog: rzv2h: Drop WDTRCR_RSTIRQS macro
Date: Thu,  2 Jul 2026 17:04:57 +0100
Message-ID: <20260702160457.1884345-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702160457.1884345-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702160457.1884345-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34669-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS(0.00)[m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:linux-watchdog@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34CDC6FA256

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS macro is unused so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index d0b38450cc32..e36f3d3c98ea 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -40,8 +40,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.54.0


