Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C10E1B7C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 16:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730369AbfEMOGa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 10:06:30 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42850 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbfEMOGa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 10:06:30 -0400
Received: by mail-lj1-f195.google.com with SMTP id 188so11075516ljf.9;
        Mon, 13 May 2019 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qsB8mONNRQdOykcbEvsV450l7EoJeG+DifZn5TSN7ps=;
        b=Ay4NVZxhPPakV2Xa8ZzJZzt3f9h2e8RV0ysLwuqZz0ywIO4mjHDRP+QgbsWRG8UYaI
         6CXEPjftNdlGuxQ/Q+CN6MFP4Oap/4Cfj12cN9xFnPMgdO4se0gSY6txfe1DwIrrg1OR
         gNQcV+ZJhBpJqfHtK3Lvn8/jg2hhsBk4jdQjDe7N3kr//KZ+2YrmFkrzI2k5JH9bZn6m
         iSMWPGK7l4Y1ONN16e5vprNbcQINWLuS3dT2UjK+klPjGxJ+kNKTTJSXoUFzJhix7HBR
         fELI6THhsonzWifsdS+wn+FXrjDnANjHl0AMvidipn0DYWrUS80lUYFHqK6n1Gq4V2Lm
         AxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qsB8mONNRQdOykcbEvsV450l7EoJeG+DifZn5TSN7ps=;
        b=EeE5ZfbnglyJEAViSusKKSYF4fgyo5sN/JADSfEBEsle9FzrWjVQAz+EgP8jClATL/
         hk1D/umJKwPuIBNBkZxP4PLR+dxKy+Ufef24NU5BWKBL5f5IgoWyK6/kF0JYkENimlMK
         BRPiZls8MmHgnIqLM+ZZTWkqXwzqnAP69xyQEDqtoZjCXFdeWuhMnalFxR+MmLL30Shp
         /k6RUgNORiS9FijRUE4BXm1+9c8d84Y6IKW+LQ3SPJjTa/4GA4d6BqwfY3fYmUvlc8Im
         AKCLfRAoF7p8VeDXOYyhzXA4aPkEkzim5JzFcfahxlpMKMN/sSDbH8qXuxqh2vw9ZEDE
         tghA==
X-Gm-Message-State: APjAAAXHvQ0jqdxygoDRJI1ImtZ5HHj5Mi4Gg5ZEjlXRpli8122KljEe
        hUrEsv3EQHq7wEeOWXOXxno=
X-Google-Smtp-Source: APXvYqxbOCYtaSW8f/ZwP0g7HwGg/jGgpM0Vd5ZEOgfA8sSD15p2EbHv2MId7jo+xznWo3RmHG0TVQ==
X-Received: by 2002:a2e:4555:: with SMTP id s82mr13823604lja.15.1557756387312;
        Mon, 13 May 2019 07:06:27 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
        by smtp.gmail.com with ESMTPSA id h29sm3137491ljb.49.2019.05.13.07.06.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 07:06:26 -0700 (PDT)
Subject: Re: [RFC PATCH] ARM: mach-shmobile: Parse DT to get ARCH timer memory
 region
To:     Julien Grall <julien.grall@arm.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     horms@verge.net.au, magnus.damm@gmail.com, linux@armlinux.org.uk,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1557505377-28577-1-git-send-email-olekstysh@gmail.com>
 <e64d7f2f-209e-cf7d-6ddc-88d338b1c010@arm.com>
From:   Oleksandr <olekstysh@gmail.com>
Message-ID: <cc9c5c48-2bc1-be49-4188-8b26dbf7ecc1@gmail.com>
Date:   Mon, 13 May 2019 17:06:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e64d7f2f-209e-cf7d-6ddc-88d338b1c010@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 13.05.19 12:19, Julien Grall wrote:
> Hi,

Hi, Julien, Geert


