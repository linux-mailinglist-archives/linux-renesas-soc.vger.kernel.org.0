Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6218360953
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 14:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbhDOM0M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 08:26:12 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:55195 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbhDOM0I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 08:26:08 -0400
X-Originating-IP: 93.61.96.190
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 05B881C0004;
        Thu, 15 Apr 2021 12:25:42 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] DNI: arm64: dts: renesas: eagle: Include eagle-gmsl
Date:   Thu, 15 Apr 2021 14:26:02 +0200
Message-Id: <20210415122602.87697-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
References: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Include the eagle-gmsl.dtsi to enable GMSL camera support on the
Eagle-V3M platform.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index ab35202857f5..a87d4b7f17c7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -378,3 +378,11 @@ &scif0 {
 
 	status = "okay";
 };
+
+/* FAKRA Overlay */
+#define GMSL_CAMERA_RDACM21
+#define GMSL_CAMERA_0
+#define GMSL_CAMERA_1
+#define GMSL_CAMERA_2
+#define GMSL_CAMERA_3
+#include "eagle-gmsl.dtsi"
-- 
2.31.1

