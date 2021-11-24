Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C44645C89F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 16:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235915AbhKXPbh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 10:31:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235524AbhKXPbd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 10:31:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FE2C061574;
        Wed, 24 Nov 2021 07:28:22 -0800 (PST)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79FC41B61;
        Wed, 24 Nov 2021 16:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637767699;
        bh=02LZgwJVqB2VPnE+9BTLe+RNzrUDHc/3RCZ0fj/g6uU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GN723sZUzWCfsaGOQUEd/xt3fryZYQxAZbBo8aS0+87xv3t+fdtH0JUWb7+kfTd9u
         eHU8DanbjnSrCK1IoqQtGbE9kbPTHvkK/sN1Q71bziZsX3nuqWdgkj1R2dciDvnuYT
         hGOCXMDrFX8zfZnaptk9AlK/UoocZFbqzXhtxh84=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 2/2] arm64: dts: renesas: salvator-common: Merge hdmi0_con
Date:   Wed, 24 Nov 2021 15:28:15 +0000
Message-Id: <20211124152815.3926961-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211124152815.3926961-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211124152815.3926961-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The remote endpoint for the hdmi connector is specfied through a
reference to the hdmi0_con endpoint, which is in the same file.

Simplify by specifying the remote-endpoint directly in the hdmi0_con
endpoint.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index bf37777dca31..6092dc4531ad 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -97,6 +97,7 @@ hdmi0-out {
 
 		port {
 			hdmi0_con: endpoint {
+				remote-endpoint = <&rcar_dw_hdmi0_out>;
 			};
 		};
 	};
@@ -424,10 +425,6 @@ dw_hdmi0_snd_in: endpoint {
 	};
 };
 
-&hdmi0_con {
-	remote-endpoint = <&rcar_dw_hdmi0_out>;
-};
-
 #ifdef SOC_HAS_HDMI1
 &hdmi1 {
 	status = "okay";
-- 
2.30.2

