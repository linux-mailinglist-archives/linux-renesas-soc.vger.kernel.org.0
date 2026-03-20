Return-Path: <linux-renesas-soc+bounces-29999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOl0Cn0mvWmr6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA892D90D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A890301B671
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC09438AC63;
	Fri, 20 Mar 2026 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5bgaBFX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86E2389471
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003800; cv=none; b=rEoRNGR1K7cKo1EH1Nbq+6Y7mrx+Bnf0p8NE+kUqfKGGthtOGcQqKaDnZlwLqmGpSDG6cHW9bv35kO3OcYOG5dwGOlNTg7hGy3G46UYvD0eefeFweGJyXyi8dAyRX9boH7denREv11lcfAHsJud3yUVVcW8pRDcFp2UgIS3yQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003800; c=relaxed/simple;
	bh=PqdtBxyERndEosPDHbmI+GUBTlW7xb/TJgdAmt5315U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaCOf9oV6wn96yThPAYGduzrU3D/rEp3IV7PhJZnOnZuNpCWhkKwOy9kifugGaU+jyD9dSWHPpZ147xXxtMTAM5WKg/D86st7JNuOXQHTZ4uOYx9RHJqF5kXItQdZwvy+ItT6tuu67RcYlbh2ZT6we3GSFku7ZpKionAkXSuEPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5bgaBFX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b9b1900bso378716f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003795; x=1774608595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKbe+TyX+B1VS7SJjwxdTR+wYHiyWXqHq9Z2tzEU/jk=;
        b=i5bgaBFXMp2eOUgrOECULRD2bDP5PqXyy5SD+BvHjCIq+XRPiz/htJHvzAO15gqslF
         77RHptLZedmsFCgiNdzx1QZ8y/+5cRWs+K2uP+cC30p0vq/hP/fqWYkaK/troFfKhGvQ
         nw2fEWu8LSG545vHqMycnfF3QhJkn9Gw5IFIDMEGLLH3H/95CnV1EGm4AdIL/OV743vh
         b+uYWvu71rNT2TK1xVTXw/sxrSykd2usPlVEsVdvAxeO3wlwLh9se4Qj0EUALS6iK+BM
         K+NwtzutluRfH/649VgEbj46GY+FrZS8NGBfoLpcxQgK+vP1Wdb1RkFimhytAufkXIp9
         KRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003795; x=1774608595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZKbe+TyX+B1VS7SJjwxdTR+wYHiyWXqHq9Z2tzEU/jk=;
        b=Etliv69LJByY2B6Y4DB7Pe1EyQlP4aze72NH3Ld5J9MlRoXhw+DxHiiD9V+MZcx0jz
         knVqdgfk9EgXBuJ7+s2Q6kjHYGpElhrqV3gNBfWQeH85YuKkfhn0QnIqtAfbbA+Jp35Q
         g1kH92EoPuppBB4Z6F59ZKdzxWTf0QwWYZBLq5acIU22G7o70empuET80nlev3UJLiCV
         c3vjeFexPHDDC0kxOwsZV8bit06cTweJOXVGtEZMvRMwwSgyN25Fnt3Ms0ebAVVYjsrr
         C+hLdqVUjXdNvLjNGUyq9U+UOSLvQgzZx5cBaaJwlWpovM+QsWd/Z40EFscgP0IgdRkL
         gYBw==
X-Forwarded-Encrypted: i=1; AJvYcCXEPOxMnx5ktbMOUhOzDiH/DBdmb5FFVGqPbwO3cfnT0XOKvUH1eKAKnxyvjYw+qIG9aEYHCVooJiGYlTfDraNqDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwODWdncxakTUd+l5G8DMWSd82qZ67dNl7jT/sflIa/XgRyfG6r
	UnHbLjYJnuHhvI8sH6/JWmVXhmbkAmqUMkeHvKXSQgeczmRFFR6uURwiAsJxXQ==
X-Gm-Gg: ATEYQzx3TapuVjO+5NFkC7DHqzYhAsv3FUaiayiVDPwhapZAAUxQrbSGNU9QvjAZLxQ
	2BONNNIQPPuhKIvcPBbw+QhN3jsBCVBazssYdTYl12U/nBlBsmSWri319Aida2/LwhI6QwWHD0o
	0uWMjrDFOnRPjfWxI47VN5dkhsM9kBWROcAxOln0XIZC41GtdJ/sJqKcuKRmwFzQEfJB/FZ3s0n
	Mck+7WjPJNaWaIpjYRV8KLvMieYDSr8tkGARjMi30LejS8N84FfoSNXkNWD9yLRAx4i8suDSgZ9
	dcBvSHelg8fuLUmDqR4MPb2bTi9F2j+1SC5ZLylGSZW8MeewNcu55QYQk+0lNWI3fPkIAYa3lsx
	1KRs5/GW1TPmyt5ZxAuXGjBODbb4plxISJmCirL8FFL9rY1lAVUhPUGFclsYuhHLy2QNS1QRPLf
	EAC0zWzd9lxPFxDUnPJP/p1+Wb/4cy2/I=
X-Received: by 2002:a5d:588f:0:b0:439:b3a3:7239 with SMTP id ffacd0b85a97d-43b6423fb3dmr4617157f8f.5.1774003794609;
        Fri, 20 Mar 2026 03:49:54 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6203062f8f.5.2026.03.20.03.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:49:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v7 04/10] clk: renesas: rzg2l-cpg: Add rzg2l_mod_clock_init_mstop_helper()
Date: Fri, 20 Mar 2026 10:49:38 +0000
Message-ID: <20260320104950.42220-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29999-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.843];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 6BA892D90D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Refactor the mstop initialisation logic in rzg2l_mod_clock_init_mstop()
into a dedicated helper function rzg2l_mod_clock_init_mstop_helper(). This
decouples the logic for setting module stop state on disabled clocks from
the iteration loop, allowing it to be reused during resume to re-enable
critical clocks.

No functional change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Collected tag
v6:
 * New patch
---
 drivers/clk/renesas/rzg2l-cpg.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f9e4af7f49d0..b68b0312f0e3 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1586,6 +1586,20 @@ static struct mstop *rzg2l_mod_clock_get_mstop(struct rzg2l_cpg_priv *priv, u32
 	return NULL;
 }
 
+static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
+					      struct mod_clock *clk)
+{
+	/*
+	 * Out of reset all modules are enabled. Set module state
+	 * in case associated clocks are disabled at probe. Otherwise
+	 * module is in invalid HW state.
+	 */
+	scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
+		if (!rzg2l_mod_clock_is_enabled(&clk->hw))
+			rzg2l_mod_clock_module_set_state(clk, true);
+	}
+}
+
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
 	struct mod_clock *clk;
@@ -1595,15 +1609,7 @@ static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 		if (!clk->mstop)
 			continue;
 
-		/*
-		 * Out of reset all modules are enabled. Set module state
-		 * in case associated clocks are disabled at probe. Otherwise
-		 * module is in invalid HW state.
-		 */
-		scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
-			if (!rzg2l_mod_clock_is_enabled(&clk->hw))
-				rzg2l_mod_clock_module_set_state(clk, true);
-		}
+		rzg2l_mod_clock_init_mstop_helper(priv, clk);
 	}
 }
 
-- 
2.43.0


