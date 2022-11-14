Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4FBD628588
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 17:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237677AbiKNQhy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 11:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237973AbiKNQhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 11:37:01 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D01528A6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 08:32:35 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id c1so20159904lfi.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 08:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vnhu6yNrqNrpqctulCCvpFfm97Ns9ccrXidxr6uN3A=;
        b=I4LJD45fhaHsRV6ElCpOeJwFnTEywE2nZ6tqO7xyUstPAsVvSBiTwMhE2EZX4nKUj+
         SrcPQofwNVlsRf00139u4pIr8fEI1USIhwdtoshHJE9qATpdzmMyjeHHSu57Dy2QM+GV
         C0nxU7xWKqBrK1RZZ8UWisX2pDpZ1rlzQG/nFN74VjBMAvAKZJnsn3IrR9/NqpV12Qnw
         9afLyrWn080mISfp4KSEAca6T3SpD2vqAOunzkSuJ3mdTyAkLYdW8EAaXjWv2S4mg7YR
         3d+QlX0dPgUvkgYTtyWo0U4qIqTLUCHbmK1m3iBOgnYVhAa0082zZtEg4xDBFSw6iqaL
         Al/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vnhu6yNrqNrpqctulCCvpFfm97Ns9ccrXidxr6uN3A=;
        b=OMoJqI9gskSlelfMbwP2YzHoI5piDGyp+HAH5dkf9ZPCzxYfbe41mVOGHjopkgs2fF
         kXezVSLQ7BTV3e97ojH4haQIJWPcpdhldlgqptybYHot4IkwwEAC06n6frl/KW1SCEJD
         B25q2BKl4YmI1zYXUEpzToXvZ6tULb4keCjStYxD4oeb0cVzbplsuw7hW1FTGx/NMQeB
         dDhTe1QZkRI4fJMUSatNgExDybeg3ro1t4x2Nl2XVIMed23Eb98L93vIwT+5qK/O5orG
         M3FVT9dClF8xBIduBaepoos3jmfymyNwHrptt6SdW+Ogo1eSnKlaa9vuSuOtE3joLKlj
         b2Dw==
X-Gm-Message-State: ANoB5pkHHob88A2b9jIZxVIaljuI2MYeGfYAeA9Ua5EmEIm2ph1pYL/s
        hMHrMckXsMj+qr/d3yaJm9kflK2TO12w8bVb
X-Google-Smtp-Source: AA0mqf4ISD+xs2P4fe0Q2q0sA4FfHPePO5IFq43TA32UB5FdpZiXEDsqMW46T/Rfjw/WKF6bFtmVRw==
X-Received: by 2002:a05:6512:2345:b0:4ae:d4db:9f89 with SMTP id p5-20020a056512234500b004aed4db9f89mr4201387lfu.174.1668443547223;
        Mon, 14 Nov 2022 08:32:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bq38-20020a056512152600b0048b1b2233ddsm1877979lfb.120.2022.11.14.08.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 08:32:26 -0800 (PST)
Message-ID: <839d9740-e814-897e-d484-ded3d531a97a@linaro.org>
Date:   Mon, 14 Nov 2022 17:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
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
 <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org>
 <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922C8A590502C8820B05A7186059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922C8A590502C8820B05A7186059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On 14/11/2022 17:18, Biju Das wrote:
