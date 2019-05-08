Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 169581754C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 11:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfEHJmg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 05:42:36 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46280 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726544AbfEHJmg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 05:42:36 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B486025AD66;
        Wed,  8 May 2019 19:42:33 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B63109403E0; Wed,  8 May 2019 11:42:31 +0200 (CEST)
Date:   Wed, 8 May 2019 11:42:31 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 10/10] ARM: dts: r7s9210-rza2mevb: Add USB host support
Message-ID: <20190508094230.5j2skmmlkzlmy2ls@verge.net.au>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-11-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190506234631.113226-11-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 06, 2019 at 06:46:31PM -0500, Chris Brandt wrote:
> Enable USB Host support for both the Type-C connector on the CPU board
> and the Type-A plug on the sub board.
> 
> Both boards are also capable of USB Device operation as well after the
> appropriate Device Tree modifications.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  arch/arm/boot/dts/r7s9210-rza2mevb.dts | 37 ++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> index 1eba37db7cdc..79d9d4b4779f 100644
> --- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> @@ -100,6 +100,18 @@
>  		pinmux = <RZA2_PINMUX(PORT5, 4, 3)>,	/* SD1_CD */
>  			 <RZA2_PINMUX(PORT5, 5, 3)>;	/* SD1_WP */
>  	};
> +
> +	usb0_pins: usb0 {
> +		pinmux = <RZA2_PINMUX(PORT5, 2, 3)>,	/* VBUSIN0 */
> +			 <RZA2_PINMUX(PORTC, 6, 1)>,	/* VBUSEN0 */
> +			 <RZA2_PINMUX(PORTC, 7, 1)>;	/* OVRCUR0 */
> +	};
> +
> +	usb1_pins: usb1 {
> +		pinmux = <RZA2_PINMUX(PORTC, 0, 1)>,	/* VBUSIN1 */
> +			 <RZA2_PINMUX(PORTC, 5, 1)>,	/* VBUSEN1 */
> +			 <RZA2_PINMUX(PORT7, 5, 5)>;	/* OVRCUR1 */
> +	};
>  };
>  
>  /* High resolution System tick timers */
> @@ -154,3 +166,28 @@
>  	bus-width = <4>;
>  	status = "okay";
>  };
> +
> +/* USB-0 as Host */
> +/* NOTE: Requires JP3 to be fitted */
> +&usb2_phy0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb0_pins>;
> +	renesas,uses_usb_x1;
> +	dr_mode = "host";
> +	status = "okay";
> +};

Hi Chris,

Please add a space between the usb2_phy0 and ehci0 nodes.
Likewise below between the usb2_phy1 and ehci1 nodes.

Otherwise this patch looks good to me.

> +&ehci0 {
> +	status = "okay";
> +};
> +
> +/* USB-1 as Host */
> +&usb2_phy1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb1_pins>;
> +	renesas,uses_usb_x1;
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +&ehci1 {
> +	status = "okay";
> +};
> -- 
> 2.16.1
> 
