Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37A9C781ECD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 18:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbjHTQA0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 12:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjHTQAW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 12:00:22 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139D8D9;
        Sun, 20 Aug 2023 08:55:27 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bc63ef9959so20038725ad.2;
        Sun, 20 Aug 2023 08:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692546920; x=1693151720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8hEsMgcLixDFSIrmiu+puLXbp6V615HsuqpYTcaAcU=;
        b=Z3tyByfKwl17PA04ODIzHFIToSSgU5UizY6G8BXKSnnet1kN2eMnYqVAtDZ5LpgP0N
         FDUdtQ6a6dcgD5XsRkYdBaAOoAbO4lAGTSY2EHjgdH4zcrJ5ZuxoUUXemRG7JZLXeDJ8
         JSQ18k71hf/4KQlvdA5VISSvxeaekvDSteTYuBlJboTqD1uAuzqcl8fToyawz3qKUbbz
         Tc6Hftg6+Rog+csZIYxD56kpAe3ilf1eMQfOs5ZByb5hYXCkfoJBHyfGlc8SQjX0xXQD
         0o80rBp0j0LdVAwkxZRIj1BZ7uVWJJKcNtVrxyMLgJAmngC36J11WjOB+h0/wcDitDgp
         rnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692546920; x=1693151720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8hEsMgcLixDFSIrmiu+puLXbp6V615HsuqpYTcaAcU=;
        b=N1/gfG8efDjm+PComHG7FNAlknprMsgy4HnUIx0EiZGRXx0Z0WzkSkImzOcbnTKJ9j
         vkUC+nmBC0SnFDuNcxD4Bkk2JoRZ2ifEEWHpws0N2IZ0OmwfPAGpeCwCNukEQuRAUsY8
         LXsuXexCNPwX7RyXX8p++iw/2n8ljdKlRnsV0IQOSMu64x9bzljnudpYNyEOPvcrNMP/
         ILG5QFnkgTMkyzSthWMvyjmDmv5ByWgKK3VO9Og47jUhXiJbSrm5/ELFrdJjcgS6Scwz
         FNAlyrA2asDzHBmr6vlCLiB/G+58Sao8Wsp5QdJgVTyrI58VFlkjhyf2knSLXwaQg4u4
         RGiA==
X-Gm-Message-State: AOJu0YxEZIinSPtg6XpZSZIw+EadlXdJD714lzWK6tS+K8B+Xr49c+Sw
        3W17ltb4IFR0Uplqa8Z7TtY=
X-Google-Smtp-Source: AGHT+IFaYzyU/SwJuv99ULQuLOgvNOjvV4v/nNI5Mz3QNAz+xxGDMSXDUP94yOpuRsPW8rhk3/duRQ==
X-Received: by 2002:a17:903:25d4:b0:1bf:46ee:9af with SMTP id jc20-20020a17090325d400b001bf46ee09afmr4836135plb.62.1692546920320;
        Sun, 20 Aug 2023 08:55:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10-20020a17090311ca00b001b83dc8649dsm5237259plh.250.2023.08.20.08.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 08:55:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 20 Aug 2023 08:55:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
 tables
Message-ID: <ea0eccc0-a29f-41e4-9049-a1a13f8b16f1@roeck-us.net>
References: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
 <ce30e9ad-67e8-4dfb-93f9-e9a6a89d6bbe@roeck-us.net>
 <OS0PR01MB592225A290451B07E5BA42698619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592225A290451B07E5BA42698619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On Sun, Aug 20, 2023 at 02:55:08PM +0000, Biju Das wrote:
