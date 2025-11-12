Return-Path: <linux-renesas-soc+bounces-24519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B27DC546E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 21:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAD754ECE2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 20:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E03A2D5946;
	Wed, 12 Nov 2025 20:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NL1G+iXM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE89D2BE655
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 20:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762978816; cv=none; b=iW/jBEepHSYlahXhHNMkmrU47ucVFPasdIQ36ssMkg8Bqo+gf5NbZQcmqtDJ+epCABUxPezUM++2ZGN0cznqkQNViWi7JPQudnhFPii6H5euOdkejQ72+XpI2Ju0ypGmaK0Yi5h6Kpyt2ladCSPhEwDby2UGVHWS0QO+ThiZNF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762978816; c=relaxed/simple;
	bh=FyeNLHzx9wEN/qXKtjmM5rgKnxBy7kQtIf7OGGTpnZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5JeQHYzF5BxKZSM8pq1SdcjOGOKuPZkQCWJ5vNVIEb6oZRd6FXF5Nbh5cSFc9S6rxKgTDeXlqB48F2M28V+q4XWG71rMvQIOZ/SEh58wSBCAlehZKTo7KreMQwXxsQ3RGcgXy4UxWMja/AWaRlwNUPi0GHYpOvemNnHZp/SllQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NL1G+iXM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7ade456b6abso21510b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 12:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762978813; x=1763583613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdhW6tk5d4e4tP2yeRNaTsh6HeUSuYd0/9wpH/jkddA=;
        b=NL1G+iXMw8XH9QrGdPtugZCuB86/Fy7BuH/6WDDeJOMaNxyIyvgXqME1E5RH8v0yZx
         tkP34H69aX0PaCvr90rg++1x/TPU0PY6pzt/PQ78nBDqkunURPaRz5R0RRs7Co7eUQv3
         vk4UARshpoKm27fCQKZ8okzTC5nDnHIY3SNck++s6o22dvxCcDKs+ZDr0OmVgrcgvzhd
         eqmev7nLFiDYMZxaFbK24wGG7oRf+ey3KxISZyP2+M9wChuzOeEwANjFjvkrFb9q7/2+
         h8+8Y/voOtyGslXCRd7HxpcfDmzdv1fJ4VP6AAHtXb5CyfZ1PXwvqWM1IVjQdxoSJ0Ax
         aeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762978813; x=1763583613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mdhW6tk5d4e4tP2yeRNaTsh6HeUSuYd0/9wpH/jkddA=;
        b=Zia2M51UbQoLn65kWenmLMcKQu1chfxV2YYwWE7EH+QCBCIeqaScv75wDaLiQL+qUz
         KuZQn/BPpGmru0t6tUfEAtmncjMBttDGOSOStYIryr9gZ5B48dTL5DLfTsx+HqfdZHmc
         HcPjkmq+gSxfCzvKcsB520vJtHjymy6HK7UBcLRKpt0l3zygZmiRyy+LLTTlcvSy439a
         lcKAea7nWe2gIsrJdrtAGHIxsTpwucn1kr9Gp9MEHDbEc/rq0YbIaspSckJ5WFq16vW/
         mhx3OAJtAP88Fn7iaOv7lfzWrhtrFSew2lqhtpZUCyQWbFq9MD1kkFR0eRP9p+ZQ/++l
         ds3Q==
X-Gm-Message-State: AOJu0YyComhct6HZMyrKs8YC1BnjvlPunzuGJ6PZDMp4dJDlEy9VWXxO
	GHzfokHbRzBtCvW9gjxs4TmTP+kBj6V+Z6LGoeyLNQQfwyOR++stD/pp
X-Gm-Gg: ASbGncu62KtA+YQSZ6oHULypQOKKJk2PG6PvWiXfDAiAf6sR3znRN/eNTUkq1v6HNHy
	e4nkt/zTYEtqpzATwpRxpXrfTFvnm4yJtwCsaCvPQzMl4kTr5JYWPIpB3rh5wrK7p7lAaidUkkc
	FdmzXiyAgE8xtd35AOyz7dF5ljKKLJhqoxhpw21LI9FmFDgaUfqIVoVbTy++Sr0H5KHeQoneSti
	DZ9fHdo/HcMsoBxH1XJ8sr33k8QTaYbzfqrNIT7cuJ1TxOTfbxJbaYTvJBM9P/E3jJBno12pdc6
	jiBWJjbeL6u2YPSb1dV7hcILVWGP8L74m1Y0tI0KVmKB4nBUUc7uP1StRIalvaLP5X33xEmqQ2g
	0iVGr6qwwGMDl/ZjLISKK+35dFv/hJcGRf7FxIpQVGjqvBkFy4dQjptjkh2SNOekAKHOZcxIdWZ
	BxWYuPI+SiRsIiUkwqDMIA4w==
