Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5BA6258C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 11:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbiKKKwL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Nov 2022 05:52:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbiKKKvx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 05:51:53 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F8F6585
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2022 02:51:52 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id d6so7740874lfs.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2022 02:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r+mBWPeWSsJqcJ3QokQFaX83tJCFJAVRvj60JzLY2zc=;
        b=NcLSjiHTMoYOxW6LiVEjxugA/YIeMalt5sZf6w3a+u8YScwWPYm0vk7k9ck/cqO7aS
         uND2VXAmFSVRFDWF2JsoJ4qf0myZXH/RM0eSrYQxv4klSH84F/OWmt1VPmP5dJRTjIUv
         0A2aYBOFry/KXNCsnRiUin8nZ8TY4NUX/8yX8BViBa7kGomUwMsYvx4olDqE6eDKG3nw
         wqu9gbHA2ZHy1oW1SUWIkVGtPdfByVYshnsQz2XD6gXWmYoj8ngRu06TDq4apig2df3d
         FQdi8L2lcB0jDLn0PoZfZvqOkHyc0XxRhmqSk8bWy2YxiksSjuKk/3d5TmpDeL5QNUPL
         16Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+mBWPeWSsJqcJ3QokQFaX83tJCFJAVRvj60JzLY2zc=;
        b=RvyGt/0kqkczDstq+12guveuu69kEofsjxOSuiHdZVIg9yLZdh4i4SyDSyrnsKIxRG
         Im0oWCg4GU3jIX2BfdwpjAA6n8K3qdzplG5YYue/y8cLbfzkAGNeAxjvsicwQ3Sntbpg
         FFOPCRIQRf5DFBRNGSwbJAC2B0W6kEu8zXIaEAEqIPV7b/J8MwA5UFC0hew5htWYZUXE
         tIw42OU0WFSJtldxmajCcwTOFr2AOf58lPSw5JpyPeF+vfHx/5YcUPf9sAKiiGRSZdcy
         hL4Z6ObpeLz9evBwy8OYPAEojQ/dnOCdCLeO1DAV6Tv/1TNpgZ+iHNboseEQELRDD6rV
         0uTQ==
X-Gm-Message-State: ANoB5plqYzH+BP/nUVxrgiXp6YUN7tGzQBMRCo7FDa9rNGjRrnUvcuLn
        bEC+iWOT5UDeS2N/Ea3Pq5J5Iw==
X-Google-Smtp-Source: AA0mqf7D2GKcMgFH5iAYIaHS0Y/DYeu2kRAEDuShm5lGkdiUNVN1TP2o5nDGw83gn5ass2+0L9V85A==
X-Received: by 2002:ac2:54b1:0:b0:499:af06:a77b with SMTP id w17-20020ac254b1000000b00499af06a77bmr511328lfk.202.1668163910778;
        Fri, 11 Nov 2022 02:51:50 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id q6-20020a05651232a600b0049fb08e91cesm261509lfe.214.2022.11.11.02.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 02:51:50 -0800 (PST)
Message-ID: <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org>
Date:   Fri, 11 Nov 2022 11:51:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
 <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
 <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/11/2022 10:06, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: 11 November 2022 08:34
>> To: Biju Das <biju.das.jz@bp.renesas.com>; Rob Herring <robh+dt@kernel.org>;
>> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Phil Edworthy <phil.edworthy@renesas.com>; Geert Uytterhoeven
>> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; linux-
>> renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Chris Paterson
>> <Chris.Paterson2@renesas.com>; Fabrizio Castro
>> <fabrizio.castro.jz@renesas.com>
>> Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas
>> RZ/V2M System Configuration
>>
>> On 10/11/2022 17:21, Biju Das wrote:
>>> From: Phil Edworthy <phil.edworthy@renesas.com>
>>>
>>> Add DT binding documentation for System Configuration (SYS) found on
>>> RZ/V2M SoC's.
>>>
>>> SYS block contains the SYS_VERSION register which can be used to
>>> retrieve SoC version information.
>>>
>>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>>> [biju: Updated the example ]
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>> v1->v2:
>>>  * Moved the file from arm->soc/renesas
>>>  * Updated the path for binding file
>>>  * Updated the example
>>> ---
>>>  .../soc/renesas/renesas,rzv2m-sys.yaml        | 39 +++++++++++++++++++
>>>  1 file changed, 39 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml
>>> b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml
>>> new file mode 100644
>>> index 000000000000..cc41747798e2
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.
>>> +++ yaml
>>
>> Filename should be based on the compatible. Pretty often some common parts of
>> both are fine (e.g. when file contains multiple compatibles), but this very
>> different then what I see below.
> 
> We plan to upstream another similar SoC, RZ/V2MA which has similar IP, so we may
> need to add generic compatible rzv2m-sys. I am checking with HW people to get
> more info about RZ/V2MA.
> 
>>
>>> @@ -0,0 +1,39 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id:
>> "
> "
>>> +$schema:
>> "
> "
>>
>> Drop quotes from both.
> 
> OK.
> 
>>
>>> +
>>> +title: Renesas RZ/V2M System Configuration (SYS)
>>> +
>>> +maintainers:
>>> +  - Geert Uytterhoeven <geert+renesas@glider.be>
>>> +
>>> +description:
>>> +  The RZ/V2M System Configuration (SYS) performs system control of
>>> +the LSI
>>> +  and supports the following functions,
>>> +  - LSI version
>>> +  - 34-bit address space access function
>>> +  - PCIe related settings
>>> +  - WDT stop control
>>> +  - Temperature sensor (TSU) monitor
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: renesas,r9a09g011-sys
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    sysc: system-configuration@a3f03000 {
>>
>> If I get properly the purpose of the device, usually this is called "system-
>> controller". Use that as device node.
> 
> The hardware manual mentions the below. So want to consistent with HW manual.

If the hardware manual said this is called "foo-whatever-name" or
"rz85736dfnx2", you would use it as well?

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> 
> Section 38 System Configuration (SYS)
> This section describes the functions of the system configuration (SYS).

So NAK.

Best regards,
Krzysztof

