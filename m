Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA841411671
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 16:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhITOMS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 10:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbhITOMS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 10:12:18 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAE7C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Sep 2021 07:10:51 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b15so50019771lfe.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Sep 2021 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2JAqQhrK3zP5XHtsDM6EOQH25Hn5+gPmIqqVdI0le+c=;
        b=jhuOK6S4u/+Y+cz6CoUIlw6M3gI2/ulCvDbq4vu7Kp/xMnKiRlZZwd4SVwOhDvOF+O
         vmTB0VViUDGst8wZm8IeI+RVJFs3TmB5GcdOh8r2OBHYxIpygM4ranwPWuRQuZ6vw6BZ
         cMrwIRFez74onl1MESGnIZlzny4fOxtGvPmPaR5ZX/2yLJDoFQLOPApZBxcgtUg5NVf/
         PdbM+usrj4WgqzsG6hBG+hnEYnZ49CsVHlztZL/8d0dv+e2cKf/DdHtYxfbR7dKOVjta
         fNBQw+zWQq+czRBLkExAnCzZ34zRmydTYe22/K61ucdLVyswSPhbd1WFefkdf3b8B50a
         E1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2JAqQhrK3zP5XHtsDM6EOQH25Hn5+gPmIqqVdI0le+c=;
        b=hXBFQOGSLrVxh/8SX6AIpUVHau+jPP8xl/D4UwmBRPrV4OXgNNxOhi1FUzdIuzEFc+
         wKHROOqH7x9YnP1MSzhZPZIR6S/83Cf0Ytp5UDUWWu6tW4Mg6MKmEkYWN0wSYg86Bnur
         ZkOERKLP/3/3y+wq2pCJJV+CuD6Tj7uFpKF/p31/4XbHMnK1QmNREUA3inxrP3OxI3/o
         OXUJKfQ06ZcHx61NBXDKbsR3+a6RCsiNNm2msIw3mQx9q9cQCJ6dwwtzyU58aZOmDHJi
         kqHVMDclYjCA5x++XLYvs3ZdzzWKbapENCez5BYrTPFY4Wb4h7pXZ63d+LMVo8+1kUkw
         LbFA==
X-Gm-Message-State: AOAM532IhapCD5gr0UHX/7uMnQKA1BYLkrKQptcTXcpNtFHjWp5gVRuv
        QwkTWRPDoGJfwsKPyFYhuZ+Fsw==
X-Google-Smtp-Source: ABdhPJznAy7+5gncZVdjpqtN8i9pozLiE33fXqXLdxsQA8DMu+Vaq7d3p7oLV9P5WyppRIphoCa8fw==
X-Received: by 2002:a2e:1641:: with SMTP id 1mr22540124ljw.83.1632146989616;
        Mon, 20 Sep 2021 07:09:49 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id n24sm1278181lfq.294.2021.09.20.07.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 07:09:48 -0700 (PDT)
Date:   Mon, 20 Sep 2021 16:09:47 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] serial: 8250: SERIAL_8250_EM should depend on
 ARCH_RENESAS
Message-ID: <YUiWK84CGyBeoMlY@oden.dyn.berto.se>
References: <7b5a4bbf2f47b2c4c127817e8b1524a650795d97.1631710085.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b5a4bbf2f47b2c4c127817e8b1524a650795d97.1631710085.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-09-15 14:49:22 +0200, Geert Uytterhoeven wrote:
> The Emma Mobile integrated serial port hardware is only present on Emma
> Mobile SoCs.  Hence add a dependency on ARCH_RENESAS, to prevent asking
> the user about this driver when configuring a kernel without Renesas
> ARM32 SoC support.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/tty/serial/8250/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
> index 71ae16de0f90e06f..808268edd2e82a45 100644
> --- a/drivers/tty/serial/8250/Kconfig
> +++ b/drivers/tty/serial/8250/Kconfig
> @@ -376,7 +376,7 @@ config SERIAL_8250_DW
>  config SERIAL_8250_EM
>  	tristate "Support for Emma Mobile integrated serial port"
>  	depends on SERIAL_8250 && HAVE_CLK
> -	depends on ARM || COMPILE_TEST
> +	depends on (ARM && ARCH_RENESAS) || COMPILE_TEST
>  	help
>  	  Selecting this option will add support for the integrated serial
>  	  port hardware found on the Emma Mobile line of processors.
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