> Hi Guenter Roeck,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
> > tables
> > 
> > On Sun, Aug 20, 2023 at 01:49:08PM +0100, Biju Das wrote:
> > > Convert enum->pointer for data in the match tables, so that
> > > device_get_match_data() can do match against OF/ACPI/I2C tables, once
> > > i2c bus type match support added to it.
> > >
> > 
> > I don't see why this would be necessary. You don't explain why the current
> > implementation would no longer work. Various other drivers implement the
> > same mechanism as this driver, i.e., type cast the return value of
> > device_get_match_data() to a non-pointer. I'd argue that changing the
> > functionality of device_get_match_data() such that this is no longer
> > possible would be inherently flawed and would introduce unnecessary
> > complexity to drivers using that mechanism today. If
> > device_get_match_data() is enhanced to include the functionality of
> > i2c_match_id(), it should be done in a way that doesn't mandate such an API
> > change.
> 
> Currently nothing is broken. There is a helper function
> to do OF/ACPI/ID match(i2c_get_match_data). But Dmitry proposed
> to extend device_get_match_data() to buses  so that we can get
> rid of i2c_get_match_data  and future it can be extended to SPI aswell. see [1].
> 
> While doing this Jonathan found an issue where it won't work if
> OF table is using pointer and ID is using enum in the match data. Moreover,the proposed API returns NULL for non-match.

I think that is may be problem because many drivers don't have a value
in the driver_data field. Maybe that doesn't matter because such drivers
would normally not call device_get_match_data() or i2c_match_id(),
but it would create some ambiguity because those functions would no
longer work for all cases.

> 
> So Andy proposed to convert the valid enums to non-zero or use a pointer.
> 
There are _lots_ of drivers where the chip ID is in driver_data and starts
with 0, or with the field not used. It is not my call to make, but I really
think that demanding that this field is always != 0 is just wrong.

> In this case, pointer makes sense as the hardware differences between
> the chips are compared against type rather than using feature and
> driver data. In the second patch, I just used a driver data to
> avoid one such case.
> 
> [1] https://lore.kernel.org/all/20230804161728.394920-1-biju.das.jz@bp.renesas.com/
> 

The suggested changes do make some sense independently of the API change,
but not as suggested. I'd be inclined to accept the changes if the number
of channels is kept in the configuration data. With that, the chip ID would
no longer be needed. TMP513_TEMP_CONFIG_DEFAULT and TMP512_TEMP_CONFIG_DEFAULT
are not really needed in the configuration data since the value can be
derived from the number of channels instead of the chip type.

According to what you said earlier, that suggests that the only necessary
change would be to report the number of channels in driver_data / data
because that would never be 0.

Either case, I would want to keep temp_config and the number of channels
in struct tmp51x_data to avoid repeated double dereferences and because
temp_config could change (resistance correction enabled/disabled should be
a devicetree property, conversion rate as well as channel enable should
be sysfs attributes, and channel enable/disable should also be devicetree
properties). The value could also be used to support suspend/resume
in the driver if someone wants to add that at some point.

In this context,
		if (data->id == tmp512 && channel == 4)
			return 0;
is wrong because there are 3 or 4 channels, meaning the channel numbers
are 0..3 and there is no channel 4. This should be "channel == 3"
to disable the 4th channel on tmp512. Interesting that no one
(including me ;-) noticed this.

> > 
> > > This patch series is only compile tested.
> > 
> > I assume that means you don't have access to the chip. Is this correct ?
> > Just asking, because it would be great to have a register dump which would
> > enable me to write unit test code.
> 
> That is correct, I don't have access to the chip.
> 

Too bad. Eric, if you are still around, would it be possible to send me
register dumps ?

Thanks,
Guenter


> Cheers,
> Biju
> 
> > 
> > >
> > > Biju Das (2):
> > >   hwmon: tmp513: Convert enum->pointer for data in the match tables
> > >   hwmon: tmp513: Add temp_config to struct tmp51x_info
> > >
> > >  drivers/hwmon/tmp513.c | 51
> > > ++++++++++++++++++++++--------------------
> > >  1 file changed, 27 insertions(+), 24 deletions(-)
> > >
> > > --
> > > 2.25.1
> > >
