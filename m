Return-Path: <linux-renesas-soc+bounces-31248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMqJNns13WnWagkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 20:27:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CBE3F1FDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 20:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E09EE305DF89
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 18:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0F93806BE;
	Mon, 13 Apr 2026 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUtnyAvL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B17377EAF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104713; cv=none; b=u6QUr5ByXhxrLgyv8tgONsu4cTUfwSAx+bEXuribJvDbXcFgq2VqKRw+qE0QUt9iBE/yiGGU7VuWFlcWAOAvZ4FgworMIBursM5OvQwE6FHuFjkeG1vW6V+txPWa0+sZUJ9yBuNBcGivGYC+XbB+mAoHg0Cpb21MGuytWivkaVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104713; c=relaxed/simple;
	bh=U4Y/F+JH7fE+UC5EjEQ+l4RRAJguyzUzwpFHaYQwvWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jd2xCapD2WWeA88puzH7NWKg1Q0fcZPPffwXoe3zCuJHCKjJTJx6NSE8p+RNuu8BSdNdBqFgaHvmOBYSdEn/pr5T6NRFNN9q4Lo9nWx6GmH6OLzCHTNDg39rsDFp9dcTGA5DOmiugO0Fts1qvMWbF9va41mFdAecEs4mRLKhM3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oUtnyAvL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488c21c636dso28291585e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776104710; x=1776709510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvXShpkoYrfA999CM9pWEW9h1p62k4eqsGp9A9pTeT8=;
        b=oUtnyAvLJX682lG7orYukO4hCuYq7lOWhFQhKiqEm8L1Yn/VJ7pKqX2lLekTCNYXQS
         w3xlFXyZm/9aEHpS4rf807crVF2J3p5YxuT+2wJz0+xEKSWsz4D4baY0Juet1FTFLcQT
         PB3TgPUb6Kf8DD6aUvNvRw+BOyc7ByHmWUIACyno2mcfp0Y5us99dR2g1JlOZA/L9puV
         kHhaQxCSuukeR2JTI5QjHzTh1v4uKEAoVOZHCnTHfzBWEwBGY5VSVqOZvV4UC3pvRVgN
         xOx5MDDfzONvZkaY5Xe7GJTdKTmsYKabzm5k2NfywKIFCtxBdEyApPxFQoHdRdzo/Y5i
         DpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104710; x=1776709510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QvXShpkoYrfA999CM9pWEW9h1p62k4eqsGp9A9pTeT8=;
        b=ITQQB4wIhj2LKgjoVrDxg/KKz5drae0kKuU6EENBYPvK6cK0OKPXNHs0A5HEdRh7Sq
         n1Ln3iQQwbHhpJ0DHad4IiljGO01H3rsTWQzCDo8ypy8cz/Kf+y+XchNtbyonw56BLhV
         eZKi5tm4cS8ambEdxjhqlsadufnf9piOz1+tVBW5Cv4thK0p5w/k7lhrN3I+3vRTygW8
         g1b0Hx7pUnPXkutqPZ2yk9W3NvUDuyI/4lbMVOXNX1/FQmIpSQGEJFZGmJwh0jDXsm9O
         WI4wo53rJ5HOE3tr9x2t28egqLHScp9LGQby/YJpiGk5RGGyOmwtaKq5Mke4/+AqITol
         p2sA==
X-Gm-Message-State: AOJu0Yw/xKtSl0yxnejNWR6P/TWqsU7kMlOloiTi8t2iD/Hh1xUlRZKV
	CrJf1cnySK7tT8htAJ+VPJp77730wDj89ajpQ2M5mNi7ngWIheSupYQuS4K7BQfFPxg=
X-Gm-Gg: AeBDies6WhKFzkX8jUxMEMwrL6kmN2rXs74PUw1d/XqBkbbUrRtkeNIl7Tr9Jal5YSX
	RWesb2ZIqzLHp5gAqXJEjGI7Xvj8Qr3nej9qWoeS1WXjZpwqv3vGactYb0vr2BiWj8UMdiuC1bQ
	pvymkW/7kxmumWuPMqFGoYIs4KEOeYs7rGu3/2YTrRsVkAJomaE5aHBv88zuslAbqUsolLrUIh6
	b1ShwMToX4MqzRvLPcb65obJl2t33KGUuZTs8yMspnRpeyeqeN6L8p9BBEjcJcnDJKYfGu4MkM7
	GIj2RYC/YPoomPz09yFojzNivC0se7zT7Kbd5zs51lW/KQHq7DNnaA4NbGS8ihQSB+o4tpB/ZHA
	xWcJ8E9tE04t24Y3hBWlF6SU02TZb7NMVDaVow1SRRRgQVjzGVfRAc/otR+nmVxYPkAO1lA3NO7
	0au9JBQwl8LMotxHzUQMpXE1/XjGjNMy2l9nqnBDeU4cF2u5HgSwVtWMUYOHZfc4whDurf9CtW9
	UiyPK81mBbmQw79QeU8SQNp1J5pnnDQkDsiWlstCYgmy60=
