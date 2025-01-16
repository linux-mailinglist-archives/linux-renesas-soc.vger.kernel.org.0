Return-Path: <linux-renesas-soc+bounces-12211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B68A1419B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 19:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA85D167B49
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 18:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E20022FAF9;
	Thu, 16 Jan 2025 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="exEIgaJ3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478EA22E40F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 18:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737051788; cv=none; b=a2lwBQnFk3j6sOrape/vxqgl6CLoKPHYmv+eAfh/eNv6c9WzXW6Ls30z8/ILzueTWbYDyDJaaKmcP9DHnq2AOW7IWMvI+/dqGb6h2BLMTvfJWmoLF58PbbhxdYrTPEQRIh5XZ/n/ZakIbGjYbLiYmajGfKVN4+QnKdkcK4FWVRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737051788; c=relaxed/simple;
	bh=DcF7B55zcAap/muhL1RWLS7OTEtRY63GaX/Ehm6o9BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/aKZJI1UYs9VeOICd/i8Ovk+cahQngLuzaxNXpthkLLtn0iSCp1PhcHFs2DRCdbdjX2GWxiYRuWvQTnYx4UIHGzpDRGfKPWbUQtLmSsRwPCvz6m+g6pxvroY0qxeSf+lcA3pbNv+w6I0X+PwyyCKcdQXNhtVnc9UwdEBe+dZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=exEIgaJ3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38632b8ae71so998356f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 10:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737051784; x=1737656584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xt3X3hJfAKuM+3Yz7HnXtTVzceebTppvDtGkvFMMHoM=;
        b=exEIgaJ38cv8OjUEyp91/WBHYbQID2WnURX1BKvpKTKyUISH+jUqZuhGDGLoOaCi07
         FBTrA6myTT69YuMYUDLKdvJkUpPKn8dRQ91VbbFCZoetOIbb2Ll3NWPQTUNIft6zbagN
         NBnpu2pxQzgb1SQfzZQDKSIa8oCIczZF+ICS84C1/7gB+izOit2tAYiBolcGdVVLcPHr
         UewVldw3W1eAyUDUAgV2x1to2CMqkSecin/mqOJNJu8ROQQwKOqFBnb4N7jf33Ueio+j
         thT5cOXhvayJMle6DJ4p9kH1wMTeIethJa3QWnj4ZN0LNuJg7SlH3tuRzGuw6xFV8yYg
         vZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737051784; x=1737656584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xt3X3hJfAKuM+3Yz7HnXtTVzceebTppvDtGkvFMMHoM=;
        b=OAWA1SYxESdESaaBxlgR9fHj/cdcV+cPG3v/KVLI11ypjHqaC1XkGsGP2r0QpnDx2x
         QE3aZ1O1CBVu4mD370ih1j4JwrrfQp0QlTR6J/IxKop121g0cDt/eVhdOsLsojiv8NTY
         LZMz0hbEMq/2Ppg/Sbhb6LfGo/fP3tSyqgv08du0PvAC0tMBMttc37IlhpwLPi+FEmt0
         HbvDj3C1VFBOJO0sy7v4V9RC+O+PbSt3qCIePpoCbN7qTrDubAGtmQIyz9A3iHMh4Yn0
         jsGMMU9PmETKDrLqwYFSMdPFb/VXOgL6h83lTEVFQcuiHxM/hjVEW3FK2QHG4N9PmU7T
         YVRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcGOZl+sXWY7mTyOcveCWm40YoNEIggue3lq/tN5VfMzL7wzijQI0qVofBcLY8TFEjLVk0+MVNqc/ETCd4b4wnKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAw34UcQc2cFQsV35TXNJuNXujKp3icFEjWbfHRGwxU0GYmFWa
	8YhxJdPmYI1u2oY8vlKE7tWr+BHngWgN7yWOm3xDBsPjPS/Mxzji3rkoyJcNDdY=
