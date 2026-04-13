Return-Path: <linux-renesas-soc+bounces-31245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDW2CDE13Wl9agkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 20:25:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB073F1F8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 20:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75756301319B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 18:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C571B36166E;
	Mon, 13 Apr 2026 18:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFEuZ2oN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C8835DA46
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104709; cv=none; b=bL+fZJ4i5HlBzSEFiwDIml3yP8LStMNhTcv/cpWg7jDaBSz2H7lgGB7Z4BqU4OlOEE0LU9UKHo1uD3hxX6Mpk5HSSvmOjrF6nmwdBxfHUTA07HwTnSLC3URvsfsNr5SzYRTJlfQd9NcrUji3FP2NTi+kMNmwa53zhT76jt22jsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104709; c=relaxed/simple;
	bh=cBFo06Qs8zryMh2Fij9/Im87Zl7Y6ils4ITVNZ8OOaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbAp05AhCmXNwWxT05tMQnONj/Jvz+GkUBLxgfBsjeheKETnp6X6mb2aom+ePi4ypvrjo32/HY4kRF4XaQFZPNFK4bwzvmGqw1AO7gfrWO0lapG2mMHUmP6r7dabhEG2ugZZ3YKE4kmbzyQWGd5gu0/2tHMUg5nsS4VW9iiClsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFEuZ2oN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso44149095e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776104707; x=1776709507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nagTRmYKFkoTf8+mO64XZTWVXTJ06QmVA5WY/pQVWrM=;
        b=oFEuZ2oNYePUDLztK+/zDIQ61hVDSNHzElOqyOOYYBY1oZQeoFYZ4/37TgwV8jzxbS
         ZQM0YQz/PywQSGlBKzEyQ3bZoBn+xgz06HvDHJrxsEbcazsRUjPARlTJBrb/2yuQeV8o
         QyMJnmtutTS1WM+Zg5dY1S794c3eDt/OmconmLW0ACL+I2IAAMHdvOtDdy/TEzAMOFKZ
         Og250vffQdCHti4iLFLrmk3esEKptoPx1DFaX8tJSXgoNfw6YOv/iq+PBLfHxMZhih+F
         ypz7kVrmqiN/8lt1olOtJkwdRTWSAWy+4896wy0zT8hC2/ZSbdBBczor51XgalQ0tJd1
         2Uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104707; x=1776709507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nagTRmYKFkoTf8+mO64XZTWVXTJ06QmVA5WY/pQVWrM=;
        b=s2FJ1m5m4ZG/7eIHZisP+blLd8GvDsEOrr9tvYwcM4SkMCfjYsSU6ElipK+an6C+oB
         4FhVlAmA4Mf4lE4Ne6NgWItpqa1DvCMeKk05jqcNEQv+HJy4VtQ5loLTIgVxibRFFLhp
         rFhrHyPjDZsL3jOTf4htRD/lIyJtvRadwHr8nbrEPbYfGYikV2VsCFRw/xF77MGo2ciA
         BU6X+gy6TXvw+2bq4n7r1TBxWC99N3Y32I26Mv26Cqn3f4FsJcyaDrwgj5Ffp5VcF+Kb
         aQfmnKPAw7S2BekWKzGJTizzr4reqrJTTQS5gDCy7jE+olvdgcnhSOfVxM99gl/jvtax
         uAyQ==
X-Gm-Message-State: AOJu0Yymu8m4aVlVvzdJ2Ohak1LVt5w63msk20mWp1478yCCdDqnSVjb
	BsvfsUqlh3qqAvmuu65o2Lt+ep1cVTfcq+IOelqmYZHLtVmM7abxTmYt
