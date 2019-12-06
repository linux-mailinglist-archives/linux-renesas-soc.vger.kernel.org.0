Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33323114DAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 09:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfLFIdT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 03:33:19 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35827 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbfLFIdT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 03:33:19 -0500
Received: by mail-lj1-f193.google.com with SMTP id j6so6772665lja.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2019 00:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=afeE7KQp+zTESPS60PIhW/zIilWCcKXxfycXI9iyjFU=;
        b=fvA7sOqimBrWk15Y5LuGetRC1vdyjr3uNXNv28Dz9izZ8MJppvRTWJGg5K4BKbbUvK
         JPVi9Oj/sTwayMX2Qai7OjMfxGNVmbW0jgM8CI5HHFUtuDrTa/XLmzUmO92bLsTicroJ
         iwHtwRWd4rgOUkKBUrGyVj5iDi7Q0Fo/bbvxtHOt6N+pUn0/wgpd6Px9OGRQ6mUtyCPI
         8UX48v0EyGcI+YIH6ohjgl6IzNh3uwlZyH5Vsq83/Up9IIMRwbdbCQKA3EfUwAXCp7w8
         jR6cgU0DWTVcVnUTqc4BCrHXCjM+C+vOAP+CzSznfPPl4HfSdkB5XitB67xNngzZSHSh
         liWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=afeE7KQp+zTESPS60PIhW/zIilWCcKXxfycXI9iyjFU=;
        b=QLO1AXGIPKEZ6drY12FuJTP8mhfIDBaGZE/fYrKJQsIbJbFbH3uEOlbMl52tDLkf+f
         PSTMea28cU/hLu4xFcnPqSVC1WST/+hYOsApCP126qZTULXXmVCHssh4FOwRuNg9eUN4
         7YzG/QiJaVWLx1wTP72PetyuQz6jKAoD/iLRTpm0JBbuL7h+bQYwwrFTOu16JkerXTRb
         dm4J0iHJ+YyACsXsUy1CHS/8mJzBZBT+1RPHjbq2quHLogBOvK5En1Xkg9HODFrz+l7B
         Kf94AuL1HDy/dom9IXDuGLLdPUJwUw2J0c/5722g51P3CZewS007fOhpRjVqnmXePXPC
         NvaA==
X-Gm-Message-State: APjAAAWNLnjKfsbIa0OKmUlRVoWEKTx3tnHiELoNw+ZRECc/EZQgrgU6
        aYmHQAyaj9ge5jmODp4mEwt1GA==
X-Google-Smtp-Source: APXvYqyvs6nIc1TFZhbvUOXCq4RxP88xw1dO4X12w+meMjgforHykpFtFzReUDyeu/+1xJvZD4XXLA==
X-Received: by 2002:a2e:9e55:: with SMTP id g21mr7777743ljk.245.1575621197174;
        Fri, 06 Dec 2019 00:33:17 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id f7sm6044841ljp.62.2019.12.06.00.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 00:33:16 -0800 (PST)
Date:   Fri, 6 Dec 2019 09:33:15 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: remove i2c_new_dummy() API
Message-ID: <20191206083315.GH28879@bigcity.dyn.berto.se>
References: <20191206002322.12801-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191206002322.12801-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2019-12-06 01:23:22 +0100, Wolfram Sang wrote:
> All in-kernel users have been converted to
> {devm_}i2c_new_dummy_device(). Remove the old API.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/i2c/i2c-core-base.c | 23 -----------------------
>  include/linux/i2c.h         |  6 ------
>  2 files changed, 29 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9333c865d4a9..9f8dcd3f8385 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -896,29 +896,6 @@ struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_dummy_device);
>  
> -/**
> - * i2c_new_dummy - return a new i2c device bound to a dummy driver
> - * @adapter: the adapter managing the device
> - * @address: seven bit address to be used
> - * Context: can sleep
> - *
> - * This deprecated function has the same functionality as @i2c_new_dummy_device,
> - * it just returns NULL instead of an ERR_PTR in case of an error for
> - * compatibility with current I2C API. It will be removed once all users are
> - * converted.
> - *
> - * This returns the new i2c client, which should be saved for later use with
> - * i2c_unregister_device(); or NULL to indicate an error.
> - */
> -struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
> -{
> -	struct i2c_client *ret;
> -
> -	ret = i2c_new_dummy_device(adapter, address);
> -	return IS_ERR(ret) ? NULL : ret;
> -}
> -EXPORT_SYMBOL_GPL(i2c_new_dummy);
> -
>  struct i2c_dummy_devres {
>  	struct i2c_client *client;
>  };
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index d2f786706657..d1baf8d57536 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -466,12 +466,6 @@ i2c_new_probed_device(struct i2c_adapter *adap,
>  /* Common custom probe functions */
>  extern int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr);
>  
> -/* For devices that use several addresses, use i2c_new_dummy() to make
> - * client handles for the extra addresses.
> - */
> -extern struct i2c_client *
> -i2c_new_dummy(struct i2c_adapter *adap, u16 address);
> -
>  extern struct i2c_client *
>  i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address);
>  
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
