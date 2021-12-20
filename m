Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F77147B06A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Dec 2021 16:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236633AbhLTPhc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Dec 2021 10:37:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236477AbhLTPhb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 10:37:31 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CCD2C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 07:37:31 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id bm14so27080352edb.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 07:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:subject:from
         :to:cc:references:in-reply-to;
        bh=Hu5iDisR7EDNko6/1UheOiwFNf5HuOYdbuiMvDAkPr8=;
        b=awS6r+yj1kX54JiC6uQ4UGUPUuKxDqlZGh8Wvb6mS4CUHItoYJL47NOjzIoHWwwKqa
         hOCRtj56AFhAm/Psev43HKVOavvv70ux9Hjc4anUbwhzGNeqcBiM78ZCJ0dKjpy2dmBG
         I4c+CeddSLfYPEtlXdwZGMYgOz8QsR9ZAMmS/bw43B3Cf5qQ0qRKlVtWkf5eb0i0E9HO
         7djFJBWjqzjtiYejt4CbszOwvkF9mlG8BzxrO3z01UUkxErKCKaVJEHNpd+5gJV578SW
         JTCziv/PKb+5MhzVKII/IWr0uB3fmx0D2VXeKmPkPM5iKg9OYk+1+J2gSK32dKtTsf3z
         WXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:subject:from:to:cc:references:in-reply-to;
        bh=Hu5iDisR7EDNko6/1UheOiwFNf5HuOYdbuiMvDAkPr8=;
        b=ZhWENGQWU5F9cUisa6skDTQaRsO2LAoCXph0uG1ZR2zponil1ZC06JVjsUsgjbJiv/
         dX4XmAHZhbyKjR799jyWRiACt9KklYAWxGqPRBGH+PoR59sDakNAuINwqm+fcK/1kc0E
         +f4HOI8b93QPnREiH7Xut1pGqmenlxZR6lwIc6euH21WYsZwyQ+iqEKajSBTSg+NEMs1
         6M+0rh/fad3FG9pYXw/36mpmcLWhIiutiG9BEQJ75eWRjXP6xqnAkfRcz3t0QIf7w8pp
         iSAtfQaDRiz0q9toPi4rARiBo0vY4hzpQvQLcOgzzL9ejSZ7y/bkOXI2r9RSg66ESoLZ
         jnHw==
X-Gm-Message-State: AOAM533xKg4E9psQl61VFLP676nCo8vddsQpe01PEBxMVhF7BWwDgCzQ
        kkwVbPTUkhvIEVG660/ELIrucA==
X-Google-Smtp-Source: ABdhPJxk2P6RffxSmBWcsYri0yKYsj0/TdqH1vYXh0e1KLw0oC1SCQPXZO3W8zNYh9OK26O6K9VlsQ==
X-Received: by 2002:a05:6402:348b:: with SMTP id v11mr16220893edc.276.1640014649832;
        Mon, 20 Dec 2021 07:37:29 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id r17sm3489883edd.53.2021.12.20.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:37:29 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 20 Dec 2021 15:37:28 +0000
Message-Id: <CGK8O8M50JX6.3E0WU3HUN6K5W@arch-thunder>
Subject: Re: [PATCH 4/6] usb: isp1760: Use platform_get_irq() to get the
 interrupt
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Lad Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, "Peter Chen" <peter.chen@kernel.org>,
        "Pawel Laszczak" <pawell@cadence.com>,
        "Roger Quadros" <rogerq@kernel.org>,
        "Aswath Govindraju" <a-govindraju@ti.com>,
        "Felipe Balbi" <balbi@kernel.org>, "Bin Liu" <b-liu@ti.com>
Cc:     <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Prabhakar" <prabhakar.csengg@gmail.com>
References: <20211220010411.12075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211220010411.12075-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211220010411.12075-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad,
Thanks for the patch.

On Mon Dec 20, 2021 at 1:04 AM WET, Lad Prabhakar wrote:

> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq(). Also use irq_get_trigger_type to get the
> IRQ trigger flags.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

LGTM.
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

------
Cheers,
     Rui

> ---
>  drivers/usb/isp1760/isp1760-if.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp17=
60-if.c
> index 7cc349c0b2ad..65ba5aca2a4f 100644
> --- a/drivers/usb/isp1760/isp1760-if.c
> +++ b/drivers/usb/isp1760/isp1760-if.c
> @@ -13,6 +13,7 @@
> =20
>  #include <linux/usb.h>
>  #include <linux/io.h>
> +#include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -191,17 +192,15 @@ static int isp1760_plat_probe(struct platform_devic=
e *pdev)
>  	unsigned long irqflags;
>  	unsigned int devflags =3D 0;
>  	struct resource *mem_res;
> -	struct resource *irq_res;
> +	int irq;
>  	int ret;
> =20
>  	mem_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> =20
> -	irq_res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!irq_res) {
> -		pr_warn("isp1760: IRQ resource not available\n");
> -		return -ENODEV;
> -	}
> -	irqflags =3D irq_res->flags & IRQF_TRIGGER_MASK;
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +	irqflags =3D irq_get_trigger_type(irq);
> =20
>  	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
>  		struct device_node *dp =3D pdev->dev.of_node;
> @@ -239,8 +238,7 @@ static int isp1760_plat_probe(struct platform_device =
*pdev)
>  		return -ENXIO;
>  	}
> =20
> -	ret =3D isp1760_register(mem_res, irq_res->start, irqflags, &pdev->dev,
> -			       devflags);
> +	ret =3D isp1760_register(mem_res, irq, irqflags, &pdev->dev, devflags);
>  	if (ret < 0)
>  		return ret;
> =20
> --=20
> 2.17.1



