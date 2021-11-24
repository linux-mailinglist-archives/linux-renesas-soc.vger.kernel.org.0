Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CB845C89A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 16:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235312AbhKXPbb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 10:31:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhKXPbb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 10:31:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744F2C061714;
        Wed, 24 Nov 2021 07:28:21 -0800 (PST)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1034C1224;
        Wed, 24 Nov 2021 16:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637767699;
        bh=z+n5AUf8FsH418h2jFZiGxvObpRLs/gCLd1tda7U2ls=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RA2N1WL97Kaa77N+qU94cLrktBT8mYEQe6SllUltsEczvkmUgVUdCZ0z20O4sLGMR
         1xtPeCugvZ+gIh7Z5Ao+4RYJ7nGpkGH9V88xo90TRPpebAkv+SVqXrPpsdO/KMnF3r
         SL00zXOKN+S67hgT3pjlyv7LyyO0YeGCOoNDepfc=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/2] arm64: dts: renesas: ulcb: Merge hdmi0_con
Date:   Wed, 24 Nov 2021 15:28:14 +0000
Message-Id: <20211124152815.3926961-2-kieran.bingham+renesas@ideasonboard.com>
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
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 7edffe7f8cfa..a7e93df4ced8 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -48,6 +48,7 @@ hdmi0-out {
 
 		port {
 			hdmi0_con: endpoint {
+				remote-endpoint = <&rcar_dw_hdmi0_out>;
 			};
 		};
 	};
@@ -199,10 +200,6 @@ dw_hdmi0_snd_in: endpoint {
 	};
 };
 
-&hdmi0_con {
-	remote-endpoint = <&rcar_dw_hdmi0_out>;
-};
-
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
-- 
2.30.2