X-Gm-Gg: AeBDievqUCtuabkxsKz3WYB9BA3DvZsehdzDr9D6CnpFniU4eZyEAc7Ywh5CZsijXPR
	4KtUWXM9P8guYapfErTvY5aMYdNQ2cVhhmqqNl7K+k7ZTHzStMUEPG0tQgdrD6tNRTDNLeDaBIC
	h+nEE7mGCU45k1KmFu1utlanBAkgp/gpoV/4V43qtB0IwtPEIooTaU6/yBdFH40wvHkLg/B19D6
	2P9TtjWJ+6ktrPhsWA4ORO8Mx16WY7I7cUAyAAWW0ssHBOmRE/zWFzBGhA2I7P4WLMPLbCbRmiJ
	8MyNGWMkjcyx+qdEMDRVkfhw+rA7aDL6Kemnx3yqLaF/60sGdcZTdss0nCErl8zF8mUC9FqUZP6
	1mxKGebtHFLcL4L6rKbH49a9lm6PyBMRc+R5RyvXYHR6DcNLCehMer6V+iq0fxg6XzhsvC3fwhs
	9l7FJUpJvuZ6nU+m2yBQOy9j1qbMLzhfHar/P8iVK8a9S62RphXSZH7snjmsI1L5+FPXmkGuEdM
	rBIjkklp5VoDYl21t2QF0ITTpOqDUnTnpGbnJeE7rTJ0MY=
X-Received: by 2002:a05:600c:c0c9:b0:487:1826:d89b with SMTP id 5b1f17b1804b1-488d67e262cmr131972925e9.9.1776104706627;
        Mon, 13 Apr 2026 11:25:06 -0700 (PDT)
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
Subject: [PATCH v2 1/5] pinctrl: renesas: rzg2l: Fix SMT register cache handling
Date: Mon, 13 Apr 2026 19:24:51 +0100
Message-ID: <20260413182456.811543-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-31245-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1AB073F1F8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Store SMT register cache per bank instead of using a single array.

On RZ/V2H(P), the SMT register is split across two 32-bit registers: bits
0/8/16/24 control pins 0-3, while pins 4-7 are controlled by the
corresponding bits in the next register. The previous implementation
cached only a single SMT register, leading to incomplete save/restore of
SMT state.

Convert cache->smt to a per-bank array and allocate storage for both
halves. Update suspend/resume handling to save and restore both SMT
registers when present.

Fixes: 837afa592c623 ("pinctrl: renesas: rzg2l: Add suspend/resume support for Schmitt control registers")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 561e6018fd89..5722cd4c581d 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -335,7 +335,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*iolh[2];
 	u32	*ien[2];
 	u32	*pupd[2];
-	u32	*smt;
+	u32	*smt[2];
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	oen;
@@ -2737,10 +2737,6 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 	if (!cache->pfc)
 		return -ENOMEM;
 
-	cache->smt = devm_kcalloc(pctrl->dev, nports, sizeof(*cache->smt), GFP_KERNEL);
-	if (!cache->smt)
-		return -ENOMEM;
-
 	for (u8 i = 0; i < 2; i++) {
 		u32 n_dedicated_pins = pctrl->data->n_dedicated_pins;
 
@@ -2759,6 +2755,11 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 		if (!cache->pupd[i])
 			return -ENOMEM;
 
+		cache->smt[i] = devm_kcalloc(pctrl->dev, nports, sizeof(*cache->smt[i]),
+					     GFP_KERNEL);
+		if (!cache->smt[i])
+			return -ENOMEM;
+
 		/* Allocate dedicated cache. */
 		dedicated_cache->iolh[i] = devm_kcalloc(pctrl->dev, n_dedicated_pins,
 							sizeof(*dedicated_cache->iolh[i]),
@@ -3066,8 +3067,14 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 			}
 		}
 
-		if (has_smt)
-			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SMT(off), cache->smt[port]);
+		if (has_smt) {
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SMT(off),
+						 cache->smt[0][port]);
+			if (pincnt >= 4) {
+				RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SMT(off) + 4,
+							 cache->smt[1][port]);
+			}
+		}
 	}
 }
 
-- 
2.53.0


