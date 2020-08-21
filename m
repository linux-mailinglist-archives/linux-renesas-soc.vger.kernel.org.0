Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9CE824DF54
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 20:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgHUSUY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 14:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgHUSUV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 14:20:21 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D6BC061575
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2020 11:20:20 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w14so2867713ljj.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2020 11:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Fmr7vWLbcAJsXP0YXk7CIiVY7znnA1prOK2jFX+ggUc=;
        b=YZHA97Hkwr/oO7ID/UCj9O2C2Y/NWN5GMgh8UxwejbLK+n3AbGbKLWbGrSQl4HgdIv
         juWu4ZhP8ZCz+cE2i9TfFe4PWvOtRI0QStb9Rv1pVnm6bl0/RttFa/Fsf0yG5UTlnoIM
         g8v7W2+GPUZL03AE127Fpy3ginYSmRvP6GyVi8FoYMgHf5iHBWjE/3EvGcp94XqNgCGd
         AeNKpgzI/KxpaMij4p4CL06Os8wBAzbv4STO/+T6l7eHvZPO8I2Shqlw7hlgeuZM6BBB
         eyUDi0CCUYfBMN8c7qukU12icYUV3irNLDamKKkg4RUjJt7/qTO9eSy1cj5X9ofiibg/
         194g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Fmr7vWLbcAJsXP0YXk7CIiVY7znnA1prOK2jFX+ggUc=;
        b=XOo5qjl6U1MXwgByfoUfOf2Jx88pg8tC+20gOV9xgaJtgFUfCc5xti+W75lqKugSWl
         4/yiADQHv7OBPZPx9VzIy7O7S2GMxkkx2gajM4C2XZKJYBQETySXZ3sF6scHg1rCgDQd
         7+PuunUvab5i9UbXOqOGp2DCbYFr4bB5TLx920jvN5mVbaxkl2C5J1c2/ACWUrkOyLHe
         V4wcxaWh/FVP6rq1V0Rfvpom8D4rzHKdwLXbeVMVIXIZtsjsC+tuaTlSa+WTLJmg33F1
         xTtzsaZqi9aPbyCrruh+NVkOOvPBqFiOPxwQFmJrHwxhJMZzzngh2QnRHZAZqore8zuL
         xlWQ==
X-Gm-Message-State: AOAM531ncS1xTjlfEoIq0OS3tbQWJpjtcwTCodSSRm7QlRXwwDd60nr8
        VOK4iw60L8D5T+Nu07TwHVtf4Q==
X-Google-Smtp-Source: ABdhPJy+G8ERNP5mgenwD9E2DAXhDoCXOcno+itf4p0DuvN2zCA8LYW0qmSkbRHJRG9Wu8vvrBJjiw==
X-Received: by 2002:a2e:b619:: with SMTP id r25mr2257693ljn.220.1598034018932;
        Fri, 21 Aug 2020 11:20:18 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 14sm529956lfr.17.2020.08.21.11.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 11:20:18 -0700 (PDT)
Date:   Fri, 21 Aug 2020 20:20:17 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: Fix pin controller node names
Message-ID: <20200821182017.GB69748@oden.dyn.berto.se>
References: <20200821112433.5652-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200821112433.5652-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2020-08-21 13:24:33 +0200, Geert Uytterhoeven wrote:
> According to Devicetree Specification v0.2 and later, Section "Generic
> Names Recommendation", the node name for a pin controller device node
> should be "pinctrl".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.10.
> 
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 +-
>  12 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index ed99863f1dd09fd0..0806446228ec8f14 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -408,7 +408,7 @@
>  			resets = <&cpg 905>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a774a1";
>  			reg = <0 0xe6060000 0 0x50c>;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> index 1c76de24d3ea4844..40d87baa2431edfe 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> @@ -282,7 +282,7 @@
>  			resets = <&cpg 905>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a774b1";
>  			reg = <0 0xe6060000 0 0x50c>;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 9fdca4c55ba95608..f2a93f83781dba04 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -256,7 +256,7 @@
>  			resets = <&cpg 906>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a774c0";
>  			reg = <0 0xe6060000 0 0x508>;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> index 415727c9f23200dd..c4cd05470ed7e19d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -427,7 +427,7 @@
>  			resets = <&cpg 905>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a774e1";
>  			reg = <0 0xe6060000 0 0x50c>;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> index 1b1a014c829a2e2a..644308dd886c4baa 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> @@ -490,7 +490,7 @@
>  			resets = <&cpg 905>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a7795";
>  			reg = <0 0xe6060000 0 0x50c>;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> index e6c88a748692b212..53b9aa26c9b13fa7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -459,7 +459,7 @@
>  			resets = <&cpg 905>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a7796";
>  			reg = <0 0xe6060000 0 0x50c>;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index 6fdc28a6d2cf0354..3ff2729528aeaeab 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -448,7 +448,7 @@
>  			resets = <&cpg 905>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a77961";
>  			reg = <0 0xe6060000 0 0x50c>;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 6206e28f37efae73..bfffc5b6104e2dfc 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -329,7 +329,7 @@
>  			resets = <&cpg 905>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a77965";
>  			reg = <0 0xe6060000 0 0x50c>;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> index 7be8ad1ca4646d79..5a5d5649332a8b1d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -204,7 +204,7 @@
>  			resets = <&cpg 907>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a77970";
>  			reg = <0 0xe6060000 0 0x504>;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> index f573dc0552272195..ec7ca72399ec4d54 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -234,7 +234,7 @@
>  			resets = <&cpg 907>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a77980";
>  			reg = <0 0xe6060000 0 0x50c>;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 07c35e9b049ae151..d1615474be67bac3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -282,7 +282,7 @@
>  			resets = <&cpg 906>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a77990";
>  			reg = <0 0xe6060000 0 0x508>;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 624aaa6d7f20d6d4..e1af7c4782f4d768 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -188,7 +188,7 @@
>  			resets = <&cpg 906>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a77995";
>  			reg = <0 0xe6060000 0 0x508>;
>  		};
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
