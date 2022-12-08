Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04353646C37
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Dec 2022 10:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbiLHJq4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Dec 2022 04:46:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbiLHJqh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Dec 2022 04:46:37 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7CF6F0E4
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Dec 2022 01:46:36 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id p36so1176843lfa.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Dec 2022 01:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JbJYjODEjro1RFdAuzwb2wjJ9qbMGZnpipEOMqi0I/0=;
        b=wSwCTtIanqUXWSPc0KxcMvgfz7n4H8KI2Uxk6yeWeRUPI0N7urywQW+Au5DGF6ywVK
         IXAzB0+orsU7wslEUAVg7Ay9wEwkz8SmCTk69kAwGuIHELMAHt3FoHsF4im0NqL8K06/
         RxTzKGkQcLxQyLrH55eXl/pgvWMbIy/TAi7d6YvGoo261/HSfr1f7LTF/RV6M4Kb7tGW
         RaPKKYeNxMWNdlNgXzSrWV99JpjmvFH81nYP9JiymaxvIYfO++vm9GdCEiYJi/xEoqiT
         PZc7C9q/Yyp98dry18TEUFJtafKPT8sPXa/SVSxY2p9yB21Fj4QmpphpHgRYVxdmqIX4
         8xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JbJYjODEjro1RFdAuzwb2wjJ9qbMGZnpipEOMqi0I/0=;
        b=QbgG9sf9P1q/siWryhXtFF+cxZ4VX5v8gw4WqPEx06fjYa0vGcgEw0s1wDa1oPMcbF
         JyelOgFOxRxVE6Q0o2WpjbEu/PX1x+YlRIJ6AfnDQT6NQYtDrnubAgqRf5FPgjb6yzR8
         seJ9rs/rRQXJT12z8WTz8Es6sITciL6FslEb3iBScfun9NlEQa9reKKjYK5/MHXVdsMX
         tPr8Fk373g+3tROSatjS3Zv53cYaQM3NBPZDnKzuVjjoboL9TpQTO1YuXByMaz1epHdl
         mEDBscqw3qsjNDp+iIET0UiupYgLKEL5uOdXAT9CjLkdJXtusIbr6X1Z7/iOES7DaIG3
         XOzg==
X-Gm-Message-State: ANoB5plRTE7fcYOtQxCZqGVSbhXh34MVClpNBrwKVz4zEZT5QVRL5uxG
        8O2SHOWyIj53MnvGJS33fFb/ww==
X-Google-Smtp-Source: AA0mqf5hBvoUq0DJmDGm6rvtOlEM6uybZlaFXaOwx4rvv/c2CPN/lkieaUTh7DCyPEd6A5RVF74mNw==
X-Received: by 2002:a05:6512:258b:b0:4b5:a5c7:3289 with SMTP id bf11-20020a056512258b00b004b5a5c73289mr193233lfb.8.1670492794696;
        Thu, 08 Dec 2022 01:46:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s5-20020a056512314500b004b56a8d9e90sm1826596lfi.116.2022.12.08.01.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 01:46:34 -0800 (PST)
Message-ID: <8dfb5b8a-766a-14ec-16d4-74fdd9f7d622@linaro.org>
Date:   Thu, 8 Dec 2022 10:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 3/9] dt-bindings: PCI: renesas,pci-rcar-gen2:
 'depends-on' is no more optional
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221207162435.1001782-1-herve.codina@bootlin.com>
 <20221207162435.1001782-4-herve.codina@bootlin.com>
 <36895e49-aea5-3676-e7df-78b30277e6a0@linaro.org>
 <20221208100530.137fa8b7@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208100530.137fa8b7@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 08/12/2022 10:05, Herve Codina wrote:
> Hi Krzysztof,
> 
> On Thu, 8 Dec 2022 09:26:41 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 07/12/2022 17:24, Herve Codina wrote:
>>> The 'depends-on' property is set in involved DTS.
>>>
>>> Move it to a required property.
>>>
>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>> ---
>>>  Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml | 1 +  
>>
>> This should be squashed with previous patch. There is no point to add
>> property and immediately in the next patch make it required. Remember
>> that bindings are separate from DTS.
>>
>> Best regards,
>> Krzysztof
>>
> 
> I though about make dtbs_check in case of git bisect.

And what would this commit change? In Git you will have
1. dt-bindings: PCI: renesas,pci-rcar-gen2: Add depends-on for RZ/N1 SoC
family
2. dt-bindings: PCI: renesas,pci-rcar-gen2: 'depends-on' is no more optional

so what is the difference for git bisect?

> 
> But, ok I will squash or perhaps remove completely this commit.
> It introduces a DT compatibility break adding a new mandatory
> property (raised by Rob on cover letter review).
> Is this compatibility break can be acceptable ?

Requiring property in bindings as a fix for something which was broken
is ok. But this is independent of Linux drivers, which should not stop
working.

Best regards,
Krzysztof

