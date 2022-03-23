Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 609FB4E549F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 15:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiCWO4Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 10:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244903AbiCWO4P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 10:56:15 -0400
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E6313FBA;
        Wed, 23 Mar 2022 07:54:45 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id k10so2164239edj.2;
        Wed, 23 Mar 2022 07:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=mo2GmOP8jkxt+z2fNbZo7XVN+gp9JFoqU9djcfF/JBo=;
        b=tkFCgUBvTSKkAHWC1Sur/w0vllAq+/IcbBWuwn2S3AquR11+4yelXBdk4HeXE55NBB
         eiSwhcpTGu7Xd4TFZGDa5jmwZGArZ/17QlwmBSiMDcvi9DQpkO5EK98WtxR3eNP0ki6x
         0jOmazbqTh5oFc7DrxAFuw/gu5LLGWGljxTRbUg8+lo5BMfdFAael91IXmc08JbV14VJ
         8Zq9687AWYDvMCFOWvF8PMoYlYfvlUtjukCHGy5ko4Swm0UPle0Grkvt9wq7Th2IU/PX
         xao0mwc9pdtd2gt54cO+xTdNXkLhB+Z4uV6spgbF3WO1L94JSOLSdSLTpqgwL4ZGI6Lz
         V8Ww==
X-Gm-Message-State: AOAM530FyjsB44C6OIX5JGC4kfWCLDYGPyQs+F0eBUn2ZDMxAuek+t/t
        CS2MIPVfyJIYHB495RpmSPs=
X-Google-Smtp-Source: ABdhPJyjAA3A6OB9bfyWMPLAftFpVdJVl8+54puVoR64LqxbGpfmWCihWX71WVcOW7Q00iYIJIOZWg==
X-Received: by 2002:a05:6402:14d1:b0:415:8df3:bfa4 with SMTP id f17-20020a05640214d100b004158df3bfa4mr534498edx.344.1648047283570;
        Wed, 23 Mar 2022 07:54:43 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id nc13-20020a1709071c0d00b006df4e0d352csm37798ejc.151.2022.03.23.07.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 07:54:43 -0700 (PDT)
Message-ID: <4297b8c2-1958-9abb-7d93-0e6d283b6194@kernel.org>
Date:   Wed, 23 Mar 2022 15:54:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Content-Language: en-US
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-3-phil.edworthy@renesas.com>
 <a51dec7d-4dfd-5603-3d34-a40b0fd9ec08@kernel.org>
 <TYYPR01MB70862B27A67D868B196A70E7F5189@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB70862B27A67D868B196A70E7F5189@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23/03/2022 15:44, Phil Edworthy wrote:
> Hi Krzysztof,
> 
> Thanks for the review.
> 
> On 23 March 2022 10:42, Krzysztof Kozlowski wrote:
>> On 21/03/2022 16:42, Phil Edworthy wrote:
>>> Add DT binding documentation for System Configuration (SYS) found on
>>> RZ/V2M SoC's.
>>>
>>> SYS block contains the SYS_VERSION register which can be used to
>> retrieve
>>> SoC version information.
>>>
>>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>>
>> Could you send reviewed-by tags publicly? Maybe there was internal
>> review, maybe not and it was just copy-pasted to all submissions...
> Yes, it was reviewed internally.
> We've done it like this for a while, I'll see what we can do to change
> the way we do it. Would just copying the person who reviewed it be
> enough?
> 
>>> ---
>>>  .../bindings/arm/renesas,rzv2m-sys.yaml       | 39 +++++++++++++++++++
>>>  1 file changed, 39 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/arm/renesas,rzv2m-
>> sys.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/renesas,rzv2m-
>> sys.yaml b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
>>> new file mode 100644
>>> index 000000000000..1a58906336b8
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
>>> @@ -0,0 +1,39 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/arm/renesas,rzv2m-sys.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>> +
>>> +title: Renesas RZ/V2M System Configuration (SYS)
>>> +
>>> +maintainers:
>>> +  - Geert Uytterhoeven <geert+renesas@glider.be>
>>> +
>>> +description:
>>> +  The RZ/V2M System Configuration (SYS) performs system control of the
>> LSI
>>> +  and supports the following functions,
>>> +  - LSI version
>>> +  - 34-bit address space access function
>>> +  - PCIe related settings
>>> +  - WDT stop control
>>> +  - Temperature sensor (TSU) monitor
>>
>> Usually all these are separate devices, so what does it mean that SYS is
>> supporting these functions? Is it related to other Renesas System
>> Controllers? For example
>> Documentation/devicetree/bindings/power/renesas,apmu.yaml
>> ?
>> Why one is in power and one in arm subdirectory? Maybe you should extend
>> existing one?
> 
> SYS looks like somewhere to put registers that don't have a logical home.
> There are lots of little bits, I just listed the main functions.
> On other Renesas SoCs, it's similar but they include power related
> registers. Actually, I originally put it in the power directory, then
> moved it.

The existing rzg2l-sysc looks similar and is in power. If arm location
is conscious choice (not just placeholder), fine with me. :)


Best regards,
Krzysztof
