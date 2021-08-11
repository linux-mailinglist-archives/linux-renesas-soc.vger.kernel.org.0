Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F034F3E97D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 20:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhHKSox (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 14:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhHKSox (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 14:44:53 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2335FC061765
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 11:44:29 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id e11so747533ljq.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 11:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iHat3XoCIw1ghVDFVOlf+KTgdGyI4p73gjc9fHcDt9k=;
        b=tA+2vnIcaSVNffeIrHKBJfwxlA+5lyhcCXNvKXrVmWPYIqA5ux7Z/FQ5gdfzJaUa4t
         JTIo6Rn6yKf/B4z1kvI3JlfeaCPrZwcSFjOrznVpUb/N3pU2SHtI2cot+xtGyEx/QCOz
         gqxD9YOd7+OO+OKJTzTfG7+T7VIDb4h5fz2s2uCDuQJqjaCjrxhRzcX+BBtnIdfmkTRh
         bLBdfDm8acE/C807m/NBskEohpt/FN7R75JV+FZk0iQXEqbPJKvKkew6LPaE68VBVchN
         7ew3bPT4vjNLaqCNezGFMUHEkxJdr6F6P+FYityGbWsxYkVs9g02UhyzWpcFdPae/dtF
         LVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iHat3XoCIw1ghVDFVOlf+KTgdGyI4p73gjc9fHcDt9k=;
        b=uKxuGhAFVwqVwb15VmPv7JDFEJGEZ7GD+N05cEce62NELBSKsxvKEsnL8QCLUEL9Gw
         tIHtLUv3vbttEx55Og84oy7Eg3TfqsuwJKQkVYqNlAphYBltr/ucYBLnoHe6WfgL1B1+
         xqdXWkjI4yNix2r6wZ6O8eeyyKscD6qAAIRGOWxBqV3hyxpQarTBQcTLGZLkVa/2uz83
         GtIvtAwuZqxZhLl/m5naGh8TeCtiGil08uv9izyzd7dep839NgCtXy5vmedDilAQh5Gl
         jQ1zLp6bC1DrEjls214bQ7Orm+DclxzyEFKRUz8dxAIk+wDEWAwWjLa0MX22ALGo8llU
         /UCw==
X-Gm-Message-State: AOAM530XPeL29mmf8IWyFMsXRU3vE3AJ8JLVcbqZ4uOwe3zuOAy0NlJn
        imLtgsUqx6X4vtdEBC+ToD++rQ==
X-Google-Smtp-Source: ABdhPJzm521hnshhR5mJhPT7xHMNmBjXdgOaKcA35W+lUgmBRQdb7L36clI8KKgwyn4UV6jkUlUKbQ==
X-Received: by 2002:a2e:96d0:: with SMTP id d16mr62899ljj.279.1628707467451;
        Wed, 11 Aug 2021 11:44:27 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id j4sm14916lfu.35.2021.08.11.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 11:44:26 -0700 (PDT)
Date:   Wed, 11 Aug 2021 20:44:25 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: renesas_usb3: Fix soc_device_match()
 abuse
Message-ID: <YRQaiVPZU7YLxlOT@oden.dyn.berto.se>
References: <760981fb4cd110d7cbfc9dcffa365e7c8b25c6e5.1628696960.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <760981fb4cd110d7cbfc9dcffa365e7c8b25c6e5.1628696960.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Geert,

Thanks for your work.

On 2021-08-11 17:52:54 +0200, Geert Uytterhoeven wrote:
> soc_device_match() is intended as a last resort, to handle e.g. quirks
> that cannot be handled by matching based on a compatible value.
> 
> As the device nodes for the Renesas USB 3.0 Peripheral Controller on
> R-Car E3 and RZ/G2E do have SoC-specific compatible values, the latter
> can and should be used to match against these devices.
> 
> This also fixes support for the USB 3.0 Peripheral Controller on the
> R-Car E3e (R8A779M6) SoC, which is a different grading of the R-Car E3
> (R8A77990) SoC, using the same SoC-specific compatible value.
> 
> Fixes: 30025efa8b5e75f5 ("usb: gadget: udc: renesas_usb3: add support for r8a77990")
> Fixes: 546970fdab1da5fe ("usb: gadget: udc: renesas_usb3: add support for r8a774c0")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/usb/gadget/udc/renesas_usb3.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> index f1b35a39d1ba8712..57d417a7c3e0a687 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -2707,10 +2707,15 @@ static const struct renesas_usb3_priv renesas_usb3_priv_r8a77990 = {
>  
>  static const struct of_device_id usb3_of_match[] = {
>  	{
> +		.compatible = "renesas,r8a774c0-usb3-peri",
> +		.data = &renesas_usb3_priv_r8a77990,
> +	}, {
>  		.compatible = "renesas,r8a7795-usb3-peri",
>  		.data = &renesas_usb3_priv_gen3,
> -	},
> -	{
> +	}, {
> +		.compatible = "renesas,r8a77990-usb3-peri",
> +		.data = &renesas_usb3_priv_r8a77990,
> +	}, {
>  		.compatible = "renesas,rcar-gen3-usb3-peri",
>  		.data = &renesas_usb3_priv_gen3,
>  	},
> @@ -2719,18 +2724,10 @@ static const struct of_device_id usb3_of_match[] = {
>  MODULE_DEVICE_TABLE(of, usb3_of_match);
>  
>  static const struct soc_device_attribute renesas_usb3_quirks_match[] = {
> -	{
> -		.soc_id = "r8a774c0",
> -		.data = &renesas_usb3_priv_r8a77990,
> -	},
>  	{
>  		.soc_id = "r8a7795", .revision = "ES1.*",
>  		.data = &renesas_usb3_priv_r8a7795_es1,
>  	},
> -	{
> -		.soc_id = "r8a77990",
> -		.data = &renesas_usb3_priv_r8a77990,
> -	},
>  	{ /* sentinel */ },
>  };
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
