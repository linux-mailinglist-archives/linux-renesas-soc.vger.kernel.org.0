Return-Path: <linux-renesas-soc+bounces-27665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAASFAadfGn2NwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:59:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C4CBA43D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06376300EF9A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 11:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335EF372B34;
	Fri, 30 Jan 2026 11:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSGxCtJ1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8245136E475
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774336; cv=none; b=Tgok4VCyIFS3M48Bd4KOzPd1VbMLbisgPPW5oR3+nqv9D22B5+X1iWXhblJgiXLOGGV74mtpQcVTnsrhlUC/xNvIkfin8AI9/pzvkAzXSJFXHuzQ+LzE0XgW+Ycj8928PUU8Y+ASO80OB5V8fuFpcRZrt8lh8CytJqU6F0bxm5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774336; c=relaxed/simple;
	bh=wUvy3QQiQeAOG1bMC0djoJvJvuxkTXceaEm1ZvLPvV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwqy8qHQaT+Gm7wyaTdXJ2h0gIWf+10ZHl/mPeQz2axwPVh5lPR4g+yjp3GZn90GLveu42kne76a0yUn+LQ7QDjmONHSsacCWW1Nr3mkDcd6Iu/DJqayehsG/VIqbLPQWVK1j+zEl/qCZqBf+oiX/ncMW8uHqRQXHOXJm2HZlHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSGxCtJ1; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b883c8dfb00so477771366b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 03:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769774333; x=1770379133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrk2D5glHxinFpEivMEobZUHDU8krg32pwTF1WkjNCk=;
        b=mSGxCtJ1tG4lBO8X8fD6W8fQ3b/pz4jZY3JZk7qNuJxdSLRbFqaQs0NfAsSoSgbh0N
         ugLJQTxfmr0D2eIR0/+S3pPRDRuFKQpIibCxg0BRAku7WDY/L7EV4L3B5Jsr1qHWKA8a
         V0gukHT7wYD4JJLGFlNj4TD3QntnSUFLbIR1KqdVYXo/vfutB1lnLwaYUaWUC8MROdYo
         W1NE3vdfPQukQPV8Qo3SZY6/DejKKLYbvrV3hWW5J+iJp7JD+WtHSF+Og1kYeg7qeZfi
         O5v1bvkIbp+2lAd8phU0AKlZw6RpPvMBRWbL+sX1N4rbnnxs296WmtVn7sIH05Kccb5q
         jPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774333; x=1770379133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hrk2D5glHxinFpEivMEobZUHDU8krg32pwTF1WkjNCk=;
        b=pQgi27jhAsaJ2M0ONX/3iud0wns2rSUhaX8JX/iW2ZDPKZW1JEkZA4jVlCcy93dqd2
         XKaMsh5pbQXFcos7Hnud9aaxS2ZwI/Ds9r/FZ92twU+oBZrSnlK5VACzgRAETAfZSid4
         NTCaLdLwQ6c9JY/P4FQjE1zP1am8fNUDewrksTI0B1scsJmN/EQfaMjCd1WFoG/oSof/
         C7s5TiEdd75d9uGgKnU7rg2sW6qpOEOX4YW/zzc3HvD/Qfx37nF7rjyQAbvmDbXephbV
         Zy+SY/F3d3+Bmwei+DDWu1DrSQYMJKOQpOnlBjIKAG4XVBZlrNGmkoIeBzPa02CMfo8M
         Z5pg==
X-Forwarded-Encrypted: i=1; AJvYcCVrBVQqCwtc5HoBoKqZJRNOHOB2mILUlM+MPQ9PN83Xe9jqtgmvJciUBI+T4hScFyqD59vhVRr8I0AptIcrgHihww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMA9Ng/MQsQqrZr2Ygyg75TCVIDKB8J+ln7sWwsfCakn0C1bV
	VtKX/F6205XJPFNeKfElFXCALxKdC8fGD4sJxdzDn2DmIH47UooICYwi8L4X/w==
X-Gm-Gg: AZuq6aL96W5Z9KiYQNUOirRRmO01zNmHkqvrWQpfjL1KezCB4qJ+TyFWIRV2km3oMYX
	LKQDTdOYwpZrDefap207sob+ulXnchtR9RO7ecNByn2AA3diQLa6g9MrAJFaTBn6bJ1s8urHXeb
	Xxvr1K0FXAro7PTMBFGZTVoxfv5VglbSTLqB5yQ0478Lij5ttjQROVM+CrzcEZwLwNYRd5G0q5N
	on1p7/6qebl/Y9QX6VAE++A18PYBq2Tuaufu2trU2WOLXVhcCGE/DGwXgzC5VYWoVhBAgcGKlVo
	ujNI8SM2sK1e+85ti+85nvKd9t/8l0oMGcJRH5PqWVw3Lb92ks3yjJkUuGUjEIYtOobwubwdtDN
	HTzXL3aw+br62dDNOXqhhn8OzLgrCd1ieP3Qn8qdJMEgL4byD7gNY+AJld6vi3jfAWUKb24ulLR
	Wl0jbP+TLN9dRKUC6klojHBnyZW2Rg6cVQiZc=
X-Received: by 2002:a17:907:3d43:b0:b84:40e1:c1c8 with SMTP id a640c23a62f3a-b8dff6678c1mr156980666b.33.1769774332758;
        Fri, 30 Jan 2026 03:58:52 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm404671566b.31.2026.01.30.03.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:58:52 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/4] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
Date: Fri, 30 Jan 2026 11:58:42 +0000
Message-ID: <20260130115850.253555-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
References: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27665-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: E3C4CBA43D
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
is SoC specific.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 16771a0101bd..ee92d07c6ff7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1113,9 +1113,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	u32 nir, nfr, mr, pr, val, setting;
 	u64 rate;
 
-	if (pll_clk->type != CLK_TYPE_G3S_PLL)
-		return parent_rate;
-
 	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
 	if (setting) {
 		val = readl(priv->base + setting);
-- 
2.43.0


