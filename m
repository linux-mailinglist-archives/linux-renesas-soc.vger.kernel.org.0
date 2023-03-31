Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367766D221F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Mar 2023 16:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbjCaOMl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 Mar 2023 10:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbjCaOMl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Mar 2023 10:12:41 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB141D846
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Mar 2023 07:12:39 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id eg48so90034289edb.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Mar 2023 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680271958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWblS21f7MwbeFDcHXvf6ZN7vsvR3dKGxsNxsmvhTTE=;
        b=4e1Tz8QxaCs0PDKXbLxXj0VBT8Oz6YSmzrxYTzW5CkEYI/EiRP5Sqa0o87ItGvFxFF
         tldh+MVUg33kKa8INHXnjHKJxup8r6ETNoQ7/Rf5lDjzuLq1jNiXAify7MZUsx5J9GrE
         8Cv78Me7YDssFtng3bIlGYuHTkynucrUn39QaJmcp0mUCCnCZNpmE2lunOFaFOYwxE5J
         +toiXubxfuCIrBAB+rfXP4OmufmvMouu6+YtJexc5TRSyQ9k/O+141W2+IU4tYCUb5kn
         94QgtGy8hc/yluw9MtUv4R3kQWqAyBROB+h1Q7b1eAB9oL2UNC01M5S67lhb0hBoR6hw
         cJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680271958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWblS21f7MwbeFDcHXvf6ZN7vsvR3dKGxsNxsmvhTTE=;
        b=gSHaOAckxOTylTiGYSirjKRC+FxY0/0YERayglySJACMq84NpRUxdGaH2ZG8sNVpou
         q1S92ToiNrcwQd+N2TXkfOHrRa/3oPgTuVqwekf16EygUrGuxbEGQ8v459fRtoVMY/bg
         bBrc6VBDNuexj8ipXSZMMu3YgpkJvMNYR1ocUlw59jes0Rd7/UHhuxsON0klq9xPxlMU
         gCwjVb8YSaf0+Emv1mNyGduNy+1/oPlu02pAg5W9B5HxBASGWk+wsBKCYKNcQH/ZkAye
         fv3iN2Vy0blj4ogHDIcKGz9Di//UO03oWtF7JLTx27PzcONUILQenbEIKT0CzEdU3k+1
         Zvug==
X-Gm-Message-State: AAQBX9eXfZnqNSYSGaQ/kGY40+WKE56cWyBGxTTEbY6fhl+R95J87cdl
        Aw71dk9Zt16hB2iFaqiMmzQMhw==
X-Google-Smtp-Source: AKy350ZFp71i8e1Ppu4KWJhAnOa9mr+2nxnr3Rey851kGN7Ef4Q+VHxPP0z4zAh2jUzJA4CdtzdDow==
X-Received: by 2002:a17:906:9485:b0:933:c052:a277 with SMTP id t5-20020a170906948500b00933c052a277mr27731867ejx.12.1680271957867;
        Fri, 31 Mar 2023 07:12:37 -0700 (PDT)
Received: from sleipner.berto.se (p54ac5f91.dip0.t-ipconnect.de. [84.172.95.145])
        by smtp.googlemail.com with ESMTPSA id gw6-20020a170906f14600b009334edaed98sm1016557ejb.50.2023.03.31.07.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 07:12:37 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dt-bindings: i2c: maxim,max96712: Require setting bus-type property
Date:   Fri, 31 Mar 2023 16:10:32 +0200
Message-Id: <20230331141032.3817866-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The MAX96712 can support both CSI-2 C-PHY and D-PHY bus. Document the
supported bus-types and make the property mandatory.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Hi,

This is done in conjunction with adding C-PHY support to the driver,
patches on list. The current driver only supports D-PHY so this was
assumed in the driver.

There is a single user of this binding, r8a779a0-falcon-csi-dsi.dtsi. A
separate patch to update that binding with a bus-type property is be
submitted.

Without the property present the driver fall-back to D-PHY (even with
the C-PHY work applied). So this change is backward compatible with old
versions of the only effected DTS file.
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 444f24838d3d..fccbf287ff79 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -65,9 +65,14 @@ properties:
 
             properties:
               data-lanes: true
+              bus-type:
+                enum:
+                  - 1 # CSI-2 C-PHY
+                  - 4 # CSI-2 D-PHY
 
             required:
               - data-lanes
+              - bus-type
 
     required:
       - port@4
@@ -82,6 +87,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
 
     i2c@e6508000 {
             #address-cells = <1>;
@@ -101,6 +107,7 @@ examples:
                             port@4 {
                                     reg = <4>;
                                     max96712_out0: endpoint {
+                                            bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
                                             clock-lanes = <0>;
                                             data-lanes = <1 2 3 4>;
                                             remote-endpoint = <&csi40_in>;
-- 
2.40.0

