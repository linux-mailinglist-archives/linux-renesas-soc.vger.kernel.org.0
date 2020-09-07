Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3167525F1E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 05:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgIGC77 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 6 Sep 2020 22:59:59 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:33104 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726323AbgIGC77 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Sep 2020 22:59:59 -0400
Date:   07 Sep 2020 11:59:58 +0900
X-IronPort-AV: E=Sophos;i="5.76,400,1592838000"; 
   d="scan'208";a="56314885"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Sep 2020 11:59:58 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1403E4179B94;
        Mon,  7 Sep 2020 11:59:58 +0900 (JST)
Message-ID: <87ft7u70qm.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 9/9] arm64: dts: renesas: r8a77961-salvator-xs: add HDMI Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        (Renesas) shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
In-Reply-To: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch enables HDMI Sound on R-Car M3-W+ Salvator-XS board.
This patch is test on R-Car M3-W+ Salvator-XS board.

This reverts commit b997613fad58a03588f0f64a3d86db6c5bd76dd2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../boot/dts/renesas/r8a77961-salvator-xs.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
index ca21a702db54..1e7603365106 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
@@ -51,9 +51,38 @@ rcar_dw_hdmi0_out: endpoint {
 				remote-endpoint = <&hdmi0_con>;
 			};
 		};
+		port@2 {
+			reg = <2>;
+			dw_hdmi0_snd_in: endpoint {
+				remote-endpoint = <&rsnd_endpoint1>;
+			};
+		};
 	};
 };
 
 &hdmi0_con {
 	remote-endpoint = <&rcar_dw_hdmi0_out>;
 };
+
+&rcar_sound {
+	ports {
+		/* rsnd_port0 is on salvator-common */
+		rsnd_port1: port@1 {
+			reg = <1>;
+			rsnd_endpoint1: endpoint {
+				remote-endpoint = <&dw_hdmi0_snd_in>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint1>;
+				frame-master = <&rsnd_endpoint1>;
+
+				playback = <&ssi2>;
+			};
+		};
+	};
+};
+
+&sound_card {
+	dais = <&rsnd_port0	/* ak4613 */
+		&rsnd_port1>;	/* HDMI0  */
+};
-- 
2.25.1

