Return-Path: <linux-renesas-soc+bounces-24714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4D8C696F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 13:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C5C5A34AE2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 12:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7CF3126DE;
	Tue, 18 Nov 2025 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GR4+0i0p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEDE2EBBB0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469573; cv=none; b=ML63q/4VYmksB/J12mPSt2oN/iQ3dKFmEv6aZoAaJYUO53lH8D3DWOYo/tAtzKCN9OlpwUdk3mWfOASwpfUAk4GMScErPYv38ND9RTbqtfAmCqrrTGygM6KrZVKIsrwAqEZeCEXN2dv9yog34Q01kvF50SHPtVzMN6yjtmg3gKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469573; c=relaxed/simple;
	bh=08QgB8qKaX3i2DapxCTs97dy/bfjef6zfRlNUY2ki3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sVkqSUZKRsApmCaYDmyZjToC5/U1BRSsM425gKBoN5kxgeSHP+KRiH4Lq6UFIkokV4KJjBAL9+jeEIgWuo+4c7K2RgnUFcqsgwBy7PMTBG6V2zHVvhBo9oTOgVQ04QvvgHVxjaydCLyKFL0m1G+cM18QYEMUWgvRpTBGy2mQwNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GR4+0i0p; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso19778695e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 04:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763469569; x=1764074369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vwrEerijLR8cEtR08TVeGqvxntRRCMtwXVUkvykKipc=;
        b=GR4+0i0pqTX7Z7vC3Bd+VRcYn50dTLS2s+mvZdzzQnLd3o7C1AvnRTIpIs0nQkdL1W
         JWonek3Ut3x0cfxq8y//0GrknfheYCwyK1ounOX+g1lBasmO137wSa0pEfhdPrghDwb2
         6PN5WMwnn0gy/KAvjZLQnwN5v7xvXnoK1GTHdFJi3Jyl0rbFlX94JU0SIDn/X/PVpX5L
         nlAF3fgOrGNqZy1fc0GGxOxepHVrMFhujnO2qj+L4xxjXsd8pDKUKnKAyknej7mAGHCX
         PHOs/EuAAk6djRRo79BcL+xxarpcvd8OaqMqFLgAg+ih4U01DqgMxbvGaixlICy/TsWX
         nZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763469569; x=1764074369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwrEerijLR8cEtR08TVeGqvxntRRCMtwXVUkvykKipc=;
        b=SirPeErMUKEfsr9WvNnHAh5X7a9lXX3BNW6cisZaKlZOb8YzgA3qFeCMSc1IFUHzDH
         W9/G+xxgAV+6IuyDHxwL38ey5E8b2DkmeyDOS6PqX1fwjXT5l7NCz0YKvHdi6fUaQvSB
         2rfG9SRked7nmCUiWp07eCXf4+LWEwkevYI7scIahLQpAoQFO9+a+k5KC25txe7yh7EH
         tngJADRjWgWTn565V/fiDF0+xfXhgNcwMXoYdIn9h/5WoY+HnRIW6aa6ZpQokNtjsxh4
         C5/18UNt3czJgvGgqo2niakODuu+PVVF2WmyuxSbEDMluJLQuNRI/0BgpkMPx1ixg+9d
         JA+A==
X-Forwarded-Encrypted: i=1; AJvYcCX1Gd5NS0CdUhkmS3HFlth1Rx+qksQbRK6zTifwfUl7JrMCubx8vyM2htVtZ+iRgC93gdPJIHRlJ/9BOkfsz0hwTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJLmUsn98g7RIoBhBPvNEY409+kLg3RINkN1SsxmSW+/ywz7de
	M/XWT63KtnwfaOflv/s2qRxVDyef3cqhuGFVn7vsOCDrDC5xhSOI+UYp
X-Gm-Gg: ASbGncu+c/E1cg5Fhw5G0IkEDhq+A1Mh4EQT3fOAgGxa0MMNx6hiO03icA5ENvyL0zd
	t4R2hY7n2zvdptZQxvT/Xv4NkJE1A0Shxb8kZFbtNEjLEXbkTqb4TtFHhdHSuO5Bvn5NDjhvoi5
	FM7m3XuThnbklI4TPuUxPacBn5r4vIMmlVKd1vWRLmnIll8ebGwyGKe7T4pLrpr5t0/Dlhj+XqE
	Amar5DDHpdBmjStyaIb3LavSlNtU97kBJtMnx4PgGKNZs3cB3XStFAUSDSl7q6x78nlb+q6KJei
	bsGpO1XDjnotdGPxBPLWhvuE6kD55pI3a1ayJC2eIp67lfDUloChLGvXEkhR6KZN2mPngN1TWjC
	MuXrzGVU7EvTurj2IszpnZS2rhNP5cQOquOrAeX5kC/rvW20mzwYjiQWpNnu7nmR4hDoKbie36g
	IXSz91g59xmtlLHvpuKIsghBcHbucK2OyW9+jqK9WSz9F6ZtRQNoMIVMLjyNG5GQ3zhM/LvzcCg
	KM6C1jhNTvcvcka
X-Google-Smtp-Source: AGHT+IEoYNWQzEZD7paWmkP6FwlKTYsbsMXIs34oAOoA8ChioIklj1ImVoN2jNXCXJsyM7m/ic/zHw==
X-Received: by 2002:a05:600c:a05:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-4778fe55465mr137719985e9.1.1763469569384;
        Tue, 18 Nov 2025 04:39:29 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm199431895e9.13.2025.11.18.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 04:39:29 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Tranh Ha <tranh.ha.xb@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] can: rcar_canfd: Fix CAN-FD mode as default
