Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2392C403
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 12:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfE1KKr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 06:10:47 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40454 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbfE1KKq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 06:10:46 -0400
Received: by mail-lj1-f193.google.com with SMTP id q62so17113156ljq.7;
        Tue, 28 May 2019 03:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=90u8jynERQ/QGRx+gqo4x+Nz4maTgQrDYFXbItCJEXM=;
        b=RI2K8rf5ef9d6lypoJw9Ra76/tPYpkyamnfIiJlH/lDMK38knsMGtAUYNIn6DtswBr
         JHBtJdQTWpbGXgHDComLwRjKz5t5zLUXfKCjoTHtnCvxEDzF5pNOmclY5q++7EOP9Nai
         +HLnYEqysQnL30H5uiVOD4wWyUicFASIA9jhmdWBCty/IulL2dBeMN0kRO589cU6BtKa
         vQAoTRdUT4Ms2+3dUQ8GYajCzUvy//fmRTX0pFtjvYyoxtqY0ni9zYivvCow71cTvn18
         FWwW8/DpjkoXvevrPuouxee3CnTh+Elp9ZHAmuFZlCWN+HxkYUB2JgfhpD5wu4O/GryM
         w2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=90u8jynERQ/QGRx+gqo4x+Nz4maTgQrDYFXbItCJEXM=;
        b=ZIdOnC5Kwx4Q3F/teuJ0Tn94+Y1PVXvh1Sjd6LM5AZpLQauVd4b6gPeJz8Z4TjspqR
         x6b1XAWGjVKKk0iTIdBYtiE0HOeMH1vdW2h+z/9TEGj6OxelbvJeHWTa4sRLl5yYko7b
         +uyY2NtW+tMHFWZYWMY2s2Usmv3EHFTiBasM7XflrFusv98b/AwQ0TxaOqTlUgeigPCg
         gAPTSV96rQWAjiAX/LIjOfd329LejDng8R8OtsN7q6GUdsNxbbWVuUZEd6RZwGcJ5mkI
         hNPrKnxNliYEGP31E5OM/1g2LvmZm+SiSY8M7zzVJNiHB6fJ0NKIfIXKqbVMCT8iTijC
         3qRA==
X-Gm-Message-State: APjAAAVjGPKFZhf0+ObN2oPBZQYvz3anvuqEFGnH5/kD8xTAVk1o1ivj
        IN1+UaCv9h/BUfIA/owFLg4=
X-Google-Smtp-Source: APXvYqwI/oj4adz5R93iQ8EcHoJMzbQaT8YYQ5l8eReKonHm19v1gOKVQaBAQbYebVGfrf+yxcqAUA==
X-Received: by 2002:a2e:5d49:: with SMTP id r70mr66968830ljb.102.1559038244724;
        Tue, 28 May 2019 03:10:44 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
        by smtp.gmail.com with ESMTPSA id p71sm3353286ljb.18.2019.05.28.03.10.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 03:10:44 -0700 (PDT)
Subject: Re: [PATCH V5] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI
 is available
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julien Grall <julien.grall@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1558087093-22113-1-git-send-email-olekstysh@gmail.com>
 <CAMuHMdVC=aNQTZ0r+7qpiWEyEaoQ587pm1FxhWqR3pwHwv2ARg@mail.gmail.com>
From:   Oleksandr <olekstysh@gmail.com>
Message-ID: <6d3160d2-ce36-980a-1054-03bdece5bbfc@gmail.com>
Date:   Tue, 28 May 2019 13:10:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVC=aNQTZ0r+7qpiWEyEaoQ587pm1FxhWqR3pwHwv2ARg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 28.05.19 11:27, Geert Uytterhoeven wrote:
> Hi Oleksandr,

Hi Geert, all


> Thanks for the update!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for review!


Just FYI:

Required support for Gen2 Stout board has been already added to Xen [1].

What needs to be done next is to add support for handling device-tree 
nodes with "interrupts-extended" property in Xen [2].
This is related to Gen3 as well.


[1] 
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg44386.html

[2] 
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg45951.html

>
> Two cosmetic comments below. I'll leave it to Simon to ignore them for
> applying ;-)
>
>> @@ -62,6 +63,21 @@ void __init rcar_gen2_timer_init(void)
>>   {
>>          void __iomem *base;
>>          u32 freq;
>> +       bool need_update = true;
> Some people like reverse Xmas tree declaration order...
>
>> +
>> +       /*
>> +        * If PSCI is available then most likely we are running on PSCI-enabled
>> +        * U-Boot which, we assume, has already taken care of resetting CNTVOFF
>> +        * and updating counter module before switching to non-secure mode
>> +        * and we don't need to.
>> +        */
>> +#if defined(CONFIG_ARM_PSCI_FW)
> #ifdef CONFIG_ARM_PSCI_FW ?
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
-- 
Regards,

Oleksandr Tyshchenko