X-Gm-Gg: ASbGnct+3iD8eM9T8HBTRG7uurqJ/uBUvydszCy1HtMz2JzbE4gHmWNzbnbeZGgcfc+
	Bp2eEey33ETcs5w+wq121d7l9H8G0IKkCN/yvsNKr7Dt3ESiMUIZdx31o3JZm4ForCQFEHyCab8
	ADJq/gGQo4ki2J9M5s1fuC4rBbB7xaGo3iSSEDQ74iCwc+H2iF0NXuGgXsVrgZvctnBW577hiKB
	8TRzYeD3QHfVpHhStLHSwLxnzQJkPQTTUxyhEor+yMFNdR3T9VBtWjtXKB16OGsKwLBIwjjqEcu
	vXeSeumCbwI=
X-Google-Smtp-Source: AGHT+IELCx1Crvm+gMJWnRj/5W/vXDbON9DFubikSRu/WF4Y4wWdLHxE8IaPDSh+SujAoNScHaHbSw==
X-Received: by 2002:a5d:6485:0:b0:38b:eb7b:316 with SMTP id ffacd0b85a97d-38beb7b043fmr4040641f8f.47.1737051784352;
        Thu, 16 Jan 2025 10:23:04 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a838sm495942f8f.48.2025.01.16.10.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 10:23:03 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	ysato@users.sourceforge.jp,
	ulrich.hecht+renesas@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/5] serial: sh-sci: Move runtime PM enable to sci_probe_single()
Date: Thu, 16 Jan 2025 20:22:46 +0200
Message-ID: <20250116182249.3828577-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116182249.3828577-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250116182249.3828577-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Relocate the runtime PM enable operation to sci_probe_single(). This change
prepares the codebase for upcoming fixes.

While at it, replace the existing logic with a direct call to
devm_pm_runtime_enable() and remove sci_cleanup_single(). The
devm_pm_runtime_enable() function automatically handles disabling runtime
PM during driver removal.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes since RFT:
- collected tags
- in sci_probe_single() return directly the ret code of
  uart_add_one_port()

 drivers/tty/serial/sh-sci.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 09e69cb7d798..51382e354a2d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3056,10 +3056,6 @@ static int sci_init_single(struct platform_device *dev,
 		ret = sci_init_clocks(sci_port, &dev->dev);
 		if (ret < 0)
 			return ret;
-
-		port->dev = &dev->dev;
-
-		pm_runtime_enable(&dev->dev);
 	}
 
 	port->type		= p->type;
@@ -3086,11 +3082,6 @@ static int sci_init_single(struct platform_device *dev,
 	return 0;
 }
 
-static void sci_cleanup_single(struct sci_port *port)
-{
-	pm_runtime_disable(port->port.dev);
-}
-
 #if defined(CONFIG_SERIAL_SH_SCI_CONSOLE) || \
     defined(CONFIG_SERIAL_SH_SCI_EARLYCON)
 static void serial_console_putchar(struct uart_port *port, unsigned char ch)
@@ -3260,8 +3251,6 @@ static void sci_remove(struct platform_device *dev)
 	sci_ports_in_use &= ~BIT(port->port.line);
 	uart_remove_one_port(&sci_uart_driver, &port->port);
 
-	sci_cleanup_single(port);
-
 	if (port->port.fifosize > 1)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
 	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF)
@@ -3425,6 +3414,11 @@ static int sci_probe_single(struct platform_device *dev,
 	if (ret)
 		return ret;
 
+	sciport->port.dev = &dev->dev;
+	ret = devm_pm_runtime_enable(&dev->dev);
+	if (ret)
+		return ret;
+
 	sciport->gpios = mctrl_gpio_init(&sciport->port, 0);
 	if (IS_ERR(sciport->gpios))
 		return PTR_ERR(sciport->gpios);
@@ -3438,13 +3432,7 @@ static int sci_probe_single(struct platform_device *dev,
 		sciport->port.flags |= UPF_HARD_FLOW;
 	}
 
-	ret = uart_add_one_port(&sci_uart_driver, &sciport->port);
-	if (ret) {
-		sci_cleanup_single(sciport);
-		return ret;
-	}
-
-	return 0;
+	return uart_add_one_port(&sci_uart_driver, &sciport->port);
 }
 
 static int sci_probe(struct platform_device *dev)
-- 
2.43.0


