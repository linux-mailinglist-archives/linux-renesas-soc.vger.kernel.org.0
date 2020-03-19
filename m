Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE4B318B97B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2020 15:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbgCSOfx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Mar 2020 10:35:53 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45633 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgCSOfx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Mar 2020 10:35:53 -0400
Received: by mail-lj1-f195.google.com with SMTP id y17so2706400ljk.12;
        Thu, 19 Mar 2020 07:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bmjG9gaaQ2TjqqhPacVxow1nIQ7XMOuiMUqsv40Ng6o=;
        b=XmpgI+Y+l0jFiu9RRFFVsx/fMRXN5RVp8hXzK6areAV3SA9pKJhzAzFVKD+ZIz7Lac
         EDmMON+ML0dOFfhjj/aTkKoHI+PottLANy4nY7oyXJUZqzhRMJ3OU29lPITiEsvZMN2B
         TbA1StSWy8tSPAbdO4ZqQ9CYLUh0y5P6mLMg4DsiZRcLkrwQJmzpZbZmybOKXBOUEKGz
         A2Os30veyozq2yz57qv9ssa8gGlDrMJ5mfaQ3E4hboHejlF7WkZ+42yB8koqSN4Z8QMB
         DPvr3al6Il0yL46//2Cctu3+X6OpgxnEzxwA0Wkq/l8aZYmMsblNhAXzmrcj+kbfKOhs
         jJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bmjG9gaaQ2TjqqhPacVxow1nIQ7XMOuiMUqsv40Ng6o=;
        b=GIHaVyOtMfpX9NF4B4kl4jfRZij1u1OVL/zdn2jhbZOYBUYX8/g/W0RzCJAFih6vJQ
         YfD/0ODwFsrqrCzvqCkQOo6Lq+GbmOxsUGjhrXF5UmNwcfJW+uF3r8t/QBCaNfxMdW/s
         D4L+yjx2q73JoKNZUh3V/StdbZNCh6KKT0e0fw9XIA1qimDqWCitVJTLjtw5KqYybYw5
         Coy1/MxZwrZp/gcqA8lVFyshEIn3h0i5ww143HgutJNnqlCXvwPYCKU/h3Vk2m3GejI1
         tJ+VZfrNQtGt5R5x6gJu+wTNVJAPcZ7za9W9tMQtOy3extX0GGloPn/cbkav8iOz2nP5
         pQMQ==
X-Gm-Message-State: ANhLgQ1xww0/+LXysR8ISBLWLZFExX7BqRUL3DZmgN1SqJeyLmSqG4KV
        lcVDeoKpQnliOx7hl1/en4HxyO28
X-Google-Smtp-Source: ADFU+vvNHbniIt/Exu9Z3WwVvwUgASZbwJ83WhaQpJ0IQvhX+ql2mCobw2XN+J+nC1eqItfvQIw9hg==
X-Received: by 2002:a2e:984d:: with SMTP id e13mr2255298ljj.275.1584628551316;
        Thu, 19 Mar 2020 07:35:51 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id i13sm1619509lja.73.2020.03.19.07.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2020 07:35:50 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Eric Miao <eric.miao@nvidia.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
 <20200127140716.15673-1-geert+renesas@glider.be>
 <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
 <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com>
 <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com>
 <20200319092535.GB25745@shell.armlinux.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <86239143-b7de-3385-5288-82ac94e7e5db@gmail.com>
Date:   Thu, 19 Mar 2020 17:35:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319092535.GB25745@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

19.03.2020 12:25, Russell King - ARM Linux admin пишет:
> On Thu, Mar 19, 2020 at 04:11:00AM +0300, Dmitry Osipenko wrote:
>> 25.02.2020 14:40, Geert Uytterhoeven пишет:
>>> Hi Marek,
>>>
>>> On Tue, Feb 25, 2020 at 12:24 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 27.01.2020 15:07, Geert Uytterhoeven wrote:
>>>>> Currently, the start address of physical memory is obtained by masking
>>>>> the program counter with a fixed mask of 0xf8000000.  This mask value
>>>>> was chosen as a balance between the requirements of different platforms.
>>>>> However, this does require that the start address of physical memory is
>>>>> a multiple of 128 MiB, precluding booting Linux on platforms where this
>>>>> requirement is not fulfilled.
>>>>>
>>>>> Fix this limitation by obtaining the start address from the DTB instead,
>>>>> if available (either explicitly passed, or appended to the kernel).
>>>>> Fall back to the traditional method when needed.
>>>>>
>>>>> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
>>>>> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
>>>>> i.e. not at a multiple of 128 MiB.
>>>>>
>>>>> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
>>>>> ---
>>>>> Against arm/for-next.
>>>>
>>>> This patch landed recently in linux-next. It breaks legacy booting from
>>>> the zImage + appended DT + cmdline/memory info provided via ATAGs. I
>>>> will debug it further once I find some spare time. What I noticed so
>>>> far, the cmdline/memory info is not read from the ATAGs, only the values
>>>> provided via appended DT are used.
>>>
>>> Oops, something happening like this was one of my biggest worries when
>>> posting this patch... Sorry for the breakage.
>>>
>>> IIUIC, the kernel still boots, but just doesn't use the info passed by ATAGs?
>>>
>>> I'll have a closer look later today.
>>> In the mean time, I've sent some debug code I used when developing
>>> this patch, which may be useful, hopefully.
>>
>> Hello,
>>
>> NVIDIA Tegra is also affected by this patch. A week ago an updated
>> version of the patch was pushed into linux-next and now machine doesn't
>> boot at all.
>>
>> I couldn't find v3 on the ML, so replying to the v2. Please take a look
>> and fix the problem, or revert/drop the offending patch, thanks in advance.
> 
> I'll drop the patch. It's clear that this is going to be difficult,
> so I would ask you to test the next version, rather than waiting for
> it to appear in linux-next.

Thank you very much! I'll be happy to try v4, please feel free to CC me.
