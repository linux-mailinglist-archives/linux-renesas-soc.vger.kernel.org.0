Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 445F078B3ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 17:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjH1PDj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 11:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbjH1PDG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 11:03:06 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC0DCC;
        Mon, 28 Aug 2023 08:03:04 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-34ca22e3b3dso11570365ab.3;
        Mon, 28 Aug 2023 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693234983; x=1693839783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwNIZBavXMZo1akHKZTjOyuetxIq1qrOPfRzCXAyJaw=;
        b=eeu+jRET8twmVPrNLzZhzjXd35HZJNSaMDo0KWlrW+ryQC4Ucg9kgPP9/2FQcIBkd4
         r0whdupaVjskodqtqs2NSEbIhnORsSQxo6zS5L4O+tla+MVw1x/0QHrVeDngtmX4RiWc
         tSIewY7ZS7/VWMk0uLNrQMxy+XOJ3mSup5A2m1yjEBWnAcIGyYUXTTMIoIeGdvLnXOwK
         nIN7PWuNfwUz5KA6oichoZSZlT6DtW8qK/QN/Y+Jb7dD1PI5b+Gxpj046Y7LeVXcOpPc
         fyxeJ71NKOQEb6/h1OzFsqV+KC1gPfL9qfh3Xsc95vtTZrojNJiq6Lpbi2AvdSNkDhcg
         q41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693234983; x=1693839783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwNIZBavXMZo1akHKZTjOyuetxIq1qrOPfRzCXAyJaw=;
        b=FxUXaiH1z/TBqxLjF2qDpl2fxm1uTZQPZOdPOyw3zQuI78A9acG1Et9UfUM0csLvdJ
         K2Gcmt054bBYtn0yx8am1w/QTPkJ5g6Ifq0BuKz8rLgBnul4iEnwpWKZvZXJcSWMk50Y
         58UKbhtZPu2RwemEaNJI4YFiPdfd3DMZRsQxc7xc5lEENT2bPbKbZlIUYRfzIVeBMGze
         yFDh6+YoQHVJMKkVvdXTlNa6vtsnsDmNg0BWizpLjsAqLyMCOP7yOiaf/4oscGaWD+Cb
         kpXJCVgm2iW7nAX+4cRYRSWo7WLi1QSkOKhvv4ponOh2veJR1vw9bH29Sc3UKMLMVUtT
         movg==
X-Gm-Message-State: AOJu0YwhOE9ll90+NRONnEbIwxFdcLGpMzNVLSQLS6HS/09i7rZzpBxY
        6ClK+oMSbPdoTyWhsvw9b5yYXFf9jy8=
X-Google-Smtp-Source: AGHT+IHxuAXeAKESABQAMyOc89nh/dB41UduiD4bgrkStCyTgDNKW06l5xJdZHUks9kjikTyZCD2VA==
X-Received: by 2002:a05:6e02:152f:b0:346:d51:9922 with SMTP id i15-20020a056e02152f00b003460d519922mr17884072ilu.13.1693234983415;
        Mon, 28 Aug 2023 08:03:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t9-20020a92dc09000000b0034a93f0709esm2496223iln.37.2023.08.28.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 08:03:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 28 Aug 2023 08:03:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: tmp513: Drop enum tmp51x_ids and variable
 id from struct tmp51x_data
Message-ID: <01b19c73-d158-401b-8a0b-3fdef61294c0@roeck-us.net>
References: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
 <20230825205345.632792-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825205345.632792-3-biju.das.jz@bp.renesas.com>
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

On Fri, Aug 25, 2023 at 09:53:44PM +0100, Biju Das wrote:
> Drop variable id from struct tmp51x_data and enum tmp51x_ids as all the
> hw differences can be handled by max_channels.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated the macro TMP51X_TEMP_CONFIG_DEFAULT by adding bit definitions.
>  * Dropped unused macros TMP51{2,3}_TEMP_CONFIG_DEFAULT.
> ---

[ ... ]

I had another look at those. First of all, using MASK and FIELD_PREP
for single-bit fields doesn't add value. Just drop the _MASK from
all those and just use BIT().

> +#define TMP51X_TEMP_CONFIG_GPM_MASK	BIT(2)

GPM is bit 0 and 1, so this is wrong. This should probably
be TMP51X_TEMP_CONFIG_GP which is bit 2. It is also a read-only
value, so setting it is never warranted.

> +#define TMP51X_TEMP_CONFIG_RC_MASK	BIT(10)
> +#define TMP51X_TEMP_CONFIG_CONT_MASK	BIT(15)

Drop _MASK.

> +
> +#define TMP51X_TEMP_CONFIG_GPM		FIELD_PREP(GENMASK(1, 0), 0)

Technically, using a 2-bit field here is misleading, since bit 1 defines
if the gpio bit is an input or output, and bit 0 defines the state of
the pin if it is an output.  This would have to change if and when gpio
support is added to the driver, so it is best to not define anything GP
related in the first place.

> +#define TMP51X_TEMP_CONFIG_GP		FIELD_PREP(TMP51X_TEMP_CONFIG_GPM_MASK, 0)
> +#define TMP51X_TEMP_CONFIG_CONV_RATE	FIELD_PREP(GENMASK(9, 7), 0x7)
> +#define TMP51X_TEMP_CONFIG_RC		FIELD_PREP(TMP51X_TEMP_CONFIG_RC_MASK, 1)

Those are really the values to be put into the configuration register,
which I find is just confusing. But define the register bits, set the bit
if needed, and otherwise keep it alone.

> +#define TMP51X_TEMP_CHANNEL_MASK(n)	FIELD_PREP(GENMASK(14, 11), GENMASK(n, 0) > 1)

This is wrong. Either s/>/>>/ or GENMASK((n) - 1, 0). I personally prefer
the latter since I find it easier to understand.

> +#define TMP51X_TEMP_CONFIG_CONT		FIELD_PREP(TMP51X_TEMP_CONFIG_CONT_MASK, 1)
> +
> +#define TMP51X_TEMP_CONFIG_DEFAULT(n) \
> +			(TMP51X_TEMP_CONFIG_GPM | TMP51X_TEMP_CONFIG_GP | \
> +			 TMP51X_TEMP_CONFIG_CONV_RATE | TMP51X_TEMP_CONFIG_RC | \
> +			 TMP51X_TEMP_CHANNEL_MASK(n) | TMP51X_TEMP_CONFIG_CONT)
> +

I would very much prefer something like

#define TMP51X_TEMP_CONFIG_DEFAULT(n)	(TMP51X_TEMP_CONFIG_CONT | \
			TMP51X_TEMP_CHANNEL_MASK(n) \
			TMP51X_TEMP_CONFIG_CONV_RATE | TMP51X_TEMP_CONFIG_RC)

and drop the unnecessary complexity of defining single bit values with
FIELD_PREP().

Guenter
