Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 153016613BF
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jan 2023 07:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjAHGEO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Jan 2023 01:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjAHGEN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Jan 2023 01:04:13 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B359818E0D
        for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Jan 2023 22:04:11 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id p24so6107978plw.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Jan 2023 22:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgZ2O2c7uY02sp110jrpcb4sFVag4L5bnVZx1zPM2pI=;
        b=IW2zWqIfbJ6qsS5cqgDH+ted49FOkNroNVcFrpkVcoPl8GKd+1RwKWqzEyepMhcXwx
         u+gr6KXwzGkboxfT4riF2CX1urgg8C34a9iSgadD5M7L1hb4pGKdWuO1JTlkh2FnVXOt
         15v+rOAVummx8A349NdKMYRkS5XdeWUHIQ4EefeM0DFTsGTrWq9eiy8UiI9vUNy0T8F9
         iXCYLlmNw7VcOncr9R/ivAlFC43hjc4ZJfD25eEspNBvvHaKOgYSGHGk2wewL0zcJ+oq
         2i/QGasknTh9UC9ZhK4iLMwdsxSrChabp+i7CkVvSVQAA7NqMWM0kfTOC7oFj0H37yM0
         BSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgZ2O2c7uY02sp110jrpcb4sFVag4L5bnVZx1zPM2pI=;
        b=sw1QmdtvA7oO1wpyd+3uuuwTfwXYNhSrsbpCkyRiuu1OTKra2NUlg3Yaj18MroIa9M
         KTAtwY2JQFbjsp0yLNZkoSGwnJ5uZnEQN8fDEWSyhMaZQ2Ao690VtHsUZIiQqs1nLfYy
         RGpMeWJY9O5n5Y9P2YDP18Z/5VdeSIcK69dw9s7v5SKkhzmpDCco1VUBnMAL+oPISlF0
         aXzCfvXjLuIzmMKmdvw5oFrRpfkiF7y0CWJajNIGbI8avCHpRFggqjEi80X9jziciFBf
         MD2REfd0mpcHEcGGl95x9vR8I5G6W3GghIoYLk9LbTXfXM1/rj0PKbttEf9Ebq8w3u2G
         NnxQ==
X-Gm-Message-State: AFqh2koQEhxk2UxDhyhsAA6oCxF7rN+4E+c1gGgcZp7BfQErAqgn3mUC
        547vjrz+7G6IvdXwdX2pkvg=
X-Google-Smtp-Source: AMrXdXuIhWr4qCAcRzAZ1ind21LDvWzbvvMG909C5Jh3ogz5WeCZFjP7tXUmssARcmq8hOPwya/3XQ==
X-Received: by 2002:a05:6a20:4f1c:b0:b2:8c0b:529c with SMTP id gi28-20020a056a204f1c00b000b28c0b529cmr58171027pzb.54.1673157851160;
        Sat, 07 Jan 2023 22:04:11 -0800 (PST)
Received: from morpheus.home.roving-it.com (91.196.27.211.sta.commander.net.au. [211.27.196.91])
        by smtp.googlemail.com with ESMTPSA id u18-20020a170903125200b001869ba04c83sm3557012plh.245.2023.01.07.22.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 22:04:10 -0800 (PST)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2] drm: rcar-du: depend on DRM_RCAR_DU for components on that SoC
Date:   Sun,  8 Jan 2023 06:04:01 +0000
Message-Id: <20230108060401.391061-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There's a few components in the rcar-du drm directory that
don't make sense to be selectable if DRM_RCAR_DU isn't because
they are part of the IP block so add a dependency and add
compile check to ensure they're still tested.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

v2:
- typo fix in commit message
- s/ARCH_RENESAS/DRM_RCAR_DU

 drivers/gpu/drm/rcar-du/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index b2bddbeca878..362fb6099e9f 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -25,6 +25,7 @@ config DRM_RCAR_CMM
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
 	depends on DRM && OF
+	depends on DRM_RCAR_DU || COMPILE_TEST
 	select DRM_DW_HDMI
 	help
 	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
@@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
 config DRM_RCAR_USE_LVDS
 	bool "R-Car DU LVDS Encoder Support"
 	depends on DRM_BRIDGE && OF
+	depends on DRM_RCAR_DU || COMPILE_TEST
 	default DRM_RCAR_DU
 	help
 	  Enable support for the R-Car Display Unit embedded LVDS encoders.
@@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
 config DRM_RCAR_USE_MIPI_DSI
 	bool "R-Car DU MIPI DSI Encoder Support"
 	depends on DRM_BRIDGE && OF
+	depends on DRM_RCAR_DU || COMPILE_TEST
 	default DRM_RCAR_DU
 	help
 	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
-- 
2.39.0

