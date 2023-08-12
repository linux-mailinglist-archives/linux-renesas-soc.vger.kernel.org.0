Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A840877A08D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Aug 2023 16:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjHLOs0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 12 Aug 2023 10:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjHLOsZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Aug 2023 10:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CEF1BB
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Aug 2023 07:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691851664;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lvTNrZE0FUydIr5X8Gl1/Qbnw/wOKNz153/d0K2fWyE=;
        b=cBAm3DzEjgg5NGCRy4Kz6k87B08YjSyuNrSqQ2jwTeogkl8pc9g3QLZHfqx7STaFrr4vwD
        WdFJ3ElPa8RJv3Q0Kucu4p3GhVRD7hslBU+2dZoqqF89F8fFGEmEjr9B5Wf06ds5lw35bM
        CLAJ98PpGGedxCbxc6rrHeMK27fU9xQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-TiX7o6UGNjug52RaGhF9ZA-1; Sat, 12 Aug 2023 10:47:42 -0400
X-MC-Unique: TiX7o6UGNjug52RaGhF9ZA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4fe27502459so2867603e87.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Aug 2023 07:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691851661; x=1692456461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvTNrZE0FUydIr5X8Gl1/Qbnw/wOKNz153/d0K2fWyE=;
        b=TGOSudc4LpqJt6YZQ+nqNqyDLk7zJPHI8tWmg6T7uG40fGUUb5xiBpgzU1B5rSyE4t
         P72Zu4aZxbzjcQFE5pgtR0mehUahGpi4UPP9a2AEpYQS7T3H4HCuMNfafXG1Gx26QRiO
         iRRrq3BYOf3PZ4nOqT/6awJ9l3zb0/FKXBvK7IViLRHu2leMw0dNn+5MbG4sxDkgGbXq
         wIprcdgKqsCO0wZFu05M4/zhmpJJCu9KgiHbAYhNSlnvyM+WgQBKFfDYd0uCt77w8fhA
         iF7uqg6rTe45SKOeGULdW/ioo4xWaA909ktcrxp+eXMtVY2VFTRaz6Vf3htwZLhkJL8z
         GSBw==
X-Gm-Message-State: AOJu0YwxYDInSYbf7IzymkEUJb7OYLSJpsz5S6vZ2U2k6NQrWSHBY32O
        2VhQTcamRJCVk5W2niGEvkU7PcnP/dwcxrVc32fGJPU1drlBqLLQb+TnptBwCfkU+Uzqx4r8XG5
        3lZZuqgQaj9IisL1qVTQ+iw+K4/DbTbb5CjUT6AA=
X-Received: by 2002:a05:6512:3414:b0:4f8:6d53:a68f with SMTP id i20-20020a056512341400b004f86d53a68fmr3939207lfr.64.1691851660915;
        Sat, 12 Aug 2023 07:47:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKcAQUHCzKJAXuSAEkyLDQ8WsazPxwfrqXg9nTNsiXCHLGvGGRwriUgOewbERObpC267bK2Q==
X-Received: by 2002:a05:6512:3414:b0:4f8:6d53:a68f with SMTP id i20-20020a056512341400b004f86d53a68fmr3939188lfr.64.1691851660537;
        Sat, 12 Aug 2023 07:47:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d9-20020aa7d689000000b0052237dfa82fsm3270652edr.64.2023.08.12.07.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 07:47:39 -0700 (PDT)
Message-ID: <f4712ca1-be56-24b9-e4a8-bb85d4c4b6a9@redhat.com>
Date:   Sat, 12 Aug 2023 16:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] iio: accel: mma8452: Convert enum->pointer for data in
 the ID table
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Mehdi Djait <mehdi.djait.k@gmail.com>,
        Rob Herring <robh@kernel.org>, linux-iio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
References: <20230812143100.159700-1-biju.das.jz@bp.renesas.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230812143100.159700-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 8/12/23 16:31, Biju Das wrote:
> Convert enum->pointer for data in the ID table, so that
> device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
> bus type match support added to it.
> 
> Replace enum->struct *mma_chip_info for data in the ID table and simplify
> mma8452_probe() by replacing device_get_match_data() with
> i2c_get_match_data().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/iio/accel/mma8452.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index f42a88711486..5864ad726e97 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1547,7 +1547,6 @@ MODULE_DEVICE_TABLE(of, mma8452_dt_ids);
>  
>  static int mma8452_probe(struct i2c_client *client)
>  {
> -	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	struct mma8452_data *data;
>  	struct iio_dev *indio_dev;
>  	int ret;
> @@ -1560,15 +1559,10 @@ static int mma8452_probe(struct i2c_client *client)
>  	data->client = client;
>  	mutex_init(&data->lock);
>  
> -	data->chip_info = device_get_match_data(&client->dev);
> -	if (!data->chip_info) {
> -		if (id) {
> -			data->chip_info = &mma_chip_info_table[id->driver_data];
> -		} else {
> -			dev_err(&client->dev, "unknown device model\n");
> -			return -ENODEV;
> -		}
> -	}
> +	data->chip_info = i2c_get_match_data(client);
> +	if (!data->chip_info)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "unknown device model\n");
>  
>  	ret = iio_read_mount_matrix(&client->dev, &data->orientation);
>  	if (ret)
> @@ -1830,12 +1824,12 @@ static const struct dev_pm_ops mma8452_pm_ops = {
>  };
>  
>  static const struct i2c_device_id mma8452_id[] = {
> -	{ "mma8451", mma8451 },
> -	{ "mma8452", mma8452 },
> -	{ "mma8453", mma8453 },
> -	{ "mma8652", mma8652 },
> -	{ "mma8653", mma8653 },
> -	{ "fxls8471", fxls8471 },
> +	{ "mma8451", (kernel_ulong_t)&mma_chip_info_table[mma8451] },
> +	{ "mma8452", (kernel_ulong_t)&mma_chip_info_table[mma8452] },
> +	{ "mma8453", (kernel_ulong_t)&mma_chip_info_table[mma8453] },
> +	{ "mma8652", (kernel_ulong_t)&mma_chip_info_table[mma8652] },
> +	{ "mma8653", (kernel_ulong_t)&mma_chip_info_table[mma8653] },
> +	{ "fxls8471", (kernel_ulong_t)&mma_chip_info_table[fxls8471] },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, mma8452_id);

