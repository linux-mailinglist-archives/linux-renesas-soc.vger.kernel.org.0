Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 962636D222A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Mar 2023 16:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbjCaOPK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 Mar 2023 10:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbjCaOPI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Mar 2023 10:15:08 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC1B59F8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Mar 2023 07:15:06 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id w9so90180748edc.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Mar 2023 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680272105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BrDsTrd9KLSKSQ6OxEMuUpt1ePO+mhfnRW2i0VPJRgc=;
        b=ZuQT6y3yFUt85bdxbIWWROiKnCvK3VV/RjDdbfxwqJIt7uH97Mq2bmWl3zLS9DnOT/
         IwmoMdIayeo9WHaOuOaSEYI3rDzVrHYDQ17qCt/h26UToeu/R0ELvKI5ozPEVZ9fOTj7
         sNOXlVW1ERUCYijleEFU6X7QPLMshZKDAw0KmvgYINn0yqtJqqI78L5bIJdS2RCzlIdT
         XFe0liwhLC6w8YvVrteoyaLNdMYRx4p6vAlbVTji+Bm1yvwgzgpNr3zwegYrW1TsKFop
         DZkVyzFqM3lmxcp0xgm4hA/mBE7fPhmYiwdTLeTNltxvbWzuMS/Y3mgnOtVe/yAK6Vmf
         vPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680272105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BrDsTrd9KLSKSQ6OxEMuUpt1ePO+mhfnRW2i0VPJRgc=;
        b=GrRBmuUiVFErB4K1LY43QEw96fw7tW2u74OtovH7032tvOWXA+wzl85hC1+NjqR0Nu
         oOoH9m61qpJxl1NGg8ebfa88f0IfSkwl2vXxwtJzVeF6ragbkZ9cPQTFMU6R9lU0POs9
         gwMrHG1QaIZNv2YYIoNkmavc/04P79tlFwJC17g0w0IW/+egR1/pCdQmZUR7oKFrQ1Vl
         7OU7PBPmIVucfJjz8RDHEfpXsH6BfElkJAV7wwmSz6I+Txv8Ki0IZKjtG45eZXI4LfGl
         Ghz3tOS2Zje+oZ+unGdKxgMuXFSVZstP82ieGOFKEz8n3m0z0n414ksCfsSoOy4Xm339
         7bZA==
X-Gm-Message-State: AAQBX9dasvZfTPlFqJdaiXale7+yIE+HPg4cVgnUwnwko2x2/lnlpHmg
        b/IDfJbqMHksS5mF8eTsB96WCNZdHfw3b8nJapVSag==
X-Google-Smtp-Source: AKy350Z+gXpGii5gahXuX3oDqtk0AjVPREHuyk10DGZ+AflGwfFulzo1cA5bctLqtSKMgT6IrjPhIg==
X-Received: by 2002:a17:906:f754:b0:92e:fcc9:aa22 with SMTP id jp20-20020a170906f75400b0092efcc9aa22mr9794906ejb.37.1680272105262;
        Fri, 31 Mar 2023 07:15:05 -0700 (PDT)
Received: from sleipner.berto.se (p54ac5f91.dip0.t-ipconnect.de. [84.172.95.145])
        by smtp.googlemail.com with ESMTPSA id kx6-20020a170907774600b009310d4dece9sm1012276ejc.62.2023.03.31.07.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 07:15:04 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: falcon-csi-dsi: Set bus-type for MAX96712
Date:   Fri, 31 Mar 2023 16:14:31 +0200
Message-Id: <20230331141431.3820311-1-niklas.soderlund+renesas@ragnatech.se>
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

Specify the bus-type property for all three connected MAX96712.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
index e06b8eda85e1..dbc8dcab109d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
@@ -5,6 +5,8 @@
  * Copyright (C) 2021 Glider bv
  */
 
+#include <dt-bindings/media/video-interfaces.h>
+
 &csi40 {
 	status = "okay";
 
@@ -105,6 +107,7 @@ ports {
 			port@4 {
 				reg = <4>;
 				max96712_out0: endpoint {
+					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
 					clock-lanes = <0>;
 					data-lanes = <1 2 3 4>;
 					remote-endpoint = <&csi40_in>;
@@ -125,6 +128,7 @@ ports {
 			port@4 {
 				reg = <4>;
 				max96712_out1: endpoint {
+					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
 					clock-lanes = <0>;
 					data-lanes = <1 2 3 4>;
 					lane-polarities = <0 0 0 0 1>;
@@ -146,6 +150,7 @@ ports {
 			port@4 {
 				reg = <4>;
 				max96712_out2: endpoint {
+					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
 					clock-lanes = <0>;
 					data-lanes = <1 2 3 4>;
 					lane-polarities = <0 0 0 0 1>;
-- 
2.40.0

