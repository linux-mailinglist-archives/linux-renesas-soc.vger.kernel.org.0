Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625E1450589
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 14:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhKONf1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 08:35:27 -0500
Received: from mail.iot.bzh ([51.75.236.24]:21363 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231875AbhKONdq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:33:46 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id A7B021B646;
        Mon, 15 Nov 2021 14:30:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=Pb1meLNgceFRGl3J1QiW/2avLk
        XztIsTucUjZId/JzA=; b=L2Pv3TlhNXDl6WbSfCFUfmkDo4sm1Clqa30AGHlm78
        g2h0G7yY9HZyLesfQ3XPGvCHUu17doOrmtmPnPD3Aq1jAMtd5js+LvIanhqv9d1F
        NnqJtVBtLb3oFHmMhuDhtl500OzEzjFL/YDh1t5MCgbV2mCvgFKB54aSOLsLmT7X
        bpV1bc73p+hHLfY6vUQYUOoa3U0GZRiqml4rxFr4dGMoHHRqAbzgz3Rw0P0b9PAe
        giaTQan4bxHWp1eejfSeTHBzdReX6foaLeGGFy1gK+mWTO1a6Qukb3/TjXwMMARl
        akTmzzH/kK174TQ0rCSbgDcVvIBwbSrUCdN8l4ZAA8dw==
Message-ID: <9ba66a3c-2a0e-9f1c-a8eb-e99a8867938e@iot.bzh>
Date:   Mon, 15 Nov 2021 14:30:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 3/3] remoteproc: Add Renesas rcar driver
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     =?UTF-8?Q?Bj=c3=b6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20211027073020.17055-1-julien.massot@iot.bzh>
 <20211027073020.17055-4-julien.massot@iot.bzh>
 <20211108184252.GA1971795@p14s>
 <CAMuHMdWZTXp5O56wkf3Lesd4jDv4tvhpKfagq3uUW5qNTNYdOQ@mail.gmail.com>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <CAMuHMdWZTXp5O56wkf3Lesd4jDv4tvhpKfagq3uUW5qNTNYdOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert, Mathieu,

Thanks for the review

On 11/9/21 09:09, Geert Uytterhoeven wrote:
> On Mon, Nov 8, 2021 at 7:42 PM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
>> On Wed, Oct 27, 2021 at 09:30:20AM +0200, Julien Massot wrote:
>>> Renesas Gen3 platform includes a Cortex-r7 processor.
>>>
>>> Both: the application cores (A5x) and the realtime core (CR7)
>>> share access to the RAM and devices with the same address map,
>>> so device addresses are equal to the Linux physical addresses.
>>>
>>> In order to initialize this remote processor we need to:
>>> - power on the realtime core
>>> - put the firmware in a ram area
>>> - set the boot address for this firmware (reset vector)
>>> - Deassert the reset
>>>
>>> This initial driver allows to start and stop the Cortex R7
>>> processor.
>>>
>>> Signed-off-by: Julien Massot <julien.massot@iot.bzh>
> 
>>> --- a/drivers/remoteproc/Kconfig
>>> +++ b/drivers/remoteproc/Kconfig
>>> @@ -261,6 +261,17 @@ config QCOM_WCNSS_PIL
>>>          verified and booted with the help of the Peripheral Authentication
>>>          System (PAS) in TrustZone.
>>>
>>> +config RCAR_REMOTEPROC
>>> +     tristate "Renesas RCAR remoteproc support"
>>
>> It is probably a good idea to include the type of SoC being supported, something
>> like:
>>
>>          tristate "Renesas Gen3 RCAR remoteproc support"
> 
> R-Car Gen3 please
Thanks changed to "Renesas R-Car Gen3 remoteproc support".

>>
>>> +     priv->dev = dev;
>>> +
>>> +     priv->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>>> +     if (IS_ERR(priv->rst)) {
>>> +             ret = PTR_ERR(priv->rst);
>>> +             dev_err(dev, "fail to acquire rproc reset\n");
>>> +             goto free_rproc;
>>> +     }
>>> +
>>> +     pm_runtime_enable(priv->dev);
>>> +     ret = pm_runtime_get_sync(priv->dev);
>>
>> There is no dev_pm_ops for the platform driver nor clocks to manage for this
>> device - is there something that requires pm_runtime operations to be called?
> 
> Given
> 
>      cr7_rproc: cr7 {
>          compatible = "renesas,rcar-cr7";
>          memory-region = <&cr7_ram>;
>          power-domains = <&sysc R8A7795_PD_CR7>;
>          resets = <&cpg 222>;
>          status = "okay";
>      };
> 
> the pm_runtime_get_sync() is intended to power the CR7 power domain,
> right?

That's exactly why I'm calling pm_runtime_get_sync. The Cortex R7 power domain
needs to be enabled.
  
> However, I have my doubt about the (bindings for) that node, as it
> does not represent the hardware.  Shouldn't the Cortex R7 have its
> own CPU node instead, with an appropriate enable-method?

Yes, representation is really from Remoteproc point of view, the Cortex R7 is
represented as other devices, and doesn't have a cpu node. As far I know it's
how others remoteproc CPUs are described in other SoCs such as ST, Qcom, TI, or NXP
SoCs. From what I see, CPU nodes are given for binary compatible CPUs where Linux can
execute on.

Regards,

-- 
Julien Massot [IoT.bzh]