> Hi All,
> 
>> -----Original Message-----
>> From: Biju Das
>> Sent: 11 November 2022 11:17
>  >
>>> On 11/11/2022 10:06, Biju Das wrote:
>>>> Hi Krzysztof Kozlowski,
>>>>
>>>>> -----Original Message-----
>>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Sent: 11 November 2022 08:34
>>>>> To: Biju Das <biju.das.jz@bp.renesas.com>; Rob Herring
>>>>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>>>>> <krzysztof.kozlowski+dt@linaro.org>
>>>>> Cc: Phil Edworthy <phil.edworthy@renesas.com>; Geert Uytterhoeven
>>>>> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>;
>>>>> linux- renesas-soc@vger.kernel.org; devicetree@vger.kernel.org;
>>>>> Chris Paterson <Chris.Paterson2@renesas.com>; Fabrizio Castro
>>>>> <fabrizio.castro.jz@renesas.com>
>>>>> Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document
>>>>> Renesas RZ/V2M System Configuration
>>>>>
>>>>> On 10/11/2022 17:21, Biju Das wrote:
>>>>>> From: Phil Edworthy <phil.edworthy@renesas.com>
>>>>>>
>>>>>> Add DT binding documentation for System Configuration (SYS) found
>>>>>> on RZ/V2M SoC's.
>>>>>>
>>>>>> SYS block contains the SYS_VERSION register which can be used to
>>>>>> retrieve SoC version information.
>>>>>>
>>>>>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>>>>>> [biju: Updated the example ]
>>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>> ---
>>>>>> v1->v2:
>>>>>>  * Moved the file from arm->soc/renesas
>>>>>>  * Updated the path for binding file
>>>>>>  * Updated the example
>>>>>> ---
>>>>>>  .../soc/renesas/renesas,rzv2m-sys.yaml        | 39 +++++++++++++++++++
>>>>>>  1 file changed, 39 insertions(+)
>>>>>>  create mode 100644
>>>>>> Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.ya
>>>>>> ml
>>>>>>
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.
>>>>>> ya
>>>>>> ml
>>>>>> b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.
>>>>>> ya
>>>>>> ml
>>>>>> new file mode 100644
>>>>>> index 000000000000..cc41747798e2
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.
>>>>>> +++ yaml
>>>>>
>>>>> Filename should be based on the compatible. Pretty often some
>>>>> common parts of both are fine (e.g. when file contains multiple
>>>>> compatibles), but this very different then what I see below.
>>>>
>>>> We plan to upstream another similar SoC, RZ/V2MA which has similar
>>>> IP, so we may need to add generic compatible rzv2m-sys. I am
>>>> checking with HW people to get more info about RZ/V2MA.
>>>>
>>>>>
>>>>>> @@ -0,0 +1,39 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
>>>>>> +1.2
>>>>>> +---
>>>>>> +$id:
>>>>> "
>>>> "
>>>>>> +$schema:
>>>>> "
>>>> "
>>>>>
>>>>> Drop quotes from both.
>>>>
>>>> OK.
>>>>
>>>>>
>>>>>> +
>>>>>> +title: Renesas RZ/V2M System Configuration (SYS)
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>> +
>>>>>> +description:
>>>>>> +  The RZ/V2M System Configuration (SYS) performs system control
>>>>>> +of the LSI
>>>>>> +  and supports the following functions,
>>>>>> +  - LSI version
>>>>>> +  - 34-bit address space access function
>>>>>> +  - PCIe related settings
>>>>>> +  - WDT stop control
>>>>>> +  - Temperature sensor (TSU) monitor
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: renesas,r9a09g011-sys
>>>>>> +
>>>>>> +  reg:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +required:
>>>>>> +  - compatible
>>>>>> +  - reg
>>>>>> +
>>>>>> +additionalProperties: false
>>>>>> +
>>>>>> +examples:
>>>>>> +  - |
>>>>>> +    sysc: system-configuration@a3f03000 {
>>>>>
>>>>> If I get properly the purpose of the device, usually this is called
>>>>> "system- controller". Use that as device node.
>>>>
>>>> The hardware manual mentions the below. So want to consistent with
>>>> HW
>>> manual.
>>>
>>> If the hardware manual said this is called "foo-whatever-name" or
>>> "rz85736dfnx2", you would use it as well?
>>>
>>> Node names should be generic.
> 
> I got the following feedback from LSI team.
> 
> *The reason why we use "configuration" and not "controller" is the possibility that users might take it to mean 
> "control" of system operation (product operation). This unit determines how the whole LSI configure to operate LSI, 
> so we use "configuration" for this IP name.
> 
> As per this it is not a controller. It is a Configuration IP.
> 
> What should be generic node name for system configuration IP?

Then it's closer to chipid and should be in hwinfo?

Anyway, you wrote in bindings description: "performs system control", so
what can I say?

Best regards,
Krzysztof

