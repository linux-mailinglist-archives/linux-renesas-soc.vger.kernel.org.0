Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7076412D80
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 14:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfECM2J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 08:28:09 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45306 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfECM2I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 08:28:08 -0400
Received: by mail-lj1-f193.google.com with SMTP id w12so5016374ljh.12;
        Fri, 03 May 2019 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GDiBzSj4s/zGBV/+MMNhWpQAi3gkIAYNBVktbdFKSgw=;
        b=ZCsrwsTS2xpFfckVXsgcYwTbevaFBpmuAtPyYh/AlT7a064cvWcOGOMSm2JediMlzR
         fLvxowlzmy3ahD4X0FVY62lr3IhpOK3Se/C3fnRq8gnQrA2t6MwbWBOVRh0zWraGBiaf
         9m1yLzrM1MONeXbI3aJVuJdQ4MYtFIW4Lin9fiiR5cB/d3DguKEireYtvi8SryIXqQ3N
         98sxP+P3WaBMzOsP98j0HtRmyY7sEXSTstSPyUvAk4tY620NebwV01nTriPR+fPW4TSu
         rI+car/C+XaPozjD4BPgF4EzLpBYIgMDxsAzYK4SQbkOjZJZEUi8pR8r2nOtwh+uZQ8r
         qlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GDiBzSj4s/zGBV/+MMNhWpQAi3gkIAYNBVktbdFKSgw=;
        b=q0d8MgiO4e7jcRRzwUI8U49FFUpmef9p7GWH6JJutG8deRVJ17/L21jpgvtQ3/J27Z
         jB2vbLR7PLfRwu+9VKFWTMf8XNNEl/Q6foGIEu+v4f9kANyNk/E/pfRQysSKzOdgUTxp
         BtASqneDmjiXtbmHsHIxH7GOcbvvzoOpbXhgwaR/BkNlm/c999ZCO4hawzZ+oo3+FFeS
         fD1bxuUyLrT9jUHLbNnig2IlFs9TUM1qPbzT2VYsSkD1nhNYkB2cXki+BQHGw3FT6LKg
         apDzPKkXBS08hB+95EsESlHWaU1eLLYNKFBk/eHpLWh5DO6wtcPnX0VTUKbx0jAyQ/82
         dsTg==
X-Gm-Message-State: APjAAAWhgsKsuR78npV1ugwlAdJT+t3riBfokC2qWDIFDwoDy+XE6K1A
        IKsv2UL2xanXR9pxPFNhhS0=
X-Google-Smtp-Source: APXvYqzR7jfYzAEVsFVVdfQNIvT4vlFd7utbUxEe52N8l4f5W1LQIRmjltFlKKRaglrNuwdSMr7ukQ==
X-Received: by 2002:a2e:8446:: with SMTP id u6mr5024354ljh.71.1556886485682;
        Fri, 03 May 2019 05:28:05 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
        by smtp.gmail.com with ESMTPSA id b29sm405382lfo.38.2019.05.03.05.28.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 05:28:04 -0700 (PDT)
Subject: Re: [PATCH V2] ARM: mach-shmobile: Don't init CNTVOFF if PSCI is
 available
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julien Grall <julien.grall@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1556882268-27451-1-git-send-email-olekstysh@gmail.com>
 <CAMuHMdVYff-YsGxJykT_p31iyw9f4yVY967_i166TSm__WRG9g@mail.gmail.com>
From:   Oleksandr <olekstysh@gmail.com>
Message-ID: <a7b82354-abce-4317-7495-d97ee2092bc4@gmail.com>
Date:   Fri, 3 May 2019 15:28:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVYff-YsGxJykT_p31iyw9f4yVY967_i166TSm__WRG9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 03.05.19 14:38, Geert Uytterhoeven wrote:
> Hi Oleksandr,

Hi Geert


>
> On Fri, May 3, 2019 at 1:21 PM Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> If PSCI is available then most likely we are running on PSCI-enabled
>> U-Boot which, we assume, has already taken care of resetting CNTVOFF
>> before switching to non-secure mode and we don't need to.
>>
>> Also, don't init CNTVOFF if we are running on top of Xen hypervisor,
>> as CNTVOFF is controlled by hypervisor itself and shouldn't be touched
>> by Dom0 in such case.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
> Thanks for your patch!

Thank you for review!


>
>> ---
>>     You can find previous discussion here:
>>     https://lkml.org/lkml/2019/4/17/810
>>
>>     Changes in v2:
>>        - Clarify patch subject/description
>>        - Don't use CONFIG_ARM_PSCI option, check whether the PSCI is available,
>>          by using psci_smp_available()
>>        - Check whether we are running on top of Xen, by using xen_domain()
>> ---
>>   arch/arm/mach-shmobile/setup-rcar-gen2.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
>> index eea60b2..bc8537b 100644
>> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
>> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
>> @@ -17,7 +17,9 @@
>>   #include <linux/of.h>
>>   #include <linux/of_fdt.h>
>>   #include <linux/of_platform.h>
>> +#include <xen/xen.h>
>>   #include <asm/mach/arch.h>
>> +#include <asm/psci.h>
>>   #include <asm/secure_cntvoff.h>
>>   #include "common.h"
>>   #include "rcar-gen2.h"
>> @@ -63,7 +65,16 @@ void __init rcar_gen2_timer_init(void)
>>          void __iomem *base;
>>          u32 freq;
>>
>> -       secure_cntvoff_init();
>> +       /*
>> +        * If PSCI is available then most likely we are running on PSCI-enabled
>> +        * U-Boot which, we assume, has already taken care of resetting CNTVOFF
>> +        * before switching to non-secure mode and we don't need to.
>> +        * Another check is to be sure that we are not running on top of Xen
>> +        * hypervisor, as CNTVOFF is controlled by hypervisor itself and
>> +        * shouldn't be touched by Dom0 in such case.
>> +        */
>> +       if (!psci_smp_available() && !xen_domain())
>> +               secure_cntvoff_init();
>>
>>          if (of_machine_is_compatible("renesas,r8a7745") ||
>>              of_machine_is_compatible("renesas,r8a77470") ||
> How do you prevent secure_cntvoff_init() from being called for secondary
> CPUs in arch/arm/mach-shmobile/headsmp-apmu.S?

Good question.


>
> With PSCI, it is not called if "enable-method" in DT is "psci"', so that case
> is covered, I guess.

Yes.

>
> What about XEN? Do you override the "enable-method"?
> If yes, perhaps a check for "renesas,apmu" is more appropriate?

No, I don't override.


The correct way to run Xen would be to use PSCI, so Linux shouldn't do 
any platform low level operation with secondary CPU cores (on/off, 
reset, etc) by itself when running on top of Xen hypervisor.

As Xen brings available secondary cores up before starting first domain 
(Dom0) using PSCI CPU_ON call to FW, and these cores are entered Xen in 
Hyp mode, so any attempts from Dom0 to perform CPU power management 
directly (using APMU, RST, etc) may result in something not good. I 
think that in case when someone wants to run Xen on R-Car Gen2 system 
(which is SMP) without PSCI enabled, we need to forbid even trying to 
start secondary cores using APMU.

What do you think?


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
-- 
Regards,

Oleksandr Tyshchenko

