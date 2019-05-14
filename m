Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 030A01C9C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 15:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfENN6x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 09:58:53 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38011 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfENN6x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 09:58:53 -0400
Received: by mail-lj1-f193.google.com with SMTP id 14so14422617ljj.5;
        Tue, 14 May 2019 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TXkbr8S0quedHhwnVy9a2UzBuQwq+DVg7EOJ79R7nvk=;
        b=dVwhDA/CsdVyGzQz4Zq5GyUImMVOPlzK7q92WaBv7aVR/QNOln6a9vHks5IQjJ21Xv
         lqqj2A6TR2AD7nzeoZGHQw9U3U5x16XjiHEEig6Z/452AC8sMkgC/a05J/zbcBMKhokv
         JFXrLfRjEZHm0QsChfdmptxwabFfnLT9X5Whod9F5xmQMwa/EpgUO7rF/emXZYUDuhb0
         C5NcuAyuoyRYabw+YyRFGapqrOvp5n1PD//7/kUIGLdzhSM1QD73RBiBCQFG27o1SAzR
         Am+gEbfJ3zA+PF2iPD5lC70v0VAYrp6hx4lBC2I647hu9NLKvwU2yVFg2iYqhRv4hNqI
         vH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TXkbr8S0quedHhwnVy9a2UzBuQwq+DVg7EOJ79R7nvk=;
        b=WmBEeCDRcxaFtvC7lZ4AzNlO2m6jfJiUR5bweo8+GyWPuHjvOJbZpPGw+8T3VQ/0mn
         2herlUayYM1Xnxw88eMq+NE+ZkkECnVKeE2RaTTmUHzyK0VjjvE0rPlVktcx8L/T8H75
         LZQwlN58Czp5QRdW3C998iPlrn0G7FV8VtkFSV+viGqZ4kkpvq8Nej2tzI34XJpdIkTK
         zvWdH8DiX//HNwv1Cf0MMwJTKL6keKnyG3Wf/jRvbTsesQqmcnP4NdzADWHEsj5I33tj
         3dl1MnJ3gSA4B7kEKePS4s14WApzyVjnioAlmH6pyUxAq09ibjietifq1hIlCgSuXjG7
         fmAQ==
X-Gm-Message-State: APjAAAWUI9BUSe0IpI7Wd50+hxSvRKg2+HOWQ7IJwa8hxCo6w6BdmHCr
        WFnIx757GbjV4aB3rpgssqM=
X-Google-Smtp-Source: APXvYqx0S1pl0aXedFJoDeY9xEINeBSgt0TzaWXi3c4ODg1MdUP8vfhIX2JBNMO1WKWZxmxyQf118Q==
X-Received: by 2002:a2e:568b:: with SMTP id k11mr17057734lje.124.1557842330726;
        Tue, 14 May 2019 06:58:50 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
        by smtp.gmail.com with ESMTPSA id y27sm1282033ljd.14.2019.05.14.06.58.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 06:58:49 -0700 (PDT)
Subject: Re: [RFC PATCH] ARM: mach-shmobile: Parse DT to get ARCH timer memory
 region
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Julien Grall <julien.grall@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1557505377-28577-1-git-send-email-olekstysh@gmail.com>
 <e64d7f2f-209e-cf7d-6ddc-88d338b1c010@arm.com>
 <cc9c5c48-2bc1-be49-4188-8b26dbf7ecc1@gmail.com>
 <CAMuHMdWODzaHSeXyB5CgGmq3ZumFGVZYOUT1v1_Ps-RguPLseA@mail.gmail.com>
 <25f5f60e-46ff-18af-2a65-1e3f6719ef49@gmail.com>
 <CAMuHMdWkEU7x_Lzk6NUCxEdZRx_xTBFzkETwShZ322aYL5=bLg@mail.gmail.com>
From:   Oleksandr <olekstysh@gmail.com>
Message-ID: <3e786103-69a4-2867-fc04-ccb4512bf221@gmail.com>
Date:   Tue, 14 May 2019 16:58:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWkEU7x_Lzk6NUCxEdZRx_xTBFzkETwShZ322aYL5=bLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 14.05.19 10:16, Geert Uytterhoeven wrote:
> Hi Oleksandr,

Hi Geert


>
> On Mon, May 13, 2019 at 6:00 PM Oleksandr <olekstysh@gmail.com> wrote:
>> On 13.05.19 18:13, Geert Uytterhoeven wrote:
>>>> So, if the DT bindings for the counter module is not an option (if I
>>>> correctly understood a discussion pointed by Geert in another letter),
>>>> we should probably prevent all timer code here from being executed if
>>>> PSCI is in use.
>>>> What I mean is to return to [2], but with the modification to use
>>>> psci_smp_available() helper as an indicator of PSCI usage.
>>>>
>>>> Julien, Geert, what do you think?
>>> Yes, that sounds good to me.
>>>
>>> Note that psci_smp_available() seems to return false if CONFIG_SMP=n,
>>> so checking for that is not sufficient to avoid crashes when running a
>>> uniprocessor kernel on a PSCI-enabled system.
>> Indeed, you are right.
>>
>>
>> Nothing than just check for psci_ops.cpu_on == NULL directly comes to
>> mind...
>>
>> Have already checked with CONFIG_SMP=n, it works.
>>
>> Sounds ok?
> Fine for me, thanks!

Great, I will send new version.


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
-- 
Regards,

Oleksandr Tyshchenko

