Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 779491CD3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 18:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbfENQve (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 12:51:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39181 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfENQve (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 12:51:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id a10so7000882ljf.6;
        Tue, 14 May 2019 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pSrbjSgq+dDmZOF6wxf9ya7W/nk/pOt4k1xQAWNm2h0=;
        b=FaJ7RuokSxb694vs9RYQ3CdbXCt+vX680coDFf5OKzeC/S5qLy6bQnQXPAiJz1sGP7
         wPEVrtZxPHAaNBdyLedE/y3Dm74q73EbK/I9mcKPjXFN4vcZMXtGoBt4xhHIdANS2ELH
         aTC8FLMlmuJ2+GXrio8IhJEhbns3L/tw6rNak3DIlAx/xt9dhm+DL2/zVM5S3S4CtsbQ
         wTtXfpYJZHJ+HPWCQklJRiyyh8L4F18f8+mGeOfcguv/qGlIZ0jrw3DLqK6rN80lz2xk
         ezHT0inH1nDogg+CN5h3xkcFlJzMibVJTZ6stAhDaGytVfTSezv+tt6v3g5pNaGfX5C4
         p2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pSrbjSgq+dDmZOF6wxf9ya7W/nk/pOt4k1xQAWNm2h0=;
        b=pv3fHxUM43lNPax5CfM+J0+KzTWmUnmOKyBfeM5qHCbq+vj3+fOTNQSB1XDZodoqZT
         24rT1EKsTqd6/ABfuAf1g++J5g3X5bjRFY9DbSdpTD9CORSxXO33B0jJRTQ+preHZ1gj
         JiLKqEZP++sJ7ADjHGM90NRCxp2E5W4V7tcYCLCjoVjzNeHlG+qcZG/wHGvwn9xkgThY
         A2GVzaSqfl3kaev9/EtFh/NMyld9VAUfWKqFkEOgn87AxjfrO0fbrEEg4z5G86Wq4jiD
         LdpjkMFLQvquNEIwUdR0y1KDm20IobRHO5KWAE2utcY5n5sXPaKXOXpEVvWZuTy7TZn/
         Qh+w==
X-Gm-Message-State: APjAAAU18qW7lcXev7nlIr7SZ1FaYJTUgVVfPPHWlOFhNvYPbSL0ouoU
        M/qjwIwoc80hbnYQA9yr5+Y=
X-Google-Smtp-Source: APXvYqwqcDNBmiFzjMEaT5HuLqs76kVQf9BpRqrod5VaQC5I8VDdpCAwmR/r0SOk/D4yViP4ZtNtQQ==
X-Received: by 2002:a2e:9756:: with SMTP id f22mr17568259ljj.30.1557852691941;
        Tue, 14 May 2019 09:51:31 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
        by smtp.gmail.com with ESMTPSA id l15sm3784600lji.5.2019.05.14.09.51.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 09:51:31 -0700 (PDT)
Subject: Re: [PATCH V4] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI
 is available
To:     Julien Grall <julien.grall@arm.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     horms@verge.net.au, magnus.damm@gmail.com, linux@armlinux.org.uk,
        geert@linux-m68k.org,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1557850012-16612-1-git-send-email-olekstysh@gmail.com>
 <4e712484-d6a4-e358-ea66-51dfcee18b0d@arm.com>
From:   Oleksandr <olekstysh@gmail.com>
Message-ID: <c45a056f-80d5-187d-e865-fb66d514830a@gmail.com>
Date:   Tue, 14 May 2019 19:51:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4e712484-d6a4-e358-ea66-51dfcee18b0d@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 14.05.19 19:13, Julien Grall wrote:
> Hi,

Hi Julien


>
> On 14/05/2019 17:06, Oleksandr Tyshchenko wrote:
>> diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c 
>> b/arch/arm/mach-shmobile/setup-rcar-gen2.c
>> index eea60b2..64e3abd 100644
>> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
>> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
>> @@ -17,6 +17,7 @@
>>   #include <linux/of.h>
>>   #include <linux/of_fdt.h>
>>   #include <linux/of_platform.h>
>> +#include <linux/psci.h>
>>   #include <asm/mach/arch.h>
>>   #include <asm/secure_cntvoff.h>
>>   #include "common.h"
>> @@ -63,6 +64,15 @@ void __init rcar_gen2_timer_init(void)
>>       void __iomem *base;
>>       u32 freq;
>>   +    /*
>> +     * If PSCI is available then most likely we are running on 
>> PSCI-enabled
>> +     * U-Boot which, we assume, has already taken care of resetting 
>> CNTVOFF
>> +     * and updating counter module before switching to non-secure mode
>> +     * and we don't need to.
>> +     */
>> +    if (psci_ops.cpu_on) > +        goto skip_update;
> Are you sure this is working when ARM_PSCI_FW is not selected? Is it 
> possible to have a .config for RCAR without ARM_PSCI_FW?

Oh, my fault. Mainline shmobile_defconfig has PSCI stuff disabled.

I should have checked for the PSCI operation to be available only if 
CONFIG_ARM_PSCI_FW is defined.

Thank you for pointing this out.


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko

