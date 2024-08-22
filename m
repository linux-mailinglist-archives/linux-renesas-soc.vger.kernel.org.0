Return-Path: <linux-renesas-soc+bounces-8043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 001FE95BA42
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 973A0B27383
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8761CE71E;
	Thu, 22 Aug 2024 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ahkaTrVs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C8E1CDFBC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340513; cv=none; b=M0s/RHqeUWifyqxLCi5G9FBrb5Mbm28/Ch2vGhBsBG2FsrhR/aPBUn6vAVPqhd3OZJdDpd7IXHm/DBtHZgkX4YDui9vJ15T6ishn8L7cjwcJNYCC7JR1GSXmMX1qxsgo/b8lZCOAhbsf7rN7L/gCm8omrSdO2Y10ckcVVzX9vJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340513; c=relaxed/simple;
	bh=w+weaAEOmGk0To+KXOoCxU7aqcf94aBLMt0+/RCKEWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ftCSFlzJKxZzZeAzf/PfC5ZkSNqAGzz1ztS9bKNjF8nY2ZNE789kdWYph8aD9npleAid+wl/GQDysILVpkw2bQXD82u69VUvt0pz9lF0mArO68IAmYrpdbpMfV7Nl/bBrNPPLeCFBjbIp65u+N4hd4tlLPZQDoCTSFNenGbPW9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ahkaTrVs; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8657900fc1so155026166b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340511; x=1724945311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7FkQHIsvgS8tLvmRvs57rTjX/u1Y5CHinD6jgFXzvM=;
        b=ahkaTrVsbrgQ++YRM9CHFl4Zt1+3G69WBNK9S9wraUUldB5QsS/cWtF/ZG2RH8KU+9
         M2mKY0d7w9bWgXOPxNGRHzQlNSRPe1Gv2PZzkyHKcFWZEFacvO3ZMnwPg1xPpN1Mr/2T
         EAY+1qjZ8hzVKrfuOLjmN99yyXjMwK8yIL9+1geoJuAL1kuzzmEDRfZyFWmRt179qpz3
         oOcsMQnpIqJu7zne2Bxi4UpIhLT6f1BAlOPi2XaHNrDu9XNE/NMPTiz/Uk3Xx7vpp+TF
         jFa+A0WvOqtCHyqitBslzL2/bagHKsS02TQU/uZ1Z7CqjW04HvrwVz6ypKCwzt/XS2ve
         z+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340511; x=1724945311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7FkQHIsvgS8tLvmRvs57rTjX/u1Y5CHinD6jgFXzvM=;
        b=dBSgD+foipD6gpfSCNmm4tUfKJWsk2dv+TmK0CJR9a+fhbivRhSBNiCRXUQL78KBfH
         J+u0vftpdPG+4DQBzL3WlJfl+V73OxFzU4DJI2uHgoZ7MTkmPdbCg1/KCedWohGSScIj
         BSziRp5z/+6Y+3qsW03RWZJb/fUuOHU1W8sHXtU/kdWuC5FQ90k+nRz5WeEsPnyULXPE
         Lzf5zAeb/TXEVnrV0Cvn8qRJerphVOD7mReJL+PtXQrXv8TivHGU++xRnfKv6ou3RpZ6
         td4c8DuSXPTfmQjsIBXUSuxZJ2l1pG6tAyJchb3wrPJUl2CjAtY3UmLZAiQVewhrG0QG
         OgHg==
X-Forwarded-Encrypted: i=1; AJvYcCUgjR20QTjEBIyx8BcHCbbC1+V5HOjIwMkkRw6sE9BhOKXZNsgdf/m69Plp6/jW3p4cOD+YruZ70AVC/sje6l0SRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXxupXIE+iY+vJG7EV2bx+5NBYp02h1OmXyLh5Q0djYViRv1pC
	RvFyW7mWC7fsifNDt3YTSdzsWp29pVfJeKjjNgMkJNBb+zW34CXR9ySAlH2L/Gk=
X-Google-Smtp-Source: AGHT+IGPID6PnpNBLXBTXMtHC4bLo5V7GR8HicFGoYSBbUPtn858dZ2vIoy56QGfOFS6q2WDw3Kkwg==
X-Received: by 2002:a17:907:c7dc:b0:a77:d85c:86fa with SMTP id a640c23a62f3a-a8691abe63dmr193992366b.13.1724340510445;
        Thu, 22 Aug 2024 08:28:30 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:30 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 07/16] reset: rzg2l-usbphy-ctrl: Get reset control array
Date: Thu, 22 Aug 2024 18:27:52 +0300
Message-Id: <20240822152801.602318-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Before accessing the USB area of the RZ/G3S SoC the PWRRDY bit of the
SYS_USB_PWRRDY register need to be cleared. When USB area is not used the
PWRRDY bit of the SYS_USB_PWRRDY register need to be set. This register is
in the SYSC controller address space and the assert/de-assert of the
signal handled by SYSC_USB_PWRRDY was implemented as a reset signal.

The USB modules available on the RZ/G3S SoC that need this bit set are:
- USB ch0 (supporting host and peripheral mode)
- USB ch2 (supporting host mode)
- USBPHY control

As the USBPHY control is the root device for all the other USB channels
(USB ch0, USB ch1) add support to set the PWRRDY for the USB area when
initializing the USBPHY control. As this is done though reset signals
get the reset array in the USBPHY control driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 1cd157f4f03b..8b64c12f3bec 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -132,7 +132,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	priv->rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get reset\n");
-- 
2.39.2


