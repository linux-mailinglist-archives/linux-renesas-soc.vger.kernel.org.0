Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6E523534C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Aug 2020 18:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgHAQSu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Aug 2020 12:18:50 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:37616 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727849AbgHAQSu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Aug 2020 12:18:50 -0400
X-Halon-ID: add390c9-d412-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id add390c9-d412-11ea-933e-005056917a89;
        Sat, 01 Aug 2020 18:18:48 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: adv7604: Fix documentation for hpd-gpios
Date:   Sat,  1 Aug 2020 18:18:23 +0200
Message-Id: <20200801161825.96837-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200801161825.96837-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200801161825.96837-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As of [1] the hpd-gpios property is optional, document it as such.

1. commit 269bd1324fbfaa52 ("[media] media: adv7604: improve usage of gpiod API")

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/adv7604.txt | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
index b3e688b77a38cb6d..8c7cdc7cd7aaebc8 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
@@ -19,10 +19,6 @@ Required Properties:
     slave device on the I2C bus. The main address is mandatory, others are
     optional and revert to defaults if not specified.
 
-  - hpd-gpios: References to the GPIOs that control the HDMI hot-plug
-    detection pins, one per HDMI input. The active flag indicates the GPIO
-    level that enables hot-plug detection.
-
 The device node must contain one 'port' child node per device input and output
 port, in accordance with the video interface bindings defined in
 Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
@@ -37,6 +33,9 @@ The digital output port node must contain at least one endpoint.
 
 Optional Properties:
 
+  - hpd-gpios: References to the GPIOs that control the HDMI hot-plug
+    detection pins, one per HDMI input. The active flag indicates the GPIO
+    level that enables hot-plug detection.
   - reset-gpios: Reference to the GPIO connected to the device's reset pin.
   - default-input: Select which input is selected after reset.
   - reg-names : Names of maps with programmable addresses.
-- 
2.28.0

