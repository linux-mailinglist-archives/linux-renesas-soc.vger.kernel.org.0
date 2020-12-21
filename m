Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA0D2DFE4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 17:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgLUQ5x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:57:53 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:34540 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgLUQ5w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569700;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=VC12K20oCPtboVN3UULo2HLq1MZksh+JC7dhaOZoi+U=;
        b=nIyNAp/VGKJ0zrvLrmR5CSaa77OKIjvt6aEChtIOacrbVHYFmCG+iQtEEZLmhYCEpR
        0OrwceLyTmdQHEFkjNMLsMbm021HhH0yeGsYw2/nrLpL7HaGJD56ecHvzWR9Bx0KnJG3
        WGMHaWF3tYKZPaEBLm2p7fd2VzSYSNSa3/Jyn0tPII1S5JQGiXls4aOjLK64NMXQDUkB
        N0MczhlhT73HH0y6Z4c//IoDdRGhq5ygdX/pBcA2xxKy9Wi41bGfvDDnZLlVXobyzS3D
        SkaAiq0hrAOyd9ZD04Khk9ubs7qrwUdx6TG9ZQXs7Ckt0FED4E0nmRS+rQsF4Wq364wb
        +GMQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GJSdzTYQw=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.10.2 DYNA|AUTH)
        with ESMTPSA id j05b20wBLGss0KA
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:54:54 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 2/5] pinctrl: renesas: add I/O voltage level flag
Date:   Mon, 21 Dec 2020 17:54:45 +0100
Message-Id: <20201221165448.27312-3-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221165448.27312-1-uli+renesas@fpond.eu>
References: <20201221165448.27312-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds config macros describing the voltage levels available on
a pin. The current default (3.3V/1.8V) maps to zero to avoid having to
change existing PFC implementations.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/renesas/pinctrl.c | 16 ++++++++++++++--
 drivers/pinctrl/renesas/sh_pfc.h  |  9 +++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index ac542d278a38..85a182191d7d 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -634,6 +634,9 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 	}
 
 	case PIN_CONFIG_POWER_SOURCE: {
+		int idx = sh_pfc_get_pin_index(pfc, _pin);
+		const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
+		int lower_voltage;
 		u32 pocctrl, val;
 		int bit;
 
@@ -648,7 +651,10 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 		val = sh_pfc_read(pfc, pocctrl);
 		spin_unlock_irqrestore(&pfc->lock, flags);
 
-		arg = (val & BIT(bit)) ? 3300 : 1800;
+		lower_voltage = (pin->configs & SH_PFC_PIN_VOLTAGE_25_33) ?
+			2500 : 1800;
+
+		arg = (val & BIT(bit)) ? 3300 : lower_voltage;
 		break;
 	}
 
@@ -702,6 +708,9 @@ static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
 
 		case PIN_CONFIG_POWER_SOURCE: {
 			unsigned int mV = pinconf_to_config_argument(configs[i]);
+			int idx = sh_pfc_get_pin_index(pfc, _pin);
+			const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
+			int lower_voltage;
 			u32 pocctrl, val;
 			int bit;
 
@@ -712,7 +721,10 @@ static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
 			if (WARN(bit < 0, "invalid pin %#x", _pin))
 				return bit;
 
-			if (mV != 1800 && mV != 3300)
+			lower_voltage = (pin->configs & SH_PFC_PIN_VOLTAGE_25_33) ?
+				2500 : 1800;
+
+			if (mV != lower_voltage && mV != 3300)
 				return -EINVAL;
 
 			spin_lock_irqsave(&pfc->lock, flags);
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index dc484c13f59c..00bfda90a7b7 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -31,6 +31,15 @@ enum {
 					 SH_PFC_PIN_CFG_PULL_DOWN)
 #define SH_PFC_PIN_CFG_IO_VOLTAGE	(1 << 4)
 #define SH_PFC_PIN_CFG_DRIVE_STRENGTH	(1 << 5)
+
+#define SH_PFC_PIN_VOLTAGE_18_33	(0 << 6)
+#define SH_PFC_PIN_VOLTAGE_25_33	(1 << 6)
+
+#define SH_PFC_PIN_CFG_IO_VOLTAGE_18_33	(SH_PFC_PIN_CFG_IO_VOLTAGE | \
+					 SH_PFC_PIN_VOLTAGE_18_33)
+#define SH_PFC_PIN_CFG_IO_VOLTAGE_25_33	(SH_PFC_PIN_CFG_IO_VOLTAGE | \
+					 SH_PFC_PIN_VOLTAGE_25_33)
+
 #define SH_PFC_PIN_CFG_NO_GPIO		(1 << 31)
 
 struct sh_pfc_pin {
-- 
2.20.1

