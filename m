Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE553789340
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 04:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjHZCF5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 22:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjHZCFb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 22:05:31 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467C4213A;
        Fri, 25 Aug 2023 19:05:29 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68a3082c771so1082637b3a.0;
        Fri, 25 Aug 2023 19:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693015529; x=1693620329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbCYtg0vOko1eWDjOnwC8EEgo363vCFPLmjBeNY6Hvo=;
        b=ayIb6O1xOCtnHWq9JlP+nxRnrXIjAzeOOIKnAM39OFNtYUMeou6npnBKazGGd5kgrA
         cBxrmCQDGFo4MT2Cs8xJyZ5B83H1YXGTl7OSb237NW5cNTC6EWdqI3BIuqTqozGKt+JS
         d32aWImYvPcXfGPxLwGpOqdXZ0YZoGDOxRJ8utyvZRjiEedvebwAvp7ipCPo6ZODfZmk
         Gs4wHKlupOPfNZdjbgeCRR/LCb9wCdZXWPfI/Ya7VR/Few33FRi+/tvXpUOTXPhefnyt
         k6oKGAWTcInoDA/kk2TbEQQ9mnbRgJPo2GJX61tmHMV9Y9et9k8GViCrKm8jW4dnCmN7
         JVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693015529; x=1693620329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbCYtg0vOko1eWDjOnwC8EEgo363vCFPLmjBeNY6Hvo=;
        b=abSHrc66DdwAxf9zozngwjGLgb4NZZ7ITdbYYtWCcSSYMOfFI5F485MBDET2EV7a90
         BJKzhLKzeOVFmMLXe6c/IFbVZPAYSLidjt4J1uyClEy8NHX0hF2Ka/UpckfhRBGpKYWv
         BWf4Gr/HU1lpf+jUh9B0eXBacazyTJGuUigeQzqsmI8CTDPXt29YfOk9IhEUr9R4B9cT
         k+AXX/vwv7BUucb1c372GBrjOsIPWrzC5zsP0BVB1yKhoVMrQ8of+KwZaJmgnEkm2qOj
         GJd3xiox7AW6SkICLYeS6QqlDXZJnlSpaniH/IkeLdpzuoevnZpjb3GizqwzyTLIaxF+
         WogQ==
X-Gm-Message-State: AOJu0YyO7uqF4fB8wZebKAtS9kZeIfpYlHGP8NZ8Jeexxp9tS/19j92w
        PXP6imoZX/+fLfRv7L3qhAY=
X-Google-Smtp-Source: AGHT+IFMvstKx+NYhyR1h839F9UGkJbZzeYvZtek3tRXwEVur6E9dMoj7pu4P6/Sj512FUYmwMzIGg==
X-Received: by 2002:a05:6a00:1818:b0:68a:55ff:3a1c with SMTP id y24-20020a056a00181800b0068a55ff3a1cmr28883945pfa.7.1693015528501;
        Fri, 25 Aug 2023 19:05:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bm2-20020a056a00320200b00687196f369esm2230721pfb.62.2023.08.25.19.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 19:05:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Aug 2023 19:05:26 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: tmp513: Add max_channels variable to
 struct tmp51x_data
Message-ID: <bf401e42-320b-4d8f-a9e5-f76b4c7d855d@roeck-us.net>
References: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
 <20230825205345.632792-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825205345.632792-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 25, 2023 at 09:53:43PM +0100, Biju Das wrote:
> The tmp512 chip has 3 channels whereas tmp513 has 4 channels. Avoid
> using tmp51x_ids for this HW difference by replacing OF/ID table
> data with maximum channels supported by the device.
> 
> Add max_channels variable to struct tmp51x_data and fix the logic for
> invalid channel in tmp51x_is_visible().

This patch does not fix anything. The existing logic in tmp51x_is_visible()
is perfectly fine.

Guenter

> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * New patch split from patch #3
>  * Avoided Yoda style logic.
>  * Replaced OF/ID data from tmp51x_ids->max_channels
> ---
>  drivers/hwmon/tmp513.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
> index 9a180b1030c9..99f66f9d5f19 100644
> --- a/drivers/hwmon/tmp513.c
> +++ b/drivers/hwmon/tmp513.c
> @@ -113,6 +113,9 @@
>  
>  #define MAX_TEMP_HYST			127500
>  
> +#define TMP512_MAX_CHANNELS		3
> +#define TMP513_MAX_CHANNELS		4
> +
>  static const u8 TMP51X_TEMP_INPUT[4] = {
>  	TMP51X_LOCAL_TEMP_RESULT,
>  	TMP51X_REMOTE_TEMP_RESULT_1,
> @@ -170,6 +173,7 @@ struct tmp51x_data {
>  	u32 pwr_lsb_uw;
>  
>  	enum tmp51x_ids id;
> +	u8 max_channels;
>  	struct regmap *regmap;
>  };
>  
> @@ -434,7 +438,7 @@ static umode_t tmp51x_is_visible(const void *_data,
>  
>  	switch (type) {
>  	case hwmon_temp:
> -		if (data->id == tmp512 && channel == 3)
> +		if (channel >= data->max_channels)
>  			return 0;
>  		switch (attr) {
>  		case hwmon_temp_input:
> @@ -601,21 +605,15 @@ static int tmp51x_init(struct tmp51x_data *data)
>  }
>  
>  static const struct i2c_device_id tmp51x_id[] = {
> -	{ "tmp512", tmp512 },
> -	{ "tmp513", tmp513 },
> +	{ "tmp512", TMP512_MAX_CHANNELS },
> +	{ "tmp513", TMP513_MAX_CHANNELS },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tmp51x_id);
>  
>  static const struct of_device_id tmp51x_of_match[] = {
> -	{
> -		.compatible = "ti,tmp512",
> -		.data = (void *)tmp512
> -	},
> -	{
> -		.compatible = "ti,tmp513",
> -		.data = (void *)tmp513
> -	},
> +	{ .compatible = "ti,tmp512", .data = (void *)TMP512_MAX_CHANNELS },
> +	{ .compatible = "ti,tmp513", .data = (void *)TMP513_MAX_CHANNELS },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, tmp51x_of_match);
> @@ -720,7 +718,11 @@ static int tmp51x_probe(struct i2c_client *client)
>  	if (!data)
>  		return -ENOMEM;
>  
> -	data->id = (uintptr_t)i2c_get_match_data(client);
> +	data->max_channels = (uintptr_t)i2c_get_match_data(client);
> +	if (data->max_channels == TMP513_MAX_CHANNELS)
> +		data->id = tmp513;
> +	else
> +		data->id = tmp512;
>  
>  	ret = tmp51x_configure(dev, data);
>  	if (ret < 0) {
> -- 
> 2.25.1
> 
