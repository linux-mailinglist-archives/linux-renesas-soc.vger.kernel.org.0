Return-Path: <linux-renesas-soc+bounces-26520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A58B7D0A9D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 15:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B963D301D7D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 14:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380CE35EDBE;
	Fri,  9 Jan 2026 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHVb+DEb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ED135E54D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767968587; cv=none; b=lDMwnIMWjBZHQwXAWbTxnR9ZAgi+3dMncmPpXrdWQSiByht59xx/zwi/jfcDhus838T/SuZSuoH/nBcvreP638sbFzdvlkbj8QzVOmqzmDx0xpOx5cRdL9P2FumLDHjlMcUIlNdmyv23SuEJwaIFgHFTXJw5iwzAzUl5dAxvcGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767968587; c=relaxed/simple;
	bh=IZX0GyFDL7t70J/Ljr/Ww9EPikfNIA5b00sjzTAqWpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghgp7RL2wY2RINToKnQODot/vDfno6TOzr48PyFWSIykw8BXnaW59wEVaYOb4yM++qorVCoCufL68+3ROHElwqpFdjI3MZ+XwES7vUvDSaPyYbHPtLLTWmH7iDWMVSkL5AGUoM2obBlmFftnHSdRevyVFkYiZMGM8eqO0pf5hdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHVb+DEb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso16173185e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 06:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767968583; x=1768573383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJuTI/pP3gTuIvrfb63LlTSw7eNSK1HBmiLz7uaNHpI=;
        b=JHVb+DEbPsUUdQ3cNFP1ezBmkMcT6jWEl5c/QP7+37dKQ8hLV1AF7H/rMwKWV/a9ZM
         UE9atsV6eVXjU32O0N5KgQbBxRrUx/lOxzruizKkgSzrjPbhMGu3kJ6KqKVOsi6o71vY
         fMytUL9+E5YHW45k1zUrlXIELR0/4bqFs/Z5maZsTsoO2p3naxAE0QSmnzf8RzfTOZSF
         d0M9uKdkmCH9Ni6dPYT6wUKoEdjsj7w8xaSqgeuWOulBayCuKXdVRa0P2WHVeHkSp1mY
         Ny0QXLdX/Ze74F9C6rnsY2vL7D+6CXBF5V/K8IGJtq84JZGf48ha6zWXoQI7QYtFL59G
         YcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767968583; x=1768573383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GJuTI/pP3gTuIvrfb63LlTSw7eNSK1HBmiLz7uaNHpI=;
        b=tsIhBF/1FwmDF5gHKPkWeTfIHkmSJu6To3yG/U5Me8aHULzJEAx8qtLuBHpFbhwQcQ
         xAZfVtPWtRBiczR9YVm1DVYXs6T9HxtIdmWkdcTgsjU2WG8xvVxW1ErxexXH5yu0Eh96
         mJN3W3oWT/X+29I5h5JaeiHWDB7kvy72IQlejIA5EXCNFlrS1eLVIV239i1dSRavlPHW
         +cxwXSVJcybB3zbj7unLTywAbz/BuQnmrsRuZ4zIXeKdFol85fzjn5UuBH0Kj6t8CRRx
         cDhca+ULVx1DtnhsjVXBWIaUQQipCn401rDL6aNjIhInXQN6NV34uLaL7X44UUp/e9ZE
         ZItQ==
X-Gm-Message-State: AOJu0YyOJ/wYB7emqYGTn3H1YswVi4APF4lX51jbhsp4Tr7dPKbXKjVF
	YwyphDbwqNpoXe4L3yJMObqcmHrXFkYflqTxBw0UesMkjGGTN/CHckw1
X-Gm-Gg: AY/fxX41UWnuw4I/y4FVMdoBUT2AjLE+GyqAh6y4o2B2T1Dl46cF8TMnekXZ4DkOY5C
	Ti/w4fSRm1hK3b8LZHgxsGHwBxYzfdjxev+9HMgCFiYRR1ZLnvUBtIEun03YG58+NXXoB6lVzDK
	P3EJ+PTqrp9jPCqryprmHRQOBkO0LRqgE8wi5rRTjXCy6vp7aRAZ4DjIjzBqJMoOEaM423b0x1B
	b2q0W5s8jGbD/ihy9KxhAjzP+D1cPx87x6LTtAZ/f6TWrlUm0+clpgqW7TE8pW/PKAzCkKYV9Ho
	e8S07S1RCLR9iXIdMAmQTcM0euoZq0tW6rBncwDaBkEhN765a92uv7O2aQ0z7uaBfKtoWl+WB6N
	IsPLBZVxX4imM4hySJUqqDdkUKwHS+QKT1zApIyppzJ2yoxKwwTuEuaPkbcZUb1tMWjVQRt0WKv
	RF+GI+hnejOb3B36fChxI4qwj5PP+pek7Vs7XdDATeOh+5ge3FOUFzstcpG9qTsW0l//40js8xj
	0YqRTpRXznrJC44h+xp0hM=
X-Google-Smtp-Source: AGHT+IHuqWKzRFHwggueYURnOwU1f6nLlo3Dx/aAg2AtNERz9s/rUtlR+rwtsB4ngafpJcpJ++sTBg==
X-Received: by 2002:a05:600c:3541:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d848787e3mr127679765e9.14.1767968583016;
        Fri, 09 Jan 2026 06:23:03 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3d06:ce2:401e:8cb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d871a1e11sm61448855e9.19.2026.01.09.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:23:02 -0800 (PST)
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
Subject: [PATCH net-next v2 2/2] net: pcs: rzn1-miic: Add support for PHY link active-level configuration
Date: Fri,  9 Jan 2026 14:22:50 +0000
Message-ID: <20260109142250.3313448-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109142250.3313448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260109142250.3313448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The accumulated configuration is stored during DT parsing and applied
later in `miic_probe()` after hardware initialization, since the MIIC
registers can only be modified safely once the hardware setup is complete.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 108 +++++++++++++++++++++++++++++++-
 1 file changed, 106 insertions(+), 2 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 885f17c32643..cc090f27e559 100644
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
+	miic->phylink.val = (miic->phylink.val & ~mask) | (val & mask);
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
2.52.0


