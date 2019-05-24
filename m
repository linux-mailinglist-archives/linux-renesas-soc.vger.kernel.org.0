Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 217932A0A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2019 23:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404425AbfEXVux (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 May 2019 17:50:53 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43609 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404376AbfEXVux (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 May 2019 17:50:53 -0400
Received: by mail-ot1-f67.google.com with SMTP id i8so9984573oth.10;
        Fri, 24 May 2019 14:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ynzlr+cR83hUAA2WeJGtfIvhQbY6Sg6aSP8erYIfj6Y=;
        b=jsXpZPzGEBLJMU7xx8ZJ3HRJK7ZfTeQnbePZi7sp7qSr6VOXEoPllSCkKFfRCv/2bi
         Rr5qK+qvr9Z+qKw6tSrnfOY56d7WFF6gBeXqPaKZwzYW3UZUeB0DgOrMOJct1+E6aqqu
         WIfSK99g7ymav4q8kXSFRFXCIjUCFXnkPwYzx3VsXTuhT/kdkOMx+f6R0r67ryVeAdsW
         1HCsyvI20yLG5JfyLhp1GahVxIMj+byoAolZRHwnmX/DLNkak6mxDLIGwjq5ZJLAq5xf
         Co/4EYrTLkpdfI+lN2K8FX3qcMrEdF3n54zXNYo0v0SWTnQ9iwmqBv/wlXVaEvOHdY+G
         PaWw==
X-Gm-Message-State: APjAAAUoZaCQ7FuG9SaLofCueLD3rPUP+AwzSE3WG9y4XG/+lZZpt2Fm
        GXTxpl5uCKNjkl+tPKQkvQ==
X-Google-Smtp-Source: APXvYqwd1FZNRR1eWSNwVVQUfyV8WZFiIrUMukOpXbXBk3+70U5TgvVBrYcUaLEmV6wks6SNl/n4iw==
X-Received: by 2002:a9d:67d8:: with SMTP id c24mr18869642otn.190.1558734652305;
        Fri, 24 May 2019 14:50:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e8sm1275939otk.13.2019.05.24.14.50.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 14:50:51 -0700 (PDT)
Date:   Fri, 24 May 2019 16:50:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v6 7/7] arm64: dts: renesas: r8a774c0-cat874: Enable usb
 role switch support
Message-ID: <20190524215050.GA23538@bogus>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-8-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557922152-16449-8-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 15, 2019 at 01:09:12PM +0100, Biju Das wrote:
> This patch enables TI HD3SS3220 device and support usb role switch
> for the CAT 874 platform.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V5-->V6
>   * No change
> V4-->V5
>   * No change
> V3-->V4
>   * No change
> V2-->V3
>   * Used "renesas,usb-role-switch" instead of generic "usb-role-switch"
>     property
> V1-->V2
>   * New patch
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 39 +++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index b9ae7db..124ed58 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -85,6 +85,34 @@
>  	clock-frequency = <48000000>;
>  };
>  
> +&i2c0 {
> +	status = "okay";
> +	clock-frequency = <100000>;
> +
> +	hd3ss3220@47 {
> +		compatible = "ti,hd3ss3220";
> +		reg = <0x47>;
> +		interrupt-parent = <&gpio6>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			data-role = "dual";
> +		};
> +
> +		port {

port should be a child of 'connector' node. It should also be port #1 if 
this is a SuperSpeed controller. Port #0 is HS.

As there are multiple ports possible, there should be a 'ports' node 
too.

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			hd3ss3220_ep: endpoint@0 {
> +				reg = <0>;

Don't need reg when there is only 1. Build your dtb with W=1 as that 
will tell you this.

> +				remote-endpoint = <&usb3peri_role_switch>;
> +			};
> +		};
> +	};
> +};
> +
>  &i2c1 {
>  	pinctrl-0 = <&i2c1_pins>;
>  	pinctrl-names = "default";
> @@ -175,6 +203,17 @@
>  &usb3_peri0 {
>  	companion = <&xhci0>;
>  	status = "okay";
> +	usb-role-switch;
> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		usb3peri_role_switch: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&hd3ss3220_ep>;
> +		};
> +	};
>  };
>  
>  &xhci0 {
> -- 
> 2.7.4
> 