X-Received: by 2002:a05:600c:5292:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-488d67fa48emr206566925e9.9.1776104710273;
        Mon, 13 Apr 2026 11:25:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm301175695e9.15.2026.04.13.11.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:25:09 -0700 (PDT)
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
Subject: [PATCH v2 4/5] pinctrl: renesas: rzg2l: Add NOD register cache for PM suspend/resume
Date: Mon, 13 Apr 2026 19:24:54 +0100
Message-ID: <20260413182456.811543-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31248-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 91CBE3F1FDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Include the NOD (N-ch Open Drain) register in the PM suspend/resume
register cache.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 37 +++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index b2eb9dca7eec..be6d229c927b 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -323,6 +323,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @ien: IEN registers cache
  * @smt: SMT registers cache
  * @sr: SR registers cache
+ * @nod: NOD registers cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
  * @oen: Output Enable register cache
@@ -338,6 +339,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*pupd[2];
 	u32	*smt[2];
 	u32	*sr[2];
+	u32	*nod[2];
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	oen;
@@ -2767,6 +2769,11 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 		if (!cache->sr[i])
 			return -ENOMEM;
 
+		cache->nod[i] = devm_kcalloc(pctrl->dev, nports, sizeof(*cache->nod[i]),
+					     GFP_KERNEL);
+		if (!cache->nod[i])
+			return -ENOMEM;
+
 		/* Allocate dedicated cache. */
 		dedicated_cache->iolh[i] = devm_kcalloc(pctrl->dev, n_dedicated_pins,
 							sizeof(*dedicated_cache->iolh[i]),
@@ -2785,6 +2792,12 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 						      GFP_KERNEL);
 		if (!dedicated_cache->sr[i])
 			return -ENOMEM;
+
+		dedicated_cache->nod[i] = devm_kcalloc(pctrl->dev, n_dedicated_pins,
+						       sizeof(*dedicated_cache->nod[i]),
+						       GFP_KERNEL);
+		if (!dedicated_cache->nod[i])
+			return -ENOMEM;
 	}
 
 	pctrl->cache = cache;
@@ -3016,7 +3029,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
 
 	for (u32 port = 0; port < nports; port++) {
-		bool has_iolh, has_ien, has_pupd, has_smt, has_sr;
+		bool has_iolh, has_ien, has_pupd, has_smt, has_sr, has_nod;
 		u32 off, caps;
 		u8 pincnt;
 		u64 cfg;
@@ -3039,6 +3052,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		has_pupd = !!(caps & PIN_CFG_PUPD);
 		has_smt = !!(caps & PIN_CFG_SMT);
 		has_sr = !!(caps & PIN_CFG_SR);
+		has_nod = !!(caps & PIN_CFG_NOD);
 
 		if (suspend)
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PFC(off), cache->pfc[port]);
@@ -3099,6 +3113,15 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 							 cache->sr[1][port]);
 			}
 		}
+
+		if (has_nod) {
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + NOD(off),
+						 cache->nod[0][port]);
+			if (pincnt >= 4) {
+				RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + NOD(off) + 4,
+							 cache->nod[1][port]);
+			}
+		}
 	}
 }
 
@@ -3113,7 +3136,7 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 	 * port offset are close together.
 	 */
 	for (i = 0, caps = 0; i < pctrl->data->n_dedicated_pins; i++) {
-		bool has_iolh, has_ien, has_sr;
+		bool has_iolh, has_ien, has_sr, has_nod;
 		u32 off, next_off = 0;
 		u64 cfg, next_cfg;
 		u8 pincnt;
@@ -3136,6 +3159,7 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 				      PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV2H));
 		has_ien = !!(caps & PIN_CFG_IEN);
 		has_sr = !!(caps & PIN_CFG_SR);
+		has_nod = !!(caps & PIN_CFG_NOD);
 		pincnt = hweight8(FIELD_GET(RZG2L_SINGLE_PIN_BITS_MASK, cfg));
 
 		if (has_iolh) {
@@ -3150,6 +3174,10 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SR(off),
 						 cache->sr[0][i]);
 		}
+		if (has_nod) {
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + NOD(off),
+						 cache->nod[0][i]);
+		}
 		if (pincnt >= 4) {
 			if (has_iolh) {
 				RZG2L_PCTRL_REG_ACCESS32(suspend,
@@ -3166,6 +3194,11 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 							 pctrl->base + SR(off) + 4,
 							 cache->sr[1][i]);
 			}
+			if (has_nod) {
+				RZG2L_PCTRL_REG_ACCESS32(suspend,
+							 pctrl->base + NOD(off) + 4,
+							 cache->nod[1][i]);
+			}
 		}
 		caps = 0;
 	}
-- 
2.53.0


