Return-Path: <linux-renesas-soc+bounces-13202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C027EA380D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD1EA16D66D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD5B21858C;
	Mon, 17 Feb 2025 10:55:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93565217703;
	Mon, 17 Feb 2025 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789710; cv=none; b=IuHapKSdZz8oD6TURa4eYnx8/m1vM3DYWODE29ARhn5TpioW891Ht7hm1JIq6WYj7BQstaPpeLeUPmmRqI1EJ2Ajx/t193zf3RUmaWe9eIz85tKsBKVsWmzkeApWPEmiX15VK+awYb+nBJ+3EuI8DoRSc3jIwTuLLJNde1J6MZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789710; c=relaxed/simple;
	bh=06dbBVuYyNS7TEaHOhl2RJMuzL9SFiWdwtWJnQZuxE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YT5gAbQZVBQiqIMsuI+xNpd/1NPkPFAhdBzUgCNlo6JZ9kuVeFvXwpjyquwAY40NP6qhO+N463WCxkJx0c3/agfrATTvlVibie3WmcVoxzjiuT//dvjB/zPO++f0YmhVI2Z13kQ8xY4F+5GWakf1gSxcW1Gr6RexEC35/SOupNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 6qgoDMJ5RSCFBxUfwuzMUQ==
X-CSE-MsgGUID: WnhbAWXQQ8CGDc7fx0HXpg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Feb 2025 19:55:08 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D32FB404B0EC;
	Mon, 17 Feb 2025 19:55:05 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 09/13] serial: sh-sci: Introduced sci_of_data
Date: Mon, 17 Feb 2025 11:52:10 +0100
Message-ID: <20250217105354.551788-10-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
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
 drivers/tty/serial/sh-sci.c        | 60 ++++++++++++++++++------------
 drivers/tty/serial/sh-sci_common.h | 11 +++++-
 2 files changed, 46 insertions(+), 25 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index ace56375c044..eee1c03ba5a7 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2917,10 +2917,13 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
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
 
@@ -2967,9 +2970,7 @@ static int sci_init_single(struct platform_device *dev,
 	int ret;
 
 	sci_port->cfg	= p;
-	sci_port->ops	= &sci_port_ops;
 
-	port->ops	= &sci_uart_ops;
 	port->iotype	= UPIO_MEM;
 	port->line	= index;
 	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_SH_SCI_CONSOLE);
@@ -3009,7 +3010,6 @@ static int sci_init_single(struct platform_device *dev,
 		for (i = 1; i < ARRAY_SIZE(sci_port->irqs); i++)
 			sci_port->irqs[i] = sci_port->irqs[0];
 
-	sci_port->params = sci_probe_regmap(p);
 	if (unlikely(sci_port->params == NULL))
 		return -EINVAL;
 
@@ -3264,9 +3264,14 @@ static void sci_remove(struct platform_device *dev)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 }
 
-#define SCI_OF_DATA(type, regtype)	(void *)((type) << 16 | (regtype))
-#define SCI_OF_TYPE(data)		((unsigned long)(data) >> 16)
-#define SCI_OF_REGTYPE(data)		((unsigned long)(data) & 0xffff)
+#define SCI_OF_DATA(_type, _regtype) (\
+&(struct sci_of_data) {\
+	.type = (_type), \
+	.regtype = (_regtype),\
+	.ops = &sci_port_ops,\
+	.uart_ops = &sci_uart_ops,\
+	.params = &sci_port_params[_regtype],\
+})
 
 static const struct of_device_id of_sci_match[] __maybe_unused = {
 	/* SoC-specific types */
@@ -3334,7 +3339,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 	struct reset_control *rstc;
 	struct plat_sci_port *p;
 	struct sci_port *sp;
-	const void *data;
+	const struct sci_of_data *data;
 	int id, ret;
 
 	if (!IS_ENABLED(CONFIG_OF) || !np)
@@ -3380,8 +3385,12 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 	sp = &sci_ports[id];
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
 
@@ -3471,6 +3480,7 @@ static int sci_probe(struct platform_device *dev)
 		}
 
 		dev_id = dev->id;
