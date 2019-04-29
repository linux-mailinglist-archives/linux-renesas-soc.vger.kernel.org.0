Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E84FDD87
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 10:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbfD2IRx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 04:17:53 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:32876 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbfD2IRx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 04:17:53 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2276925B783;
        Mon, 29 Apr 2019 18:17:50 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1D1BC940376; Mon, 29 Apr 2019 10:17:48 +0200 (CEST)
Date:   Mon, 29 Apr 2019 10:17:48 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>,
        magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tfranzen@de.adit-jv.com,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] arm64: dts: ulcb-kf: Add support for TI WL1837
Message-ID: <20190429081747.irznig7yrvztuc5x@verge.net.au>
References: <20190411124102.22442-1-spapageorgiou@de.adit-jv.com>
 <20190425111245.GA7258@vmlxhi-102.adit-jv.com>
 <20190426095012.xzyzevvmom4fzdcd@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190426095012.xzyzevvmom4fzdcd@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi again,

I have been able to solicit a limited private review of this patch and
have gone ahead and applied it for inclusion in v5.2.

On Fri, Apr 26, 2019 at 11:50:12AM +0200, Simon Horman wrote:
> Hi,
> 
> from my point of view what is required is a review.
> I will try to find someone to do so.
> I apologise for not doing so earlier.
> 
> On Thu, Apr 25, 2019 at 01:12:45PM +0200, Eugeniu Rosca wrote:
> > Hi Simon,
> > 
> > Do we have any chance getting this upstream? If so, would you kindly
> > list the acceptance criteria we have to conform to?
> > 
> > Many thanks.
> > 
> > On Thu, Apr 11, 2019 at 02:41:03PM +0200, Spyridon Papageorgiou wrote:
> > > This patch adds description of TI WL1837 and links interfaces
> > > to communicate with the IC, namely the SDIO interface to WLAN.
> > > 
> > > Signed-off-by: Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>
> > > ---
> > >  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 49 ++++++++++++++++++++++++++++++++
> > >  1 file changed, 49 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> > > index 7a09576..27851a7 100644
> > > --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> > > @@ -38,6 +38,18 @@
> > >  		regulator-min-microvolt = <5000000>;
> > >  		regulator-max-microvolt = <5000000>;
> > >  	};
> > > +
> > > +	wlan_en: regulator-wlan_en {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "wlan-en-regulator";
> > > +
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +
> > > +		gpio = <&gpio_exp_74 4 GPIO_ACTIVE_HIGH>;
> > > +		startup-delay-us = <70000>;
> > > +		enable-active-high;
> > > +	};
> > >  };
> > >  
> > >  &can0 {
> > > @@ -88,6 +100,13 @@
> > >  			line-name = "Audio_Out_OFF";
> > >  		};
> > >  
> > > +		sd-wifi-mux {
> > > +			gpio-hog;
> > > +			gpios = <5 GPIO_ACTIVE_HIGH>;
> > > +			output-low;	/* Connect WL1837 */
> > > +			line-name = "SD WiFi mux";
> > > +		};
> > > +
> > >  		hub_pwen {
> > >  			gpio-hog;
> > >  			gpios = <6 GPIO_ACTIVE_HIGH>;
> > > @@ -254,6 +273,12 @@
> > >  		function = "scif1";
> > >  	};
> > >  
> > > +	sdhi3_pins: sdhi3 {
> > > +		groups = "sdhi3_data4", "sdhi3_ctrl";
> > > +		function = "sdhi3";
> > > +		power-source = <3300>;
> > > +	};
> > > +
> > >  	usb0_pins: usb0 {
> > >  		groups = "usb0";
> > >  		function = "usb0";
> > > @@ -273,6 +298,30 @@
> > >  	status = "okay";
> > >  };
> > >  
> > > +&sdhi3 {
> > > +	pinctrl-0 = <&sdhi3_pins>;
> > > +	pinctrl-names = "default";
> > > +
> > > +	vmmc-supply = <&wlan_en>;
> > > +	vqmmc-supply = <&wlan_en>;
> > > +	bus-width = <4>;
> > > +	no-1-8-v;
> > > +	non-removable;
> > > +	cap-power-off-card;
> > > +	keep-power-in-suspend;
> > > +	max-frequency = <26000000>;
> > > +	status = "okay";
> > > +
> > > +	#address-cells = <1>;
> > > +	#size-cells = <0>;
> > > +	wlcore: wlcore@2 {
> > > +		compatible = "ti,wl1837";
> > > +		reg = <2>;
> > > +		interrupt-parent = <&gpio1>;
> > > +		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> > > +	};
> > > +};
> > > +
> > >  &usb2_phy0 {
> > >  	pinctrl-0 = <&usb0_pins>;
> > >  	pinctrl-names = "default";
> > > -- 
> > > 2.7.4
> > > 
> > 
> > -- 
> > Best regards,
> > Eugeniu.
> > 
> 
