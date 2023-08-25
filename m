Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D42A7880F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 09:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235451AbjHYHgf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 03:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239227AbjHYHg0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 03:36:26 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3671BFA;
        Fri, 25 Aug 2023 00:36:23 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-26fc5a218daso392051a91.1;
        Fri, 25 Aug 2023 00:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692948983; x=1693553783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qj4pHAC/Taa90g3Isk4tCrfiaWOtHQATobRZ+hy8KXE=;
        b=AvWOADbn0DMevAHL502YpBXyWg8QYZHVO2vhPIAWYl/WUy8LoGv1z9PA7KVjzXN7zp
         rH7TVuvm1oAmATnFnAn+GsfbLFHcQ8/SzmjXuU+Crd2jAGiQBRmWjH49v+niTLCrtnYe
         9dUh0FLDQmRHmHeFIrRGy6QR8YNyXGTCbyXNaQP9R8hLewcz6P629aBh9JZPqFYvAeo1
         RXQ0YUdK2xtYKVronuRhwCkVJkdgUR2c3G+beD/W4dMB91h3/17R6IYi1ricWGVS33NA
         EbNm00hwHDkAf18haf2tnl+INsFRH+cnplmzhQrTl1cPgQBznzW+l2akgO/U8X09uObs
         SI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692948983; x=1693553783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qj4pHAC/Taa90g3Isk4tCrfiaWOtHQATobRZ+hy8KXE=;
        b=W8WxLsu/F7qN2YV9AVChavUBY+OKk//jmlVEn61hcTFms7nF+2Ykgnb8MDD6Cj/wdi
         YPhHbVJ7Xp+Zcs6gRJFXwq+FSMA8tOIZR29LV9qlfp/XKqoHCX56PjLkZCvnWRXJDXON
         XwI93xmbUM4MfCutC3ArOIqVkCGGB2o3JvKXWoj+oYKnXvruwU6qGzlaPIhZifSozhx8
         V3fAPQ0RF00OlJON9b6PVg+lzCJpJJDqrTvsMaqRBqS52F6tP+r6ht8tSkak80Fl/Rqn
         L7D4hC8OUrAfMr+w5+EADnFce8L++cvsC5V02hoAcOHhdfybEMpMWhaX01CwakYKqiqE
         2O5A==
X-Gm-Message-State: AOJu0YztzVzxekD7uIWTp05yxczYLe6NFijw7yKxe+O3+UW4XcVvd8W0
        FFI6luDjA6VQNr9/X7bCD849rRI5b4A=
X-Google-Smtp-Source: AGHT+IGQbmAWe+6yygp3azAvuQw01i0ypD72G510AL4WjTvILfu6QRC4oiO53crS7hGYRuKczEynYg==
X-Received: by 2002:a17:90b:108d:b0:26d:a83:79cc with SMTP id gj13-20020a17090b108d00b0026d0a8379ccmr14150536pjb.11.1692948982996;
        Fri, 25 Aug 2023 00:36:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 21-20020a17090a19d500b00263f5ac814esm2969229pjj.38.2023.08.25.00.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 00:36:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Aug 2023 00:36:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels
 in struct tmp51x_data
Message-ID: <258bae5d-3602-4625-8ac1-375856d9b334@roeck-us.net>
References: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
 <20230824204456.401580-4-biju.das.jz@bp.renesas.com>
 <ZOgQ2Fc1J8V7rdm4@smile.fi.intel.com>
 <OS0PR01MB592292B941414BF452B14AB086E3A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592292B941414BF452B14AB086E3A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On Fri, Aug 25, 2023 at 06:44:56AM +0000, Biju Das wrote:
> Hi Andy Shevchenko,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels
> > in struct tmp51x_data
> > 
> > On Thu, Aug 24, 2023 at 09:44:56PM +0100, Biju Das wrote:
> > > The tmp512 chip has 3 channels whereas tmp513 has 4 channels. Avoid
> > > using tmp51x_ids for this HW difference by replacing
> > > tmp51x_ids->max_channels in struct tmp51x_data and drop
> > 
> > You don't replace it, you replaced "id" by it.
>  You are correct "id->max_channels"
> 

"replacing tmp51x_ids->max_channels" is a bit difficult to read.

