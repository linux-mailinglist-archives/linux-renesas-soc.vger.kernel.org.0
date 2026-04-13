Return-Path: <linux-renesas-soc+bounces-31246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA8kLUw13WnWagkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 20:26:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3D93F1FB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 20:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1265B3010715
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 18:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED63368946;
	Mon, 13 Apr 2026 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGjw8SYn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7435FF6E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 18:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104711; cv=none; b=CJaaLH6ArrL1V+Z1+jl9qCXIh/Igqf4mmNQyuE4OR+VGA1SqSRUG7V0ppONeatQsVFSV8WfQBU+w6wVa1FIV8D4PoWaXXhh+Q2rPaOiwee6FNASp3db8SLgPKg/1/qEFQTijOxtvCit2PJdn66VhzwOqKSMY7sOPKCFagFxC4rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104711; c=relaxed/simple;
	bh=PhMu6IlyuJrTYVg5xXNObtcZkXdo0CAF0SJTcIQdUEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQCp5yKIes/iZrKboRjFsMIUP0aBkOe0kA/71n/ZVP//sW9kJFZFE0km3t2chhgmUV0qAROXsajhSbc7z+0B4GMd4HTqJVYCBs0DKtmIJXcCKNdR22+qVvSIuRYHLoqSwx/VXHr/6OB0mO1SW8Z1bsTWSduAyX53UXgRq0bYCXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tGjw8SYn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so32778795e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 11:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776104708; x=1776709508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzWRo5P+IBz0/FlUg+Uf7FiB7FVcxaQR5SJIRNr9yuc=;
        b=tGjw8SYnJjdaK0v6xY1IrmZtbhdc4GzLUPHCT09JaLAluP+4vBN9EXoDoyW75g7olO
         EhptSRLu3+Oj3ZjFzGIk4PJcUYtQ44nlPpn9Udvpyv9D9bDTkteD9WG1FmPn8uahWf6o
         /U2rYWPsp89y/xuXUBFA5gLQbGS1IagF1KJZM2XMDiYApVWjNQpdRxgpdWeZhuysI5gB
         S86dZefYaspMyioJ9+P1nXpkiV1b3FEcVNon9hz51/sIG4z3JePHXopvGtcN1r8CPZNA
         3afF7GEc2rAD9vE9fh5gQFC6nLnsYO8vhem3otvQGFJrmvDZlgkC+pzJdC/cl0iy7e29
         fbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104708; x=1776709508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TzWRo5P+IBz0/FlUg+Uf7FiB7FVcxaQR5SJIRNr9yuc=;
        b=rquYDyUWdwmzSB6yFAmwJ8/LBgyWL3MLG3o/UnyFx+tYAaXzhcrEeZLmsvqxkZr2Tq
         S1aJuAZJF9d6O53g58IU5e5VjcoCUXNmSx6tKusgnaPqmYzTeofVYzTccOiOV+o4xinS
         Xa2uzrL1w4mD+vSHt6EeyPITrrMqeHhz/AQ1QE6Tlcdjy6zm7PlS8MnZaugjbR96SWLK
         nB7gy+wcAwlbTfOKOkO0JV7Jl4GRgpd4rrK6x8OmZXZ1+4Td8LkcPQBHtofOLAvmrY+x
         vGaBiTxDnabL9T/E4Q8OULYCh0gqygPjNJcIJCAMRrZ3euHcxXZDXIMH5ozfwHhWVkAG
         pxyw==
X-Gm-Message-State: AOJu0YxX0IdbRNAGuVC5IgQu9CRrsBQy+ZIFec7q2AqSSyzSBZYtlIXO
	epaL3aQjHV3TJgkMbH5009rIQv9ByNkfc+lXB48zSvS8iA7ETS4zSHRC
X-Gm-Gg: AeBDietHm0OvEg7M0fMyScADbl9ePQUiMkvmCqjeF2zVBxMOtTkN7Zxk2XPw+Q+1m7J
	iZxem7yp8IHKFOPwB2tx0ALJywp7mNQRCZxHqqfvwVl+CTKhQ8ZaqmklvhbN+QtQpRQ0yYdb446
	8srSmlhPqQpMIl8uRdNqizAEXvI6IBxYDhxU3i+jVPJkeAOpnnwrRl+7YWYjdIf/x/fFjvLYuT7
	lRfsa48EQlvADzMcGza63+y/m4ZNKqk5Iqrh5Sz3t0W1IKlJPo2rSb1iswCgn2uk96Wr5sIVeJZ
	5ZjeWqeljKai+1DTS7R/J4UagcKlyKZ4e+PrSMr2mY9WxirpO7+wtWmEmfWOQODhsl4wfmKSrg+
	3ge8ty+tyoK6W/MzxpXQC3lV7Ju6IZf2A4sYSBeUm5SEEpK6xRMdsKRvo89f7w8y9PcDejno3U4
	7pW2cXfY8gNvLXQ1lpZX52VGfUtxGMPhTmfQEAPv50vhOTBe1YyvjFgZJsM1h2Kq34/mO7nW2Pg
	dinmEM3UJOouMS1oD6JInXXWTkBgVOPwuhjAYNE5TVbqqc=
