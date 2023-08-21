Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 133337829B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 15:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbjHUNAC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 09:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjHUNAC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 09:00:02 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A4BB1;
        Mon, 21 Aug 2023 05:59:59 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-688787570ccso2121559b3a.2;
        Mon, 21 Aug 2023 05:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692622799; x=1693227599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOeP6KP3gJcc/NYFebYI51QAqR1tb+q4pIiKU1Jf+9A=;
        b=HqeNSgWZGJPyRSy4VC5OWM/3OqsVCjPg1qn6Cj3jkQ2xHVgro/ZHmr4DqNSWzawjAT
         VIJFrOCFYIMyhU1ZiWS3AqVZQipTlmu9ByeOG9xcMtJR6v/FNIRJgxDyh612vOHIIzyX
         yztisdG6vt5MZB0LMWOY89faAt1vB9eNjU3EoXZ3h3TKXwHLH4mTeSVwuJj8HyIDU1W2
         pCZkPZdpNj1FZxDRLPmsUOzfNrfPKBvXyw1KIztU/eREvHtREW2ih1YlB3KhUl/vas9s
         EwdL8xNH0l8VgEWPYHuOXvMGlj/Urd/c/p6++Y44spV8+RXjJ6Q/vpU6ATUnvhdK3A9r
         n2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692622799; x=1693227599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOeP6KP3gJcc/NYFebYI51QAqR1tb+q4pIiKU1Jf+9A=;
        b=b7QrzuXwJzVfOttH/RaDtPdXZ555QF+T8qTXsuDd2K827TUrCu3HzFHmzt8CT0Wz0t
         n2Ilah81BJb9UWQGQOCHkHkpcs4IQGk8FiOcSgGPGg9S2oSJEot5p/kjklSYrwi5bOlt
         nMGcdMnmj1Q3cGnoZNXSPWKCRSiU0uWFihB2+PxhkNX9g/eYq4fbCwCa+lkIqzHiwF5X
         3wsn7TfHuj2anjiqp/lRrfAW+JM+5QnPylDHO1XMq63miXfcy8MymEzjXv4u02yEGg4N
         0lGK1t1plnbhb+I4vj9rZ7/UdPmJCmJpIAtzJTOgpojDpnDjNsuc1IVspXslrSO2ujBW
         ZX0Q==
X-Gm-Message-State: AOJu0YwwZPQ7VMeUphZh5TAyGaVCBTsFj5VmVx74Fkcf//3IxyKhOBKZ
        NMNapc33lSOlh/1UAk7Qliw=
X-Google-Smtp-Source: AGHT+IFKWYzPRyG/tL5T+exRXcRMss/VYX5xg4ioRVt8x2TrHFSlmjHsPYjwBaGJlDE6xdQ3S29zlQ==
X-Received: by 2002:a05:6a00:b8e:b0:68a:530d:a39b with SMTP id g14-20020a056a000b8e00b0068a530da39bmr2082645pfj.8.1692622798943;
        Mon, 21 Aug 2023 05:59:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id fm25-20020a056a002f9900b00682868714fdsm1405891pfb.95.2023.08.21.05.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 05:59:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 21 Aug 2023 05:59:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
 tables
Message-ID: <5392e46f-8174-4c14-96f6-04a61a2ccacc@roeck-us.net>
References: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
 <ce30e9ad-67e8-4dfb-93f9-e9a6a89d6bbe@roeck-us.net>
 <OS0PR01MB592225A290451B07E5BA42698619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ea0eccc0-a29f-41e4-9049-a1a13f8b16f1@roeck-us.net>
 <ZOMrrrxto6TtJQzt@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOMrrrxto6TtJQzt@smile.fi.intel.com>
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

On Mon, Aug 21, 2023 at 12:17:34PM +0300, Andy Shevchenko wrote:
> On Sun, Aug 20, 2023 at 08:55:18AM -0700, Guenter Roeck wrote:
> > On Sun, Aug 20, 2023 at 02:55:08PM +0000, Biju Das wrote:
> > > > On Sun, Aug 20, 2023 at 01:49:08PM +0100, Biju Das wrote:
> 
> ...
> 
> > > While doing this Jonathan found an issue where it won't work if OF table is
> > > using pointer and ID is using enum in the match data. Moreover,the proposed
> > > API returns NULL for non-match.
> > 
> > I think that is may be problem because many drivers don't have a value
> > in the driver_data field. Maybe that doesn't matter because such drivers
> > would normally not call device_get_match_data() or i2c_match_id(),
> > but it would create some ambiguity because those functions would no
> > longer work for all cases.
> 
> Are you talking here about the cases where 0 / NULL makes things optional?
> Like when driver data is defined, we use its value, otherwise apply some
> defaults? If so, where do you see a problem?
> 

The fact that you have to change lots of drivers to make this work should prove
my point.

> > > So Andy proposed to convert the valid enums to non-zero or use a pointer.
> > > 
> > There are _lots_ of drivers where the chip ID is in driver_data and starts
> > with 0, or with the field not used. It is not my call to make, but I really
> > think that demanding that this field is always != 0 is just wrong.
> 
> Those drivers are hackishly abusing OF ID tables. Those, that have _no_ OF ID
> tables are okay.

This is what you are saying. That doesn't make it true. With the same logic
I could claim that drivers providing a pointer in i2c_device_id would
hackishly abuse i2c_device_id tables.

Guenter

> 
> Moreover this approach allows to have the driver data to be const, and keep it
> that way which now is problematic and in some cases may even be broken (due to
> wrong assumptions made by drivers). I.o.w. this makes code more robust against
> the possible mangling of driver data contents at runtime.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