>
> On 5/10/19 5:22 PM, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Don't use hardcoded address, retrieve it from device-tree instead.
>>
>> And besides, this patch fixes the memory error when running
>> on top of Xen hypervisor:
>>
>> (XEN) traps.c:1999:d0v0 HSR=0x93830007 pc=0xc0b097f8 gva=0xf0805000
>>        gpa=0x000000e6080000
>>
>> Which shows that VCPU0 in Dom0 is trying to access an address in memory
>> it is not allowed to access (0x000000e6080000).
>> Put simply, Xen doesn't know that it is a device's register memory
>> since it wasn't described in a host device tree (which Xen parses)
>> and as the result this memory region wasn't assigned to Dom0 at
>> domain creation time.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> ---
>>
>> This patch is meant to get feedback from the community before
>> proceeding further. If we decide to go this direction, all Gen2
>> device-trees should be updated (add memory region) before
>> this patch going in.
>>
>> e.g. r8a7790.dtsi:
>>
>> ...
>> timer {
>>     compatible = "arm,armv7-timer";
>>     interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | 
>> IRQ_TYPE_LEVEL_LOW)>,
>>                   <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | 
>> IRQ_TYPE_LEVEL_LOW)>,
>>                   <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | 
>> IRQ_TYPE_LEVEL_LOW)>,
>>                   <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | 
>> IRQ_TYPE_LEVEL_LOW)>;
>> +     reg = <0 0xe6080000 0 0x1000>;
>
> This looks incorrect, the "arm,armv7-timer" bindings doesn't offer you 
> the possibility to specify an MMIO region. This makes sense because it 
> is meant to describe the Arch timer that is only access via 
> co-processor registers.
>
> Looking at the code, I think the MMIO region corresponds to the 
> coresight (based on the register name). So you may want to describe 
> the coresight in the Device-Tree.
>
> Also, AFAICT, the code is configuring and turning on the timer if it 
> has not been done yet. If you are here running on Xen, then you have 
> probably done something wrong. Indeed, it means Xen would not be able 
> to use the timer until Dom0 has booted. But, shouldn't newer U-boot do 
> it for you?

Let me elaborate a bit more on this...

Indeed, my PSCI patch series for U-Boot includes a patch [1] for 
configuring that "counter module". So, if PSCI is available 
(psci_smp_available() == true), then most likely we are running on 
PSCI-enabled
U-Boot which, we assume, has already taken care of configuring timer (as 
well as resetting CNTVOFF). So, when running on Xen, the timer was 
configured beforehand in U-Boot, and Xen is able to use it from the very 
beginning, these is no need to wait for Dom0 to configure it.

(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 10000 KHz

So, the code in brackets won't be called when using PSCI/running Xen, 
since the timer is already both enabled and configured:

if ((ioread32(base + CNTCR) & 1) == 0 ||
         ioread32(base + CNTFID0) != freq) {
         /* Update registers with correct frequency */
         iowrite32(freq, base + CNTFID0);
         asm volatile("mcr p15, 0, %0, c14, c0, 0" : : "r" (freq));

         /* make sure arch timer is started by setting bit 0 of CNTCR */
         iowrite32(1, base + CNTCR);
}

But, the problem here is the first read access from timer register (when 
we check whether the timer requires enabling) results in hypervisor trap:

(XEN) traps.c:1999:d0v0 HSR=0x93830007 pc=0xc0b097f8 gva=0xf0805000 
gpa=0x000000e6080000

So, if the DT bindings for the counter module is not an option (if I 
correctly understood a discussion pointed by Geert in another letter), 
we should probably prevent all timer code here from being executed if 
PSCI is in use.
What I mean is to return to [2], but with the modification to use 
psci_smp_available() helper as an indicator of PSCI usage.

Julien, Geert, what do you think?


[1] https://marc.info/?l=u-boot&m=154895714510154&w=2

[2] https://lkml.org/lkml/2019/4/17/810


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko

