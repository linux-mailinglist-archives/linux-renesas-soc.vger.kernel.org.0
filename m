Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3664019D3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 14:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfEJM1y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 08:27:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36319 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfEJM1y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 08:27:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id z1so4946376ljb.3;
        Fri, 10 May 2019 05:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8bTJnJ4u4gNj6fEkiaq/ZQUE1VT0mFgas8z16OA2vBA=;
        b=CXH1mDUDprdkxXBXM3VU8xUGJCsipKouwv505rAJ/KDvO60FIoXqn5Sc4UC/jQZB1e
         QNJu0dCPNSVhj0zmO1axuKMbT4gZJAOwmG6VJsRzbo5o1DvwI7GNsLgDmI0sZrrDzQBu
         QT4AubZNf5g9CNV1wbI2V1zaWDm5jDvAvkPDe9CccUfV+L+6K1z+Y7Sq15CwKONFhjzL
         wwWbSH1XCJFRIx1mt0nO6V0tapCbKhnaW9c0cJwdh+GcpLSgp545Eo1QJM1/CcM0oGZD
         7lyyqsondAzeDs0SW2DzE5/YkZfYClDDnSHzr/8KzB+eG/WcWwMg2u8DK5EwJWsjJ2nS
         ScAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8bTJnJ4u4gNj6fEkiaq/ZQUE1VT0mFgas8z16OA2vBA=;
        b=fU4yiXauKYzsXS2Nx6AnIhHRGik9/gxR2Ju5gTECQ/lmz2f38l5MW/J03n0yhOFGp3
         SD1iLF80X2tf4THHmxUBooKcDHZFn/9GPh7f/L51SYWk5oJOezwB77IaUgyUMHhNaHoQ
         QC/vtb/7WyLTI5qjoMXgR+aeZTY52Q1KlUKtC5s1a2Ja/W8ptwFT6l8wm8qtnsePWVv2
         n6ozJDfVq9pZQNFyvB2URfIuGKdgQeLXbrF+zeWD6Wtjo7m7S27j9De8WrlrCZduPCWq
         FxdADcv1gbNSHzFpIYd6OO/YPpTT+GIX9PhE5/lHfd37GeGmk86I8bfrYv8Eiuj7mdht
         VJaA==
X-Gm-Message-State: APjAAAV7dA6KqEQXXdUkaDCtbUo/fGRdjFAYi9Bkuc6K3sT7Y/QjJ7SW
        Xw4+8Fk0oWlIH2oWst5kt+0=
X-Google-Smtp-Source: APXvYqyUPdqkGUaw+6B2ePgkKJl7cl5nm4ZOxgxWA4Z1RtfnMN6mB9Z7HGQVOIdNrXeVaPvulatRDw==
X-Received: by 2002:a2e:2f0e:: with SMTP id v14mr5727224ljv.77.1557491271930;
        Fri, 10 May 2019 05:27:51 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
        by smtp.gmail.com with ESMTPSA id o70sm1423153lff.53.2019.05.10.05.27.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 05:27:51 -0700 (PDT)
Subject: Re: [PATCH V2] ARM: mach-shmobile: Don't init CNTVOFF if PSCI is
 available
To:     Julien Grall <julien.grall@arm.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     horms@verge.net.au, magnus.damm@gmail.com, linux@armlinux.org.uk,
        biju.das@bp.renesas.com,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1556882268-27451-1-git-send-email-olekstysh@gmail.com>
 <b52a7c3f-6e10-b45e-4cb9-859ac4b468a8@arm.com>
From:   Oleksandr <olekstysh@gmail.com>
Message-ID: <6495fca7-bdfa-9020-4eff-b2d04c19827a@gmail.com>
Date:   Fri, 10 May 2019 15:27:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b52a7c3f-6e10-b45e-4cb9-859ac4b468a8@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 06.05.19 18:37, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


>> ---
>>   arch/arm/mach-shmobile/setup-rcar-gen2.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c 
>> b/arch/arm/mach-shmobile/setup-rcar-gen2.c
>> index eea60b2..bc8537b 100644
>> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
>> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
>> @@ -17,7 +17,9 @@
>>   #include <linux/of.h>
>>   #include <linux/of_fdt.h>
>>   #include <linux/of_platform.h>
>> +#include <xen/xen.h>
>>   #include <asm/mach/arch.h>
>> +#include <asm/psci.h>
>>   #include <asm/secure_cntvoff.h>
>>   #include "common.h"
>>   #include "rcar-gen2.h"
>> @@ -63,7 +65,16 @@ void __init rcar_gen2_timer_init(void)
>>       void __iomem *base;
>>       u32 freq;
>>   -    secure_cntvoff_init();
>> +    /*
>> +     * If PSCI is available then most likely we are running on 
>> PSCI-enabled
>> +     * U-Boot which, we assume, has already taken care of resetting 
>> CNTVOFF
>> +     * before switching to non-secure mode and we don't need to.
>> +     * Another check is to be sure that we are not running on top of 
>> Xen
>> +     * hypervisor, as CNTVOFF is controlled by hypervisor itself and
>> +     * shouldn't be touched by Dom0 in such case.
>
> If you are running on top of Xen, then PSCI will be available. So is 
> there any real value to check the presence of Xen as well?

I think, no. If the PSCI is a must to run Xen, then it is certainly an 
excessive check. I will drop it in V3.


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko

