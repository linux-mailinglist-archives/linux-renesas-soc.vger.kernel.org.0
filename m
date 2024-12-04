Return-Path: <linux-renesas-soc+bounces-10917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B859E4001
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 17:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A916B2EDA1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 16:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C78821019B;
	Wed,  4 Dec 2024 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jsPFp6Cw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BDC2144C3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327902; cv=none; b=plUaczS5Hq9dLLnlKuUktT8IxSKSTOhAH8Vw3jFuKh3rQp8O0u/UGUTOdxj1l+7TeMV5IyHzqizT5hFcT+V4gU18g9ImWFNWRusMbsvr/WFN3+np75NGGM76LDnL4F+gdLAHFxxNGFn/a6nvWL2Nr2+fKgwtzW+U9xrAh0V2QLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327902; c=relaxed/simple;
	bh=ZT/xdjFLeWNNlsrj3Ue+9kz2Tfvcw+jWnO0VG76SBPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BP+jIvP5UKOuxp6JR5lZ9E5NqFj6Pfk+vu6Fc+z5dC9q2I3thO+eiTpR46wktJvx5lJYUaM6/cFjAlhYCNTGkYJy48S9kvOFk6iFLOjr9ImcI8ed8mkFoN4iecVw4JBJPMJLMsPrCuxaKHiwV4D+8iR2tBmDUJjERZoklec55Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jsPFp6Cw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a45f05feso85299485e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Dec 2024 07:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733327899; x=1733932699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iw97V1HkeTfD3TObMHDloJkcKAuf8zzJLrBo8Fp9hAs=;
        b=jsPFp6CwqnKs6uCZj8RfZB4mh0xEeb//7c9XjOdsA1BDzN9VodpgLMN2ZosSzFum0/
         Zh/lGILkVfTCf8WCcNyqAlTQRsUJjQVbkCcpVhQCfNwudGaX3SE+7ux+3iICm8I6YkyD
         60U9RE/5CsWtjqsN0xQH+vevlKffzMMRlww0M47K0rdI4CVaT/erh/imD7V7XhqjqZci
         XKXSPM995v3aVclBenxpH88qx9REPXjU3UI5o/WKYMDQBMWl2uL+l5nRQKoO8IeCYocl
         bOUGPLtPDr5KC8pF2TPZXcK8VLeOzczMMfpO5AwuIvPzr49Y5tOVuVx2smAp99f4vKIG
         lEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327899; x=1733932699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iw97V1HkeTfD3TObMHDloJkcKAuf8zzJLrBo8Fp9hAs=;
        b=SmjCsq3NLywkLHFGkQd4tpJNxo6ZvQ3XPxeVg4qnE6aWWlmQFgTSlOebDFBetFFDBO
         hD0cFVAdaD531TyoG0eKI3hGBMeUpobHUUrNP5HY9TILrQoubHmxE3F2LuB2VpuHCOuo
         uzPgyUDgsBO+vlslCpN7k1ug5Ckbhvo1M1FX8E+WppMOfES4qVjGWmtaJGimSbE0scSN
         0t3nFYnWzpMX95laLj1G037Krk8Yj4vhkzeesvtuyia+Q9qwa9kCgnBU2YIMncKXYcz6
         NCqQqfqPb2PD8cn8Qi6h+ydieozCm7pyGBzRKeLiW/VCccb1CzGCHYcjvt4s62JTRFmk
         KImg==
X-Forwarded-Encrypted: i=1; AJvYcCVqDJK4LPe1BB1FYTelgZ74ISwWEgMtsPOc1v9DBCtIE+DuoADa+s+3USL+LW+rAhDHdkX46mGseo+ZfRyxV5PWtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGozZzjC/1uUICsgc0p6ZKDX0FzZ1+H66cNul7f2hHs/Ib3PS5
	LTVST6EjxwAYJOJZASiYSjZtXHjtbrANzANq6K+90gcoKrk7JccOE+Xb06rEwxk=
X-Gm-Gg: ASbGncvGT4vQQHgs3wleRJHwf/CHi9oQgOZS9i5AlPNb3SpxaQ+BMnQMTAMM+4mq8HJ
	JQSOfJSi7WEHfqlXc3VRaoyA4IgLqnxpeRpECXVL/PXydW3Lr32vojvNeWDyGFx+gjv0LrSdta0
	aSZuWf5QUiO701+JRrvfazhHnQWCrz4pTIB/myqtLyEomvoJsaEPYfb3iMVm0gfDsE8Ox9NEmMn
	5laxAlqUcjJ+8qof7w9gYRK09De2lXB9+xxLe+16FErVxCECZOsBtmhTm2B0RQ55CQBCiF3qYa4
	Hz0v
X-Google-Smtp-Source: AGHT+IEdO01rXNTKKymFk0tOKPPstS1yxCCBYj396aNVH1MZSrtaciEZJPkmPj7/r7/fpuguB+UslA==
X-Received: by 2002:a05:600c:4593:b0:434:9ec0:9e4e with SMTP id 5b1f17b1804b1-434d0a28531mr77312675e9.30.1733327899104;
        Wed, 04 Dec 2024 07:58:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52b5677sm29043695e9.37.2024.12.04.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:18 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	wsa+renesas@sang-engineering.com,
	geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de,
	groeck@chromium.org,
	mka@chromium.org,
	ulrich.hecht+renesas@gmail.com,
	ysato@users.sourceforge.jp
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH RFT 3/6] serial: sh-sci: Move runtime PM enable to sci_probe_single()
Date: Wed,  4 Dec 2024 17:58:03 +0200
Message-Id: <20241204155806.3781200-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4f5da3254420..373195995d3b 100644
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
@@ -3440,7 +3434,6 @@ static int sci_probe_single(struct platform_device *dev,
 
 	ret = uart_add_one_port(&sci_uart_driver, &sciport->port);
 	if (ret) {
-		sci_cleanup_single(sciport);
 		return ret;
 	}
 
-- 
2.39.2


