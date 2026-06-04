Return-Path: <linux-renesas-soc+bounces-33575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EJwFIhtOIWqpCwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 12:06:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FE163ECDB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 12:06:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="EO/2fHqq";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 938EE30E0397
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 09:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8C83DE43E;
	Thu,  4 Jun 2026 09:57:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026B13FE656
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 09:56:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567022; cv=none; b=RzYayeh/EKrdEi1luiovGv28vDeO4g1uWtyJVtrp0RcccTGJeAa8a65LUBi+YKrLzGVAdwHGPetJC/9ubUxxWG7ziGqto3JpIFq/6eRzxqTOArBSV8w03x+BSnqbnAdZ1a2vvkGvjeSMWKnYSYksa/1V+fH1JhYzfj6IVt0ZAVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567022; c=relaxed/simple;
	bh=DSOrnh+y1FR5hznD6d87goguRPCs/nf79LO/QwtZvLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdONAo+giA/+ZJAvVW2WjxLVdzGpKHSbF1pltRoig/PBFPafq1JPezt3x2qAHr2Qyk62GSP2hBVtAgot3AkjAiQAJR/AtQAvGL4E1AZvZJZdTcGGOKNL1TX8uGIZBTEhL9q9KdOLv1/Lx3kbjEUSh1bULzit+EBFQzO1dbZiEgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EO/2fHqq; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so276301f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567018; x=1781171818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+OfL2gz90L3t0N5J/m3NQlBjpG1dV2rmeosaocF/dE=;
        b=EO/2fHqqptII7S5/MbSpi4XZB7E0hoqgA2NM3CtTdNMP9oca9lAdJcieDRZAMjL0o4
         oDjuw4HLpWRoOJu7iaxJvSAvtTVefmhT0EaL5b/Eogbm0qnWvzexlXZz4xBv9A7TO3wv
         OpJ7iDlxXPtqOIGxuZoZHrhzTt+iOe5Wp0pkopQL2MgtxZgg9t4kq2crWR7hXJFM2z8+
         U9QnEgJPBc5jV9zBZvQQk9gHCwap3apcPZCGAhVyzQVncbLZSlyPP209TwFyoM6xliMM
         5BCL9vQTCWI2mtWhYNJOxM6VnlXNvA2kVZzv1T+T6uErxPjS5zIJNuNGh1u6i5FkhKTV
         nTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567018; x=1781171818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+OfL2gz90L3t0N5J/m3NQlBjpG1dV2rmeosaocF/dE=;
        b=bVEOes12nrWJ2upjlVgYFf13FkohTS05RO6qogpu5cO1Vm+EL/dNc3vNCxbLy2BM+a
         3+gIPvl8Ya7aW7nQ7efFa8ipSQKQ5d3D0YJfODv6gLlgkNPvVQCfG2MDVtqklY7ca7c8
         9RsnlQYm7BFSF1fPZ2XOQBR0+KkuvrSctbzhwUEO5G4MDrOdnskAh8dQWNI0wi27Oqnb
         QGHFU8zic9zUIuILtH5MBnmqgx6Kee9W5D1AsnFTaJdCHvnSd+j04NQRgDiNjEKcfABV
         MlGY2CjGcNncrPYbWONzlmXa9TD92IBZFMghvQeddbCIr9OZ8980KbaL3HFYjUE2kaeU
         F/0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8+j0VeVkXucQqyqnIZXnHtANYuhAVXI3PtY4Jtt4oFihxmxE/s2I+6ONjluJKSzylY0a5Xme9eDv4iz6TG1t2fxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyfO4gkaSjBkozFp+JgnP4zUBtIOrA3Zpk6uhYOTvXPXXUEyNr
	3r5jY6+9Joxyr42NSEA8lWtRFN2VTN0Attp3NGpn8sAUWZTLEuaLkrgI
X-Gm-Gg: Acq92OG2+LMbBPvPGG+NVgXOAGJpvTjdJAj5slr71zwR8xWXZLANWXHsQaKkDbh07cA
	dmQwuzSX1mBWNMuEhl/AZMOF69l1XPtlumNX6fbdowUdgf5FK/V7x2d3OCWEOdryhjM6foe+c7q
	5NfsxAZw8KpHjvUrBEIIcq8WoXlhMqRAwUKC58etEakjPnl8ecMK+jVsLZTXOqm10gXmFJPf0qg
	r0178oXoxGLMZH1JxL0fXhq9Pp7N2UEZlbQVhb1NpUjfiiF0IuCL2Hff9KqBdMKwGs+ARqdMAtn
	TNvQkBIn1xvgrcf2/cCpu8t6t8j50b5LakPgles+IG0Kt4sFZUiMw//p/XEG0NOhojWnNdn0tiD
	lBw5HmTYQnsgjiXtjOcN0vmvfWeyviuYMhzq001soMK4Kynjfr72eg8ahQZTuNNvDq0fhmoaGlE
	Kf26QCqiV703gYzeXU1WWqEJqbns6fmufoJhae5KY1qeUYnqDEdoKY0xgIaczBynb4LKZwRQ==
X-Received: by 2002:a05:600c:354e:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-490b60edb8bmr112259485e9.29.1780567018421;
        Thu, 04 Jun 2026 02:56:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm38037335e9.8.2026.06.04.02.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:56:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v6 09/11] pwm: rzg2l-gpt: Add calculate_prescale() callback to struct rzg2l_gpt_info
Date: Thu,  4 Jun 2026 10:56:39 +0100
Message-ID: <20260604095647.108654-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
References: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33575-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ukleinek@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-pwm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:tommaso.merciai.xr@bp.renesas.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7FE163ECDB

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L GPT prescaler steps are continuous powers of 4, while RZ/G3E
uses powers of 2 but with a discontinuous sequence. Add a
calculate_prescale function pointer to struct rzg2l_gpt_info to allow
per-SoC prescaler selection logic. Replace the direct call to
rzg2l_gpt_calculate_prescale() in rzg2l_gpt_round_waveform_tohw() with an
indirect call through info->calculate_prescale(). Wire the existing
rzg2l_gpt_calculate_prescale() into rzg2l_data to preserve current RZ/G2L
behaviour.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v4->v5:
 * Updated commit description.
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 4f3b4dd959e6..7e669406dcdd 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -91,6 +91,7 @@
 #define RZG2L_LAST_POEG_GROUP	3
 
 struct rzg2l_gpt_info {
+	u8 (*calculate_prescale)(u64 period);
 	u32 gtcr_tpcs;
 	u8 prescale_mult;
 };
@@ -305,7 +306,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 		}
 	}
 
-	wfhw->prescale = rzg2l_gpt_calculate_prescale(period_ticks);
+	wfhw->prescale = info->calculate_prescale(period_ticks);
 	wfhw->gtpr = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
 	wfhw->gtccr = 0;
 	if (is_small_second_period)
@@ -588,6 +589,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 }
 
 static const struct rzg2l_gpt_info rzg2l_data = {
+	.calculate_prescale = rzg2l_gpt_calculate_prescale,
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
 	.prescale_mult = 2,
 };
-- 
2.43.0


