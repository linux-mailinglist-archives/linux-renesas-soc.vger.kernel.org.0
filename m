Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE8143621E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Oct 2021 14:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhJUMyz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 08:54:55 -0400
Received: from mail.iot.bzh ([51.75.236.24]:24012 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230374AbhJUMyz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 08:54:55 -0400
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 35C9016730;
        Thu, 21 Oct 2021 14:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=qy++6GyZIXpqBNMU/RewEwPaWp
        lhjUkLfMbVjY7RepA=; b=mWHarlmST/4D9A3nm/+F3DlSaB/ncXXr97s50kjqH/
        pwM0+hgXXkb309RsEyxWo2j6Vbs/OQxotzhuXq36I0Ft9PIcMJCR42zM0oIoa4Da
        gL3Y5OVlV6uWOFrLKGowd3osv5aEpf5hM1vS4XWwH3YIBAM8dKx/e3CGl6n2yr1n
        27CrVACf6VliQWpkfn0H0Xate7v9BoYe+uEVVCpywYXtrXCdmgD8Jj56DT9uP5zK
        Visy6WK/AejdzXeRFYsuY5k0qb5/wPHclsBRViDdR/H4gNA/iFFGT4JH2YDEeBX4
        8p9nXGxbeialOkayc//Y700vBTCgcg+gkT/+yXFzE03w==
Message-ID: <2df286a3-c805-c160-d656-5ab88b7ea3ba@iot.bzh>
Date:   Thu, 21 Oct 2021 14:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] soc: renesas: rcar-rst: Add support to set rproc boot
 address
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20211012121117.61864-1-julien.massot@iot.bzh>
 <CAMuHMdUyO+L40hP5+uzeyY+Tn-9un-ignekzzqx=5Nd6DkJSxg@mail.gmail.com>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <CAMuHMdUyO+L40hP5+uzeyY+Tn-9un-ignekzzqx=5Nd6DkJSxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

>> +/*
>> + * Most of the R-Car Gen3 SoCs have an ARM Realtime Core.
>> + * Firmware boot address has to be set in CR7BAR before
>> + * starting the realtime core.
>> + * Boot address must be aligned on a 256k boundary.
>> + */
>> +static int rcar_rst_set_gen3_rproc_boot_addr(u32 boot_addr)
> 
> phys_addr_t?
Not sure, in the remoteproc subsystem the boot address is in the
remote processor address space, which can be a different mapping than the host
processor. On Gen3 both the realtime and the application cores share the same address
map. (excepted for 64 bits address)
So a physical address from the CA5x processors is the same on the CR7
processor.
My feeling is that it's better to keep u32.

> 
>> +{
>> +       if (boot_addr % SZ_256K) {
>> +               pr_warn("Invalid boot address for CR7 processor,"
>> +                      "should be aligned on 256KiB got %x\n", boot_addr);
> 
> Please don't split printed messages, for easier searching.
Sure will fix.
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
>>   struct rst_config {
>>          unsigned int modemr;            /* Mode Monitoring Register Offset */
>>          int (*configure)(void __iomem *base);   /* Platform specific config */
>> +       int (*set_rproc_boot_addr)(u32 boot_addr);
> 
> phys_addr_t
> 
>>   };
>>
>>   static const struct rst_config rcar_rst_gen1 __initconst = {
> 
>> @@ -130,3 +157,12 @@ int __init rcar_rst_read_mode_pins(u32 *mode)
>>          *mode = saved_mode;
>>          return 0;
>>   }
>> +
>> +int rcar_rst_set_rproc_boot_addr(u32 boot_addr)
> 
> phys_addr_t
> 
>> +{
>> +       if (!rcar_rst_set_rproc_boot_addr_func)
>> +               return -EIO;
>> +
>> +       return rcar_rst_set_rproc_boot_addr_func(boot_addr);
>> +}
>> +EXPORT_SYMBOL(rcar_rst_set_rproc_boot_addr);
> 
> EXPORT_SYMBOL_GPL?
Ok

> 
> Do you have a public user of this code, too?
I have one that I plan to submit to the remoteproc subsystem once
it will be possible to set the CR7 boot address.

Please have a look there
https://github.com/iotbzh/linux/blob/iot/for-upstream/rproc/drivers/remoteproc/rcar_rproc.c#L114

In this function the remoteproc subsystem already fetched a firmware and parsed the elf file.
The firmware entry point is stored in a u64 variable
https://github.com/iotbzh/linux/blob/iot/for-upstream/rproc/include/linux/remoteproc.h#L550

Then we can start the processor by deasserting the reset.


Thanks,
Julien

