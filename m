Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4632497CBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jan 2022 11:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236991AbiAXKGj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 05:06:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbiAXKGi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 05:06:38 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C41C06173D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 02:06:38 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id x11so48134296lfa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 02:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=L0c3QQ5qJI2SMvUoT8kig85qoS741nGRm4z2UySCMZk=;
        b=Mid0z5Z4LO6Is50P3PPV0ERc4qaHrhWZmVeN9oQNJ/zwJyZa++e2tIud7h6eYuS5Tc
         gC719XIZ6m5Vpfx8x0rOwzxG61fpkz+v4sa3qXLWnQ7zAmATjfKnf1eDg0eiGZL7Sbcf
         SfWfjajgUwMZ3k5NQ8pwX+ZMObsOIF+YPkbZz5YbgWuG/CqhPiXNQfvVLbsUDZb0D+Ca
         abFYQ3nPKvPdXce78NhJY5JSylUdN8uP0OgTlHUqf+Cx6Df/2Bc2Z+Ca7maH7JELmIIS
         L/MqncS2N8o3tSCHdZUJbtVTm2WeY4sHMz3cPLrG6yMFa4auk4kPKmy46wtGJgFPrzxq
         Z3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=L0c3QQ5qJI2SMvUoT8kig85qoS741nGRm4z2UySCMZk=;
        b=RuJ2Ut8+o7xDTK90pUi47uoqpO61Gf3dTV32QI+kSUg0ICsUKK1R9sVJ//GY2iKxZ7
         sfAnnF+uBsDk6UwaVzo+1WyK0uvevx3QDETMi3+h13uQPu0joegz6U0KCnsuAqdetFSI
         +xHK1Kv9m4UNKX8qJf6EpegxWilyRWbUDwzvwztJk9LccctVlYnuOfIqQep8ijbnRkcl
         29DCJhhoR3gb9SVq0ivvjo3DXPD4DkBnkXkD4PVDIB+5XpVJ8NgpUDJYv+qp8+p3Tn7N
         MOvYFip1Od6K3vHBHjvw3bDnD+peir6DzbtiJ7DXarmOkM+tbnR5RQVB2vQulmvlvy+3
         CLkw==
X-Gm-Message-State: AOAM5336OLjP3dZLBpzDqrw6H0/nGX8SnypEVdAQZJKyCWGRacmBsmkS
        LZa1z7ZAAu1osCGrQDNBa8fI4tFEL8D37wul
X-Google-Smtp-Source: ABdhPJwLtW6iejFQku3Pb9lUiqFwyMhUCShrESawWlGXwp1nZdHOJmePw0gdUfzej7aw/7CpRuisPw==
X-Received: by 2002:ac2:548d:: with SMTP id t13mr8622231lfk.560.1643018796395;
        Mon, 24 Jan 2022 02:06:36 -0800 (PST)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id i31sm1119293lfv.199.2022.01.24.02.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 02:06:36 -0800 (PST)
Date:   Mon, 24 Jan 2022 11:06:35 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g044c2-smarc: Drop unneeded
 pinctrl-names, too
Message-ID: <Ye56K7S2z84opKP4@oden.dyn.berto.se>
References: <ada490aeee8f1bfdae4a878dd1fadbb34dbc3fb7.1642779366.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ada490aeee8f1bfdae4a878dd1fadbb34dbc3fb7.1642779366.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2022-01-21 16:42:17 +0100, Geert Uytterhoeven wrote:
> "make dtbs" complains when "pinctrl-names" is present without "pinctrl-0".
> 
> Fixes: 5c0d1874072bef54 ("arm64: dts: renesas: Add initial device tree for RZ/G2LC SMARC EVK")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be folded into the original in renesas-arm-dt-for-v5.18.
> 
>  arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> index 53845823d0dce9cc..728a2275ea8d21ac 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> @@ -19,46 +19,55 @@ / {
>  
>  &canfd {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &ehci0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &ehci1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &hsusb {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &i2c0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &i2c1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &i2c3 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &ohci0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &ohci1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
> @@ -68,32 +77,38 @@ &phyrst {
>  
>  &scif2 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &sdhi1 {
>  	/delete-property/ pinctrl-0;
>  	/delete-property/ pinctrl-1;
> +	/delete-property/ pinctrl-names;
>  	/delete-property/ vmmc-supply;
>  	status = "disabled";
>  };
>  
>  &spi1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &ssi0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &usb2_phy0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
>  
>  &usb2_phy1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status = "disabled";
>  };
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund
