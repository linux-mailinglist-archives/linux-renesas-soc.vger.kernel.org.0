Return-Path: <linux-renesas-soc+bounces-14101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88327A54F0C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 16:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 133D116367B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0AC21C9F8;
	Thu,  6 Mar 2025 15:26:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE3020E700;
	Thu,  6 Mar 2025 15:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274796; cv=none; b=RqVwin1xsNpOo+n5j4P2/zoSwA6kmn8VErE681zfKP+FNYXO7hKLT963jO2FuQaOg0ysjKS6j8pr8z8qCxzwOLBlIn1Vcs/x1TyD2kfaemQv0Kbz44WmP91cXnNWd3PBZK7kMZAM83zkAxiZ46BrG2T+35/7o8EKUfp2AZaDvFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274796; c=relaxed/simple;
	bh=s18q+Pc31Q6ftDhyOfg0aBWMy27a69oWlNJP6Pvcne0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=najJfdpHFOoDie/sAxNcFzZN4VInnfTgfYLTJi8DZwlX/glfxPQJwK03wgMFudiiyA3QtMxsppWtvNFdQViPN/nw8j0R/9eme6rRY4QUDyCgPW/Ci0vmgl1gYXRIFburTigtUUxVJhP9npIHrtQxSG1rsDowofa9DRGmKrz00hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: GzUy20AjRQeX061D6PP2HA==
X-CSE-MsgGUID: WXHGJxQfTnK/AotX0ei+Lg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Mar 2025 00:26:33 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 49BEE400091E;
	Fri,  7 Mar 2025 00:26:30 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 09/13] serial: sh-sci: Introduced sci_of_data
Date: Thu,  6 Mar 2025 16:24:43 +0100
Message-ID: <20250306152451.2356762-10-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The aim here is to provide an easier support to more different SCI
controllers, like the RZ/T2H one.

The existing .data field of_sci_match is changed to a structure containing
all what that can be statically initialized, and avoid a call to
'sci_probe_regmap', in both 'sci_init_single', and 'early_console_setup'.

'sci_probe_regmap' is now assumed to be called in the only case where the
device description is from a board file instead of a dts.

In this way, there is no need to patch 'sci_probe_regmap' for adding new
SCI type, and also, the specific sci_port_params for a new SCI type can be
provided by an external file.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v3->v4:
   - Fix the bot compilation error on superh in sci_probe_earlyprink()
---
 drivers/tty/serial/sh-sci-common.h |  10 +-
 drivers/tty/serial/sh-sci.c        | 164 +++++++++++++++++++++--------
 2 files changed, 131 insertions(+), 43 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 3ea116033d53..16b41da4afd9 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -89,6 +89,14 @@ struct sci_port_ops {
 	size_t (*suspend_regs_size)(void);
 };
 
+struct sci_of_data {
+	const struct sci_port_params *params;
+	const struct uart_ops *uart_ops;
+	const struct sci_port_ops *ops;
+	unsigned short regtype;
+	unsigned short type;
+};
+
 struct sci_port {
 	struct uart_port	port;
 
@@ -152,7 +160,7 @@ int sci_startup(struct uart_port *port);
 #define max_sr(_port)		fls((_port)->sampling_rate_mask)
 
 #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
-int __init scix_early_console_setup(struct earlycon_device *device, int);
+int __init scix_early_console_setup(struct earlycon_device *device, const struct sci_of_data *data);
 #endif
 
 #endif /* __SH_SCI_COMMON_H__ */
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4e82055a41c8..a8e7f739c4ec 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2996,10 +2996,13 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 }
 
 static const struct sci_port_params *
