Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F291330F71
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 14:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhCHNgn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 08:36:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbhCHNgS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 08:36:18 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607BAC061760
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Mar 2021 05:36:18 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id f12so11471148wrx.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Mar 2021 05:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9jhP2MF4epK90ovxYiOQdRlAiGBdV0/S9BUUrdARNSE=;
        b=E1yEDdVmw5aSBQQKCtejKlo+wBD8nkvu5BMM+mFiyCrbuMP2h4pFJ2DYB22ggU2MjO
         eEmp5bFokkJkXj94JvpTdDCIOc7/aGGkzEJiI6gNVRgNRvOzMZfJjVpgGaxvWoe8Uz2w
         j2QBpEjkE8V8OcnJxncEI+E/0mEDzbB8Xtep28pY4HJqB/0n5ZsF1jC39jrTZRSxZEvn
         4NtP8H5W5mh2AlM7k09oxJKwBTZtd6GrfWkBAIQM0ELWlWzAlHxAdF2RjJSNwYpl05+R
         dTwPtCuf+Trq3097nrGO/Ru3XTqGJfJ73pJQtZqrYYMm10q1+sAJWtUdxDwiIH0oEJ72
         EODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9jhP2MF4epK90ovxYiOQdRlAiGBdV0/S9BUUrdARNSE=;
        b=coMvizhYIj+uDTYWZcP1lSuP+ZXw8DcSGqWk0jyvU/jo9Z7N8YOH92EX3xWTcL/kTB
         GAuTR07YaW6FXxm/jN4kaXjLqlU0mkRxB5uzcL2JsqkBkkZgCwld93ApbofCpqzn2oVD
         xWyY2f9VQCo2ypWIiv16mCD61n8dLB1K1bQg2AoJNutk0bVj7HFnYxGy8PqvH2UbcDLm
         paT3F5oIyDHM9D/A4rIbMdB9HD6+6cVdotEZHsDBqlfvIGfdIjMfthHaZnRpLR44z8EF
         xeDah9KsPl85Bn+s0hawxsXBHumB15u0qPVDP6Q6TTg0Wi2MQCLo24M8R4T6DIlLilvG
         eq5g==
X-Gm-Message-State: AOAM533c3jwg+AIT6GvbYxLpZ8Q3izS4lKdFAysPmOwyQE9Z0+TNT/eU
        lXtRMiPur6VZ/1Alqu7Yg5QDuw==
X-Google-Smtp-Source: ABdhPJxDZEGPdML/0EtnGOoFUeADw1E9Nh2DkXp4dTrBbXxKGVdDRaBVQZzzoLuOkxxmo0NC0DR0cA==
X-Received: by 2002:a5d:42d2:: with SMTP id t18mr22833703wrr.258.1615210577120;
        Mon, 08 Mar 2021 05:36:17 -0800 (PST)
Received: from dell ([91.110.221.130])
        by smtp.gmail.com with ESMTPSA id d16sm18502133wrx.79.2021.03.08.05.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 05:36:16 -0800 (PST)
Date:   Mon, 8 Mar 2021 13:36:14 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8 2/6] mfd: Support ROHM BD9576MUF and BD9573MUF
Message-ID: <20210308133614.GD4931@dell>
References: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
 <560b9748094392493ebf7af11b6cc558776c4fd5.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <560b9748094392493ebf7af11b6cc558776c4fd5.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 11 Feb 2021, Matti Vaittinen wrote:

> Add core support for ROHM BD9576MUF and BD9573MUF PMICs which are
> mainly used to power the R-Car series processors.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> Changes:
>  - Comments fixed based on suggestions from Lee
>  - Name of regulator cell changed as suggested by Lee
>  - Renamed MFD cell variables for better readability
>  - Aligned header definitions for better readability
> 
>  drivers/mfd/Kconfig              |  11 ++++
>  drivers/mfd/Makefile             |   1 +
>  drivers/mfd/rohm-bd9576.c        | 109 +++++++++++++++++++++++++++++++
>  include/linux/mfd/rohm-bd957x.h  |  59 +++++++++++++++++
>  include/linux/mfd/rohm-generic.h |   2 +
>  5 files changed, 182 insertions(+)
>  create mode 100644 drivers/mfd/rohm-bd9576.c
>  create mode 100644 include/linux/mfd/rohm-bd957x.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index bdfce7b15621..53c7c96283bd 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1998,6 +1998,17 @@ config MFD_ROHM_BD71828
>  	  Also included is a Coulomb counter, a real-time clock (RTC), and
>  	  a 32.768 kHz clock gate.
>  
> +config MFD_ROHM_BD957XMUF
> +	tristate "ROHM BD9576MUF and BD9573MUF Power Management ICs"
> +	depends on I2C=y
> +	depends on OF
> +	select REGMAP_I2C
> +	select MFD_CORE
> +	help
> +	  Select this option to get support for the ROHM BD9576MUF and
> +	  BD9573MUF Power Management ICs. BD9576 and BD9573 are primarily
> +	  designed to be used to power R-Car series processors.
> +
>  config MFD_STM32_LPTIMER
>  	tristate "Support for STM32 Low-Power Timer"
>  	depends on (ARCH_STM32 && OF) || COMPILE_TEST
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 14fdb188af02..e58fae024bb2 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -262,6 +262,7 @@ obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
>  obj-$(CONFIG_MFD_ROHM_BD70528)	+= rohm-bd70528.o
>  obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
>  obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
> +obj-$(CONFIG_MFD_ROHM_BD957XMUF)	+= rohm-bd9576.o
>  obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
>  obj-$(CONFIG_MFD_KHADAS_MCU) 	+= khadas-mcu.o
>  
> diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
> new file mode 100644
> index 000000000000..efd439677c9e
> --- /dev/null
> +++ b/drivers/mfd/rohm-bd9576.c
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2020 ROHM Semiconductors

If you get a chance, could you please update these?

> + * ROHM BD9576MUF and BD9573MUF PMIC driver
> + */

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
