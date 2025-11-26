Return-Path: <linux-renesas-soc+bounces-25209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61201C8AB01
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 16:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CA7AF3456BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 15:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9C633A6FD;
	Wed, 26 Nov 2025 15:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akl0Q1w6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A943033A01A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171370; cv=none; b=VioMaQ1DAMEOC1BkcSHvriIxPRVWm43EnEZ677/T4FGnyKiQGJFpnbLquyeO4x+zIQ4Yhppk9N+Zz9IB8CykGA9UaLkDrIuWslw4FdCn2nNShDEYn1MHUWMeiEunuhU9W5dCLKsuYizoaCONnn/vvF9BlI1WLdXaVtYoCC5aMI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171370; c=relaxed/simple;
	bh=dO7L6iokZPFvGgnL1lgelPNYk38TYJe3rYcYdWOJpmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lV4SVsvDpl2uHjBNVtyKNffIUbMwxjrf8mvCEybkAjr7NbCqwH6w4XC37LKppiRdndaTgQIZojqekp0mvPB0AUHJdKIcwnfhb6Yadv35K5q5XQ4jN36MmPQVzo4IiJvR3LLj+XmV1aPlHHsgf1coBcMkmLhpTixV+PJWbx0I90g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akl0Q1w6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47789cd2083so40581065e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 07:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764171367; x=1764776167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ol4QUkXBKn9N338vzVa00ZQN1iku5KGXrDwgFZIEYI=;
        b=akl0Q1w6VKLvgmC/llnv8oKXfWEnoN08n+EQp9tpm9sYa91/nqHADdlS+PQKz83lY0
         1Oy38iLhv5nahbmgUIkfOnmdSv+9n/PndOPDp4kEuAPzhEyj2M6Pk4hcLRi5Uas9kQkm
         MoGBAGyOjDiWSukm4yjC3IF67rcVp7c1H569whceMa+gE4/o9J9eySAQPTsa1LNagN25
         PkL8plQ2kkoflotjoNZHv5O6eJA4PqhzAITQ7aKu4UuNHbhpso/GIzlalgKdXbDXtYvE
         ijdDpfJZR28PPXRVh/c7Owo/wcWo+4Hp5lp7RXCEsj13RDTPwZhN7OqJI0fYEI89OzSN
         XseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171367; x=1764776167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Ol4QUkXBKn9N338vzVa00ZQN1iku5KGXrDwgFZIEYI=;
        b=UnOAXLgkPISRLPcPm9vONHpXzlhHX0ICoTGdJZM5vUl7M1PA8adMnJXx6XKP3UhAja
         kfSWCWiQ29huHWpTgdGWTxzQb6FVCgEuBClerG8DakvlOUITVeoxDeEu3Ca/S7EqYRdA
         kyITW5BwhIcxrVW7WV658bZ43LhEwNVvt8V9CbTQEOXHWNtalkj4nxtg33spB5Go4lMK
         vXC0hWaHLG0T3CVpupi8IrkHeB8Cckt9aMUX0xkKtKMuvESlCxfuvoGO8CrIcvlaKpbV
         m7UYoNtrZRIn7IAIv9PjxPA3OqYvQJ2ui1DiiT9huOqGa9xOHMwins/mkCmOIg4Ck+68
         xVEA==
X-Forwarded-Encrypted: i=1; AJvYcCVSmajR58Yr6KAJLjGFLrMsQV/9ssQOe3gNjbHdeoZfyfqkZRG77LbRSCCeRKAejffqCJMIem9glonN13+0mNZfkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybtOO8EJxugzHwtTDTs3uSatI8LfkFrZt+H5n2cVmerCIQpklx
	WZXa/DflbcgbKoStvcSqeRCXXGBfmThU6nfdxDKjD/9IGaNs8djmYlXS90cusw==
X-Gm-Gg: ASbGncss4iEo5c7KGHhjMN5cZyQwGdjmMYv81M0hNBIeKKxYplWiYCfQ5UVg32gJUVg
	JuQNccQiq34+9hgDJih7wYjYbEbbsUMYYEYZULjTqLO0FgRvG8zYq8HvJKVKFhrWqEnybjYv6qE
	v35FTBMEDh4K0Wz0Uiawu1s6UPqcvdraishNUBzA2NKrGnVgOse+1YUvvL5ZLXxiookwun5xd0q
	n+aiDyxkr5GpoLCUQa3UVQgPO+6+q7wot/VvTBCp2b0EXlqJtPQHpkBW30CZA74BpWsQZbVK6Zb
	QYfTUpXGI0TWQftmIscBQP2dLULF+4xMd7pg4nHx92Ps+GWXmIkIdxcUm92XqE3bPPnYuiiGd/A
	85mb7TP/6kpBOLRigmJYR0XErKNdGLHY7NjSYSC9b1U9omr/RppF1shONbCN9DxxjOgyW3FA6t4
	O3Fxkai35Tf/YuIdln00srmBJnBFpFRr+Da/S20UwHMWapz6OT046xL9qb2flxN+5wR9eLKFU=
