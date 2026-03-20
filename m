Return-Path: <linux-renesas-soc+bounces-29998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOMhGIMmvWmr6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F7D2D90F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 815A4304D671
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C9D39282B;
	Fri, 20 Mar 2026 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpT7Y5v3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0917A393DE9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003799; cv=none; b=Rzi/HTO7m/S4Kec9xyhC0MNMKhOUPZ2QRET1+ppbjPqI7TQtPtTPsZzpipVfiEBSlnpfCPozf7lU2sCNhYh/N3QWry+SlHCkI3F7pqLneP9hwE+3Fh4XWhdfFqdargTBBKG5N+ysmuwRk6EC0c4Mbb/kkvoOHAjCbnww7lbvGv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003799; c=relaxed/simple;
	bh=KV6RQJ0PMqXgl39fDov5/8rRWnSxE60D38ftJ3AsSuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpMqFr8wJRHdjdzGsvIEK454IdiKentjC5N4h3abwJvtIdOcQ4Lm7XBtA/xHV7HY5Uk0jd1e2VrbwfSBmHuuO4TNP1vDGocN90yYC/XmBltGqfIkKfzzwUJBOkoxfv/w+g25kpuzHfaZ30zYv0ZwrLiIxbsb1LK70wJMOllxaPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpT7Y5v3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b5bded412so974338f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003795; x=1774608595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDoprgHu93ls7kHmqlV6l9UPsfd/brYSyxRd8cyc4oY=;
        b=IpT7Y5v3raw+RZdp+jC5c0PFbAwoirt4NpG6AmXItNJE6RogvPPjGiUjBTWmZ5GH+E
         Fi3mkvqXZ/G7WsdOISyLqo85Ri2VYaFxTEuc2XM89WxxAvrXxYCRJy54CzzH6doHPP1n
         4puUWGYWwFmRoPqA4AvCP4iKzOeJaL4gluJ00fD8Riz56jsTnQo0EW/Zv+fEH8WoCKD9
         /xiMqrSo5GLNV1eCYax5WV/BZx2+eI/4sM0H9ZgajYht2Ts1iPwFMR9jnoWUOnPsvHSR
         oofa45n7aKa0RVUq6m71GYY9v9ZQGvIbAc6cZB40Z3Biu8ObQEtBuCpPk5170bQUAFUE
         J3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003795; x=1774608595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MDoprgHu93ls7kHmqlV6l9UPsfd/brYSyxRd8cyc4oY=;
        b=fuZfvqBD4PRwTnrZiXYIpgv4Mg3mJUewDt7Az1ogqNk3YbgVKVSdiJmfV6YLyiD8kP
         y2mEHAgY+aKECkRQ2ilR9/JcLdk+5+rHNCPnLaGD83ebhl+Kl0APKZLHmK8ysXuaUFST
         xFTYZx+WMBTMslEe/h/RleZM2FKX+XIbX75UZSvmCtwYRqDL7InZ8xhQwW8UgYgeKoYd
         /SL9HjclFzQuDP9o90b2aZJ/NU+va5nZOiP+lp9TyMU8lVXf77vsn5GyCFT9dE8epai0
         +x1TNzJX842bWWvdYO9W1f8sCzPdd23Uo4vd41d+wvU20JphcviTp2M9lBVSHi1wu938
         naWA==
X-Forwarded-Encrypted: i=1; AJvYcCWjnguhLsdJmoNS2VtmUFjz1Mlwe4Nj5q9vzsbXwLrt/E4eQq3gbbvvG3yvH33Y5paJp3GBdK2kJI/3dOVnzEaskg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWeSZVx6KXYBBrB9nsxadbgPolwZQDzfxAjutr8f0LNqKc4H+D
	/bEecLoUx7md/F+MbqTF1leF78V3B1O0ARAE/bq6GOtUu6vBF7cP1eip
X-Gm-Gg: ATEYQzz3tXlZAuGRxm0zvTr9iVHCcftqxWJquAnoABNhAokrUZOjYHWo6OirpQK1ArZ
	+QoLfs7vhiLJoXE7tRRz4LE4yPRIjhkj7RXvT6BcAnQWDpM6nQ1V8+fQ2d9cxP/UaH/F5wBuSj5
	EHS+ssAyvQECCcSsVGNZAJzjypzFS5xIlkhgB7xmJvCRJ23DGE7NaYyeGOgNEgWrVI4SqO+gtr4
	hFVSsh0qGQCmUkUbWCPe882bDJt+/PVtnbqtO1afyFtD0ZUNGoBrVccQhocZb9aaU8iZgHVoiHo
	35Dtq6fht3+fC8XaV0IRU6QFcQe83GXgZeLh9LmeU4Ijs0QZ48N77HX3nxDpi3eyCsm9T0FOatl
	E+qT+aidyisEVk4t/4LpepqznDQ+rMuuDMNxWVf/6ZVEP1qn52ZcPe96Q5d5S2r+xBqnWVWpRGW
	yxSxE2E03FhWxpUxByWbyxUzpp+TW/aVc=
X-Received: by 2002:a05:6000:4381:b0:439:fd13:5c4a with SMTP id ffacd0b85a97d-43b64234891mr4494405f8f.6.1774003795250;
        Fri, 20 Mar 2026 03:49:55 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v7 05/10] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Fri, 20 Mar 2026 10:49:39 +0000
Message-ID: <20260320104950.42220-6-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29998-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.736];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 14F7D2D90F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

After a suspend/resume cycle, critical module clocks (CLK_IS_CRITICAL) may
be left disabled as there is no owning driver to restore them, unlike
regular clocks.
Add rzg2l_mod_enable_crit_clock_init_mstop() which walks all module clocks
on resume, re-enables any critical clock found disabled, and then restores
the MSTOP state for clocks that have one via the existing helper. This
replaces the direct call to rzg2l_mod_clock_init_mstop() in
rzg2l_cpg_resume(), preserving the correct clock-before-MSTOP restore
ordering.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Updated commit description
 * RZ/V2M has critical clocks but no mstop, so move the mstop check after
   enabling critical clocks. After this, we need to restore only mstop for
   module clocks, so remove the inverted logic and continue statement and
   directly call rzg2l_mod_clock_init_mstop_helper() if the clock has
   mstop.
v5->v6:
 * Updated commit description
 * Dropped the list implementation.
 * Replaced  rzg2l_mod_clock_init_mstop->rzg2l_mod_enable_crit_clock_init_mstop() 
   for enabling critical clks and restoring mstop state during resume.
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b68b0312f0e3..038b3f8e85a1 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1600,6 +1600,21 @@ static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
 	}
 }
 
+static void rzg2l_mod_enable_crit_clock_init_mstop(struct rzg2l_cpg_priv *priv)
+{
+	struct mod_clock *clk;
+	struct clk_hw *hw;
+
+	for_each_mod_clock(clk, hw, priv) {
+		if ((clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL) &&
+		    (!rzg2l_mod_clock_is_enabled(&clk->hw)))
+			rzg2l_mod_clock_endisable(&clk->hw, true);
+
+		if (clk->mstop)
+			rzg2l_mod_clock_init_mstop_helper(priv, clk);
+	}
+}
+
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
 	struct mod_clock *clk;
@@ -2095,7 +2110,7 @@ static int rzg2l_cpg_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	rzg2l_mod_clock_init_mstop(priv);
+	rzg2l_mod_enable_crit_clock_init_mstop(priv);
 
 	return 0;
 }
-- 
2.43.0


