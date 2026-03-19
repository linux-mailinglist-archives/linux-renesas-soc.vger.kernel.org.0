Return-Path: <linux-renesas-soc+bounces-29891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF4EKHLyu2nkqQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:56:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 334AB2CB7C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D85923204C1E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2A43D47AA;
	Thu, 19 Mar 2026 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mA1lclRx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC613D3CFA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924715; cv=none; b=AE8yd5D6FggoVEyp9vEuigR7486qyLVIqb6J/cG0wM1ttCo2Pq06JswhrkR3Iqj9n3DVEsmu/WvglxDQhtieU5mgOa+ZGKworEnv+slDy7Fyv2bfYtUpBcTu+2LMdF4Boo7LzykiEB3eUq8Vvxubx+l251UWHkiBVSJ5Osb5J58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924715; c=relaxed/simple;
	bh=p1Dy5QwacmRT/b3H3p4y11qC+z1schtfyshS1B+/Zb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tF+zWej3PHDAAygcpeUxOIip6niWZdbyzFiQbpjysw7n9mzBlQN4ZRFRbOCCF35MUUuyq0BcKsCpUz1g1LWmFuvXANnKrvE0wYcCOweKIQSV1GBaeiMzbnn+xF6ozVjlToDaV1kmPTapWaD/wszlKa4L8A3gFM/nWK8ES4tCfxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mA1lclRx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483487335c2so6788395e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773924710; x=1774529510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpin9fgTSd6+Bb+khmyQR5GOT1G9JWW0tiZ2kKEgCN8=;
        b=mA1lclRx0l5QRBMUjfpEfV5KRNAmF2cRlBKRUK+Fq5EfJ2KlfZEMiE8IjzIc4WSBFX
         te9/eeaqyuV3WhZRRIrXarpUIihqLyg3MNfW++glTP5veO0Yo1QdsM/Y8bjsxtC7+tsP
         sLGX1nabOE06/erqET9U1G2SER2eMoIRKVepa4U/CM1FQ39ik/oMYqWKAkD6GyF3SlB0
         +l+OkuTI3Ab3GvFTpnJqcC4jJU/h2gnydNjWrc40c05HmOEWjJq5QfwA55XkL9b3qgyX
         SbT5FKWtzMWZvCnLj3KYTWMT19uEkDfAC0tyac9InmKOL35uTvY+s7jeSIHsXPdIg66Q
         rIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924710; x=1774529510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dpin9fgTSd6+Bb+khmyQR5GOT1G9JWW0tiZ2kKEgCN8=;
        b=aMVFSbd3Px6sH7X7SHaMrgsiWtuwcJEE7pyIeuFgTh3hmRe63vwPD6kfyS/JcN7ugw
         OrsN7wyIx0GpwB8VG/J6j65MyOB1CUbUQmybGVDEtWmmj+jDK3fgZN6mBnso6RgCUKOB
         98otmSwRoETp+1wt0YVUYObpkcxMPJEbysTDrRksn4kwSHACnC0IPgxrUO4gSInQQpyG
         fsk6dvckdsp7NHUDHGo+77nVXQAiI5Of3SLtsvToO8tEeXorrJqq9/iyt5I8fEY8Je93
         ZTGCFH6eVjKiorHiFLg4rFimzBuALAOObSBEvLo6dKrtcBdyD4x5h5UrG+pz3CvfM6Sq
         N7jA==
X-Forwarded-Encrypted: i=1; AJvYcCWGVPZ23T8hRjjL9AZvWBXvWQIjY0tQkzz5WXCnHtttyYEGFlS5aptI9oNzSoNb7zaDYQVc9IwR6PCceUkYJFGX3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfLs+xY2m6EtW5gs/dEADHCGsp6gx2m/bTuZN+15eDbKtglQ1t
	9HiTyD/sE0f9GX0TGvbWaIcCttNYupvpC5P9xdOUnbJh3Qqnyev5MWw/
X-Gm-Gg: ATEYQzzwPE4+Pp/nTGY/iwh2We6hPt1Qxs8knahwJV1oIHeaePIgxgiUA12D9RBQlwf
	h3zFNak1Up5ErTDcjK9As6ls+NuDyXv7m+rNhJDmk5CYDu/cWFBTJanuhFtgR9lICPCRxHQvXJN
	2/6kZM6KxAa9yanQQGhA1A3oyLcugkIw2GdGHS75AhZdP/IgJHCiXsmurI25o5/Y8J+I1V54b4Z
	JH2sP+GOHisTgbeQL8y3yqitdBwQ7oRMOVHqpnIOQry5lo24N33kuB8eZFQo0e85OourfkxwQaz
	MWVSE2t7VsUZyg/SXdjWB9X5akJTOdlrfWDPNatm5qrfbgbgMAzWWyKjuVt0NfQbdyfl6AeVa6C
	qVdz+kMDzqAIXjPC33+/W5GoVukzV1ptYOqLtXlzEd9W5MRYo+dFZkBN32qgrHpLV0TOsDFn6Tg
	oWJRczrIWrhPxK3E915g5kfyYhQNmwELU=
X-Received: by 2002:a05:600c:4e42:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-486f446359emr111081835e9.29.1773924709573;
        Thu, 19 Mar 2026 05:51:49 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bc96c6sm72382035e9.5.2026.03.19.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:51:49 -0700 (PDT)
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
Subject: [PATCH v6 04/10] clk: renesas: rzg2l-cpg: Add rzg2l_mod_clock_init_mstop_helper()
Date: Thu, 19 Mar 2026 12:51:28 +0000
Message-ID: <20260319125143.230377-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29891-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.826];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 334AB2CB7C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Refactor the mstop initialisation logic in rzg2l_mod_clock_init_mstop()
into a dedicated helper function rzg2l_mod_clock_init_mstop_helper(). This
decouples the logic for setting module stop state on disabled clocks from
the iteration loop, allowing it to be reused during resume to re-enable
critical clocks.

No functional change.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


