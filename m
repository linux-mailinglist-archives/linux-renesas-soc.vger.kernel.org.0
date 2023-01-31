Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C71D682C89
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Jan 2023 13:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjAaM2P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Jan 2023 07:28:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbjAaM2O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jan 2023 07:28:14 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 424CF10D1;
        Tue, 31 Jan 2023 04:28:06 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65F302F4;
        Tue, 31 Jan 2023 04:28:48 -0800 (PST)
Received: from [10.57.88.157] (unknown [10.57.88.157])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E96CE3F71E;
        Tue, 31 Jan 2023 04:28:04 -0800 (PST)
Message-ID: <23408b52-32f0-9098-e434-78cb85c8e75b@arm.com>
Date:   Tue, 31 Jan 2023 12:28:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Update
 descriptions for R-Car Gen4
Content-Language: en-GB
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
 <TYBPR01MB5341B023178B4A10DE52B844D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdXXnu88Tn2ucuHZK=3G18v-nCfaTYpomchRXBu3bD7UuA@mail.gmail.com>
 <3c3e1dc2-1f66-565c-c677-2eae368e10be@arm.com>
 <20230130193604.GA3218335-robh@kernel.org>
 <CAMuHMdU4j3drFt6jAZPHTJMrrL7GTWHxNqMGHR-1pScqg4H2xg@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAMuHMdU4j3drFt6jAZPHTJMrrL7GTWHxNqMGHR-1pScqg4H2xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2023-01-31 08:20, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Mon, Jan 30, 2023 at 8:36 PM Rob Herring <robh@kernel.org> wrote:
>> On Wed, Jan 25, 2023 at 10:42:13AM +0000, Robin Murphy wrote:
>>> On 2023-01-25 08:54, Geert Uytterhoeven wrote:
>>>> On Wed, Jan 25, 2023 at 1:49 AM Yoshihiro Shimoda
>>>> <yoshihiro.shimoda.uh@renesas.com> wrote:
>>>>>> From: Geert Uytterhoeven, Sent: Tuesday, January 24, 2023 11:35 PM
>>>>>> On Mon, Jan 23, 2023 at 2:35 AM Yoshihiro Shimoda
>>>>>> <yoshihiro.shimoda.uh@renesas.com> wrote:
>>>>>>> Since R-Car Gen4 doens't have the main IPMMU IMSSTR register, but
>>>>>>> each cache IPMMU has own module id. So, update descriptions of
>>>>>>> renesas,ipmmu-main property for R-Car Gen4.
>>>>>>>
>>>>>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>>>
>>>>>>> ---
>>>>>>>    The old R-Car S4-8 datasheet had described IPMMU IMSSTR register, but
>>>>>>>    the latest datasheet undocumented the register. So, update the propeties
>>>>>>>    description. Note that the second argument is not used on the driver.
>>>>>>
>>>>>> DT describes hardware, not software policy.
>>>>>
>>>>> I think so.
>>>>>
>>>>>>>    So no behavior change.
>>>>>>
>>>>>> So where do we get the module id numbers to use, if they are no longer
>>>>>> documented in the Hardware Manual?
>>>>>
>>>>> If so, we cannot get the module id numbers. So, should we use other
>>>>> information which is completely fixed instead? I have some ideas:
>>>>> 1) Just 0 (or other fixed value) if the IMSSTR register doesn't exist.
>>>>> 2) Sequential numbers from register base offset.
>>>>>      In R-Car S4: ipmmu_rt0 is the first node from register base offset,
>>>>>      and ipmmu_rt1 is the second one.
>>>>>      So, ipmmu_rt0 is 0, ipmmu_rt1 is 1, ipmmu_ds0 is 2 and ipmmu_hc is 3.
>>>>> 3) Using base address upper 16-bits.
>>>>>      In R-Car S4: ipmmu_rt0 is 0xee480000. So, the value is 0xee48.
>>>>>
>>>>> Perhaps, the option 1) is reasonable, I think. But, what do you think?
>>>>
>>>> I would not make up numbers, as that would cause confusion with SoCs
>>>> where the numbers do match the hardware.
>>>> As the driver doesn't use the module id number (it already loops
>>>> over all domains, instead of checking IMSSTR, probably because of
>>>> historical (R-Car Gen2) reasons?), what about dropping it from the
>>>> property? I.e. add "minItems: 1", possibly only when compatible with
>>>> renesas,rcar-gen4-ipmmu-vmsa?
>>>
>>> Right, if there really is no meaningful ID for this model then its binding
>>> should not require one.
>>
>> I agree, however that makes parsing the property a pain (for both the
>> schema and driver). This property is a matrix. The number of entries is
>> already variable. If both dimensions are variable, we have to then look
>> at the compatible to know how to parse it. I would go with option 1.
> 
> But it does not have to be two-dimensional.
> The second dimension was added in commit 39bd2b6a3783b899 ("dt-bindings
>   Improve phandle-array schemas"), but is not needed.
> Can this be simplified again?

Maybe the answer is that it's a cell-array of one item which contains a 
bare phandle and an (optional) integer that happens to look a bit like a 
phandle argument but isn't?

Robin.

> The driver doesn't care, it just checks for the presence of the
> property, i.e. treats it as a boolean flag.
> 
>> A 4th option is a new property.
> 
> If all else fails, a new boolean flag would work...
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
