Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E4D18AA35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2020 02:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCSBLG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Mar 2020 21:11:06 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40832 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgCSBLG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Mar 2020 21:11:06 -0400
Received: by mail-lj1-f194.google.com with SMTP id 19so537883ljj.7;
        Wed, 18 Mar 2020 18:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EGLmZef2vUA7iNMUpqEjZKG2eTNPGHi8uOxfXVF1Rjw=;
        b=KGTt2yvZX6PtwUcegfBuj+F6P+E32i1Ew5+D4XNqj79iu0S5xqyHH72bNWFqyD4RRE
         VACJ4at/mDoZRJWAkYUN5YSWdAy9q2XU94xHuKPq6Kc43S3PAbVN5/mpK2tLJ9O2jOoy
         oZ47D9I7UPJMGWcOejse9qdUxA6sRH9J+R+RhsI9YDMiVUULZvlWm898oFn9STryornS
         RKOn5kDdHQqGA7MqGWGmWW3uQgIpCbFsL/KFwTbDa62fgxG5/rwJcLkjp1FbiG54G7ha
         Imo4+i3ICcJKLarv2BSBdU0U09KQxWIDPvmaNzrE157fV7PGrF4OvNv0ssrXumokQ74c
         DooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EGLmZef2vUA7iNMUpqEjZKG2eTNPGHi8uOxfXVF1Rjw=;
        b=fzo7RNgoDSjidx4F9MxURBThCh4doNd1CUfC/fjB3OJLJoBoVOCzQefRrZ3RYydMQL
         7uwI+76F7Z583e7j5RW9m+ijbLLd3KJeE3ychCgQAfCknbUXr5Z6P6/JQlt9OF9hGcyV
         12LSMIh2CzffSD6VtJJfglvpExTHblPVfpmrRNi3RN1EZdOP5uMlw/oofwc54YrKhe1Q
         svl1VrjiN96lz9Z9vG3L7VMKOpSxAy4jNKyYHnSp5Ur1YWxnB58Hzg+KPZV8bfgJfq27
         QZpknwTb1K89/EdAm9fziuZ5TC96slKU1zQ15FF6nU4ANs3/Cwt35aRbsRkt3YjhR9Da
         Vqhg==
X-Gm-Message-State: ANhLgQ0itK+ZEkwypYQ+xCP8VNypCAoSueb9n/eLD2sxJOICpo+aNWX7
        EFHxLqEyfiqUYaD8nrHCfh2UHKvv
X-Google-Smtp-Source: ADFU+vvIjlCChhIMUE6nFnW/q6nRyE3HYLgiA/phWU7QXfP+DpRbQB4guS7riNIzDsvbcuroJUH2RA==
X-Received: by 2002:a2e:b008:: with SMTP id y8mr414626ljk.107.1584580262759;
        Wed, 18 Mar 2020 18:11:02 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id o4sm210739lfl.62.2020.03.18.18.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2020 18:11:01 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com>
Date:   Thu, 19 Mar 2020 04:11:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

25.02.2020 14:40, Geert Uytterhoeven пишет:
> Hi Marek,
> 
> On Tue, Feb 25, 2020 at 12:24 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 27.01.2020 15:07, Geert Uytterhoeven wrote:
>>> Currently, the start address of physical memory is obtained by masking
>>> the program counter with a fixed mask of 0xf8000000.  This mask value
>>> was chosen as a balance between the requirements of different platforms.
>>> However, this does require that the start address of physical memory is
>>> a multiple of 128 MiB, precluding booting Linux on platforms where this
>>> requirement is not fulfilled.
>>>
>>> Fix this limitation by obtaining the start address from the DTB instead,
>>> if available (either explicitly passed, or appended to the kernel).
>>> Fall back to the traditional method when needed.
>>>
>>> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
>>> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
>>> i.e. not at a multiple of 128 MiB.
>>>
>>> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
>>> ---
>>> Against arm/for-next.
>>
>> This patch landed recently in linux-next. It breaks legacy booting from
>> the zImage + appended DT + cmdline/memory info provided via ATAGs. I
>> will debug it further once I find some spare time. What I noticed so
>> far, the cmdline/memory info is not read from the ATAGs, only the values
>> provided via appended DT are used.
> 
> Oops, something happening like this was one of my biggest worries when
> posting this patch... Sorry for the breakage.
> 
> IIUIC, the kernel still boots, but just doesn't use the info passed by ATAGs?
> 
> I'll have a closer look later today.
> In the mean time, I've sent some debug code I used when developing
> this patch, which may be useful, hopefully.

Hello,

NVIDIA Tegra is also affected by this patch. A week ago an updated
version of the patch was pushed into linux-next and now machine doesn't
boot at all.

I couldn't find v3 on the ML, so replying to the v2. Please take a look
and fix the problem, or revert/drop the offending patch, thanks in advance.
