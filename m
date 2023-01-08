Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42346661396
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jan 2023 05:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjAHEcD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Jan 2023 23:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbjAHEb6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Jan 2023 23:31:58 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8483E13CC5
        for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Jan 2023 20:31:56 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id n12so5535117pjp.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Jan 2023 20:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQcbv0fVqINYjCu2Urro0sAqFZH0EtVLvVWe9v4/BO0=;
        b=On/CuKsWVc21aXJuPlUiYlbdF/UabyUSce6mN4AP/KgtdiIJac6z3AvaPypTyhD914
         Fz4wKtbeJykThfK2QFNPCOdpyqDEtnRY/WTOIzGy/lxinTouAQLPgiQPHnodYev2JKXt
         rmx58KcknfXw7IW/7+mFWmihDIai8iGYGrdBkoKmHTGK31Ur2bHGFp1wGOYmd1BpOI4d
         TtN2j4akKegga1x1jqs0vUaLWCql/fh24QUeQNffvvXUf7ljDFmI+unAG8DTtd7M4cm5
         cIHHmJN1ns0N8+h11edzinYkqAvqlI2ifIBhFSxG4W5v/jaZmMSz6K3AD55n+GTWYyDB
         RmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQcbv0fVqINYjCu2Urro0sAqFZH0EtVLvVWe9v4/BO0=;
        b=VMQJJfSCUnL5rriMVYYV/E/0rfA8KTanY2PXwmtkLo8tLuCPntwFFKSOuhhC3ID9JS
         G2r/ba8Y/p3vM6p0Y9OChx35LFN2pbEP0+YPKn58uSvNmxU5b6ibTADukX3Y43iIIsv6
         DADppwpiewq2a3G2WVmcREzBMcA26j0MsN1he9oiYuo38icz1b1EMFgC+7lP5mea98nQ
         K+/XePuv4LnLsNZi+5LkUEM8SMTskEq6O+JNmlTkVdt/wM1a9GJkhIX/RweqEA+aknm5
         O+KTNk0gbG0PCr8eGj3A5yzR9aRfVPqI0Y/AScc0S3a87T4zKN7X2eDsIwlENkqjR1sQ
         IkhA==
X-Gm-Message-State: AFqh2krsaUjsphwfsXqjIQ/uC4pV8qK3iw8wJX7s07gKKUzuSSoVaQbJ
        nxCkw6LBMbeu8DZ74v8QS4xXt8VUt9p6uQ==
X-Google-Smtp-Source: AMrXdXsT16Rn4k6cTMhyLA23I+EmeMHXxmqs+DNboZgxbO6GKYdJ1LNgWEBTSHISPeO3HbBhENxuKA==
X-Received: by 2002:a05:6a20:2a94:b0:9d:efc0:76 with SMTP id v20-20020a056a202a9400b0009defc00076mr92438306pzh.30.1673152316013;
        Sat, 07 Jan 2023 20:31:56 -0800 (PST)
Received: from morpheus.home.roving-it.com ([60.231.56.234])
        by smtp.googlemail.com with ESMTPSA id l9-20020a170903120900b00188a908cbddsm3426046plh.302.2023.01.07.20.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 20:31:55 -0800 (PST)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] drm: rcar-du: depend on ARCH_RENESAS for components on that SoC
Date:   Sun,  8 Jan 2023 04:31:47 +0000
Message-Id: <20230108043147.346349-1-pbrobinson@gmail.com>
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
don't make sense to be slectedable if ARCH_RENESAS isn't because
they are part of those SoCs so add a dependency and add compile
check to ensure they're still tested.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index b2bddbeca878..4d2bff78a559 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -25,6 +25,7 @@ config DRM_RCAR_CMM
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
 	depends on DRM && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
 	select DRM_DW_HDMI
 	help
 	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
@@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
 config DRM_RCAR_USE_LVDS
 	bool "R-Car DU LVDS Encoder Support"
 	depends on DRM_BRIDGE && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
 	default DRM_RCAR_DU
 	help
 	  Enable support for the R-Car Display Unit embedded LVDS encoders.
@@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
 config DRM_RCAR_USE_MIPI_DSI
 	bool "R-Car DU MIPI DSI Encoder Support"
 	depends on DRM_BRIDGE && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
 	default DRM_RCAR_DU
 	help
 	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
-- 
2.39.0