X-Google-Smtp-Source: AGHT+IGuZmaA8bZsrtSJ31Pxg9MAJXLF6MUuXUKDHpV8hW9nvrdGY7K9Hzkg2UNWKBb1fiHttuFL/Q==
X-Received: by 2002:a17:903:3d07:b0:298:8a9:766a with SMTP id d9443c01a7336-2984eddeab4mr49609515ad.53.1762978813003;
        Wed, 12 Nov 2025 12:20:13 -0800 (PST)
Received: from iku.. ([2401:4900:1c07:5748:721b:a500:103e:1bad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2377e0sm261015ad.23.2025.11.12.12.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:20:12 -0800 (PST)
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
Subject: [PATCH net-next 2/2] net: pcs: rzn1-miic: Add support for PHY link active-level configuration
Date: Wed, 12 Nov 2025 20:19:37 +0000
Message-ID: <20251112201937.1336854-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support to configure the PHY link signal active level per converter
using the DT property "renesas,miic-phylink-active-low".

Introduce the MIIC_PHYLINK register definition and extend the MIIC driver
with a new `phylink` structure to store the mask and value for PHY link
configuration. Implement `miic_configure_phylink()` to determine the bit
position and polarity for each port based on the SoC type, such as RZ/N1
or RZ/T2H/N2H.

The accumulated configuration is stored during Device Tree parsing and
applied later in `miic_probe()` after hardware initialization, since the
MIIC registers can only be modified safely once the hardware setup is
complete.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 108 +++++++++++++++++++++++++++++++-
 1 file changed, 106 insertions(+), 2 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 885f17c32643..333467cf91a7 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -28,6 +28,8 @@
 
 #define MIIC_MODCTRL			0x8
 
+#define MIIC_PHYLINK			0x14
+
 #define MIIC_CONVCTRL(port)		(0x100 + (port) * 4)
 
 #define MIIC_CONVCTRL_CONV_SPEED	GENMASK(1, 0)
@@ -177,6 +179,16 @@ static const char * const rzt2h_reset_ids[] = {
 	"crst",
 };
 
+/**
+ * struct phylink - Phylink configuration
+ * @mask: Mask of phylink bits
+ * @val: Value of phylink bits
+ */
+struct phylink {
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
+ * @phylink: Phylink configuration
  */
 struct miic {
 	void __iomem *base;
@@ -191,6 +204,12 @@ struct miic {
 	spinlock_t lock;
 	struct reset_control_bulk_data rsts[MIIC_MAX_NUM_RSTS];
 	const struct miic_of_data *of_data;
+	struct phylink phylink;
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
@@ -581,10 +602,82 @@ static int miic_match_dt_conf(struct miic *miic, s8 *dt_val, u32 *mode_cfg)
 	return -EINVAL;
 }
 
+static void miic_configure_phylink(struct miic *miic, u32 conf,
+				   u32 port, bool active_low)
+{
+	bool polarity_active_high;
+	u32 mask, val;
+	int shift;
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
+	mask = BIT(port) << shift;
+
+	if (polarity_active_high)
+		val = (active_low ? 0 : BIT(port)) << shift;
+	else
+		val = (active_low ? BIT(port) : 0) << shift;
+
+	miic->phylink.mask |= mask;
+	miic->phylink.val  = (miic->phylink.val & ~mask) | (val & mask);
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
@@ -605,8 +698,15 @@ static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
 
 		/* Adjust for 0 based index */
 		port += !miic->of_data->miic_port_start;
-		if (of_property_read_u32(conv, "renesas,miic-input", &conf) == 0)
-			dt_val[port] = conf;
+		if (of_property_read_u32(conv, "renesas,miic-input", &conf))
+			continue;
+
+		dt_val[port] = conf;
+
+		active_low = of_property_read_bool(conv, "renesas,miic-phylink-active-low");
+
+		miic_configure_phylink(miic, conf, port - !miic->of_data->miic_port_start,
+				       active_low);
 	}
 
 	ret = miic_match_dt_conf(miic, dt_val, mode_cfg);
@@ -696,6 +796,8 @@ static int miic_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_runtime_pm;
 
+	miic_reg_rmw(miic, MIIC_PHYLINK, miic->phylink.mask, miic->phylink.val);
+
 	/* miic_create() relies on that fact that data are attached to the
 	 * platform device to determine if the driver is ready so this needs to
 	 * be the last thing to be done after everything is initialized
@@ -729,6 +831,7 @@ static struct miic_of_data rzn1_miic_of_data = {
 	.sw_mode_mask = GENMASK(4, 0),
 	.init_unlock_lock_regs = true,
 	.miic_write = miic_reg_writel_unlocked,
+	.type = MIIC_TYPE_RZN1,
 };
 
 static struct miic_of_data rzt2h_miic_of_data = {
@@ -745,6 +848,7 @@ static struct miic_of_data rzt2h_miic_of_data = {
 	.reset_ids = rzt2h_reset_ids,
 	.reset_count = ARRAY_SIZE(rzt2h_reset_ids),
 	.miic_write = miic_reg_writel_locked,
+	.type = MIIC_TYPE_RZT2H,
 };
 
 static const struct of_device_id miic_of_mtable[] = {
-- 
2.43.0