> > 
> > > enum tmp51x_ids as there is no user.
> > 
> > ...
> > 
> > > +#define TMP51X_TEMP_CONFIG_DEFAULT(a) (0x8780 | GENMASK(11 + (a) - 1,
> > > +11))
> > 
> > This seems fragile ("a" can't be 0, and can't be > 4) and will give not

Not really, because it is the number of channels and well known.
We should not optimize the code for something that won't ever happen.
The number of channels is 3 or 4, and the generated mask needs to be
0x3800 or 0x7800 depending on the chip. We could maybe have something
like
	#define CHANNEL_MASK(channels) (...)
and or in the other bits separately.

Anyway, maybe "a" is not the best variable name. Maybe use "channels"
or "n".


> > good code generation (for GENMASK() use), besides it has 0x8780 magic. What
> > is that?
> > Two bit field masks?
> > 
> > 	(BIT(15) | (GENMASK((a) - 1, 0) << 11) | GENMASK(10, 7))
> > 

Probably better to split out resistance correction (bit 10)
and conversion rate (bit 7..9) instead of a single mask.
Just for completeness - bit 15 is "continuous conversion".
Bit 3..6 are unused, and bit 0..2 are used to configure
the gpio pin which is currently not supported by the driver.

> > ?
> 
> Looks good to me.
> 
> > 
> > Also add a comment to explain "a" and other bits.
> 
> I don't have access to user manual to explain these bits.
> May be Guenter/Eric can help on this.
> 

https://www.ti.com/lit/gpn/tmp513

Configuration register 2 is documented on page 35 and 36.

If you change this, please consider using defines for the
various bits.

> > 
> > ...
> > 
> > >  	case hwmon_temp:
> > > -		if (data->id == tmp512 && channel == 3)
> > > +		if (data->max_channels == channel)
> > 
> > This is not the same as it was previously. And looks like this kind of fix
> > (if I understood the previous patch correctly) should be done there.
> 
> Logic wise it checks for invalid channels. But newer logic
> check for invalid channels for both tmp512 and tmp513.
> compared to only for tmp512 in previous case. For me it looks
> like an improvement.
> 
> You mean split this into 2.  First patch with just this logic (channel >= data->max_channels) and keep data->id in remaining
> Places and Second patch is to replace the id and use max_channels instead.
> 

There is only one field available in struct i2c_device_id.
Splitting this patch in 2 seems overkill because the first patch
would have to introduce code (set max_channels based on
enum tmp51x_ids) only to remove it in the second patch.

> > 
> > Btw, avoid Yoda style
> > 
> > 		if (channel == data->max_channels)
> 
> OK, it should be (channel >= data->max_channels)
> 
> > 
> > >  			return 0;
> > 
> > ...
> > 
> > >  	ret = device_property_read_u32_array(dev, "ti,nfactor", nfactor,
> > > -					    (data->id == tmp513) ? 3 : 2);
> > > +					    data->max_channels - 1);
> > >  	if (ret >= 0)
> > > -		memcpy(data->nfactor, nfactor, (data->id == tmp513) ? 3 : 2);
> > > +		memcpy(data->nfactor, nfactor, data->max_channels - 1);
> > 
> > It looks like data->nfactor is of the same type as nfactor, right?
> > Why this can't be simplified to just
> > 
> > 	device_property_read_u32_array(dev, "ti,nfactor",
> > 				       data->nfactor, data->max_channels - 1);
> 
> Yes, I think you are correct. The below code doesn't makes sense. I guess this should be another patch.
> 

"doesn't make sense" is a bit strong, but I agree that the code
is unnecessarily complex. And, yes, that would be a separate patch.

> 	if (ret >= 0)
> 		memcpy(data->nfactor, nfactor, data->max_channels - 1);
> 
> > 
> > ...
> > 
> > > -	data->temp_config = (data->id == tmp513) ?
> > > -			TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
> > 
> > Are those still being in use?
> 
> Nope. Will remove it.
> 
Not sure I understand. The above lines _are_ being removed
(- in 1st column). What else is there to remove ?

Thanks,
Guenter

> Cheers,
> Biju
> 
> > 
> > > +	data->temp_config = TMP51X_TEMP_CONFIG_DEFAULT(data->max_channels);
> > 
> > --
> > With Best Regards,
> > Andy Shevchenko
> > 
> 
