Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 615512F3669
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390853AbhALRCY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:24 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:15837 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391023AbhALRCY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470772;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=Ipl1zXdmfWk2AGzexV8bCsvnOeq8eaHutxFwFer6NvQ=;
        b=hx3KUS/PPbbTZfUd3ukerm8wkl4cYb01A3hmIPbUXG6Whafy2udYY5BTS2Mgg/BUu4
        PgJwTVPxQwl73C4seBjlTZwm7EkmtdnwDLG4brFz2rT+GbvD5p9D444hOVHxi5WwJAtm
        mzbcoRUTebsNJj1as2QD29AI2+It9+Li7r2JBhnW+++nNfi77C/PZIr9fF1OvKgs+r21
        TmI4u1mWoHsn0Ez9xd+9go6f2GzVpbOez3cHfgvo/8sJQPxpjfLcBYuhHeST3eciXtWY
        9tMKqzLc8kiODZ/KXbBTcI6Ybagu/gIi/rt/5VpwPB+fqsxtSXEH2Sv4Sn03LDHGxsUi
        2Utg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxONUF
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:24 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 2/6] pinctrl: renesas: add I/O voltage level flag
Date:   Tue, 12 Jan 2021 17:59:08 +0100
Message-Id: <20210112165912.30876-3-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165912.30876-1-uli+renesas@fpond.eu>
References: <20210112165912.30876-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds config macros describing the voltage levels available on
a pin. The current default (3.3V/1.8V) maps to zero to avoid having to
change existing PFC implementations.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/renesas/pinctrl.c | 16 ++++++++++++++--
 drivers/pinctrl/renesas/sh_pfc.h  |  9 +++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index ac542d278a38..f0f2b393a554 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -634,6 +634,9 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 	}
 
 	case PIN_CONFIG_POWER_SOURCE: {
+		int idx = sh_pfc_get_pin_index(pfc, _pin);
+		const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
+		unsigned int lower_voltage;
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
index 1404bd897d25..9787dc893a33 100644
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

