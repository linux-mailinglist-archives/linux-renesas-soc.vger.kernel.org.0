Return-Path: <linux-renesas-soc+bounces-34421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d9WCE5syPWpeywgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 15:52:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ABC6C644A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 15:52:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ue36AlMF;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49ADD302629C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 13:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB6233C502;
	Thu, 25 Jun 2026 13:52:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C758033067C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 13:52:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395543; cv=none; b=nufFZ6hWTG344p381iOmUpZn6Xn05drZMqcN1l9dxXwmey9GGDaCVTeoqmmNXIkbF+vk5mPt4i0a0NNBQhcNI+Bkmd6FbfTARJs5Y4ebOxxx+DiP4XpRGHN+EMOJVDPf+C/ZEoAohH38qsk91GhRiseexSB17wUtKtgaaTM/gV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395543; c=relaxed/simple;
	bh=n6yh2+/rWeQQNi4qwoTckvozslY49WtUu670X1OjJOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rsI6Q3+5FRuxMu6oUlWPatl0aSIYxjtHhwz1gxslo3VFonX65uv68PMtYskFNPNoDto45rsrsJHnJiwjOMjE1z0/XYPgRdKAEe36RkGJd5hXsMmq/dglkMPG0kKruxx6+ac4Gss86k7zCHy4SA+VVYyOs5AW+az5jUIndOFNEg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ue36AlMF; arc=none smtp.client-ip=209.85.218.49
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c029505b389so334285466b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782395540; x=1783000340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0QUpR3Lk1Tb8lP5JkSe8nEXPKpbfyPrEqlp9QtaxbSk=;
        b=Ue36AlMFZEzIIeBkYm0VFaRBIriBsCb/t/GvSJf8upf8bQw4SkZvboWYhw8+2lqPfg
         1T/XUKrMsBO43MzjPInUM201Z7z9cJRcbOeki5BbVPC0LdIBl4k943pJAlzsRXp+MoMO
         37rO5uA+xopeq+rhQOa/JDoHIFskab6753Zs6KHQnk+pgWAOqpBnj7stvhRloIyV8Jd9
         /uJPgEAwZilYRUYHP8cXHwojCciu9EjW5l135zB4NZImly4pGwm59unBy5K+veZqPc/6
         1f1H2IDaX/JQwjGrKYJYfxVeN6aNUjFgTCViwKW/GrZCJHGhAVGnV7PJukVYncG4aCUd
         /DSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782395540; x=1783000340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QUpR3Lk1Tb8lP5JkSe8nEXPKpbfyPrEqlp9QtaxbSk=;
        b=X9eOFSfnnJrbk5BS46RGbN6DaSTkazovtYpdH6NqHo0brFOV1TolsGamTaU7NQfScs
         LtKSVGGFsjMd1mRijXPyThE7jXIWSWJy55+EyR8ZWMDxUO2CEQbpLLtDuhg8btv9lpCl
         mnFVjIlBLfebMgf6PCUW6EEg4IQxuxU9bzrDzazJwKq/Vp+FnmqhtQvjVGsLVP9cUIyq
         qFBu6yVUt5eNaRy/2FdZkM0RFSku0dxOForFo31Hydi1BzZwJeR13CwmfXcjrEmkjaIo
         tzFtbxZcnhhweI0im8jyBOZY8gm38tpBrkf25Cmq9/ol5LuGsh/CCLG3q8XwaaB+kS34
         bRNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeAgfVMKFlrxYFGOermqkbLIMTQkEHriCgvp8gmt59eJWNCs0lMOCIBW1xkfMzgguaTeTMRkgaIgCXWyRIsL6suA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHhN7VSaHNUneVOdJG1dMrCvShbtsx/Iuxj7tC4rUasBWBcFNF
	y+G/mNI3Yj5xfw0xsRQP6gWrwIPk5mThjFof7MeM6Ton1r77VqIMkd7x
X-Gm-Gg: AfdE7ckVVlSg8ww1XyW4GGGQt237gJ6T5EtyAUHsCBZ655XHibsG4CzC9fQ158JBrEu
	wESOiXUpqc1ZzxnVAdkPwELDQSTkmsiV9lPUH+rfr1lELx6MObZ9z0HLWCH4RC7XKoN6q9uMgam
	me493eKWRiFUEPORRkKSTaBOcQmzusmhb9AYJ6Xm6NEOSn58C0UnCfJnMcrvYRdiCArLiT4Gcsl
	4l9rnYrPZYC33fWC47Prb2nSske4ZI7q/uRbyq0l6cBlx+qJR+agogKks8i+Rs024SgkbSP9H8A
	WhDz4C5/7yYXJ0ACTny3zBsCMMvZHTIA4hb8bN7N2raqeiiuWXJug2R85ABTfhhUP7rvL9fxEwr
	APOOqcHQtqsgMKwQs9bDWtylvsHqOPwyi//wEB1N0FuLuftp+0QXCBXGxbxllZfeq9ygxqzxrHT
	Sm6HIOsXY1lhO7yvzlrX0DWLclaJMec1YVbINk
