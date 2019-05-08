Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1F217CE2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 17:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfEHPL3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 11:11:29 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:53531 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfEHPL2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 11:11:28 -0400
Received: by mail-wm1-f50.google.com with SMTP id 198so3736526wme.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 May 2019 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2nVoZpGDHzJylTuGZvHq7w0y334Sc4ifrhxZOTPqy+8=;
        b=c3M59uWMwU85GE6KASPV9IrLKvD+WHtclGlC6IJVvWldApr6FPhII89CZjBIqJzR3B
         lICGMXIb4wdlnshUfc0bX1QuSt6gJMrlfQrBkaoxFTDLjZRmKqlZcErypuJtABUTH+r1
         pFiiGhSpAX/DMCboWHWtWWxNVpEBnFmQIiTp7s8KgIirJXgShRkiO2U1W4ZpGjtenT5c
         a4yGOAdUQ/ZpPw3kGF8CySYGyjk34A6BAVRkipmf6771SvCp9Nv+neVHRQ8NPOEwTnnU
         3dXLJVAI6mJ/iHXuzpm3TIjY9VSjVS8lPGlazbPozNgq3vPoEH7EJ+d0f/LaVIF9rqAP
         baVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2nVoZpGDHzJylTuGZvHq7w0y334Sc4ifrhxZOTPqy+8=;
        b=knIGWwl6zhYyPd85/LzpsmllPBw0ggINVYKXbZ22bGp7nrLu5m66fZU8+gk33czlkN
         WEChPlqJ0E4jfcPTyJbZvs5HWdefySRwps1WMMze3FUjP/9Hp1dJ71z21RWGDa6+/Wn6
         v/VmGL16ccAStw/0r3mKzYScFf/ZaVqEKAzyeI8FWQlKmCWjHZ1+gEocfuGiF7FQASei
         3EdpS5Y/NcLKEhlGrWzUe62HfYcbP/CX1KfbL4Hu80cB0+rMvOUobcfts+AdHa/59Lg8
         FLkWCUFnOOglGlQEss5HoaXRtDsNm/D4nwlHq4oewe7gylj2vloHHqmjFxVZFx82mtLD
         Z9nQ==
X-Gm-Message-State: APjAAAVatUwIPz7OxP52wQ8udEBP28ijPoHwY+A/ixiEHA+otKks7wao
        /7gI8NUyWlv+r5I69iqvQCY=
X-Google-Smtp-Source: APXvYqy9cWpBUprojd1CmnWyMyvEZkfT1Vp8kam7pUs/+axCETYvzGtaIW4Xh1auv5++mpu3wEpYfw==
X-Received: by 2002:a05:600c:24ca:: with SMTP id 10mr3600869wmu.45.1557328286462;
        Wed, 08 May 2019 08:11:26 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id g10sm16178438wrq.2.2019.05.08.08.11.25
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 08:11:25 -0700 (PDT)
Subject: Re: Automated/remote flashing of R-Car3
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        u-boot@lists.denx.de, linux-renesas-soc@vger.kernel.org,
        Michael Dege <michael.dege@renesas.com>,
        Gotthard Voellmeke <gotthard.voellmeke@renesas.com>,
        Adam Bass <adam.bass@renesas.com>,
        Bastian Farkas <bfarkas@de.adit-jv.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Philipp Ahmann <pahmann@de.adit-jv.com>,
        Simon Maleyka <smaleyka@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Matthias Weise <mweise@de.adit-jv.com>,
        Christoph Gellner <cgellner@de.adit-jv.com>
References: <20190507104115.GA27355@vmlxhi-102.adit-jv.com>
 <79ae01fb-6945-05c5-a08d-92aaffeaa6f0@gmail.com>
 <20190507155308.GA1600@vmlxhi-102.adit-jv.com>
 <48af9a12-57d9-0279-581f-e81698b18adb@gmail.com>
 <20190508135104.GA22152@vmlxhi-102.adit-jv.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <115bf820-4a60-b029-da59-9681653f57b2@gmail.com>
