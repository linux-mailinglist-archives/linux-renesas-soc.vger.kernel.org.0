Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5A721D4B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 13:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729303AbgGMLTz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 07:19:55 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:61357 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729613AbgGMLTz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 07:19:55 -0400
X-Halon-ID: c66d4191-c4fa-11ea-8fb8-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id c66d4191-c4fa-11ea-8fb8-005056917f90;
        Mon, 13 Jul 2020 13:19:54 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] dt-bindings: adv7604: Fix documentation for hpd-gpios
Date:   Mon, 13 Jul 2020 13:18:42 +0200
Message-Id: <20200713111844.528313-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713111844.528313-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200713111844.528313-1-niklas.soderlund+renesas@ragnatech.se>
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
2.27.0