X-Received: by 2002:a17:906:5a56:b0:bd4:f3bc:c4b3 with SMTP id a640c23a62f3a-c10309ba16emr556111166b.18.1782395540038;
        Thu, 25 Jun 2026 06:52:20 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:6aa7:b2d:3460:b689])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12024deb90sm171139166b.18.2026.06.25.06.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:52:19 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Tu Nguyen <tu.nguyen.xg@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] can: rcar_canfd: Change the initializing flow for clocks and resets
Date: Thu, 25 Jun 2026 14:51:51 +0100
Message-ID: <20260625135216.130450-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34421-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:mkl@pengutronix.de,m:mailhol@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:tu.nguyen.xg@renesas.com,m:biju.das.jz@bp.renesas.com,m:duy.nguyen.rh@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-can@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[renesas.com,bp.renesas.com,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8ABC6C644A

From: Tu Nguyen <tu.nguyen.xg@renesas.com>

Testing CANFD on RZ/G3E shows that many registers do not reset to their
initial values with the current flow of deasserting resets first and then
enabling clocks.

Based on the HW manual, clocks should be supplied first and the
resets deasserted afterward.

 section 7.4.3 Procedure for Activating Modules: RZ/G2L
 section 4.4.9.3 Procedure for Starting up Units: RZ/G3E

So, update the order of the initializing flow for resets and clocks
to match the hardware manual, resetting all CANFD registers to their
initial values. Also update rcar_canfd_global_deinit() to assert
resets before disabling clocks, so the teardown path mirrors the new
init ordering.

Fixes: 76e9353a80e9 ("can: rcar_canfd: Add support for RZ/G2L family")
Signed-off-by: Tu Nguyen <tu.nguyen.xg@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/can/rcar/rcar_canfd.c | 32 +++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index eaf8cac78038..fcc37b73ed43 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2003,20 +2003,12 @@ static int rcar_canfd_global_init(struct rcar_canfd_global *gpriv)
 	u32 ch, sts;
 	int err;
 
-	err = reset_control_reset(gpriv->rstc1);
-	if (err)
-		return err;
-
-	err = reset_control_reset(gpriv->rstc2);
-	if (err)
-		goto fail_reset1;
-
 	/* Enable peripheral clock for register access */
 	err = clk_prepare_enable(gpriv->clkp);
 	if (err) {
 		dev_err(dev, "failed to enable peripheral clock: %pe\n",
 			ERR_PTR(err));
-		goto fail_reset2;
+		return err;
 	}
 
 	/* Enable RAM clock */
@@ -2027,10 +2019,18 @@ static int rcar_canfd_global_init(struct rcar_canfd_global *gpriv)
 		goto fail_clk;
 	}
 
+	err = reset_control_reset(gpriv->rstc1);
+	if (err)
+		goto fail_ram_clk;
+
+	err = reset_control_reset(gpriv->rstc2);
+	if (err)
+		goto fail_reset1;
+
 	err = rcar_canfd_reset_controller(gpriv);
 	if (err) {
 		dev_err(dev, "reset controller failed: %pe\n", ERR_PTR(err));
-		goto fail_ram_clk;
+		goto fail_reset2;
 	}
 
 	/* Controller in Global reset & Channel reset mode */
@@ -2068,14 +2068,14 @@ static int rcar_canfd_global_init(struct rcar_canfd_global *gpriv)
 
 fail_mode:
 	rcar_canfd_disable_global_interrupts(gpriv);
-fail_ram_clk:
-	clk_disable_unprepare(gpriv->clk_ram);
-fail_clk:
-	clk_disable_unprepare(gpriv->clkp);
 fail_reset2:
 	reset_control_assert(gpriv->rstc2);
 fail_reset1:
 	reset_control_assert(gpriv->rstc1);
+fail_ram_clk:
+	clk_disable_unprepare(gpriv->clk_ram);
+fail_clk:
+	clk_disable_unprepare(gpriv->clkp);
 	return err;
 }
 
@@ -2090,10 +2090,10 @@ static void rcar_canfd_global_deinit(struct rcar_canfd_global *gpriv, bool full)
 		rcar_canfd_set_bit(gpriv->base, RCANFD_GCTR, RCANFD_GCTR_GSLPR);
 	}
 
-	clk_disable_unprepare(gpriv->clk_ram);
-	clk_disable_unprepare(gpriv->clkp);
 	reset_control_assert(gpriv->rstc2);
 	reset_control_assert(gpriv->rstc1);
+	clk_disable_unprepare(gpriv->clk_ram);
+	clk_disable_unprepare(gpriv->clkp);
 }
 
 static int rcar_canfd_probe(struct platform_device *pdev)
-- 
2.43.0


