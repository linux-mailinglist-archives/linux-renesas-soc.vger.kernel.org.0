Return-Path: <linux-renesas-soc+bounces-31247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJU1MGU13WnWagkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 20:26:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC33F1FC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 20:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 611F93053BE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 18:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B1537C10D;
	Mon, 13 Apr 2026 18:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw4IVPL0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B802B35BDDC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104712; cv=none; b=DqDTTDRiNDVvWD1pyb1uZVO/KBW1QWgTko+voHMf/6hebSKfEHj6sk7hzcC9YaTd10wJdvoMZms1D1ZOPkAXNiehnpiCsRuAdGC/UFdFIHx/mkOZnb/I9wyIFvomSWmnCaGc15uBhdaRabdXPisDOPXxV/kV1iT34B1lEL1Kj8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104712; c=relaxed/simple;
	bh=ctHMnk/1g0jPYjYI2obSufNG3OHrd+HDWiATO42Of9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eA3Zg24VfO9ZitFvx2LufVcVUVxHNCS0+s/i11h33LPOfoweAv7VqU7439fsqwtTu7SQVbsdeg+GemiQp4d7YlngTSHvrkoZSe5+BZ4pX9mDsPUo4vQO7MBOinRRxXwYGM8484FkG20ICGic7mUvMjZg56B6CCXyOOhsBFrIees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw4IVPL0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488d2079582so42170945e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776104709; x=1776709509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSD4IEKgoiSeEKAhaOoScHrR4rPxBxdMU+VQyrkI5fY=;
        b=hw4IVPL0uKtbsaQUlzmr6Ao5LU76gobjuxC3EuCltXDNBzwmghZXwSnVNeNitJi7of
         2KQl6OK8OJVjP+wRfkiS9wasAk9wORClITo4VaziJVdnxAst4CqDa/0RVj0Tppadd7wC
         PQAjxUnB2bmgNjGunsn25xOY/sTREdxnFDRGM4iI920HL5Dkg7CosD8IhxSa4C4qNdF1
         dC0q87II1jYqTQQBWPzR17xjD+sRy4cxO+a/d2TrkHZOpHtbQNy+fpk6QDyLeLgnHG9f
         nwm44g7N3U1p5fE5iW2iuzM18id6yf4LIxmtPsoj7EHf/FFYrfjU0gCNyPGaKzPKOqhM
         TyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104709; x=1776709509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSD4IEKgoiSeEKAhaOoScHrR4rPxBxdMU+VQyrkI5fY=;
        b=UHZVR4ypgGaBovRjWXYF2wUEMg/EuTJZOisGti/lx/mBFXdfu+vUNrxUnpgOXuluxj
         34ZsGD77gJyZqtkbVZAdqX0V4CpKrU15N9wWrWQNegmqPsM6SqNPd6SE4ONIYeR8Auct
         9vMlrPKh5/JTErTajQmNxIPsO9mLtoDGuVnKKaLiHPpg3kEc41vKURQlRaqZc2L8363y
         tt4wyZz1+KFJo7cZ2e57nrImwtWiasQvuF+fwC3x/4+/5l/skkUQnLVBjODYaez8zR5l
         e9zRe2CibwQjnJe/6pCz6FqSAM/bn0PDghcFJ/mJZZJHIAHKle86v/SDlacxTEaAaMe5
         Afog==
X-Gm-Message-State: AOJu0YzY6MqYkPgGESH/DY++6osxOlmvSnv/3jcUrXVWwufgBSjQYewX
	63OOrXNyst3r0d32IyiG2RHSHO9ubwSADlUUCzOOS/h2aFvO8HsRRrJV
X-Gm-Gg: AeBDiesNRBVeRxO+Hz79gJIYCZD1mJfbeowB5d2w3hqlqRVSPVv5sCG0B+wTseU7NTA
	j5CohxoLXXDhiuKi2STqvrNoAmCsy65ZQKyXhuNDu9Ow3+lHnNNt2YerI0wpgjc3zhyNoM1ZdZZ
	plJd6A3nkEJNluZKoiY+pBgzRWCF2eomaY7YnSzXoTJ6Cd547MqfsXn/ZKc2fd9WcP6bbzs8A2n
	XUCUiwHkgLxk3KH+SHE/+wuWWxQZ5p5OAE4NVyKq8E4vWUXpSButu70Lt8VN6rn2Pd7gqzlKqOV
	pqevAQQ4zuCA7vGxChhSMXlQiQ7Fd+EkUW5CDfTH2b+URx6P+FOkEMyXw+UbISCIbl7f5e6qMa/
	meZFw2YBWwcBH86GeObPp5fkO2u6G/DnaUJV6QzZvEnCFWF68WD5yIBXZnv8jcitsTZzk/1fNdl
	S/5eefQNjiHYWOK+QTjASwlgoEHr0HSmWy7OpZv1O/PUYE2A21MxvMG1caAhSRybLIgK3b/J1s8
	2eDpDKG36k3ihpPysKYKab+AhLGUvZvj8XpOWJkAkYFork=
X-Received: by 2002:a05:600c:4987:b0:488:def6:bb17 with SMTP id 5b1f17b1804b1-488def6bce5mr74688915e9.4.1776104709159;
        Mon, 13 Apr 2026 11:25:09 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm301175695e9.15.2026.04.13.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:25:07 -0700 (PDT)
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
Subject: [PATCH v2 3/5] pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH configuration in PM cache
Date: Mon, 13 Apr 2026 19:24:53 +0100
Message-ID: <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31247-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 50FC33F1FC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when saving
and restoring pin configuration registers.

On RZ/V2H(P), the IOLH configuration is defined by the
PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
account for this, causing the IOLH registers to be skipped during PM
save/restore.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 1e8f631fcb66..b2eb9dca7eec 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		}
 
 		caps = FIELD_GET(PIN_CFG_MASK, cfg);
-		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
+		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B |
+				      PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV2H));
 		has_ien = !!(caps & PIN_CFG_IEN);
 		has_pupd = !!(caps & PIN_CFG_PUPD);
 		has_smt = !!(caps & PIN_CFG_SMT);
@@ -3131,7 +3132,8 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 		}
 
 		/* And apply them in a single shot. */
-		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
+		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B |
+				      PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV2H));
 		has_ien = !!(caps & PIN_CFG_IEN);
 		has_sr = !!(caps & PIN_CFG_SR);
 		pincnt = hweight8(FIELD_GET(RZG2L_SINGLE_PIN_BITS_MASK, cfg));
-- 
2.53.0


