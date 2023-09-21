Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B22CF7AA313
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 23:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbjIUVqk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 17:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbjIUVqZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 17:46:25 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B712A7EEE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 10:22:40 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5031ccf004cso2043576e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695316958; x=1695921758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WE8LH19pPsCxh8naHG8n/k7q/gLXUPSjuv+tzgJMdcg=;
        b=AkHxYkxf2obBceiTjrAZy6mR1gcWWIW/ghlKMLAA4OOSjlHCE2LJC+AMfYpOOTqQyn
         9Smjrwy+LrBQ40sV5z3lXELspszqDaWG42TuiMelCzPMuS0Ic8aBTKNGB0rAGbtDtskM
         5oKKqV4jHHFUqvmxNiK9GdEhrPYPQv+1Jg1lLG4NoFGsznGhXn+mNO6ZeUJtHhu8b7XV
         kHrDzISDHL3EJu8JEt3vxvRlf138xkStn/cFibdqS/UrI46a88rBjQ27+rGyKpQ/C12q
         RSLgu0oGBOgREidvhXtCGiZblZNA/zUtSY00v4dMynM3hL+2ewkPnFFkCU67jWduC3JD
         r8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695316958; x=1695921758;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE8LH19pPsCxh8naHG8n/k7q/gLXUPSjuv+tzgJMdcg=;
        b=xTgA34ne/vEYWzUcxDfiF8tI4+ceZsWJ48Asl3ag7Z4J/RyhNcxHpfQKoQRxOf4bpT
         V4Ox17Qv36wcHKw0GHxhBh9waA9n69ZWlHen3eYV9OuOEJQPTr3KeaZzXt9iv5gcnvkg
         gT8pfROCkICZAxZyl7gf3WscvqU40+r5o2X41xhx5yD1CxflXgeN0F4P1ii0xMP5cNpJ
         hyUewVYzBPU0ltrQwAK65wjWJ870ISKM5dw3h5vjN5IVv0INuqyHqRfICCQE1zSw8nlN
         0DmkFwnNtzzHXBpcWv1ywTi4fqq798/AGY22eRo1rIkfmg+5Ofu3MdrY18lf5nZOO9n3
         sIiw==
X-Gm-Message-State: AOJu0YzveSsm+GphENG9uw3avU2jtAwC20+PBTWIK1eaj7LriD4a6dTQ
        rTeL1ZNStaZpgswm3Pmaxv7e30hDRHI0PcA8woqoVA==
X-Google-Smtp-Source: AGHT+IF+ICUJJWSZmNyofI+iEUUXe8X6vnYcAKgG6IrHyBC4yFSz0Cb6KzUEVL7HuLUkgj98UgC9fw==
X-Received: by 2002:a05:6512:281b:b0:503:256a:80cc with SMTP id cf27-20020a056512281b00b00503256a80ccmr6519101lfb.42.1695307553102;
        Thu, 21 Sep 2023 07:45:53 -0700 (PDT)
Received: from [172.20.34.61] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id g4-20020aa7c584000000b0052e2472f884sm930316edq.21.2023.09.21.07.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 07:45:52 -0700 (PDT)
Message-ID: <ee03d150-51cf-4e12-ae2c-9475a192fb6c@linaro.org>
Date:   Thu, 21 Sep 2023 15:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>
Cc:     Michael Walle <michael@walle.cc>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
 <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
 <20221205163306.GB2012644-robh@kernel.org>
 <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi, Geert,

Sorry for the delay, I just noticed this while cleaning the patchwork log.

On 12/6/22 08:32, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Mon, Dec 5, 2022 at 5:33 PM Rob Herring <robh@kernel.org> wrote:
>> On Fri, Dec 02, 2022 at 02:56:01PM +0100, Geert Uytterhoeven wrote:
>>> On Fri, Dec 2, 2022 at 2:50 PM Michael Walle <michael@walle.cc> wrote:
>>>> Am 2022-12-02 14:37, schrieb Geert Uytterhoeven:
>>>>> Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
>>>>> FLASHes.
>>>>>
>>>>> Merge the new entries with the existing entry for MT25QU02G.
>>>>>
>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> ---
>>>>> mt25qu512a is already in active use, causing "make dtbs_check" errors.
>>>>> mt25qu256a is supported by the Linux spi-nor driver, but there are no
>>>>> upstream users yet.
>>>>
>>>> Is it encouraged to use the specific compatible with SPI-NOR flashes?
>>>> As far as I know it isn't. The spi-nor subsys tries hard to identify
>>>> any flashes at runtime and any additional information in the device tree
>>>> is used as a last resort (just for flashes which doesn't support the
>>>> read jedec id command yet). And usually boards have different sources
>>>> for flash chips, so hardcoding a particular part in the device tree
>>>> doesn't make sense.
>>>
>>> Thanks, I am aware there have been pushbacks when trying to
>>> document more compatible values.
>>>
>>> IMHO either all or none of them should be documented.
>>> If device-specific compatible values are discouraged, the bindings
>>> should be updated to reflect that, and document a single compatible
>>> value ("jedec,spi-nor") only.
>>
>> That's already allowed, so there's your answer.
> 
> It's indeed allowed, but the alternative is documented, too (for some
> values).
> 
>> The caveat is don't be adding them later to your DT when you find an
>> issue and new quirk properties will probably be rejected.
> 
> Adding them later to your DT when you find an issue makes no sense,
> as that breaks compatibility with older DTBs.
> 

We won't break compatibility with older DTBs if we use a list of
compatibles. First the vendor specific one which will use some quirks,
and if that's not available, have as second the generic jedec,spi-nor to
fallback to.

Cheers,
ta
