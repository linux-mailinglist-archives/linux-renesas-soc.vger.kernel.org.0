Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3E8678888B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 15:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbjHYN00 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 09:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245071AbjHYNZ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 09:25:59 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75086272A;
        Fri, 25 Aug 2023 06:25:27 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-68becf931d0so760331b3a.3;
        Fri, 25 Aug 2023 06:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692969926; x=1693574726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/+eFeQANgoDs6BDH6E1eMtzqI4quQex5h6vYPQFVmI=;
        b=YyY4/70jJdDnQwL6grdE2X0EiGJecqndms19PKo4nILsKk32X7dye5mL7jeUCCIWxG
         7LUXnmLj5WwB0fUpHDCWAf1BUHaDp73zlcVw0/IcaAg2UddJ4b6JfxRuP8gEOHVFq6Sl
         SzRwXTsRG/AgN+Ug+OXX8w914naxoOMqx1tQq8Co6ni7rhTqljOZzMfbVpuaKtM9SYS2
         cHzkIMXCAq6rAj7RF//AnZCDqWwSovm8FX5/V+/IP9DUolgR7mXtrVkPqw5m9XJ+FxwA
         13+aJTeXsg9WpgwDnh3fIv5QXzzjAtErUqXE+XjfWlcoB47jUDOyFxYGIrevRXCAw78h
         8RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692969926; x=1693574726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/+eFeQANgoDs6BDH6E1eMtzqI4quQex5h6vYPQFVmI=;
        b=FetitdBBug13jTsdRKlIepF3A3pFL44K2Lh+sy1zl54QqHIoqGJ8KVm+GvKm7cpDtN
         DKhJNKsYp6F//7wH0dPUdAhD7ByGzKec8Msx2Rx/QBhaxLmlFOG2JyFS/Hszj2R7IqIW
         ldeSf8jYSMq0rKy/MUxlfJ5QGLAwcy7hwXXkqxTV57cBsgrVbx99blIDyfRpiEoLmJ9K
         OhDK9MK86u1rU/fv0UwU+Nmes5pdVL341GN3qRHf2ezylQNNUD4vZI5MNJl+zJFCmxix
         z3yVAuQGdlXqAP3SFVU2YoNNidBRyx2gm8lN0BSSEM4axQA0hCAGjqjascgjmic//Hjm
         9uow==
X-Gm-Message-State: AOJu0YzFf+ekuDUTy0fvvOiCMzPCJFjkM/tkfAhCeolxKpBjkh/sTRF0
        KBI+SBGkTeKbTqz/c7det0FcRtfChvM=
X-Google-Smtp-Source: AGHT+IHhEVdN020fIPu86aadYFKpL2xmpfC9KZXvY0oHwrK9osnUCn2UgWGzE13kmKVNGKIGvAnScA==
X-Received: by 2002:a05:6a00:1a13:b0:68a:4bef:5f9a with SMTP id g19-20020a056a001a1300b0068a4bef5f9amr15376622pfv.0.1692969926124;
        Fri, 25 Aug 2023 06:25:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b00682868714fdsm1569741pfn.95.2023.08.25.06.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 06:25:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Aug 2023 06:25:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: tmp513: Fix the channel number in
 tmp51x_is_visible()
Message-ID: <3baafb4e-58c8-40dc-b1bc-aeb227bbe5f9@roeck-us.net>
References: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
 <20230824204456.401580-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824204456.401580-2-biju.das.jz@bp.renesas.com>
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

On Thu, Aug 24, 2023 at 09:44:54PM +0100, Biju Das wrote:
> The supported channels for this driver are {0..3}. Fix the incorrect
> channel in tmp51x_is_visible().
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/all/ea0eccc0-a29f-41e4-9049-a1a13f8b16f1@roeck-us.net/
> Fixes: 59dfa75e5d82 ("hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied.

Thanks,
Guenter

> ---
> v2:
>  * New patch
> ---
>  drivers/hwmon/tmp513.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
> index 7db5d0fc24a4..8ee6e02b02e3 100644
> --- a/drivers/hwmon/tmp513.c
> +++ b/drivers/hwmon/tmp513.c
> @@ -434,7 +434,7 @@ static umode_t tmp51x_is_visible(const void *_data,
>  
>  	switch (type) {
>  	case hwmon_temp:
> -		if (data->id == tmp512 && channel == 4)
> +		if (data->id == tmp512 && channel == 3)
>  			return 0;
>  		switch (attr) {
>  		case hwmon_temp_input:
