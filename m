Return-Path: <linux-renesas-soc+bounces-26619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE4D146A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 18:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CFA7301174E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 17:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE1737E31A;
	Mon, 12 Jan 2026 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2/CRee0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A941C37E303
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 17:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239370; cv=none; b=QfKwhaJl7L09+CJLozAbZ5M8ZR+V1LOrpQLDZCVMxBKZUtiy1G6zCNoyFyhigRSiNu1swg1s7Hx6sABOhYN3Q2iAuMw5MtvI082wW9KvJ4U/HQmVHpTGi64lW8jbw3I4hKiMaNNRfVz/0UeZukhW9T+Kro9KmzIBD8N6luSayAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239370; c=relaxed/simple;
	bh=GCdO5a+HMfjS0Onb4iX2dcKWJm/SM5/aDLNSivt+rZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3WucaAa45n16qHbI/fSHogsrIt4sgbs7YgtsKvA5MNWbaJjgJye5/wieDEbECEJVm7JC3LHZI95yt/sSsXZDxbcrjEy/YemAUE11FALM5qFOv0/UGPqh2l46XWRYdYKGkGYa7h90OBG1GxYolbYmoXZp0OZJRph9XUZjHSmZbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2/CRee0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbc3056afso3838442f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 09:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239366; x=1768844166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuk52pHE2ucr51aG3tpUoDcttX6aTJw3OWzP3ZmFW2E=;
        b=H2/CRee0//rGPYg0l1zmRr7B+722QUuuMKv92yP2gmELT0GHa8y0AorCZVvDDfMMl5
         VVod1fNSHqTcetc4SehLAHpe7Yg8Ykj4tIgaZ/01MPtd41ptcqFS9A7cTtMbfjAp5+Wz
         GBLWx6tHYBvuGc84oL3pqgXWLqiiBcxUqhJYyL51qnjuKfDFjZdPKvzlf+RmmNhTNYRe
         H+kyiohngHx8+UwJ3ICkHQuX/cwsQ9dUETgTP8LkGnIZPjV52/M5Vyv1S0bGJoOxntCk
         il1IyCt5gbYw3OsizN0ize6bEE80kfcUruHiMAI/UfNuVKTUM/rTBsS33BIu5ndA9zu/
         O4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239366; x=1768844166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tuk52pHE2ucr51aG3tpUoDcttX6aTJw3OWzP3ZmFW2E=;
        b=ln9cRiuQKw4tlPHvn1hxFuNPLxg3o3eEl+5RyfanuopS+zxjOMGnUYk42QsONtv7N6
         TlVqdi7cvkU0geNpkIYYCMT2fjoIOPYVoMjsFfSFBZ4JD0hVq3EwenrUlIo17JyeUHFE
         AYv1XjEx+/H0C2qr5hMNAz2N7qEue8tkZl61HpjUD0Y4xI+DYENaFGnptSpwtXrOlehR
         e3DCo4Yts39mBDC9MISckh+E6Chz/7ZOIkJ9RMq6CotfcIPqfSvI297x7NowG29h2wqq
         jV/xOYcw9HK8YyMrsSJu0fF8GU73oBf2dTzgJyXUbn3Bsv7yuIDBDZAA/tYay908sW79
         rtkg==
X-Gm-Message-State: AOJu0YwPkA/EzUUihNhxQI3yRWhXouJI5AfvPlT1nzMxuZXwGZMSaRMi
	j97LuRyDb7P2CvlnH53j8JiYHnLXw/y4wNvad94JUBmiyrDtUG8SqCur
X-Gm-Gg: AY/fxX64xz1rJjgQSgGyks+5zMAHtAdIkYMnwV3efzPsGAEOLKAVSrLpuz8TXwIPKlT
	msH2YctVfV1LbzofE6haMYD2alh3Z9QogFZ8G3sxfk8ocJfixQWgv3OOVvQeQaN+K5pFNY8qRbp
	K2nhVwPJqjFvbzKlsfdGMaBkzoH6J/tUsPcJnalKE0QVRs95yAycmlAY8ZDfaMbvCSt07MEtdwk
	zGrgEfpZ/kqaybLlYSDDDu3UCnExuyuNWzPOjiNz3DBPJBrw8XrHc2J7T5EvAxggJe1uju/PZy/
	+lx19KNCJd1VGi0hlJ7FeXm/vwzfMn0tDOsE+wt+Lzt/eYI5c26lOE/myQYN2u35XcrMb8VeNBL
	Wcxo5YayjbYklU4QhdOMQWvHQcErEddlbzktVdq1ePNOEJmdJySyIdEHSEhKnmeidU4M5p4swBY
	tfawbsaJiRUb4yx9Z0oxZEmu5pNTN0MQYb2SnQAiVDIG4xBWU+xkJoF0B/XBYMfXFxl+Y+d/GNq
	44tmKqMnqtq7RZqlUpwEFu6RASlyS901lA=
