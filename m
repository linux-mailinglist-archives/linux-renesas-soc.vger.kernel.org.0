Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE108781F23
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 20:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbjHTSBt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 14:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbjHTSBs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 14:01:48 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D9C2723;
        Sun, 20 Aug 2023 10:58:57 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bf7423ef3eso1439345ad.3;
        Sun, 20 Aug 2023 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692554336; x=1693159136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vWOJYzMEdARgdU+SCyIcUY2NQEHvYI9NDh/eIJ030M=;
        b=WNYbHn4NdvP6EUKF7aYTh82fhH6evXtJURnPeMFGruptSO3Q1ekCVcssx2CYsO5KES
         8axprnoVGGfdsYMzGA3wFefBlyV065MQUogCKnlSMiXmRo6I4JVyEyaiSeolUEKamogL
         ZnE0vWYsaIFckca+klo9qbAJthaPG8zj1gg0m+5C7AESXGyW9XNLbYBeA2A5E3p4pxzC
         W9EiLX49om2k+BjwnxjPlF6C09s4vqxqW2kA8uil40PKCNIqurCSplkOd4pgZ+/nIt6t
         +n2ENOmWGveVGteZJhFzsitcsPiib+ZeWiGC6cRhfggKJbDg2scYqmQ81wnzJxs+TIqs
         SogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692554336; x=1693159136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vWOJYzMEdARgdU+SCyIcUY2NQEHvYI9NDh/eIJ030M=;
        b=g6z+v+kjfdBjra/xXN1SfbwtteCW6u1bZCTGgotmhK2s+KOZI+QC7aIG/pZ7tWnjNr
         ZCjgJl4vAiDwzFaFRyM04cVRYYOWGOdvUjm/iwbZ/HT+z1WdZEU5LwDrJAk6xD6F6JKD
         uZPqL1fnvkXtEBMBE1NdvmGxxDkVaFkyEkVHltEa5QUpufgkakjhSN56ZNo0J9PrVW2u
         CgoR67ZVndevXO9MvQLub2ozjUQmtz4Ty5DDbW+Nh9r6K8VA0P8fc6AuAC1Tn1o1flq4
         pUgtq6k8/Vkcol4GYT7PgqZpdvI8RoXA86dPKcpWnhpwvjtUyDzdeBKLmpj3GXZzSVuh
         dEFw==
X-Gm-Message-State: AOJu0YwTFuQD/pE/JMMzC5VmSP9+1FI0L0HnRXxNytN+LDdFIHTG9WKv
        zXa/txbRVJjR8SdmJDs6b6Y=
X-Google-Smtp-Source: AGHT+IHsEAttgzpiQG0IguRGxNtHMaTizd4bD6NAO6E1fu40m3p6wkzEDNKsRMCBKycb1Ed0TRktlw==
X-Received: by 2002:a17:902:f542:b0:1b7:c166:f197 with SMTP id h2-20020a170902f54200b001b7c166f197mr3318687plf.29.1692554336463;
        Sun, 20 Aug 2023 10:58:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u18-20020a17090341d200b001b9d95945afsm5392358ple.155.2023.08.20.10.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 10:58:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 20 Aug 2023 10:58:54 -0700
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
Message-ID: <8199dbe3-4fe7-48f0-93c4-6cb3d12542b1@roeck-us.net>
References: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
 <ce30e9ad-67e8-4dfb-93f9-e9a6a89d6bbe@roeck-us.net>
 <OS0PR01MB592225A290451B07E5BA42698619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ea0eccc0-a29f-41e4-9049-a1a13f8b16f1@roeck-us.net>
 <OS0PR01MB5922C02D0984F36C8CDE98888619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922A79C02FF9D934767307E8619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922A79C02FF9D934767307E8619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 20, 2023 at 05:36:02PM +0000, Biju Das wrote:
> Hi Guenter Roeck,
> 
> > Subject: RE: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
> > tables
> > 
> > Hi Guenter Roeck,
> > 
> > Thanks for the feedback.
> > 
> > > Subject: Re: [PATCH 0/2] Convert enum->pointer for data in the tmp51x
> > > match tables
> > >
> > > Either case, I would want to keep temp_config and the number of
> > > channels in struct tmp51x_data to avoid repeated double dereferences
> > > and because temp_config could change (resistance correction
> > > enabled/disabled should be a devicetree property, conversion rate as
> > > well as channel enable should be sysfs attributes, and channel
> > > enable/disable should also be devicetree properties). The value could
> > > also be used to support suspend/resume in the driver if someone wants to
> > add that at some point.
> > >
> > > In this context,
> > > 		if (data->id == tmp512 && channel == 4)
> > > 			return 0;
> > > is wrong because there are 3 or 4 channels, meaning the channel
> > > numbers are
> > > 0..3 and there is no channel 4. This should be "channel == 3"
> > > to disable the 4th channel on tmp512. Interesting that no one
> > > (including me ;-) noticed this.
> > 
> > If I am correct, as per above, only max number channels supported by the
> > chip can go to device data. That is the only HW difference between these 2
> > chips and other chip specific data can be derived from this.
> 
> I guess, the below initial values for temp_config
> is chip specific apart from the number of supported channels
> as we won't be able to derive from number of channels??
> 
> #define TMP512_TEMP_CONFIG_DEFAULT	0xBF80
> #define TMP513_TEMP_CONFIG_DEFAULT	0xFF80
> 
Bit 3-6 enable temperature sensors. The difference in bit 6
is that the 3rd external temperature sensor (which only exists for
tmp513) is enabled if the bit is set. So the base value for
TMP513_TEMP_CONFIG_DEFAULT would be 0xBF80 with bit 6 set if
the chip has four temperature sensors.

Guenter