X-Received: by 2002:a05:600c:8907:b0:488:ab1d:dcc5 with SMTP id 5b1f17b1804b1-488d6ac1bafmr127735555e9.27.1776104707704;
        Mon, 13 Apr 2026 11:25:07 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm301175695e9.15.2026.04.13.11.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:25:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/5] pinctrl: renesas: rzg2l: Add SR register cache for PM suspend/resume
Date: Mon, 13 Apr 2026 19:24:52 +0100
Message-ID: <20260413182456.811543-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31246-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CC3D93F1FB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Include the SR (Slew Rate) register in the PM suspend/resume register
cache.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added dedicated cache for SR registers.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 38 +++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 5722cd4c581d..1e8f631fcb66 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -322,6 +322,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @pupd: PUPD registers cache
  * @ien: IEN registers cache
  * @smt: SMT registers cache
+ * @sr: SR registers cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
  * @oen: Output Enable register cache
@@ -336,6 +337,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*ien[2];
 	u32	*pupd[2];
 	u32	*smt[2];
+	u32	*sr[2];
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	oen;
@@ -2760,6 +2762,11 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 		if (!cache->smt[i])
 			return -ENOMEM;
 
+		cache->sr[i] = devm_kcalloc(pctrl->dev, nports, sizeof(*cache->sr[i]),
+					    GFP_KERNEL);
+		if (!cache->sr[i])
+			return -ENOMEM;
+
 		/* Allocate dedicated cache. */
 		dedicated_cache->iolh[i] = devm_kcalloc(pctrl->dev, n_dedicated_pins,
 							sizeof(*dedicated_cache->iolh[i]),
@@ -2772,6 +2779,12 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 						       GFP_KERNEL);
 		if (!dedicated_cache->ien[i])
 			return -ENOMEM;
+
+		dedicated_cache->sr[i] = devm_kcalloc(pctrl->dev, n_dedicated_pins,
+						      sizeof(*dedicated_cache->sr[i]),
+						      GFP_KERNEL);
+		if (!dedicated_cache->sr[i])
+			return -ENOMEM;
 	}
 
 	pctrl->cache = cache;
@@ -3003,7 +3016,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
 
 	for (u32 port = 0; port < nports; port++) {
-		bool has_iolh, has_ien, has_pupd, has_smt;
+		bool has_iolh, has_ien, has_pupd, has_smt, has_sr;
 		u32 off, caps;
 		u8 pincnt;
 		u64 cfg;
@@ -3024,6 +3037,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		has_ien = !!(caps & PIN_CFG_IEN);
 		has_pupd = !!(caps & PIN_CFG_PUPD);
 		has_smt = !!(caps & PIN_CFG_SMT);
+		has_sr = !!(caps & PIN_CFG_SR);
 
 		if (suspend)
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PFC(off), cache->pfc[port]);
@@ -3075,6 +3089,15 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 							 cache->smt[1][port]);
 			}
 		}
+
+		if (has_sr) {
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SR(off),
+						 cache->sr[0][port]);
+			if (pincnt >= 4) {
+				RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SR(off) + 4,
+							 cache->sr[1][port]);
+			}
+		}
 	}
 }
 
@@ -3089,7 +3112,7 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 	 * port offset are close together.
 	 */
 	for (i = 0, caps = 0; i < pctrl->data->n_dedicated_pins; i++) {
-		bool has_iolh, has_ien;
+		bool has_iolh, has_ien, has_sr;
 		u32 off, next_off = 0;
 		u64 cfg, next_cfg;
 		u8 pincnt;
@@ -3110,6 +3133,7 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 		/* And apply them in a single shot. */
 		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
 		has_ien = !!(caps & PIN_CFG_IEN);
+		has_sr = !!(caps & PIN_CFG_SR);
 		pincnt = hweight8(FIELD_GET(RZG2L_SINGLE_PIN_BITS_MASK, cfg));
 
 		if (has_iolh) {
@@ -3120,7 +3144,10 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + IEN(off),
 						 cache->ien[0][i]);
 		}
-
+		if (has_sr) {
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SR(off),
+						 cache->sr[0][i]);
+		}
 		if (pincnt >= 4) {
 			if (has_iolh) {
 				RZG2L_PCTRL_REG_ACCESS32(suspend,
@@ -3132,6 +3159,11 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 							 pctrl->base + IEN(off) + 4,
 							 cache->ien[1][i]);
 			}
+			if (has_sr) {
+				RZG2L_PCTRL_REG_ACCESS32(suspend,
+							 pctrl->base + SR(off) + 4,
+							 cache->sr[1][i]);
+			}
 		}
 		caps = 0;
 	}
-- 
2.53.0


