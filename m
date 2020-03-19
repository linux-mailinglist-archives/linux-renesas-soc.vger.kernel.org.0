Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED9318B979
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2020 15:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgCSOfu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Mar 2020 10:35:50 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42206 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgCSOfu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Mar 2020 10:35:50 -0400
Received: by mail-lj1-f196.google.com with SMTP id q19so2721392ljp.9;
        Thu, 19 Mar 2020 07:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GnY66tiLgnT7uMr9518ZV493aERIdx8VHWwveyXTDnk=;
        b=YYp40Z4MW214HarFNMtj5EpZt9aUZRpAORwA8owUWeLF0UsNemk7FjcHkPFuQiF08X
         ivBCgbgNnQ0YC7l6wjb+ZFkZNtOobgpQzTm1wL6D/F1v5n/b5P4qWBkQpx6JIa3edoOz
         opPN04Owd9irRArSPfanBTsmxKfYek7pOVgc1Zz4e04aNvBhxj0KlwED8IFgdhx+GouC
         oWUJ/CgDY8TefgdMdGj6hAt1SbSZaihMXN1zkPH0df8jR/Mc817Wi+6Ehv+MXU15IYex
         XvF9hax7N2kjQSjR1Yg88RRl27MlSdn6Esk4HYtn7+mOpP7gXpCZFmWlVsmRqBlpxep9
         HKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GnY66tiLgnT7uMr9518ZV493aERIdx8VHWwveyXTDnk=;
        b=BnK0UIyr6H+2QTRwKFnqTudgeuqohusgSh2jHtT8YDCJ5ikPLkmzWhCrNUGFU2NrMe
         oENWfx32IqT4XjhJfSikj+5zbI379hZ3Aq8R+pRm0qYXDr7Kb7Q4wOMdpR2hSbcBuLzX
         VsiT9RkdK/SYax70HRrv7MLxd4Jgn7NaFPZSDQ5CIfNlcT9dsfdbQPypYxFWhQV49MRs
         Vg3W82y9ZBCNsbQ1UEvJtrEFIHv+/vlJhpGEvKKu10IMpszExoMiSs03cV2moqoKk9+O
         CEfsUO/OHrG2TFUwHxdYKGhls67y2ocseKju12AE6mOMcmDccBHHvm9sPzcnon2jGiBI
         b+HQ==
X-Gm-Message-State: ANhLgQ0PFAQPJKoqpAQUYTSkgKXhMLa1/6iqB4uJxxlego+bOzxwRUlF
        I8H629tOKmRpElgGLnxrgSrX3ZBr
X-Google-Smtp-Source: ADFU+vsUQgj771kWpKIfgPuGmuo6zRMZpbLT62dCa0mQsjR5QPKNN7fglR+T4EukdOBYFNyWQCJ38w==
X-Received: by 2002:a2e:8ec7:: with SMTP id e7mr2304748ljl.36.1584628545819;
        Thu, 19 Mar 2020 07:35:45 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id g20sm1654655lfj.88.2020.03.19.07.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2020 07:35:45 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
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
 <CAMuHMdVkhf+4CQwpf9tn3UfaMb=qoRRYS2XpwcgBMciTVmXjHA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <75358399-c292-4e60-abdc-bd0729cf5c08@gmail.com>
Date:   Thu, 19 Mar 2020 17:35:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVkhf+4CQwpf9tn3UfaMb=qoRRYS2XpwcgBMciTVmXjHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

19.03.2020 11:18, Geert Uytterhoeven пишет:
> Hi Dmitry,
> 
> On Thu, Mar 19, 2020 at 2:11 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 25.02.2020 14:40, Geert Uytterhoeven пишет:
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
>> NVIDIA Tegra is also affected by this patch. A week ago an updated
>> version of the patch was pushed into linux-next and now machine doesn't
>> boot at all.
> 
> I'm sorry to hear that.
> 
> Did v2 work for you?

Same as it was for Marek.

> Are you sure this updated version is the culprit? There are several other
> recent changes to head.S in arm/for-next.

Yes

> Do you boot a separate DTB or an appended DTB?

Appended

> Do you use ATAGS?

Yes

>> I couldn't find v3 on the ML, so replying to the v2. Please take a look
>> and fix the problem, or revert/drop the offending patch, thanks in advance.
> 
> V3 is v2 combined with "[PATCH] ARM: boot: Fix ATAGs with appended DTB"
> (https://lore.kernel.org/linux-renesas-soc/20200225144749.19815-1-geert+renesas@glider.be/).

Thank you for the clarification.

I recalled that CONFIG_THUMB2_KERNEL=y is set in my kernel's config and
disabling thumb2 build fixes the problem. Please correct it in the next
version of the patch, thanks in advance.
