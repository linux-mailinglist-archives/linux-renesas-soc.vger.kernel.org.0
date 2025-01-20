Return-Path: <linux-renesas-soc+bounces-12268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C6DA16CF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 14:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CD0C7A2CB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 13:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95DE1E0DDF;
	Mon, 20 Jan 2025 13:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A5rclq2a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776C61E0E13
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378585; cv=none; b=LdpX+eNBv3EWi9umExKA+ooJPvZ6U6IDnhy5anSmv08KKu7oCrPu63QVP6+v38rSDc2SUZrS7e6kkgHNpftIQXTYjDjIUutEVh33O1WFlKLNAE7LUnh50GuhcJ9xiT5OXf5x8JZ4rVPAYcwSyOM3DMVDrGmc8WXjluWgyuQ9kso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378585; c=relaxed/simple;
	bh=uct9U7IhGmLGks2dzIuQgZHdXFiBAwtQzHFSaHGw5ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QyB1w7/SRNg1LgYkFtLM1COPDi43s21WBXRvAKNeXcQBrgG8JsJ4erauGgk8Jm8GyzxUIH+0aipbbuFjGHMZmYP5fhTJDGG2vYde7A1fXxsKfF9jPuvGMPKn1xsxBL4zUIeeDfLBEIG1qyUgcp/I3x2nzbKWHTWQpiDUmyZaIyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=A5rclq2a; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso30687275e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 05:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737378582; x=1737983382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6x24vOEL5/TJ8vXf0hNcJSgsC5eLh36a2PxWG5XS3Q=;
        b=A5rclq2aAaPsgiQLdXDrjLZ5tbiqvYLg+ba9RHu9YPDBrUuryNzfrqiqImCrFBbyGb
         nSwQh04H8o7XaWrH9kRR/ef0Q2HGyy23qolknvFih6eAHJhmNkuAj589GQcL/QXyZGyc
         95uAabMEgP7rV95nxZM4l18VSlhg3OndDuHFYXoDVZ8JelwvL49x8/JmoXyUu3GL1KSl
         un2BIpyX33MkzWBoL39J7bd6PHKNg1wAFLX0ldl9CqK3YWGlzHqQwaz/JC2+eFxTH2W5
         kXIysTatgOGkrlJVzuggTxSCjs7Z8VI4J/eczgerBw9UYQhD+f0Jo9Ua/7xqTIkH6z19
         xFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737378582; x=1737983382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6x24vOEL5/TJ8vXf0hNcJSgsC5eLh36a2PxWG5XS3Q=;
        b=NCH5HC/fBLWs1iCwr/pd/SkaWSlbuCkgEqNGhGylc2PL+DasbS9hY0/2FdYm/7CP7E
         ZN5a4fRA659EpmUmInwAlFXJuKwQRRoCZGslA1a0VKcvLdPu4Pw0dKhX//2cNElJOZ07
         t8gV3B15G7u4FEjF04kkmyPG0qpt75en8lCsN/pq/dIM3Xr3I5VAIz7V7zYxNeTGCZ2S
         KUzgqp2aBgA12729aSDd+C6cloCN8wZkuhUy/PBHFd7a9UfKks+FScD2wiP28FvYS5xV
         dF/vTWN5E+W0Ztyydf1dP4Hv8cKMsqb5WDNR5h7mqp09lG31HuAOeyayNlb1oMKjhS5e
         FoTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU41fBYBhlWDpa7QMxrV6bWa/Hl/pxpHVX8xZHaU0N5juTVbHxbKXkdwQ0a1SM2C3OTIeeWw2V41JgvOduA1KxUdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygnNlsmTjusPEEoZkt016k8W06hQkX9SsBzJAUsmYakZ2G+4N4
	Bt3totWF32CJ97/uYjIhNpmpk+0tBCQ8SRMSPky8Q3sG+gOBb7ndbZDpAqoovcQ=
X-Gm-Gg: ASbGncumY0wxTfV163TVi6qAmpNHa+Ec6K36Gv2jg93tsajG/Rt+yGndYthApwwvUru
	Jiv2nWwlh1t7FhOT6fy4w6pGa2T3ArOQMfeeD+ixTWTvrD7e+P3qGvTNOQSoBEcsK+eHy9vmZ5Q
	Iarz6X+XB/pbL5Pte/0rh+yw7vVX1OBRgXWWUU5WZWadFwrgBdiNxRgoePYd2H0TJl64LGgzFW1
	5tRFLmQJ76xQpi5GqHjXamra8XsSIXw1w0U+TBn/h3z2cfCADUtVnOcigMJ/xCNMabSY3YejMZJ
	wbz9UUeRYajwRVXu+Bxi16M=
X-Google-Smtp-Source: AGHT+IGxlb5HA5FYguAsz6eUdlluzgj3rUbYoqrhqAKMsNvCOU1DkxKaDcLmK42gJnvVftsGSFzeeQ==
X-Received: by 2002:a05:600c:3844:b0:434:ff08:202b with SMTP id 5b1f17b1804b1-438913dbc09mr122718855e9.12.1737378581607;
        Mon, 20 Jan 2025 05:09:41 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389041f61bsm138001955e9.17.2025.01.20.05.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 05:09:41 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	claudiu.beznea.uj@bp.renesas.com,
	wsa+renesas@sang-engineering.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 1/4] serial: sh-sci: Update the suspend/resume support
