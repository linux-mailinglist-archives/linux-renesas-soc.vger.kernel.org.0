Return-Path: <linux-renesas-soc+bounces-7138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1EE929715
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jul 2024 10:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22F0B1F216B5
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jul 2024 08:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB665111AA;
	Sun,  7 Jul 2024 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="arzLq/Nt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6335318059
	for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Jul 2024 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720340943; cv=none; b=Gfnswcbbialaq/HuYkUIjyu8h7Cvphxw1iypsMLSv4AA7CM3/1c3MxIo+rlyJOOkLjjEFcBpgwHecRw6xpPDMp1TGpmzPA7IEzfUgNccBwXxGzlcCM3ualX8c9wWPwbUZWiwfhHccdsGpD0/Q/hpQo3UWSGt34j4X2up7F+yG6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720340943; c=relaxed/simple;
	bh=OzHvO6rVAWLMwGOBglvI6ki+1drfBQjh5lYtrpaYyX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5+BNTKWu+Agj9OEZdUdbhcLC9TPzDz4S6U/gJdfsd/Cvw+UlSQ3x9vAEtNhjeqFelQxv6EO1AZ5l/zSYNS2IkmEd0+Ka307zWj9SA/sCjqwpIZU3NCZ60+6O7deOH1jZOFjFHjec6roOO4Zqh2cJgBcOPRH1Di8BreCjH14QQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=arzLq/Nt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=nc77Nyudax4dUYLrDvKpXrdOETKQVPpzHynxuO9OHTM=; b=arzLq/
	Nt8S9/n3TfoP5EIKzzC3wBgZKnGNfmkbosqRFGu58ZslWTP7n9F/iYadhoC4wTK2
	v9Ctt+/9uQCoc8+hzooVNyvf31AXpmTlG2R+z+kcJfS72UF47gYm9GqJ96jHteHu
	pxa0m75AQjd+CwGwIcAAfKBqr6wp4wHFDvEXGDXS2WolV0lDHBlG81tG/KTmPNr5
	R78cfkhPXGRPNYlBclBtfM3mILrMdcNVd631MlO94Avk55GuIszRy9ezFeqMsZmH
	ABht3fXjFuRqrJPswLcFxf1rwl55CnkZQ3J0gSdtBb7FOnrTn01oIXDi/oi1r3J4
	2f4iNuDhj7qYTpzw==
Received: (qmail 4044189 invoked from network); 7 Jul 2024 10:28:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jul 2024 10:28:57 +0200
X-UD-Smtp-Session: l3s3148p1@okB2FqQcRpRQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] i2c: rcar: bring hardware to known state when probing
Date: Sun,  7 Jul 2024 10:28:46 +0200
Message-ID: <20240707082848.5424-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240707082848.5424-1-wsa+renesas@sang-engineering.com>
References: <20240707082848.5424-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When probing, the hardware is not brought into a known state. This may
be a problem when a hypervisor restarts Linux without resetting the
hardware, leaving an old state running. Make sure the hardware gets
initialized, especially interrupts should be cleared and disabled.

Reported-by: Dirk Behme <dirk.behme@de.bosch.com>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/r/20240702045535.2000393-1-dirk.behme@de.bosch.com
Fixes: 6ccbe607132b ("i2c: add Renesas R-Car I2C driver")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Should go to for-current.

Changes since v1:
* renamed new function to *_reset_slave() instead of *_init_slave()
  which is more appropriate
* do not mention refactorization in commit message
* added Fixes tag

 drivers/i2c/busses/i2c-rcar.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 828aa2ea0fe4..ec73463ea9b5 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -257,6 +257,14 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 	}
 }
 
+static void rcar_i2c_reset_slave(struct rcar_i2c_priv *priv)
+{
+	rcar_i2c_write(priv, ICSIER, 0);
+	rcar_i2c_write(priv, ICSSR, 0);
+	rcar_i2c_write(priv, ICSCR, SDBS);
+	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
+}
+
 static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
 {
 	int ret;
@@ -1033,11 +1041,8 @@ static int rcar_unreg_slave(struct i2c_client *slave)
 
 	/* ensure no irq is running before clearing ptr */
 	disable_irq(priv->irq);
-	rcar_i2c_write(priv, ICSIER, 0);
-	rcar_i2c_write(priv, ICSSR, 0);
+	rcar_i2c_reset_slave(priv);
 	enable_irq(priv->irq);
-	rcar_i2c_write(priv, ICSCR, SDBS);
-	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
 
 	priv->slave = NULL;
 
@@ -1152,7 +1157,9 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 		goto out_pm_disable;
 	}
 
-	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
+	/* Bring hardware to known state */
+	rcar_i2c_init(priv);
+	rcar_i2c_reset_slave(priv);
 
 	if (priv->devtype < I2C_RCAR_GEN3) {
 		irqflags |= IRQF_NO_THREAD;
-- 
2.43.0


