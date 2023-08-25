Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF48788889
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 15:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240878AbjHYN01 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 09:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245212AbjHYN0O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 09:26:14 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A061FF6;
        Fri, 25 Aug 2023 06:26:10 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68c0d886ea0so322824b3a.2;
        Fri, 25 Aug 2023 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692969970; x=1693574770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGQkkPPLedW8ngn+g15L4K1aW2J4fAuXSXgaLZIP97Y=;
        b=LSWENwUU3YrhMEuQVW0ee2XHe5/zGUAb2rMqaoXskjlG+y0UfDY+bChgCVeA6ZijQf
         eBijrKpF0QyWyGIAzEiQLxW64vkx/97wD8qEclF3zNk2PyOW4fCQoFUEVFycH3NjvQ78
         aX69iVYA2rTE2ARIb5FjIBCQ7JwuEUcJo3oB2T+T1e3LALhSmAYm8ahQ5Mshwu8A4Dts
         FLAPSrrzck84ZARIVr8dTeSkZ/wDH9KncayM6+un8jyyc955md6UniTnqPNHyr9UplIv
         kk2b7AYrs2HFce/UBcj/B7zmJgOM0hZY2lJOO2y59AqI1aw/JhzQnjEvdEW6NoOr4DQk
         nG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692969970; x=1693574770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGQkkPPLedW8ngn+g15L4K1aW2J4fAuXSXgaLZIP97Y=;
        b=Rtu2WiVbAwrm0C0om0RR8CeJjG3/o349yHROUf1ZDaiqxuG5p9DXWDgA+5INWgk52m
         tLQHKMy0iNfdHDdN1gXSFwKPbYvD8l041OTMKhcsmD5Gv7WQBwzL204d8nTKhXEqPZ4Z
         yu35N5XsTR/ldytT8y94fQiJPUP3qcnxdrFeImbhWrTQXtm2BX1SveRCTZwbMRXf+fXo
         z54aupO5tAsRYT19OjhHGY9jtBDdwSGpAKymAFYQzBsB4hPZGuBVue+msRrYotbb7U8o
         bAQl9DgG5Jd32oae4hfEzgXxpza+gWdyQevjQWG6I8uPO84mEfA77pypZvzYcEP2yNM4
         7RZA==
X-Gm-Message-State: AOJu0Yzl/nje4wyB9ne4xzZ14qUrvGni4/ZhJ+dH9R3/7BBuacHxIBRP
        wOhDsux2ifJ5sNCzkEy1l7U=
X-Google-Smtp-Source: AGHT+IEfpRZwpVTXZzLtSdxb1deyjrQ46KNbP9gCl6Fc9S2LhZPRqOXock9w8n6VQvf0D6cG6K/dHg==
X-Received: by 2002:a05:6a20:2443:b0:13e:6447:ce39 with SMTP id t3-20020a056a20244300b0013e6447ce39mr24718193pzc.6.1692969970092;
        Fri, 25 Aug 2023 06:26:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z22-20020aa791d6000000b00686a80f431dsm1512809pfa.126.2023.08.25.06.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 06:26:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Aug 2023 06:26:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: tmp513: Simplify probe()
Message-ID: <94abbea0-a793-407c-92f7-6bfecb5b4974@roeck-us.net>
References: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
 <20230824204456.401580-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824204456.401580-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 24, 2023 at 09:44:55PM +0100, Biju Das wrote:
> Simpilfy probe() by replacing device_get_match_data() and id lookup for
> retrieving match data by i2c_get_match_data().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied.

Thanks,
Guenter

> ---
> v1->v2:
>  * Split from v1.
> ---
>  drivers/hwmon/tmp513.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
> index 8ee6e02b02e3..9a180b1030c9 100644
> --- a/drivers/hwmon/tmp513.c
> +++ b/drivers/hwmon/tmp513.c
> @@ -720,10 +720,7 @@ static int tmp51x_probe(struct i2c_client *client)
>  	if (!data)
>  		return -ENOMEM;
>  
> -	if (client->dev.of_node)
> -		data->id = (uintptr_t)device_get_match_data(&client->dev);
> -	else
> -		data->id = i2c_match_id(tmp51x_id, client)->driver_data;
> +	data->id = (uintptr_t)i2c_get_match_data(client);
>  
>  	ret = tmp51x_configure(dev, data);
>  	if (ret < 0) {
