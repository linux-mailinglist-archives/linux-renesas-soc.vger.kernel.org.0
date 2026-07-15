Return-Path: <linux-renesas-soc+bounces-35261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BqtKK6GNV2o5WwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 15:39:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC375EC7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 15:39:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="puyML/nd";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65524300BB83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 13:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F072FBDE0;
	Wed, 15 Jul 2026 13:39:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098EF2F1FEA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 13:39:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122774; cv=none; b=GY+EvpC3EsaSQpgqhSVQDCle/wpJfy2wad8Ju3rFvdFSTNS6O0eLOcX4nyNG6SmimWmj/OTeosTDNbuq6vdAxdHo9DDVn1qP6Ak5UW0nq4Wgu/TWKtF7yQQxovY93P3BfvE41EX+F8cTAvgGzm4kL7wYMQ/KM0ThsAFXePLEwrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122774; c=relaxed/simple;
	bh=nRqbKbaWfRz8hfPCtBqKC/mvR+cJJL/qoNAprASWliM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJmpNi6YEGSKrOQpS2YAU+w0PFXkzKqmqio6TnzHbzwW+n6XTJCS7IoL+nena9b408blBt/mQj+24zfH70qiMUnFtOiR6zZhEXVk15Q0tnr7HousaBiw+G4eL0ciG7W+zvfV1Isk23G2DoxCVHt56ievCLozJJP4P7ZiPKPGf3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puyML/nd; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953ddae026so4345025e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122771; x=1784727571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSfN1MRxYCHj9lB6dAV7fGSSShXP8EN6Hzd+6qGouO8=;
        b=puyML/ndvkzf9qrRbpjveiZtaq9j+AItRRTyD6nm2g7Ypwq+ZOQVpsAAlnU/JjMo+i
         P7FgMrStaVuRwZJIGetlJxhT2l+ug7Wvex2ynGgkK2CaFy5rAvZ+ahpW+jPzfZjUkjzU
         Oky1rYLlFYtL54aW0eR/tr8IGv16FLWT15ryxRYyoX3SCr2LkJcccyxrdSM4TGkfIpe/
         BiLzw10RIXO0mlbbfICtUuMY7nCO28uPMQwsbCf3pKDblKXFcdX2wOy4vIpVx2FND8Dw
         AO6lXZkWx1gE2HiqJRQN87mvdC+EGWSUOiRHVxj9/aGfUqwzM1IghrEv5R2BstLSvw2A
         ULKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122771; x=1784727571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSfN1MRxYCHj9lB6dAV7fGSSShXP8EN6Hzd+6qGouO8=;
        b=tUTdiPIjZp2eEztc+iR/SHIxyPtutwc2iSzTPUl8udZtzQvWQNZtwGgvWs8AFnZtAq
         x61POlQFZOvatq3+ZXSqEJi7tU8tJBYRRgL2zFX05GRXNx5jH2zq3U7577jDReqvl9aU
         n8SQecLC632zKA98/RVAb1ib0WIW53vysc5oylwFVvt7TpTaF3imfQVaenJB86sVf5a/
         nlX6l7E88EbQ8+8B3h8y3tEoWBWy1mhPMEA866dxSjdVKoTqjXN7Z1UWg2BubfbCqWy5
         BiP5uW68wANTR3L4VX2JMKPPcXBBQcBKv3iKN7Cn0mxVK6u40eDWLLLp4+PFLBNj71jm
         lxLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr00NIudbOHB46bHNRK2SxFaOoO+EFt+BkuTF+mdMw/CRBawphqgnu9slu2LPVuyNAk7Xyyw6BkYimUQ9aXKP4npg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVxCrAEPGPTUrWqFfnoLgV1pxpz3Kj2QFRKBFUqdmDC5yev5O4
	rDn1ONAM2lL9JGCQA9hY4626f+mmTtor6GwXZHwxDDP+d81HkMTQq5m6
X-Gm-Gg: AfdE7cn39DMyldZVV6YuHc9jMzqMF53RrZHPK/c7ztZdnRVLj1G+0GZo5GsoBrIgPGl
	/3V3AJakd/D71R3KmkIYlhfY3DuT0dg8VoZMzd6TP6yxmEG4sdE3EVucqRWwm/BGcavtG5ztZLR
	zO2jIM4BEnkvXqOpSF6er19RVBn4ukkLefy1vYCHx0FVOOgLdy07RPx4wWN3OtRAWn2kXxdvSwv
	WCOW3EAcZ/Cs5smBk/F5ytTkKBzaQqlIJmOogEH3zfdHhxiCm8VUbJpAoYcO2kgBkX//p4i/ZqX
	/h6LYNWLnz/4m49+duvJuWEQiw8tHR9T6qtrN+uv+obpD7A4NoAvXYPpRpAXalGmhhvgQuqFQD3
	+l/SO45hjDd38AShttnGGV+pp2JjNF5ItnZcfCi10/OtHufxOOkF497KF8Xyn6S5fsw1vqvedKA
	e1HbGrM+d7zg9HKvo+AoeilDS9l7bzYdzZrO3ZIsLu6bw7ORSyR2orJ5wMt2dzCdzIcc9wdPKYY
	/qeBQ1VPWTM17f+zAV5j+yOSNo=
X-Received: by 2002:a05:600c:c4b7:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-493f89523d2mr178874425e9.6.1784122771209;
        Wed, 15 Jul 2026 06:39:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6d4f:b160:7aea:9d1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953b35105esm79420195e9.9.2026.07.15.06.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:39:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-watchdog@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] watchdog: rzv2h: Drop WDTRCR_RSTIRQS macro
Date: Wed, 15 Jul 2026 14:39:22 +0100
Message-ID: <20260715133922.2129340-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715133922.2129340-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260715133922.2129340-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35261-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:wim@linux-watchdog.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:linux-watchdog@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93EC375EC7D
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS macro is unused so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 0f951219caf8..3c8739902ec4 100644
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


