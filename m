Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04100414599
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 11:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbhIVJzi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 05:55:38 -0400
Received: from mail.iot.bzh ([51.75.236.24]:34884 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234603AbhIVJzh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 05:55:37 -0400
Received: from [192.168.1.26] (lfbn-ren-1-1868-231.w83-199.abo.wanadoo.fr [83.199.51.231])
        by mail.iot.bzh (Postfix) with ESMTPSA id 016BB400A4;
        Wed, 22 Sep 2021 11:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1632304442;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=anuPeMMdXwVc5DrNyYNHveRxwY+OuIczb1a+joGdnQA=;
        b=P6ozeI6AIN1PO1v9rr44EMuD68ugMiRdm8+JkhUZRMdNJc9Fyshpg4L0VS0NjZdngHei0i
        0EOPDnw/30k1b+AQA9iLRjxKMdVL3uxA1n0pb9pXWYt7yYGGX0Uq90qXPh+x4MatXHN82Y
        Ib6DpS2iipCcNaSAhuJHCEwLf0XmfLFqzlTDDn3UYaor5S+kLh6SZdholAXIdfZu0DJG50
        SUZXlqq3BVvUgJD8YRHjaKcW/15NcXnGTlXbMObWCkEbR6NAial48x/98mXfff6vF1UQZH
        Wlw7JATLEJ+W4KXvw2jvQAlNPeKqAOquV7+jmcOuUtDU8u2uQOxsYspin9PEMg==
Message-ID: <9922048a-2278-e3bf-ea23-b07f95ab607b@iot.bzh>
Date:   Wed, 22 Sep 2021 11:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 1/1] soc: renesas: rcar-rst: Add support to set rproc
 boot address
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20210914094650.15235-1-julien.massot@iot.bzh>
 <20210914094650.15235-2-julien.massot@iot.bzh>
 <CAMuHMdVT+OgASuzwnNHEHYpc3hc1-ObThTmdHETfxF5inePP5g@mail.gmail.com>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <CAMuHMdVT+OgASuzwnNHEHYpc3hc1-ObThTmdHETfxF5inePP5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

>> +
>> +/*
>> + * Most of R-Car Gen3 SoCs have an ARM Realtime Core.
>> + * Firmware boot address can be set before starting,
>> + * the realtime core thanks to CR7BAR register.
>> + * Boot address is on 32bit, and should be aligned on
>> + * 4k boundary.
>> + */
>> +int rcar_rst_set_rproc_boot_addr(u32 boot_addr)
>> +{
>> +       if (!rcar_rst_base)
>> +               return -EIO;
>> +
>> +       if (boot_addr % SZ_4K) {
>> +               pr_warn("Invalid boot address for remote processor, should be aligned on 4k\n");
>> +               boot_addr -= boot_addr % SZ_4K;
> 
> I think it would be safer to just return -EINVAL.
Indeed, I should better fix my firmware or my remoteproc driver to give correct input to this
function. will return -EINVAL in case of bad alignment.
> 
>> +       }
>> +
>> +       boot_addr |= CR7BAREN;
>> +       iowrite32(boot_addr, rcar_rst_base + CR7BAR);
> 
> According to Note 2 for the CR7BAR register, you must do this in two steps,
> first without CR7BAREN set, then with CR7BAREN set.
You're right will fix.
> See also how CA7BAR and CA15BAR are handled in
> arch/arm/mach-shmobile/pm-rcar-gen2.c.
> 
> Note that CA15/CA7 on R-Car Gen2 (and CA57/CA53 on Gen3, but
> that's hidden by ACPI), unlike CR7, also need RESCNT handling.
> 
>> +
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(rcar_rst_set_rproc_boot_addr);
>> diff --git a/include/linux/soc/renesas/rcar-rst.h b/include/linux/soc/renesas/rcar-rst.h
>> index 7899a5b8c247..7c97c2c4bba6 100644
>> --- a/include/linux/soc/renesas/rcar-rst.h
>> +++ b/include/linux/soc/renesas/rcar-rst.h
>> @@ -4,8 +4,10 @@
>>
>>   #ifdef CONFIG_RST_RCAR
>>   int rcar_rst_read_mode_pins(u32 *mode);
>> +int rcar_rst_set_rproc_boot_addr(u32 boot_addr);
>>   #else
>>   static inline int rcar_rst_read_mode_pins(u32 *mode) { return -ENODEV; }
>> +static inline int rcar_rst_set_rproc_boot_addr(u32 boot_addr) { return -ENODEV; }
>>   #endif
>>
>>   #endif /* __LINUX_SOC_RENESAS_RCAR_RST_H__ */
> 
> In general, I think this looks like a good abstraction, which we can
> also use for further abstraction of R-Car Gen2 (cfr. [1]).
Yes I was also thinking about future generation like Gen4, but I don't have the documentation
at this point.
 From what I understand in [1]: CA7BAR in Gen2 is managed by the SYSC module and not by the RST module
as for CR7BAR in Gen3. So despite the fact that the procedure is similar, we won't be able to set CA7BAR in
rcar-rst.c.

> 
> I'm just wondering if we should pass the BAR offset to
> rcar_rst_set_rproc_boot_addr() explicitly (and rename the function),
> or have multiple functions for the different BARs.
Passing BAR offset will imply to spread RST module offsets across different subsystems,
and the second question will be to be able to do the correct boundary check for the targeted
processor: CR7BAR is aligned on 4k an it looks like CA7BAR is on 256k. It looks like it's
manageable thanks to the driver data which already holds the 'mode monitor register' offset per SoC generation.

One missing point will be for future R-Car SoCs: trends on others SoC seems to be to go to have
several 'realtime', or remote processor. In this case this function will not scale up.

Thanks for the review !

-- 
Julien Massot [IoT.bzh]