-sci_probe_regmap(const struct plat_sci_port *cfg)
+sci_probe_regmap(const struct plat_sci_port *cfg, struct sci_port *sci_port)
 {
 	unsigned int regtype;
 
+	sci_port->ops = &sci_port_ops;
+	sci_port->port.ops = &sci_uart_ops;
+
 	if (cfg->regtype != SCIx_PROBE_REGTYPE)
 		return &sci_port_params[cfg->regtype];
 
@@ -3046,9 +3049,7 @@ static int sci_init_single(struct platform_device *dev,
 	int ret;
 
 	sci_port->cfg	= p;
-	sci_port->ops	= &sci_port_ops;
 
-	port->ops	= &sci_uart_ops;
 	port->iotype	= UPIO_MEM;
 	port->line	= index;
 	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_SH_SCI_CONSOLE);
@@ -3088,10 +3089,6 @@ static int sci_init_single(struct platform_device *dev,
 		for (i = 1; i < ARRAY_SIZE(sci_port->irqs); i++)
 			sci_port->irqs[i] = sci_port->irqs[0];
 
-	sci_port->params = sci_probe_regmap(p);
-	if (unlikely(sci_port->params == NULL))
-		return -EINVAL;
-
 	switch (p->type) {
 	case PORT_SCIFB:
 		sci_port->rx_trigger = 48;
@@ -3277,13 +3274,18 @@ static struct console early_serial_console = {
 static int sci_probe_earlyprintk(struct platform_device *pdev)
 {
 	const struct plat_sci_port *cfg = dev_get_platdata(&pdev->dev);
+	struct sci_port *sp = &sci_ports[pdev->id];
 
 	if (early_serial_console.data)
 		return -EEXIST;
 
 	early_serial_console.index = pdev->id;
 
-	sci_init_single(pdev, &sci_ports[pdev->id], pdev->id, cfg, true);
+	sp->params = sci_probe_regmap(cfg, sp);
+	if (!sp->params)
+		return -ENODEV;
+
+	sci_init_single(pdev, sp, pdev->id, cfg, true);
 
 	if (!strstr(early_serial_buf, "keep"))
 		early_serial_console.flags |= CON_BOOT;
@@ -3332,58 +3334,126 @@ static void sci_remove(struct platform_device *dev)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 }
 
-#define SCI_OF_DATA(type, regtype)	(void *)((type) << 16 | (regtype))
-#define SCI_OF_TYPE(data)		((unsigned long)(data) >> 16)
-#define SCI_OF_REGTYPE(data)		((unsigned long)(data) & 0xffff)
+static const struct sci_of_data of_sci_scif_sh2 = {
+	.type = PORT_SCIF,
+	.regtype = SCIx_SH2_SCIF_FIFODATA_REGTYPE,
+	.ops = &sci_port_ops,
+	.uart_ops = &sci_uart_ops,
+	.params = &sci_port_params[SCIx_SH2_SCIF_FIFODATA_REGTYPE],
+};
+
+static const struct sci_of_data of_sci_scif_rz_scifa = {
+	.type = PORT_SCIF,
+	.regtype = SCIx_RZ_SCIFA_REGTYPE,
+	.ops = &sci_port_ops,
+	.uart_ops = &sci_uart_ops,
+	.params = &sci_port_params[SCIx_RZ_SCIFA_REGTYPE],
+};
+
+static const struct sci_of_data of_sci_scif_rzv2h = {
+	.type = PORT_SCIF,
+	.regtype = SCIx_RZV2H_SCIF_REGTYPE,
+	.ops = &sci_port_ops,
+	.uart_ops = &sci_uart_ops,
+	.params = &sci_port_params[SCIx_RZV2H_SCIF_REGTYPE],
+};
+
+static const struct sci_of_data of_sci_rcar_scif = {
+	.type = PORT_SCIF,
+	.regtype = SCIx_SH4_SCIF_BRG_REGTYPE,
+	.ops = &sci_port_ops,
+	.uart_ops = &sci_uart_ops,
+	.params = &sci_port_params[SCIx_SH4_SCIF_BRG_REGTYPE],
+};
+
+static const struct sci_of_data of_sci_scif_sh4 = {
+	.type = PORT_SCIF,
+	.regtype = SCIx_SH4_SCIF_REGTYPE,
+	.ops = &sci_port_ops,
+	.uart_ops = &sci_uart_ops,
+	.params = &sci_port_params[SCIx_SH4_SCIF_REGTYPE],
+};
+
+static const struct sci_of_data of_sci_scifa = {
+	.type = PORT_SCIFA,
+	.regtype = SCIx_SCIFA_REGTYPE,
+	.ops = &sci_port_ops,
+	.uart_ops = &sci_uart_ops,
+	.params = &sci_port_params[SCIx_SCIFA_REGTYPE],
+};
+
+static const struct sci_of_data of_sci_scifb = {
+	.type = PORT_SCIFB,
+	.regtype = SCIx_SCIFB_REGTYPE,
+	.ops = &sci_port_ops,
+	.uart_ops = &sci_uart_ops,
+	.params = &sci_port_params[SCIx_SCIFB_REGTYPE],
+};
+
+static const struct sci_of_data of_sci_hscif = {
+	.type = PORT_HSCIF,
+	.regtype = SCIx_HSCIF_REGTYPE,
+	.ops = &sci_port_ops,
+	.uart_ops = &sci_uart_ops,
+	.params = &sci_port_params[SCIx_HSCIF_REGTYPE],
+};
+
+static const struct sci_of_data of_sci_sci = {
+	.type = PORT_SCI,
+	.regtype = SCIx_SCI_REGTYPE,
+	.ops = &sci_port_ops,
+	.uart_ops = &sci_uart_ops,
+	.params = &sci_port_params[SCIx_SCI_REGTYPE],
+};
 
 static const struct of_device_id of_sci_match[] __maybe_unused = {
 	/* SoC-specific types */
 	{
 		.compatible = "renesas,scif-r7s72100",
-		.data = SCI_OF_DATA(PORT_SCIF, SCIx_SH2_SCIF_FIFODATA_REGTYPE),
+		.data = &of_sci_scif_sh2,
 	},
 	{
 		.compatible = "renesas,scif-r7s9210",
-		.data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
+		.data = &of_sci_scif_rz_scifa,
 	},
 	{
 		.compatible = "renesas,scif-r9a07g044",
-		.data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
+		.data = &of_sci_scif_rz_scifa,
 	},
 	{
 		.compatible = "renesas,scif-r9a09g057",
-		.data = SCI_OF_DATA(PORT_SCIF, SCIx_RZV2H_SCIF_REGTYPE),
+		.data = &of_sci_scif_rzv2h,
 	},
 	/* Family-specific types */
 	{
 		.compatible = "renesas,rcar-gen1-scif",
-		.data = SCI_OF_DATA(PORT_SCIF, SCIx_SH4_SCIF_BRG_REGTYPE),
+		.data = &of_sci_rcar_scif,
 	}, {
 		.compatible = "renesas,rcar-gen2-scif",
-		.data = SCI_OF_DATA(PORT_SCIF, SCIx_SH4_SCIF_BRG_REGTYPE),
+		.data = &of_sci_rcar_scif,
 	}, {
 		.compatible = "renesas,rcar-gen3-scif",
-		.data = SCI_OF_DATA(PORT_SCIF, SCIx_SH4_SCIF_BRG_REGTYPE),
+		.data = &of_sci_rcar_scif
 	}, {
 		.compatible = "renesas,rcar-gen4-scif",
-		.data = SCI_OF_DATA(PORT_SCIF, SCIx_SH4_SCIF_BRG_REGTYPE),
+		.data = &of_sci_rcar_scif
 	},
 	/* Generic types */
 	{
 		.compatible = "renesas,scif",
-		.data = SCI_OF_DATA(PORT_SCIF, SCIx_SH4_SCIF_REGTYPE),
+		.data = &of_sci_scif_sh4,
 	}, {
 		.compatible = "renesas,scifa",
-		.data = SCI_OF_DATA(PORT_SCIFA, SCIx_SCIFA_REGTYPE),
+		.data = &of_sci_scifa,
 	}, {
 		.compatible = "renesas,scifb",
-		.data = SCI_OF_DATA(PORT_SCIFB, SCIx_SCIFB_REGTYPE),
+		.data = &of_sci_scifb,
 	}, {
 		.compatible = "renesas,hscif",
-		.data = SCI_OF_DATA(PORT_HSCIF, SCIx_HSCIF_REGTYPE),
+		.data = &of_sci_hscif,
 	}, {
 		.compatible = "renesas,sci",
-		.data = SCI_OF_DATA(PORT_SCI, SCIx_SCI_REGTYPE),
+		.data = &of_sci_sci,
 	}, {
 		/* Terminator */
 	},
@@ -3402,7 +3472,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 	struct reset_control *rstc;
 	struct plat_sci_port *p;
 	struct sci_port *sp;
-	const void *data;
+	const struct sci_of_data *data;
 	int id, ret;
 
 	if (!IS_ENABLED(CONFIG_OF) || !np)
@@ -3449,8 +3519,12 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 	sp->rstc = rstc;
 	*dev_id = id;
 
-	p->type = SCI_OF_TYPE(data);
-	p->regtype = SCI_OF_REGTYPE(data);
+	p->type = data->type;
+	p->regtype = data->regtype;
+
+	sp->ops = data->ops;
+	sp->port.ops = data->uart_ops;
+	sp->params = data->params;
 
 	sp->has_rtscts = of_property_read_bool(np, "uart-has-rtscts");
 
@@ -3557,6 +3631,7 @@ static int sci_probe(struct platform_device *dev)
 		p = sci_parse_dt(dev, &dev_id);
 		if (IS_ERR(p))
 			return PTR_ERR(p);
+		sp = &sci_ports[dev_id];
 	} else {
 		p = dev->dev.platform_data;
 		if (p == NULL) {
@@ -3565,9 +3640,12 @@ static int sci_probe(struct platform_device *dev)
 		}
 
 		dev_id = dev->id;
+		sp = &sci_ports[dev_id];
+		sp->params = sci_probe_regmap(p, sp);
+		if (!sp->params)
+			return -ENODEV;
 	}
 
-	sp = &sci_ports[dev_id];
 	sp->suspend_regs = devm_kzalloc(&dev->dev,
 					sp->ops->suspend_regs_size(),
 					GFP_KERNEL);
@@ -3714,19 +3792,23 @@ static int early_console_exit(struct console *co)
 }
 
 int __init scix_early_console_setup(struct earlycon_device *device,
-				      int type)
+				    const struct sci_of_data *data)
 {
 	const struct sci_common_regs *regs;
 
 	if (!device->port.membase)
 		return -ENODEV;
 
-	device->port.type = type;
+	device->port.type = data->type;
 	sci_ports[0].port = device->port;
-	port_cfg.type = type;
+
+	port_cfg.type = data->type;
+	port_cfg.regtype = data->regtype;
+
 	sci_ports[0].cfg = &port_cfg;
-	sci_ports[0].ops = &sci_port_ops;
-	sci_ports[0].params = sci_probe_regmap(&port_cfg);
+	sci_ports[0].params = data->params;
+	sci_ports[0].ops = data->ops;
+	sci_ports[0].port.ops = data->uart_ops;
 	sci_uart_earlycon = true;
 	regs = sci_ports[0].params->common_regs;
 
@@ -3743,41 +3825,39 @@ int __init scix_early_console_setup(struct earlycon_device *device,
 static int __init sci_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return scix_early_console_setup(device, PORT_SCI);
+	return scix_early_console_setup(device, &of_sci_sci);
 }
 static int __init scif_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return scix_early_console_setup(device, PORT_SCIF);
+	return scix_early_console_setup(device, &of_sci_scif_sh4);
 }
 static int __init rzscifa_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	port_cfg.regtype = SCIx_RZ_SCIFA_REGTYPE;
-	return scix_early_console_setup(device, PORT_SCIF);
+	return scix_early_console_setup(device, &of_sci_scif_rz_scifa);
 }
 
 static int __init rzv2hscif_early_console_setup(struct earlycon_device *device,
 						const char *opt)
 {
-	port_cfg.regtype = SCIx_RZV2H_SCIF_REGTYPE;
-	return scix_early_console_setup(device, PORT_SCIF);
+	return scix_early_console_setup(device, &of_sci_scif_rzv2h);
 }
 
 static int __init scifa_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return scix_early_console_setup(device, PORT_SCIFA);
+	return scix_early_console_setup(device, &of_sci_scifa);
 }
 static int __init scifb_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return scix_early_console_setup(device, PORT_SCIFB);
+	return scix_early_console_setup(device, &of_sci_scifb);
 }
 static int __init hscif_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return scix_early_console_setup(device, PORT_HSCIF);
+	return scix_early_console_setup(device, &of_sci_hscif);
 }
 
 OF_EARLYCON_DECLARE(sci, "renesas,sci", sci_early_console_setup);
-- 
2.43.0