X-Google-Smtp-Source: AGHT+IHvetCOikt5zHJa+kt1XGT/CFTzAu/3wOZte9eNFcIcwZdd0nfXB3SqwzR7iSvrVRxboWe4ZQ==
X-Received: by 2002:a05:6000:2087:b0:430:f8b3:e834 with SMTP id ffacd0b85a97d-432c3629b4amr24163355f8f.11.1768239366073;
        Mon, 12 Jan 2026 09:36:06 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9336:b2a5:a8c1:722e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm39625403f8f.42.2026.01.12.09.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:36:05 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 2/2] net: pcs: rzn1-miic: Add PHY_LINK active-level configuration support
Date: Mon, 12 Jan 2026 17:35:55 +0000
Message-ID: <20260112173555.1166714-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112173555.1166714-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260112173555.1166714-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support to configure the active level of MIIC PHY_LINK status signals
on a per-converter basis using a DT property.

MIIC provides dedicated PHY_LINK signals that indicate EtherPHY link-up and
link-down status in hardware. These signals are required regardless of
whether GMAC or ETHSW is used. With GMAC, link state is retrieved via
MDC/MDIO and handled in software, while ETHSW relies on PHY_LINK pins for
both CPU-assisted operation and switch-only data paths that do not involve
the host.

Hardware PHY_LINK signals are also critical for fast reaction to link-down
events, for example when running redundancy protocols such as Device Level
Ring (DLR), where rapid detection of cable faults is required to switch to
an alternate path without software latency.

Parse the requested polarity from DT, accumulate the configuration during
probing, and apply it to the MIIC_PHY_LINK register once hardware
initialization is complete, when the registers can be safely modified.
Handle SoC-specific bit layout differences between RZ/N1 and RZ/T2H/N2H
within the driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Updated commit message
- Renamed DT property from renesas,miic-phylink-active-low to
  renesas,miic-phy-link-active-low.
- Simplified the PHY_LINK configuration parsing logic in the driver
  as suggested.

v1->v2:
- No changes.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 105 +++++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 885f17c32643..8d7f82c1df2f 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -28,6 +28,8 @@
 
 #define MIIC_MODCTRL			0x8
 
+#define MIIC_PHY_LINK			0x14
+
 #define MIIC_CONVCTRL(port)		(0x100 + (port) * 4)
 
 #define MIIC_CONVCTRL_CONV_SPEED	GENMASK(1, 0)
@@ -177,6 +179,16 @@ static const char * const rzt2h_reset_ids[] = {
 	"crst",
 };
 
