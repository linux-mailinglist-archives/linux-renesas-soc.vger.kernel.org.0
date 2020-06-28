Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B537020CA07
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Jun 2020 21:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgF1Txl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Jun 2020 15:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgF1Txl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Jun 2020 15:53:41 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AAEC03E97A
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Jun 2020 12:53:41 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g2so7943481lfb.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Jun 2020 12:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZASlE2kQH+vLIKHBKPCtawJzFr+e+rpZK/7yWHtfjcA=;
        b=VQ9+EToS4Ik/pGO5Vhj6ysls2iY4ixmB+NAyHEEIz/khvOceaN9/rCoTglGr7+rKhJ
         vpucKhcIzbB77fIQ9AxfD0+S2gpDIK/Nm9ZcmaCLU9fYu8YCa16xzQRCDDxfZRZ1TwE5
         VsSn9L0DI2eoi5eBD6sHwxMJknEcvA/0ZIB+viW++Vz91JL6tBmvW+7xXKF6wskL3k4L
         LP9PgfNMQ77O1eTvt7fYatATUYRhIhQFgn/Jy78Zy2fi9mjIdSVc3OkLs9sUR3MeLEjo
         czW0bINZD1qw4KoJYbEqXY4IDWpmp8bUDQX8VJQJWL0F3HRUhQ1CFXF6pAdntcORLvff
         ukFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZASlE2kQH+vLIKHBKPCtawJzFr+e+rpZK/7yWHtfjcA=;
        b=d6ysNAnE+TOu90OxNI4jFaZ8m4GPcQNxA+j8ga2srgvILQt3gbbwsx2rG45V6iDVsM
         a9NgHOXPAQ/nEk9DCJ8S3KGdDWSE90080URiuhkBGSrMGShKbaiojPka/b4NpFJ4fUi0
         Qoiw4Kq+k82/9CNKsdW16Odn3xHYZb7Y2fzBGxqN3AwDT7cluu3wZ0gHg4JEw1l49X1x
         fd/iEkMs61Kqv5mF97/+uZyo6DBSZI/JsqGuaUTTP8+R3C3HKFn++EFppYGd9YC6l1TE
         fzXUMeOw00u478j9R7zhxxBWTq/UnDX7qkWcvyYLxuCKXD0YgZwBXqdOW4TGzHZliLm8
         mZ6A==
X-Gm-Message-State: AOAM533Z+cjjt2QycslUcGVmClaVSaOJe0OstnjARsd0w2/ANI0LlpMl
        oKRoHy39aB6szVRPILlmXMCggg==
X-Google-Smtp-Source: ABdhPJygT+lscosIL2TGiMk7b4HveW2XcR0TUEL6aH+I6toqofp+qUsFD/J6+mfgHVvQf0z7fopY6g==
X-Received: by 2002:ac2:5f0b:: with SMTP id 11mr7412058lfq.201.1593374019604;
        Sun, 28 Jun 2020 12:53:39 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id k14sm2500133ljc.48.2020.06.28.12.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 12:53:39 -0700 (PDT)
Date:   Sun, 28 Jun 2020 21:53:38 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] i2c: slave-eeprom: update documentation
Message-ID: <20200628195338.GQ1105424@oden.dyn.berto.se>
References: <20200628185426.5733-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200628185426.5733-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-06-28 20:54:26 +0200, Wolfram Sang wrote:
> Add more details which have either been missing ever since or describe
> recent additions.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Change since v1: add 'help' keyword to the Kconfig explanation
> 
>  Documentation/i2c/slave-eeprom-backend.rst | 22 +++++++++++++++++-----
>  drivers/i2c/Kconfig                        |  4 ++++
>  2 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/i2c/slave-eeprom-backend.rst b/Documentation/i2c/slave-eeprom-backend.rst
> index 0b8cd83698e0..38d951f10302 100644
> --- a/Documentation/i2c/slave-eeprom-backend.rst
> +++ b/Documentation/i2c/slave-eeprom-backend.rst
> @@ -1,14 +1,26 @@
>  ==============================
> -Linux I2C slave eeprom backend
> +Linux I2C slave EEPROM backend
>  ==============================
>  
> -by Wolfram Sang <wsa@sang-engineering.com> in 2014-15
> +by Wolfram Sang <wsa@sang-engineering.com> in 2014-20
>  
> -This is a proof-of-concept backend which acts like an EEPROM on the connected
> -I2C bus. The memory contents can be modified from userspace via this file
> -located in sysfs::
> +This backend simulates an EEPROM on the connected I2C bus. Its memory contents
> +can be accessed from userspace via this file located in sysfs::
>  
>  	/sys/bus/i2c/devices/<device-directory>/slave-eeprom
>  
> +The following types are available: 24c02, 24c32, 24c64, and 24c512. Read-only
> +variants are also supported. The name needed for instantiating has the form
> +'slave-<type>[ro]'. Examples follow:
> +
> +24c02, read/write, address 0x64:
> +  # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-1/new_device
> +
> +24c512, read-only, address 0x42:
> +  # echo slave-24c512ro 0x1042 > /sys/bus/i2c/devices/i2c-1/new_device
> +
> +You can also preload data during boot if a device-property named
> +'firmware-name' contains a valid filename (DT or ACPI only).
> +
>  As of 2015, Linux doesn't support poll on binary sysfs files, so there is no
>  notification when another master changed the content.
> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
> index ef39c83aaf33..dbcbb8a6024e 100644
> --- a/drivers/i2c/Kconfig
> +++ b/drivers/i2c/Kconfig
> @@ -119,6 +119,10 @@ if I2C_SLAVE
>  config I2C_SLAVE_EEPROM
>  	tristate "I2C eeprom slave driver"
>  
> +	help
> +	  This backend makes Linux behave like an I2C EEPROM. Please read
> +	  Documentation/i2c/slave-eeprom-backend.rst for further details.
> +
>  endif
>  
>  config I2C_DEBUG_CORE
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