X-Google-Smtp-Source: AGHT+IG3acN07D2P+XIE+3m8JXiw8J2r9Q3rvdPGCp7S4Lu5fn229vc3IatKPYyUdoKZa9jsG1KHHA==
X-Received: by 2002:a05:600c:19ce:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-477c115dfaamr177037775e9.33.1764171366796;
        Wed, 26 Nov 2025 07:36:06 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm41223775f8f.2.2025.11.26.07.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:36:06 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 2/2] can: rcar_canfd: Add support for FD-Only mode
Date: Wed, 26 Nov 2025 15:35:58 +0000
Message-ID: <20251126153603.312265-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126153603.312265-1-biju.das.jz@bp.renesas.com>
References: <20251126153603.312265-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/{G2L,G3E} and R-Car Gen4 SoCs support additional CAN FD mode called
FD-only mode. In this mode, communication in Classical CAN frame format is
disabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Dropped has_fd_only_mode variable from the struct rcar_canfd_hw_info
   as it is checked by the dt schema validation.
---
 drivers/net/can/rcar/rcar_canfd.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 7895e1fdea1c..4a653d8978ba 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -472,6 +472,7 @@ struct rcar_canfd_global {
 	unsigned long channels_mask;	/* Enabled channels mask */
 	bool extclk;			/* CANFD or Ext clock */
 	bool fdmode;			/* CAN FD or Classical CAN only mode */
+	bool fd_only_mode;		/* FD-Only mode for CAN-FD */
 	struct reset_control *rstc1;
 	struct reset_control *rstc2;
 	const struct rcar_canfd_hw_info *info;
@@ -829,12 +830,20 @@ static int rcar_canfd_reset_controller(struct rcar_canfd_global *gpriv)
 							 RCANFD_GEN4_FDCFG_FDOE);
 				rcar_canfd_set_bit_reg(&gpriv->fcbase[ch].cfdcfg,
 						       RCANFD_GEN4_FDCFG_CLOE);
+			} else if (gpriv->fd_only_mode) {
+				rcar_canfd_clear_bit_reg(&gpriv->fcbase[ch].cfdcfg,
+							 RCANFD_GEN4_FDCFG_CLOE);
+				rcar_canfd_set_bit_reg(&gpriv->fcbase[ch].cfdcfg,
+						       RCANFD_GEN4_FDCFG_FDOE);
 			} else {
 				rcar_canfd_clear_bit_reg(&gpriv->fcbase[ch].cfdcfg,
 							 RCANFD_GEN4_FDCFG_FDOE);
 				rcar_canfd_clear_bit_reg(&gpriv->fcbase[ch].cfdcfg,
 							 RCANFD_GEN4_FDCFG_CLOE);
 			}
+		} else if (gpriv->fd_only_mode) {
+			rcar_canfd_set_bit_reg(&gpriv->fcbase[ch].cfdcfg,
+					       RCANFD_GEN4_FDCFG_FDOE);
 		}
 	}
 
@@ -2140,6 +2149,9 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	gpriv->fdmode = fdmode;
 	gpriv->info = info;
 
+	if (of_property_read_bool(dev->of_node, "renesas,fd-only"))
+		gpriv->fd_only_mode = true; /* FD-Only mode for CAN-FD */
+
 	gpriv->rstc1 = devm_reset_control_get_optional_exclusive(dev, "rstp_n");
 	if (IS_ERR(gpriv->rstc1))
 		return dev_err_probe(dev, PTR_ERR(gpriv->rstc1),
@@ -2239,7 +2251,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, gpriv);
 	dev_info(dev, "global operational state (%s clk, %s mode)\n",
 		 gpriv->extclk ? "ext" : "canfd",
-		 gpriv->fdmode ? "fd" : "classical");
+		 gpriv->fdmode ? (gpriv->fd_only_mode ? "fd-only" : "fd") : "classical");
 	return 0;
 
 fail_channel:
-- 
2.43.0