+/**
+ * struct miic_phy_link_cfg - MIIC PHY_LINK configuration
+ * @mask: Mask of phy_link bits
+ * @val: Value of phy_link bits
+ */
+struct miic_phy_link_cfg {
+	u32 mask;
+	u32 val;
+};
+
 /**
  * struct miic - MII converter structure
  * @base: base address of the MII converter
@@ -184,6 +196,7 @@ static const char * const rzt2h_reset_ids[] = {
  * @lock: Lock used for read-modify-write access
  * @rsts: Reset controls for the MII converter
  * @of_data: Pointer to OF data
+ * @link_cfg: MIIC PHY_LINK configuration
  */
 struct miic {
 	void __iomem *base;
@@ -191,6 +204,12 @@ struct miic {
 	spinlock_t lock;
 	struct reset_control_bulk_data rsts[MIIC_MAX_NUM_RSTS];
 	const struct miic_of_data *of_data;
+	struct miic_phy_link_cfg link_cfg;
+};
+
+enum miic_type {
+	MIIC_TYPE_RZN1,
+	MIIC_TYPE_RZT2H,
 };
 
 /**
@@ -210,6 +229,7 @@ struct miic {
  * @init_unlock_lock_regs: Flag to indicate if registers need to be unlocked
  *  before access.
  * @miic_write: Function pointer to write a value to a MIIC register
+ * @type: Type of MIIC
  */
 struct miic_of_data {
 	struct modctrl_match *match_table;
@@ -226,6 +246,7 @@ struct miic_of_data {
 	u8 reset_count;
 	bool init_unlock_lock_regs;
 	void (*miic_write)(struct miic *miic, int offset, u32 value);
+	enum miic_type type;
 };
 
 /**
@@ -581,10 +602,79 @@ static int miic_match_dt_conf(struct miic *miic, s8 *dt_val, u32 *mode_cfg)
 	return -EINVAL;
 }
 
+static void miic_configure_phy_link(struct miic *miic, u32 conf,
+				    u32 port, bool active_low)
+{
+	bool polarity_active_high;
+	u32 mask, shift;
+
+	/* determine shift and polarity for this conf */
+	if (miic->of_data->type == MIIC_TYPE_RZN1) {
+		switch (conf) {
+		/* switch ports => bits [3:0] (shift 0), active when low */
+		case MIIC_SWITCH_PORTA:
+		case MIIC_SWITCH_PORTB:
+		case MIIC_SWITCH_PORTC:
+		case MIIC_SWITCH_PORTD:
+			shift = 0;
+			polarity_active_high = false;
+			break;
+
+		/* EtherCAT ports => bits [7:4] (shift 4), active when high */
+		case MIIC_ETHERCAT_PORTA:
+		case MIIC_ETHERCAT_PORTB:
+		case MIIC_ETHERCAT_PORTC:
+			shift = 4;
+			polarity_active_high = true;
+			break;
+
+		/* Sercos ports => bits [11:8] (shift 8), active when high */
+		case MIIC_SERCOS_PORTA:
+		case MIIC_SERCOS_PORTB:
+			shift = 8;
+			polarity_active_high = true;
+			break;
+
+		default:
+			return;
+		}
+	} else {
+		switch (conf) {
+		/* ETHSW ports => bits [3:0] (shift 0), active when low */
+		case ETHSS_ETHSW_PORT0:
+		case ETHSS_ETHSW_PORT1:
+		case ETHSS_ETHSW_PORT2:
+			shift = 0;
+			polarity_active_high = false;
+			break;
+
+		/* ESC ports => bits [7:4] (shift 4), active when high */
+		case ETHSS_ESC_PORT0:
+		case ETHSS_ESC_PORT1:
+		case ETHSS_ESC_PORT2:
+			shift = 4;
+			polarity_active_high = true;
+			break;
+
+		default:
+			return;
+		}
+	}
+
+	mask = BIT(port + shift);
+
+	miic->link_cfg.mask |= mask;
+	if (polarity_active_high != active_low)
+		miic->link_cfg.val |= mask;
+	else
+		miic->link_cfg.val &= ~mask;
+}
+
 static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
 {
 	struct device_node *np = miic->dev->of_node;
 	struct device_node *conv;
+	bool active_low;
 	int port, ret;
 	s8 *dt_val;
 	u32 conf;
@@ -603,10 +693,15 @@ static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
 		if (of_property_read_u32(conv, "reg", &port))
 			continue;
 
+		if (of_property_read_u32(conv, "renesas,miic-input", &conf))
+			continue;
+
 		/* Adjust for 0 based index */
-		port += !miic->of_data->miic_port_start;
-		if (of_property_read_u32(conv, "renesas,miic-input", &conf) == 0)
-			dt_val[port] = conf;
+		dt_val[port + !miic->of_data->miic_port_start] = conf;
+
+		active_low = of_property_read_bool(conv, "renesas,miic-phy-link-active-low");
+
+		miic_configure_phy_link(miic, conf, port, active_low);
 	}
 
 	ret = miic_match_dt_conf(miic, dt_val, mode_cfg);
@@ -696,6 +791,8 @@ static int miic_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_runtime_pm;
 
+	miic_reg_rmw(miic, MIIC_PHY_LINK, miic->link_cfg.mask, miic->link_cfg.val);
+
 	/* miic_create() relies on that fact that data are attached to the
 	 * platform device to determine if the driver is ready so this needs to
 	 * be the last thing to be done after everything is initialized
@@ -729,6 +826,7 @@ static struct miic_of_data rzn1_miic_of_data = {
 	.sw_mode_mask = GENMASK(4, 0),
 	.init_unlock_lock_regs = true,
 	.miic_write = miic_reg_writel_unlocked,
+	.type = MIIC_TYPE_RZN1,
 };
 
 static struct miic_of_data rzt2h_miic_of_data = {
@@ -745,6 +843,7 @@ static struct miic_of_data rzt2h_miic_of_data = {
 	.reset_ids = rzt2h_reset_ids,
 	.reset_count = ARRAY_SIZE(rzt2h_reset_ids),
 	.miic_write = miic_reg_writel_locked,
+	.type = MIIC_TYPE_RZT2H,
 };
 
 static const struct of_device_id miic_of_mtable[] = {
-- 
2.52.0


