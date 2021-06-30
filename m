Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14FEA3B87BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 19:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbhF3Rd0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 13:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhF3Rd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 13:33:26 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE48C061756;
        Wed, 30 Jun 2021 10:30:55 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id l5so4085070iok.7;
        Wed, 30 Jun 2021 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S/6SfVZWS0YYflq4a4eo7WY9BLDp47JLO2fbdfuvAO0=;
        b=uFXagmEtq03jeGCLgNbqFlj+DHIAjin6s+NHI3Fuev+APPI0tJwx8n/tp1ykgc/Ubh
         tswtID1mQXSHapvgG/BjT4agBZuyjMnFGSWGPbLSkHGxHLK8n+7wVwCf23I3ds06yEuo
         /ytvDqX48WE3wWWPmC5DSbBWcH5wX4s2QLWY/QDEnahjJB8exKo/ZEQVvE3vi/VNK4tx
         m7aMJeL8C8SSenwOwiJhjWXS/8UlD5JPeujDTeoM/a5HqOyaMbtZ3G4QXRLEaNa9Ttdc
         xQYe9Bto/mC8fMQRFwTMWvsewNRryz7hmZiYEC9CxJcYp2oTVo/xieORIP0WNCv85Uej
         5C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/6SfVZWS0YYflq4a4eo7WY9BLDp47JLO2fbdfuvAO0=;
        b=labsB3EfzmyWUQOpITwaKll89T4626/wu2+C8QGK8BqISGwOxflXvd+9u4rDqmibRX
         UOOlyjc6BlDnc/pye0+mM+02O4m/R/x9TiLmthxmxijREHDwiAkY7v7V+x80byIQhbX2
         WE/akYzFT1bQRXBtEHdiOyE+t5JvbAC3/hTawC7wh5bo+pUuh7riQeWspXziMy8xA8LD
         9/KBqCflvx+qAvuZujwBjQ27LurE/KXH94ds0c4lLZCmo3RguwKGQB8zcV1+7bQ5D0z2
         NfuNVPgyAnHfKE1QrF/Ck9F8ewAfN7Z6fWwTRc18fmPI7pMDnH5fR7vJAgFnvJmFP7uU
         H8cA==
X-Gm-Message-State: AOAM5321O0ZCV561smkECRyHVXUA9nci76tvyjhS036/lDahxwLnb5Z5
        EpqMsYeCwXIO1mQ0CVaFBiOASkcCYomqDIlg
X-Google-Smtp-Source: ABdhPJzLhLnvayGj3GI+1wRlJkRK75PhYrGl4BaQF97tmg1P/JadDqGcHRzELsyB12YA/gWsZ2hzKg==
X-Received: by 2002:a5e:8f03:: with SMTP id c3mr8370704iok.115.1625074254758;
        Wed, 30 Jun 2021 10:30:54 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id q19sm12207278ilc.70.2021.06.30.10.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 10:30:54 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] usb: renesas_usbhs: Enable support for more than two clks
Date:   Wed, 30 Jun 2021 12:30:41 -0500
Message-Id: <20210630173042.186394-2-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630173042.186394-1-aford173@gmail.com>
References: <20210630173042.186394-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2 boards expect there to be an external clock reference for
USBHS controller, but this could be set by a programmable clock.
For those devices using a programmable clock, there need to be two
additional clocks beyond the internal reference clocks:

rcar-usb2-clock-sel to specify we using an external clock, and
the external reference clock itself.

Make this driver dynamically enable all the clocks assigned to it
instead of only enabling the first one or two clocks.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 3af91b2b8f76..255e4bd68ed3 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -297,6 +297,8 @@ static bool usbhsc_is_multi_clks(struct usbhs_priv *priv)
 
 static int usbhsc_clk_get(struct device *dev, struct usbhs_priv *priv)
 {
+	unsigned int i;
+
 	if (!usbhsc_is_multi_clks(priv))
 		return 0;
 
@@ -309,11 +311,13 @@ static int usbhsc_clk_get(struct device *dev, struct usbhs_priv *priv)
 	 * To backward compatibility with old DT, this driver checks the return
 	 * value if it's -ENOENT or not.
 	 */
-	priv->clks[1] = of_clk_get(dev_of_node(dev), 1);
-	if (PTR_ERR(priv->clks[1]) == -ENOENT)
-		priv->clks[1] = NULL;
-	else if (IS_ERR(priv->clks[1]))
-		return PTR_ERR(priv->clks[1]);
+	for (i = 1; i < ARRAY_SIZE(priv->clks); i++) {
+		priv->clks[1] = of_clk_get(dev->of_node, i);
+		if (PTR_ERR(priv->clks[i]) == -ENOENT)
+			priv->clks[i] = NULL;
+		else if (IS_ERR(priv->clks[i]))
+			return PTR_ERR(priv->clks[i]);
+	}
 
 	return 0;
 }
-- 
2.25.1