+		sp->params = sci_probe_regmap(p, &sci_ports[dev_id]);
 	}
 
 	sp = &sci_ports[dev_id];
@@ -3560,19 +3570,23 @@ sh_early_platform_init_buffer("earlyprintk", &sci_driver,
 static struct plat_sci_port port_cfg __initdata;
 
 int __init early_console_setup(struct earlycon_device *device,
-				      int type)
+			       const struct sci_of_data *data)
 {
 	const struct sci_common_regs *regs;
 
 	if (!device->port.membase)
 		return -ENODEV;
 
-	device->port.type = type;
+	device->port.type = data->type;
 	memcpy(&sci_ports[0].port, &device->port, sizeof(struct uart_port));
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
 	regs = sci_ports[0].params->common_regs;
 
 	port_cfg.scscr = sci_ports[0].ops->read_reg(&sci_ports[0].port, regs->control);
@@ -3586,41 +3600,39 @@ int __init early_console_setup(struct earlycon_device *device,
 static int __init sci_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return early_console_setup(device, PORT_SCI);
+	return early_console_setup(device, SCI_OF_DATA(PORT_SCI, SCIx_SCI_REGTYPE));
 }
 static int __init scif_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return early_console_setup(device, PORT_SCIF);
+	return early_console_setup(device, SCI_OF_DATA(PORT_SCIF, SCIx_SH4_SCIF_REGTYPE));
 }
 static int __init rzscifa_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	port_cfg.regtype = SCIx_RZ_SCIFA_REGTYPE;
-	return early_console_setup(device, PORT_SCIF);
+	return early_console_setup(device, SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE));
 }
 
 static int __init rzv2hscif_early_console_setup(struct earlycon_device *device,
 						const char *opt)
 {
-	port_cfg.regtype = SCIx_RZV2H_SCIF_REGTYPE;
-	return early_console_setup(device, PORT_SCIF);
+	return early_console_setup(device, SCI_OF_DATA(PORT_SCIF, SCIx_RZV2H_SCIF_REGTYPE));
 }
 
 static int __init scifa_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return early_console_setup(device, PORT_SCIFA);
+	return early_console_setup(device, SCI_OF_DATA(PORT_SCIFA, SCIx_SCIFA_REGTYPE));
 }
 static int __init scifb_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return early_console_setup(device, PORT_SCIFB);
+	return early_console_setup(device, SCI_OF_DATA(PORT_SCIFB, SCIx_SCIFB_REGTYPE));
 }
 static int __init hscif_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return early_console_setup(device, PORT_HSCIF);
+	return early_console_setup(device, SCI_OF_DATA(PORT_HSCIF, SCIx_HSCIF_REGTYPE));
 }
 
 OF_EARLYCON_DECLARE(sci, "renesas,sci", sci_early_console_setup);
diff --git a/drivers/tty/serial/sh-sci_common.h b/drivers/tty/serial/sh-sci_common.h
index 0bc49ab277b5..9235a8d4c7aa 100644
--- a/drivers/tty/serial/sh-sci_common.h
+++ b/drivers/tty/serial/sh-sci_common.h
@@ -96,6 +96,14 @@ struct sci_port_ops {
 	void (*prepare_console_write)(struct uart_port *port, u32 ctrl);
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
 
@@ -165,7 +173,8 @@ void sci_flush_buffer(struct uart_port *port);
 #define max_sr(_port)		fls((_port)->sampling_rate_mask)
 
 #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
-int __init early_console_setup(struct earlycon_device *device, int);
+int __init early_console_setup(struct earlycon_device *device,
+			       const struct sci_of_data *data);
 #endif
 
 #endif /* __SH_SCI_COMMON_H__ */
-- 
2.43.0