Date: Tue, 18 Nov 2025 12:39:25 +0000
Message-ID: <20251118123926.193445-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The commit 5cff263606a1 ("can: rcar_canfd: Fix controller mode setting")
has aligned with the flow mentioned in the hardware manual for all SoCs
except R-Car Gen3 and RZ/G2L SoCs. On R-Car Gen4 and RZ/G3E SoCs, due to
the wrong logic in the commit[1] sets the default mode to FD-Only mode
instead of CAN-FD mode.

This patch sets the CAN-FD mode as the default for all SoCs by dropping
the rcar_canfd_set_mode() as some SoC requires mode setting in global
reset mode, and the rest of the SoCs in channel reset mode and update the
rcar_canfd_reset_controller() to take care of these constraints. Moreover,
the RZ/G3E and R-Car Gen4 SoCs support 3 modes compared to 2 modes on the
R-Car Gen3. Use inverted logic in rcar_canfd_reset_controller() to
simplify the code later to support FD-only mode.

[1]
commit 45721c406dcf ("can: rcar_canfd: Add support for r8a779a0 SoC")

Fixes: 5cff263606a1 ("can: rcar_canfd: Fix controller mode setting")
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/can/rcar/rcar_canfd.c | 53 ++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 49ab65274b51..05dbdf46dd6f 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -709,6 +709,11 @@ static void rcar_canfd_set_bit_reg(void __iomem *addr, u32 val)
 	rcar_canfd_update(val, val, addr);
 }
 
+static void rcar_canfd_clear_bit_reg(void __iomem *addr, u32 val)
+{
+	rcar_canfd_update(val, 0, addr);
+}
+
 static void rcar_canfd_update_bit_reg(void __iomem *addr, u32 mask, u32 val)
 {
 	rcar_canfd_update(mask, val, addr);
@@ -755,25 +760,6 @@ static void rcar_canfd_set_rnc(struct rcar_canfd_global *gpriv, unsigned int ch,
 	rcar_canfd_set_bit(gpriv->base, RCANFD_GAFLCFG(w), rnc);
 }
 
-static void rcar_canfd_set_mode(struct rcar_canfd_global *gpriv)
-{
-	if (gpriv->info->ch_interface_mode) {
-		u32 ch, val = gpriv->fdmode ? RCANFD_GEN4_FDCFG_FDOE
-					    : RCANFD_GEN4_FDCFG_CLOE;
-
-		for_each_set_bit(ch, &gpriv->channels_mask,
-				 gpriv->info->max_channels)
-			rcar_canfd_set_bit_reg(&gpriv->fcbase[ch].cfdcfg, val);
-	} else {
-		if (gpriv->fdmode)
-			rcar_canfd_set_bit(gpriv->base, RCANFD_GRMCFG,
-					   RCANFD_GRMCFG_RCMC);
-		else
-			rcar_canfd_clear_bit(gpriv->base, RCANFD_GRMCFG,
-					     RCANFD_GRMCFG_RCMC);
-	}
-}
-
 static int rcar_canfd_reset_controller(struct rcar_canfd_global *gpriv)
 {
 	struct device *dev = &gpriv->pdev->dev;
@@ -806,6 +792,16 @@ static int rcar_canfd_reset_controller(struct rcar_canfd_global *gpriv)
 	/* Reset Global error flags */
 	rcar_canfd_write(gpriv->base, RCANFD_GERFL, 0x0);
 
+	/* Set the controller into appropriate mode */
+	if (!gpriv->info->ch_interface_mode) {
+		if (gpriv->fdmode)
+			rcar_canfd_set_bit(gpriv->base, RCANFD_GRMCFG,
+					   RCANFD_GRMCFG_RCMC);
+		else
+			rcar_canfd_clear_bit(gpriv->base, RCANFD_GRMCFG,
+					     RCANFD_GRMCFG_RCMC);
+	}
+
 	/* Transition all Channels to reset mode */
 	for_each_set_bit(ch, &gpriv->channels_mask, gpriv->info->max_channels) {
 		rcar_canfd_clear_bit(gpriv->base,
@@ -823,10 +819,23 @@ static int rcar_canfd_reset_controller(struct rcar_canfd_global *gpriv)
 			dev_dbg(dev, "channel %u reset failed\n", ch);
 			return err;
 		}
-	}
 
-	/* Set the controller into appropriate mode */
-	rcar_canfd_set_mode(gpriv);
+		/* Set the controller into appropriate mode */
+		if (gpriv->info->ch_interface_mode) {
+			/* Do not set CLOE and FDOE simultaneously */
+			if (!gpriv->fdmode) {
+				rcar_canfd_clear_bit_reg(&gpriv->fcbase[ch].cfdcfg,
+							 RCANFD_GEN4_FDCFG_FDOE);
+				rcar_canfd_set_bit_reg(&gpriv->fcbase[ch].cfdcfg,
+						       RCANFD_GEN4_FDCFG_CLOE);
+			} else {
+				rcar_canfd_clear_bit_reg(&gpriv->fcbase[ch].cfdcfg,
+							 RCANFD_GEN4_FDCFG_FDOE);
+				rcar_canfd_clear_bit_reg(&gpriv->fcbase[ch].cfdcfg,
+							 RCANFD_GEN4_FDCFG_CLOE);
+			}
+		}
+	}
 
 	return 0;
 }
-- 
2.43.0


