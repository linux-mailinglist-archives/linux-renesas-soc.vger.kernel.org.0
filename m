Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E22118500D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2020 21:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbgCMUSF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Mar 2020 16:18:05 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40212 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbgCMUSF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Mar 2020 16:18:05 -0400
Received: by mail-lf1-f68.google.com with SMTP id j17so8896229lfe.7;
        Fri, 13 Mar 2020 13:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BOrKdqp0xX849tkbGYoL5GifZ0fJWuSnmKvneHoBEPI=;
        b=SFHap9SA3MQWq/rDzTcpj95GukhT+WmakBXzY2/W/iVbaG3CYS78HgdDNCnklu2dLE
         kFU0QDG9SImIs7hlVZiJyUAgm7YUizziMveCoCVIzJ9O8cqrKgolPpoV6am7DfhU89XJ
         ltxCH8nvbIYs393MHpsDO6BhvtaKdvLKO1cCTYQMgnrpgZsHazgpH66LACi+70HhiJ6l
         AJYv+s/W3gch6gNZXXxxbLFCll+TfRRcrcTxa5xQeHRhtYaQSbszeLTX6zP5G5Jz7Jm/
         gUDVBMvSktGH2MZ2dnKv8dJAIQub63dYzfpzuua04+X6h9+JvUqOMVK/Ctt+DZXCV3Yi
         OCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=BOrKdqp0xX849tkbGYoL5GifZ0fJWuSnmKvneHoBEPI=;
        b=eyu5ID4zDDgdhfjo5oFagTZ12Fcxx7AdJolwno7zs4Xk0FKb7XNrYtJth53MqgezcB
         VuwA1Lsw3yxhkObQnOZM+5stDp8vWZ/KJ/T1HQR1wKcVehoTeACjmfoWI8GEpsiGt3hw
         wfXgH8vwvd2DRupaVTsOfRiDfZPD26JKXY7fj8lr6plat6sCFDiFd5TbKZ4jpuGgZETV
         xGu+WQo2ua+CeJJN4Sznn+cg7o8RnPbce9hA2aXAzp7eshx25eI8ILaoRGIHo/MtXFK1
         HuwzBaC8pQlzW/oXCa0pCMPClhAxI5ZveeSG0RAVtXmZd3xpV+/NUpfo/NMDnImTdNx/
         I5UA==
X-Gm-Message-State: ANhLgQ3SCSAbWlJcJMBQsi+dL93fdjbOjd2jXastSQ5n3hsfeGwyNEnf
        y7EzhA9sukshzpmjhNp3th4=
X-Google-Smtp-Source: ADFU+vuWMe8I2528Uyu2tKaIGPqCCGIWF6uu2OphKJd6rnCU8MYCRJ3bIyFwbbl07L6oMFBFxGQoig==
X-Received: by 2002:a19:7d04:: with SMTP id y4mr9463704lfc.111.1584130682588;
        Fri, 13 Mar 2020 13:18:02 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id v10sm30774074lfb.61.2020.03.13.13.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 13:18:01 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        amd-gfx@lists.freedesktop.org,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Jose Roberto de Souza <jose.souza@intel.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v1 3/3] drm/atmel-hlcdc: Use drm_encoder_init()
Date:   Fri, 13 Mar 2020 21:17:44 +0100
Message-Id: <20200313201744.19773-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313201744.19773-1-sam@ravnborg.org>
References: <20200313201744.19773-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

atmel-hlcdc has no need to extend the functionality of the
encoder, so use drm_encoder_init().

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index a845d587c315..96e0d85748d2 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -22,10 +22,6 @@ struct atmel_hlcdc_rgb_output {
 	int bus_fmt;
 };
 
-static const struct drm_encoder_funcs atmel_hlcdc_panel_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static struct atmel_hlcdc_rgb_output *
 atmel_hlcdc_encoder_to_rgb_output(struct drm_encoder *encoder)
 {
@@ -98,9 +94,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 		return -EINVAL;
 	}
 
-	ret = drm_encoder_init_funcs(dev, &output->encoder,
-				     &atmel_hlcdc_panel_encoder_funcs,
-				     DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_encoder_init(dev, &output->encoder, DRM_MODE_ENCODER_NONE);
 	if (ret)
 		return ret;
 
-- 
2.20.1

