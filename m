Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEF24BAB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 16:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfFSOGf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 10:06:35 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36434 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbfFSOGf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 10:06:35 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4F55025AF1B;
        Thu, 20 Jun 2019 00:06:33 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 58D629409FF; Wed, 19 Jun 2019 16:06:31 +0200 (CEST)
Date:   Wed, 19 Jun 2019 16:06:31 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI support
Message-ID: <20190619140631.7jdbobstw7udgahy@verge.net.au>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190619124131.GB21753@pendragon.ideasonboard.com>
 <TY1PR01MB1770B099456BD96D352DF526C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770B099456BD96D352DF526C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 19, 2019 at 12:48:17PM +0000, Fabrizio Castro wrote:
> Hi Laurent,
> 
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Laurent Pinchart
> > Sent: 19 June 2019 13:42
> > Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI support
> > 
> > Hi Fabrizio,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Jun 18, 2019 at 04:18:39PM +0100, Fabrizio Castro wrote:
> > > Add HDMI support to the HiHope RZ/G2[MN] mother board common
> > > dtsi.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > ---
> > > Please note that this patch was tested with a 4K monitor and cma=96M
> > >
> > >  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 62 ++++++++++++++++++++++++++
> > >  1 file changed, 62 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > index 625c3aa..e7568e1 100644
> > > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > @@ -17,6 +17,18 @@
> > >  		stdout-path = "serial0:115200n8";
> > >  	};
> > >
> > > +	hdmi0-out {
> > > +		compatible = "hdmi-connector";
> > > +		label = "HDMI0 OUT";
> > 
> > Is the label physically present on the device (printed on the board or
> > the case) ?
> 
> I am afraid it's not. Shall I send a v2? Or perhaps Simon could take it out while applying?

Thanks,

I have removed the label attribute when queuing this patch up for v5.3.
The result is as follows:

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Date: Tue, 18 Jun 2019 16:18:39 +0100
Subject: [PATCH] arm64: dts: renesas: hihope-common: Add HDMI support

Add HDMI support to the HiHope RZ/G2[MN] mother board common
dtsi.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 61 ++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 625c3aaead14..9f05e80cee10 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -17,6 +17,17 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi0-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con: endpoint {
+				remote-endpoint = <&rcar_dw_hdmi0_out>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -82,6 +93,30 @@
 		states = <3300000 1
 			  1800000 0>;
 	};
+
+	x302_clk: x302-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <33000000>;
+	};
+
+	x304_clk: x304-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&versaclock5 1>,
+		 <&x302_clk>,
+		 <&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.2",
+		      "dclkin.0", "dclkin.1", "dclkin.2";
+	status = "okay";
 };
 
 &ehci0 {
@@ -109,11 +144,37 @@
 	};
 };
 
+&hdmi0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi0_con>;
+			};
+		};
+	};
+};
+
 &hsusb {
 	dr_mode = "otg";
 	status = "okay";
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	versaclock5: clock-generator@6a {
+		compatible = "idt,5p49v5923";
+		reg = <0x6a>;
+		#clock-cells = <1>;
+		clocks = <&x304_clk>;
+		clock-names = "xin";
+	};
+};
+
 &ohci0 {
 	status = "okay";
 };
-- 
2.11.0

