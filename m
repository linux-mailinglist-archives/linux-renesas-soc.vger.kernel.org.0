Return-Path: <linux-renesas-soc+bounces-32318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPAlMe1FAGqgFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:46:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2B5032CF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EE143014563
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9A436C0DC;
	Sun, 10 May 2026 08:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Me4OFeWS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400C236A02C
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402649; cv=none; b=qDaB9lcgIODzHTHMN/BjJj6GUr4C2K/2vbWCbHmCXUPEuztVXqTb60RDOohZciNnVdtWDahLFSnhhYWYbHt3g+SW9ORs+MpyVREcfx/AcjMzGMzJ74mvLFDznMHthhtjlM3Irphcf2FMODIXClj6jVvoOKS3VJuFer3Ba+sDDx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402649; c=relaxed/simple;
	bh=vBVltSf+zvidy2s5NGA4z20jtANfqFt6bS7cHx7O2tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t39mEX0VFZUajdSjyKfJ1iIRan6v9QQhuAqY0RBmG2EF1+6ARBDjkP6Fr8oqjUcF7vHi35yEV6wn2WZHldbxmPnMReP/sdO2CNBQcHVOcmfkoavu1fN38yIG5lhwkQ7UAdYf2oyK3acGk/n7DJ0G3BTNFQ5PZZ7c02CtWFj44Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Me4OFeWS; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b4583f0a1aso20915035ad.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402647; x=1779007447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p0JHZRpvp5tAeW23q1iGWhiV14ay6JXEiHGZU5IDsQ=;
        b=Me4OFeWSV/C3CCoE//GHGJmx26/Ep0R9AMfzfFaZUkNesxM7wIt54d4xMxDKhkOu+d
         ytbnp6ZuW2do1vdsiyuSEMfdQipvr5jYctGzWHt108EurnXYWrQyLuhvWovHDSHKaTRy
         abTEGIcwgBxGaQS+VZiJRVYCeh0VZmysUzFgbujW6K+EXNb0HY0z2dCyMqvy1/S4SF/F
         W0aL/endzhxn74kolUQwMb9sO2o8hVqyb/ALoFwZqwiyxigiWxVDxEGMkcjm42n/Jvut
         7wslN8+gjdfgqmlHELWXyLUXFgcz01BeGe2e8GQxKPrHYHcMQr0XQJcm6p/W70f3Z1G5
         oeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402647; x=1779007447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6p0JHZRpvp5tAeW23q1iGWhiV14ay6JXEiHGZU5IDsQ=;
        b=QXcx0hntsCR8SHUTt4JC3yuTupZXZBWjgI4Axh6FLozPShj90l4f/dTRe6MpvEN1p/
         kNZvHFtoBJbm+cF/AkK6oxm3kflvwmbFQ8ea7HgD4NRJWPxfep2SX5a+XpU+a4w1S1Zq
         JKhA8bOWUj4oRVr/dtwtm2RMdPymeNAxdxVyJUon6Bl5HcSvEVlfLKLeLXe90jTWG1bP
         zEMqj9omg7VQO7Sv7nZ70m0U03s9FmzM/np7BwYaoS3S3DcYz/QdF7yr5AIscadT3Dnt
         aRbeuZficDuUvw49C0azewUQFGXesMe5C9MoNnSgyzG9tRfpYR+2IyQUaa34uBszFWXN
         xgvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RGINJlrdzohHAxOx9VwE3twxXjjXBubx7xJ1IBpCFpNnaQu2gDgc9xWEdw1wYHrfQivHe/4aUgYTfoeNpN1gADg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyH2UeiRxV8Mz6bBCmnkRhoD2bpv9fF9gLW3yD0p0jyyg2N4wu
	8z36wgWq0d9GfeYi/KLzGSdfv3X0OlkkzYKWcbB92W5LixVTmF6SZmRM
X-Gm-Gg: Acq92OF1dimWF+IN7/r3iAfq7pi5up9sEf8pDy+bdgB1va6XbFKcdGo2hNOkjibOfkr
	q/JV99QqxguzWyY01bc94LhwwBd6IIIf6MlEIgpEQAjJluYCH/29Q3DWazcdWvGmizy+NX5Q/pq
	sL8FIn23zKyZ0A1GxaZTJ/Z6m32DC9M/PV4LiNcpDa10/iueehYCLaGZkwmeLMZLHuGWXSzIoF7
	xybo8GavBsEFQKcM1Ae+DHXR86rfg58UYJG9AAEv0qVgzAnJbr4/vtRX4ayf6CuMFLYen8/jten
	78vNWKT7T3CyxbMZpChi4eiBQqujDdQG5pxBPABq3TtJqlinUwOHkcTBg7mBSDYyEFzYS4lGN1q
	ekS8zC3CpONAEhAHvNg2RbIqNdRr7WTTBxenLOm6m2IQJNaO5J58hvOZRYPrbwTfN6eMX50hv3Q
	SfsvThN7uY/I3Vru7ANeA9vb8YHbuejNfpaBES5hcgXrRj1kWOIHoqbs9ugg==
