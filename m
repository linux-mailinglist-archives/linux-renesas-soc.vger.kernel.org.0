Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA939B2C0A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2019 17:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfINPvA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Sep 2019 11:51:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32896 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfINPu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Sep 2019 11:50:59 -0400
Received: by mail-wr1-f65.google.com with SMTP id b9so1206722wrs.0;
        Sat, 14 Sep 2019 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=778m3utKBTt1vYchtlPsYkKj5vNVb6Yzv/7CVJjEO8Q=;
        b=HYbPwVq04HkBPUljTz+Bz6kD3q2GFcmF7SEleNcHSYPKPOKfdFWdESfN1rIDDtAM1V
         jWKoDD1QFJV5bMSR/IImIvlaLy22Q63uR3J1g6+CaT4x8k+esdHhkQSWrLD2WYtipING
         O8NH3A9cTK3e9cNInegxDwFEsHclQAJiC4iWXRnS5SdzHm0SakdPOiplLalwYM/Xe3XN
         B545yJWHn9V9lPn6x72hcGX4eldrNyMuEET1A+vslN+KEEm6ACAe29GNjGquY4iWtEV7
         8KIufgH4Y0NhuE3z6be8BC2uYrxuh0IryY+gHqaucSLgy6LzpFv5aLTFL9kmocjR9z/t
         iqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=778m3utKBTt1vYchtlPsYkKj5vNVb6Yzv/7CVJjEO8Q=;
        b=Mdi2KQN0BltyxwOu5LBQPneIIXSrbjC61CH/H+Sp9CIg7kgCXf0PYbaWZyVxF6x6kd
         yjgwPviolsd193V+MyfoQtZR0ZTL+DIMHMQiFFYpozIWcKnVa6x5CQkQgejN5oYxIZx3
         V3f0+Fk9f1gKA+xXhmaFuWLjKoSYs6AxDwu5Q9sGrILXyJFN9If0tQJxTeXXOj4QYKfS
         V5ayTXsIK9VNDGbLzkFRnfUOFzPCMCrK7/b4CPqad+uEAOZiKUNxXMDnPFJsM53/fmTY
         n7CNL5TNiVzVYS9Gx6aYPNCDeQSe8rN3RTq3X/Y+ZyoMHP1qWUsXCeSXYMQsm1Xi50ZO
         7PYg==
X-Gm-Message-State: APjAAAUI/HOi25aXOpPo5cpmtHCbLgcyEcL1jJQv1HAcIzp65jIeWjM1
        ecax/haQ7RaeTl8KodUbmi3oqXEb
X-Google-Smtp-Source: APXvYqwo1Vwe5g2Wrt+XyISdF7+xLZ9yteEIOcNsgHMGadz8yiRXUJofTMQWenDTB4I4hEalMfdnAw==
X-Received: by 2002:adf:f287:: with SMTP id k7mr3122994wro.206.1568476257321;
        Sat, 14 Sep 2019 08:50:57 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id q14sm67908200wrc.77.2019.09.14.08.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2019 08:50:56 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Rob Herring <robh@kernel.org>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
References: <20190907161634.27378-1-marek.vasut@gmail.com>
 <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <2d812f08-cacb-2ef2-8073-f03a22ec4033@gmail.com>
Date:   Sat, 14 Sep 2019 17:50:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/13/19 5:14 PM, Rob Herring wrote:
> On Sat, Sep 7, 2019 at 5:16 PM <marek.vasut@gmail.com> wrote:
>>
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Add dma-ranges property into /soc node to describe the DMA capabilities
>> of the bus. This is currently needed to translate PCI DMA ranges, which
>> are limited to 32bit addresses.
> 
> FYI, I've started working on this problem and issues around
> dma-ranges/dma_mask. Hopefully I'll get some patches out next week.

Thanks

>> ---
>> NOTE: This is needed for the following patches to work correctly:
>>       https://patchwork.ozlabs.org/patch/1144870/
>>       https://patchwork.ozlabs.org/patch/1144871/
> 
> First I'm seeing those... Well, I do have v7 from 2+ years ago...

Right, this issue was dragging on for a very long time.

> Not sure if these take into account the new dma_bus_mask, but that
> should simplify solving the issue.

What's that about ?

>> ---
>>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 +
>>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 +
>>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
>>  3 files changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> index 95deff66eeb6..2102140a6723 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> @@ -330,6 +330,7 @@
>>                 #address-cells = <2>;
>>                 #size-cells = <2>;
>>                 ranges;
>> +               dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
> 
> Is the limitation in the bus or the PCI bridge or both? The commit
> message sounds like it's the PCI bridge in which case this is wrong
> (or incomplete).

I believe it is the PCI bridge too.

> 'dma-ranges' should be on the bus node where the
> restriction/translation exists. For PCI devices, that's the PCI bridge
> node. So a 32-bit only PCI bridge should have a dma-ranges size of
> 4GB. If the SoC bus has more restrictions, then that should be in the
> PCI bridge parent assuming that restriction also applies to other
> devices.

Would that mean the dma-ranges for /soc/pcie@fe000000/ [1], which is
already present in the DTSi, is the one that should be used to determine
the controller limitations ?

[1]
https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm64/boot/dts/renesas/r8a7795.dtsi#L2653

-- 
Best regards,
Marek Vasut
