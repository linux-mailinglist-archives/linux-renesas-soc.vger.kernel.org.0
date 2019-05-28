Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9893A2C877
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 16:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfE1ONa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 10:13:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48982 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfE1ONa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 10:13:30 -0400
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi [85.76.65.42])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 864F0D85;
        Tue, 28 May 2019 16:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559052808;
        bh=/wU7lbmDipkoxcZKpe+dYn6kGSHkpaEPfCDQ9qFEtMk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eXkb5x6ePcSyfj5NCHmDLiNENWMM/DXHjqR3dh2ZvSQTl/QdxQGLp7VXusdbJ/lGO
         S9ZsR0XNEC+ILPukzhi9VfNXwTp7rl57ws/+yAjrFdUy++mS0wy7Z7KaupytQ8d2DO
         Ut4GQ0QQuoOcKobeRzVsBDs4lBaqYL1Ec8ilVHoo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its companion LVDS1
Date:   Tue, 28 May 2019 17:12:32 +0300
Message-Id: <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the new renesas,companion property to the LVDS0 node to point to the
companion LVDS encoder LVDS1.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 56cb566ffa09..7cf5963eb3ba 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1801,6 +1801,8 @@
 			resets = <&cpg 727>;
 			status = "disabled";
 
+			renesas,companion = <&lvds1>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 5bf3af246e14..94b5177eb152 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1038,6 +1038,8 @@
 			resets = <&cpg 727>;
 			status = "disabled";
 
+			renesas,companion = <&lvds1>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
Regards,

Laurent Pinchart