Date:   Wed, 8 May 2019 17:11:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508135104.GA22152@vmlxhi-102.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 5/8/19 3:51 PM, Eugeniu Rosca wrote:
> Hi Marek,
> 
> On Tue, May 07, 2019 at 06:09:10PM +0200, Marek Vasut wrote:
> [..]
>>>>> 1.c Use OpenOCD
>>>>> + Presumably same advantages as using a Lauterbach
>>>>> + Based on Kieran's https://github.com/kbingham/renesas-jtag
>>>>>   and on Adam's https://github.com/ntfreak/openocd/commit/1afec4f561392
>>>>>   the solution is currently in use.
>>>>> ? Any ideas on the model/price of the JTAG adapter?
>>>>
>>>> Any FT2232H (the H is important, due to MPSSE) works.
>>>> I like Flyswatter2 from TinCanTools.
>>>>
>>>>> ? Not tested. Any patches needed on top of vanilla OpenOCD?
>>>>
>>>> http://openocd.zylin.com/5149 and related ones, it adds RPC HF support.
>>>> However, there are two problems with this:
>>>> 1) Even with buffered write, the programming is slow
>>>>    - This could be improved by running code on one of the Gen3 CPUs
>>>>      instead of whacking registers via JTAG adapter. I believe that's
>>>>      what lauterbach and everyone else does too. The data upload to
>>>>      SRAM/DRAM is fast via JTAG, register IO is not great.
>>>> 2) LifeC locks the RPC HF access
>>>>    - This is a problem, since the JTAG probe cannot access it once
>>>>      it's locked. There might be a way around it, but it's rather
>>>>      nasty -- use boundary scan test mode to either flip MD pins or
>>>>      access the HF bus directly and bitbang at least erase command
>>>>      to wipe the first few sectors, then reset the CPU and have it
>>>>      drop to SCIF loader mode, then stop the CPU and reprogram the
>>>>      HF (since the SCIF loader runs in EL3 and does not touch the
>>>>      lifec settings.
>>>>
>>>> Neither of 1) and 2) is implemented, but can be implemented if there is
>>>> interest.
>>>
>>> 1) looks like a performance issue to me (suboptimal flashing time).
>>> To be honest, I don't think this is a deal-breaker, assuming that
>>> erasing/re-writing the whole 64MiB HF doesn't exceed ~10-15min.
>>> It is also my understanding this is subject of future optimization.
>>
>> It will have to be optimized further.
>>
>>> 2) looks like a functional issue (insufficient permission to
>>> write-access HF). To make things clear, could you please stress if
>>> http://openocd.zylin.com/5149 already allows updating ATF/U-Boot/OPTEE
>>> on HF of R-Car Gen3 or is it still awaiting some fixes?
>>
>> You can read/write/erase the HF with it. Just keep in mind the HF has to
>> be unlocked.
>>
>> Maybe there is some magic/sectret way to unlock the LifeC RPC access
>> restriction via JTAG, but we don't know about it.
> 
> Well, "unlocking" HF via LifeC registers (set in BL2) is pretty much
> equivalent to diverging from the Renesas-delivered BL2/IPL, by
> accepting a solution like [0] referenced in my initial e-mail
> (linked again below). Spawning multiple build variants of ATF (i.e.
> tested vs released) is what we would like to avoid.

Maybe there's a way to do it over JTAG.

Or maybe there's a way to fiddle with the MD pins via boundary scan
testing, but I cannot find the BSDL files for either R-Car Gen2 or Gen3
on the internet. There are ones for RZ/A1 and some older SH stuff.

I wonder what magic Lauterbach does there to unlock the RPC :-)

> Thanks for pointing out this limitation.
> Hopefully it can be addressed in a future iteration of
> http://openocd.zylin.com/5149.
> 
> [0] https://github.com/CogentEmbedded/meta-rcar/blob/v3.15.0/meta-rcar-gen3-adas/recipes-bsp/arm-trusted-firmware/files/0001-plat-renesas-rcar-Make-RPC-secure-settings-optional.patch
> 


-- 
Best regards,
Marek Vasut
