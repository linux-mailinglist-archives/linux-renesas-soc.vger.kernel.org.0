Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4A5A121176
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfLPROS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:14:18 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:41597 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfLPROS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:14:18 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 13F944000A;
        Mon, 16 Dec 2019 17:14:15 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC 04/11] fixup! arm64: dts: renesas: eagle: Provide MAX9286 GMSL deserialiser
Date:   Mon, 16 Dec 2019 18:16:13 +0100
Message-Id: <20191216171620.372683-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fixes DTC warning:
r8a77970-eagle.dts:236.29-335.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@e66d0000/gmsl-deserializer@48: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index c8cd548b7981..614f8d68d991 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -263,9 +263,6 @@ gmsl: gmsl-deserializer@48 {
 		compatible = "maxim,max9286";
 		reg = <0x48>;
 
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		/* eagle-pca9654-max9286-pwdn */
 		enable-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
 
-- 
2.24.0