X-Received: by 2002:a17:903:1984:b0:2b9:59ea:7eba with SMTP id d9443c01a7336-2bc7a9b74fcmr51289285ad.13.1778402647580;
        Sun, 10 May 2026 01:44:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 05/10] ASoC: renesas: fsi: Move fsi_clk_init()
Date: Sun, 10 May 2026 15:42:58 +0700
Message-ID: <20260510084303.122426-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6DF2B5032CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-32318-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() after set_rate() functions to prepare for subsequent
refactoring.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 128 ++++++++++++++++++++--------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index fc8428cb1ba7..06ec5709216b 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -718,70 +718,6 @@ static void fsi_spdif_clk_ctrl(struct fsi_priv *fsi, int enable)
 /*
  *		clock function
  */
-static int fsi_clk_init(struct device *dev,
-			struct fsi_priv *fsi,
-			int xck,
-			int ick,
-			int div,
-			int (*set_rate)(struct device *dev,
-					struct fsi_priv *fsi))
-{
-	struct fsi_clk *clock = &fsi->clock;
-	int is_porta = fsi_is_port_a(fsi);
-
-	clock->xck	= NULL;
-	clock->ick	= NULL;
-	clock->div	= NULL;
-	clock->rate	= 0;
-	clock->count	= 0;
-	clock->set_rate	= set_rate;
-
-	clock->own = devm_clk_get(dev, NULL);
-	if (IS_ERR(clock->own))
-		return -EINVAL;
-
-	/* external clock */
-	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
-		if (clock->xck == clock->own) {
-			dev_err(dev, "cpu doesn't support xck clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSIACLK/FSIBCLK */
-	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
-		if (clock->ick == clock->own) {
-			dev_err(dev, "cpu doesn't support ick clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSI-DIV */
-	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
-		if (clock->div == clock->own) {
-			dev_err(dev, "cpu doesn't support div clock\n");
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
 #define fsi_clk_invalid(fsi) fsi_clk_valid(fsi, 0)
 static void fsi_clk_valid(struct fsi_priv *fsi, unsigned long rate)
 {
@@ -1035,6 +971,70 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	return ret;
 }
 
+static int fsi_clk_init(struct device *dev,
+			struct fsi_priv *fsi,
+			int xck,
+			int ick,
+			int div,
+			int (*set_rate)(struct device *dev,
+					struct fsi_priv *fsi))
+{
+	struct fsi_clk *clock = &fsi->clock;
+	int is_porta = fsi_is_port_a(fsi);
+
+	clock->xck	= NULL;
+	clock->ick	= NULL;
+	clock->div	= NULL;
+	clock->rate	= 0;
+	clock->count	= 0;
+	clock->set_rate	= set_rate;
+
+	clock->own = devm_clk_get(dev, NULL);
+	if (IS_ERR(clock->own))
+		return -EINVAL;
+
+	/* external clock */
+	if (xck) {
+		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
+		if (IS_ERR(clock->xck)) {
+			dev_err(dev, "can't get xck clock\n");
+			return -EINVAL;
+		}
+		if (clock->xck == clock->own) {
+			dev_err(dev, "cpu doesn't support xck clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSIACLK/FSIBCLK */
+	if (ick) {
+		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
+		if (IS_ERR(clock->ick)) {
+			dev_err(dev, "can't get ick clock\n");
+			return -EINVAL;
+		}
+		if (clock->ick == clock->own) {
+			dev_err(dev, "cpu doesn't support ick clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSI-DIV */
+	if (div) {
+		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
+		if (IS_ERR(clock->div)) {
+			dev_err(dev, "can't get div clock\n");
+			return -EINVAL;
+		}
+		if (clock->div == clock->own) {
+			dev_err(dev, "cpu doesn't support div clock\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static void fsi_pointer_update(struct fsi_stream *io, int size)
 {
 	io->buff_sample_pos += size;
-- 
2.43.0