Date: Mon, 20 Jan 2025 15:09:33 +0200
Message-ID: <20250120130936.1080069-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S supports a power saving mode where power to most of the
SoC components is turned off. When returning from this power saving mode,
SoC components need to be re-configured.

The SCIFs on the Renesas RZ/G3S need to be re-configured as well when
returning from this power saving mode. The sh-sci code already configures
the SCIF clocks, power domain and registers by calling uart_resume_port()
in sci_resume(). On suspend path the SCIF UART ports are suspended
accordingly (by calling uart_suspend_port() in sci_suspend()). The only
missing setting is the reset signal. For this assert/de-assert the reset
signal on driver suspend/resume.

In case the no_console_suspend is specified by the user, the registers need
to be saved on suspend path and restore on resume path. To do this the
sci_console_setup() function was added. There is no need to cache/restore
the status or FIFO registers. Only the control registers. To differentiate
b/w these, the struct sci_port_params::regs was updated with a new member
that specifies if the register needs to be chached on suspend. Only the
RZ_SCIFA instances were updated with this new support as the hardware for
the rest of variants was missing for testing.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- rebased on top of the update version of patch 2/8 from
  this series

 drivers/tty/serial/sh-sci.c | 53 ++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index b1ea48f38248..ae43237dd684 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -101,7 +101,7 @@ enum SCI_CLKS {
 		if ((_port)->sampling_rate_mask & SCI_SR((_sr)))
 
 struct plat_sci_reg {
-	u8 offset, size;
+	u8 offset, size, suspend_cacheable;
 };
 
 struct sci_port_params {
@@ -134,6 +134,8 @@ struct sci_port {
 	struct dma_chan			*chan_tx;
 	struct dma_chan			*chan_rx;
 
+	struct reset_control		*rstc;
+
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
 	struct dma_chan			*chan_tx_saved;
 	struct dma_chan			*chan_rx_saved;
@@ -153,6 +155,7 @@ struct sci_port {
 	int				rx_trigger;
 	struct timer_list		rx_fifo_timer;
 	int				rx_fifo_timeout;
+	unsigned int			console_cached_regs[SCIx_NR_REGS];
 	u16				hscif_tot;
 
 	bool has_rtscts;
@@ -300,17 +303,17 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 	 */
 	[SCIx_RZ_SCIFA_REGTYPE] = {
 		.regs = {
-			[SCSMR]		= { 0x00, 16 },
-			[SCBRR]		= { 0x02,  8 },
-			[SCSCR]		= { 0x04, 16 },
+			[SCSMR]		= { 0x00, 16, 1 },
+			[SCBRR]		= { 0x02,  8, 1 },
+			[SCSCR]		= { 0x04, 16, 1 },
 			[SCxTDR]	= { 0x06,  8 },
 			[SCxSR]		= { 0x08, 16 },
 			[SCxRDR]	= { 0x0A,  8 },
-			[SCFCR]		= { 0x0C, 16 },
+			[SCFCR]		= { 0x0C, 16, 1 },
 			[SCFDR]		= { 0x0E, 16 },
-			[SCSPTR]	= { 0x10, 16 },
+			[SCSPTR]	= { 0x10, 16, 1 },
 			[SCLSR]		= { 0x12, 16 },
-			[SEMR]		= { 0x14, 8 },
+			[SEMR]		= { 0x14, 8, 1 },
 		},
 		.fifosize = 16,
 		.overrun_reg = SCLSR,
@@ -3374,6 +3377,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 	}
 
 	sp = &sci_ports[id];
+	sp->rstc = rstc;
 	*dev_id = id;
 
 	p->type = SCI_OF_TYPE(data);
@@ -3546,13 +3550,34 @@ static int sci_probe(struct platform_device *dev)
 	return 0;
 }
 
+static void sci_console_setup(struct sci_port *s, bool save)
+{
+	for (u16 i = 0; i < SCIx_NR_REGS; i++) {
+		struct uart_port *port = &s->port;
+
+		if (!s->params->regs[i].suspend_cacheable)
+			continue;
+
+		if (save)
+			s->console_cached_regs[i] = sci_serial_in(port, i);
+		else
+			sci_serial_out(port, i, s->console_cached_regs[i]);
+	}
+}
+
 static __maybe_unused int sci_suspend(struct device *dev)
 {
 	struct sci_port *sport = dev_get_drvdata(dev);
 
-	if (sport)
+	if (sport) {
 		uart_suspend_port(&sci_uart_driver, &sport->port);
 
+		if (!console_suspend_enabled && uart_console(&sport->port))
+			sci_console_setup(sport, true);
+		else
+			return reset_control_assert(sport->rstc);
+	}
+
 	return 0;
 }
 
@@ -3560,8 +3585,18 @@ static __maybe_unused int sci_resume(struct device *dev)
 {
 	struct sci_port *sport = dev_get_drvdata(dev);
 
-	if (sport)
+	if (sport) {
+		if (!console_suspend_enabled && uart_console(&sport->port)) {
+			sci_console_setup(sport, false);
+		} else {
+			int ret = reset_control_deassert(sport->rstc);
+
+			if (ret)
+				return ret;
+		}
+
 		uart_resume_port(&sci_uart_driver, &sport->port);
+	}
 
 	return 0;
 }
-- 
2.43.0


