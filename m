Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4413C42A3F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 14:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbhJLMLL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 08:11:11 -0400
Received: from mail.iot.bzh ([51.75.236.24]:26901 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236196AbhJLMLK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 08:11:10 -0400
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 4275E25828;
        Tue, 12 Oct 2021 14:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=kKFaSWuJWTneTUZEm4fwai7f9I
        K/sY/R4R5oeKo8cww=; b=YDAtvDXTrn745FXAT95UbRI0f8kVGwXybsMMlK7IMe
        fg2GbRwQwgnLkR+V1icHvsRszvMuuwN8bsRJKa6jt++KEpYRyPymXbBp2Gy5elmZ
        pEY+Kwh7LcbRnat1VNfcezcYDqT7d+nbaKAlJi+LTNjvV3Q6VzBEmnXIetWCxNMz
        BclvcC7cU0o0itISbObihAkrNJxm94MV4BoL/rywWvLC1YnHaVrtrEPZXsC4ZlWP
        EqtwW3AEtKydsDXIh7w0fm22fSsLUMgwfkpdDoKeHfREZ+x1J5kg3YepLrr08F3t
        WaU5ZLgs7XX1p6g+1AOSZPMAZPE4neEXLYvL3KHpteJw==
Message-ID: <19f53d50-64ec-17f0-6616-0489a2601649@iot.bzh>
Date:   Tue, 12 Oct 2021 14:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] soc: renesas: rcar-rst: Add support to set rproc boot
 address
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20210922145212.333541-1-julien.massot@iot.bzh>
 <CAMuHMdUYyKg-DkCYex6zxuUrEJHEgbMq5Bz-yP7tscOv+Bri7w@mail.gmail.com>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <CAMuHMdUYyKg-DkCYex6zxuUrEJHEgbMq5Bz-yP7tscOv+Bri7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert,
Thanks for the review !
All the point will be addressed in v3.

>> +static int rcar_rst_set_gen3_rproc_boot_addr(u32 boot_addr);
> 
> I think you can avoid this forward declaration, by reordering definitions.
Indeed I will reorder the definition.

>> -static const struct rst_config rcar_rst_gen1 __initconst = {
>> +static const struct rst_config rcar_rst_gen1 = {
>>          .modemr = 0x20,
>>   };
>>
>> -static const struct rst_config rcar_rst_gen2 __initconst = {
>> +static const struct rst_config rcar_rst_gen2 = {
>>          .modemr = 0x60,
>>          .configure = rcar_rst_enable_wdt_reset,
>>   };
>>
>> -static const struct rst_config rcar_rst_gen3 __initconst = {
>> +static const struct rst_config rcar_rst_gen3 = {
>>          .modemr = 0x60,
>> +       .set_rproc_boot_addr = rcar_rst_set_gen3_rproc_boot_addr,
>>   };
>>
>> -static const struct rst_config rcar_rst_r8a779a0 __initconst = {
>> +static const struct rst_config rcar_rst_r8a779a0 = {
>>          .modemr = 0x00,         /* MODEMR0 and it has CPG related bits */
>>   };
> 
> I prefer to keep these in __init, as there are multiple instances.
> If you need to access some fields later, just make non-__init copies
> during initialization.
Ok

> 
>>
>> @@ -76,13 +82,13 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
>>          { /* sentinel */ }
>>   };
>>
>> -static void __iomem *rcar_rst_base __initdata;
>> +static void __iomem *rcar_rst_base;
>>   static u32 saved_mode __initdata;
>> +static const struct rst_config *cfg;
> 
> You don't need a pointer to the whole config struct, just a function pointer:
Will replace by a function pointer.

> 
>      static int int (*rcar_rst_set_rproc_boot_addr)(u32 boot_addr);
> 
>> @@ -130,3 +136,33 @@ int __init rcar_rst_read_mode_pins(u32 *mode)
>>          *mode = saved_mode;
>>          return 0;
>>   }
>> +
>> +/*
>> + * Most of R-Car Gen3 SoCs have an ARM Realtime Core.
>> + * Firmware boot address can be set before starting,
>> + * the realtime core thanks to CR7BAR register.
> 
> That sentence sounds weird to me.
Ok will improve this comment.

> 
>> + * Boot address is on 32bit, and should be aligned on
>> + * 4k boundary.
> 
> 256 KiB
Ok

> 
>> + */
>> +int rcar_rst_set_gen3_rproc_boot_addr(u32 boot_addr)
> 
> Missing static?
Yes will be fixed in v3.

> 
>> +{
>> +       if (boot_addr % SZ_4K) {
> 
> SZ_256K, as noted in your follow-up.
> 
>> +               pr_warn("Invalid boot address for CR7 processor,"
>> +                      "should be aligned on 4k got %x\n", boot_addr);
> 
> 256 KiB
ok
> 
>> +               return -EINVAL;
>> +       }
>> +
>> +       iowrite32(boot_addr, rcar_rst_base + CR7BAR);
>> +       iowrite32(boot_addr | CR7BAREN, rcar_rst_base + CR7BAR);
>> +
>> +       return 0;
>> +}
>> +
>> +int rcar_rst_set_rproc_boot_addr(u32 boot_addr)
>> +{
>> +       if (!rcar_rst_base || !cfg->set_rproc_boot_addr)
> 
> This can just check the rcar_rst_set_rproc_boot_addr pointer.
Ok

Regards,
-- 
Julien Massot [IoT.bzh]

