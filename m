Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B9520CAE7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 00:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgF1WNs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Jun 2020 18:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgF1WNs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Jun 2020 18:13:48 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2EC9C03E979
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Jun 2020 15:13:47 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g139so8009054lfd.10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Jun 2020 15:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WVDsBRnmgWwG46gyu4kL4AnvdSuNwUVCzYBxBLwFX1g=;
        b=jegYSM+NkErXhefhR9Yh5qRBeXXf3j2/q+2z4RhPcqZ2dTVsn9kIAiUzeRoJHjKCUD
         7L8fw7plCGdAChoNOVQTBJg467IF2/GYFBAKAnHHE4LmpAcIVwARZXvggkQDX0vXzT0p
         nuNN/qX6/DZ1Rsq74bYHLO/imhxDo1HX5wiUuvupi6p8x1rVTFh+BBU5jpziloCz1GrT
         6u8s/HCmXW0vkhUMTvBKXdsKlL4W0LOnYXGBiTyYBEzU0xCQv5fpIiwOcIWjgT1Jq7qT
         01qpKE7tLuG9WHzzshVdyLxM08cJNsyRMhCebTDT1P95FnvdqqZohcaniJEH+bvi79U9
         +6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WVDsBRnmgWwG46gyu4kL4AnvdSuNwUVCzYBxBLwFX1g=;
        b=jKfbKqxoRhLmk7QR6ObSTs3/clKPJIjgfyG59MWVbPGMpeFq3rVHKdDpRaCwbNx8Wl
         E4/VvSQce3/cRsY/RE8aZAAkuqKZwJt1aFD+2ln6dyBE6z4UzDpaUwoXttxvZ/FFxo6K
         P4TnhsXcxTh7Fx8Yc2XRD3fBXLH2LcB/wUa3IxPjBSC8Vk1VDFnF8zSKbuFGzErndZdu
         VWNs0I+KjtatsONwCtYdam9uCaMOvtq+5FeZOwwmExW/EpAKdXL4jiE42Xvjnv3Xcird
         v0pZ4ZviPwio8b4bikz6lmAwwCA/Ffr/4cCol93qXIqQCcTDpyim1c7hmVwPm6zZ6JSy
         uAMA==
X-Gm-Message-State: AOAM53348akO0icsoawJuFfnQOevczP/ENZI6xN+An2OrU7D/n5CXLZ0
        Y+Vc5oRRSLG9FvCNasAZ8ox0qw==
X-Google-Smtp-Source: ABdhPJyQkk/nBvXm00jEcyiIpmUohqKf9o6YR0RSspbyhco+4C+zA6RB/wZJJdOQOIuBTM9QRv8yEQ==
X-Received: by 2002:a19:6a02:: with SMTP id u2mr7713937lfu.9.1593382426361;
        Sun, 28 Jun 2020 15:13:46 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id i9sm1224033ljj.132.2020.06.28.15.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 15:13:45 -0700 (PDT)
Date:   Mon, 29 Jun 2020 00:13:45 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: add Kconfig help text for slave mode
Message-ID: <20200628221345.GR1105424@oden.dyn.berto.se>
References: <20200628185522.5902-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200628185522.5902-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2020-06-28 20:55:22 +0200, Wolfram Sang wrote:
> I can't recall why there was none, but we surely want to have it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/i2c/Kconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
> index dbcbb8a6024e..e2d6063bdb4d 100644
> --- a/drivers/i2c/Kconfig
> +++ b/drivers/i2c/Kconfig
> @@ -114,6 +114,11 @@ config I2C_STUB
>  config I2C_SLAVE
>  	bool "I2C slave support"
>  
> +	help
> +	  This enables Linux to act as an I2C slave device. Note that your I2C
> +	  bus master driver also needs to support this functionality. Please
> +	  read Documentation/i2c/slave-interface.rst for further details.
> +
>  if I2C_SLAVE
>  
>  config I2C_SLAVE_EEPROM
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
