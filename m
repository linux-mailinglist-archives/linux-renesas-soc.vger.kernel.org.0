Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E26854F05BC
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 21:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236076AbiDBTV5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 15:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbiDBTV4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 15:21:56 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CC51B780
        for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Apr 2022 12:20:03 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id h4so8628428wrc.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 02 Apr 2022 12:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KWfu7r5BdLoBCcy+F6j6WkkctEf2yQapVO6X7KadQsc=;
        b=xfhZi9qHFEkh5awW9zx3M0aFAF9ViyjIT4Czan+brtHdnS36iQGeL/V4uStYM76DOJ
         39a99TgGwSLjNEAzZ50oHrHbPCCmM94LS1PhTBNCH58LWstLZsuYXSYOLqMLFkpa+9hq
         sUwKrBnrhDO98Vj+8hhPTsm8F0DYEwGWEdQOytQAva4ZFaW2Hh5ayR3ZZdcdiXib9eHk
         3hnO+gbP/Qma1QyGdSLVyJd6QCFZQYgqlV19X5Poh/AuFj+huMt5Y6rJSiJzBZmNa6tt
         xts61CRY0JG4sjPVSGmtLUJQa9GZRDh179mv5D1UuVeUMWZkkckwMwhl1j6j4qScW9Ln
         rIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KWfu7r5BdLoBCcy+F6j6WkkctEf2yQapVO6X7KadQsc=;
        b=j8LOabY5omVjOdSqiJpYQy9FgLyjWzMz4JTEqOEVdzIf6WrkS4Gm7PsF1Q81V/MoED
         C+GdP/MUR1/Qh4h/Xqfyb5H5ujqJXn3YUCNoLrOYm7ekx2hPgvWo6z0ORSW4kiCyWyxu
         iA7Q3AdLZYkt3QisjjuD9KVA0Y6ZWO5dpiWdd3+R3BE2a+F5DdhUIdU47UEV3yeQJpGH
         3GREeS+nQc/NpuzCuDiTcwuT+kFDqspOrhugnUVv9XCKGtF2HAIbN15OBmYlwxhuSXyv
         8mwuj6TXrsY+RgdwH789pCzYj9WA8A9maDxCQQIl/4IM0XZKPZnW+8REP2vTWeM3WIyl
         R80A==
X-Gm-Message-State: AOAM533JXo1pbhr8Jfoq+haBodN5BbB7KqM75yC4DxA7rX7FnA+/7K7W
        Hs0VY0Zw/ebr1sIwhde4eIDluA==
X-Google-Smtp-Source: ABdhPJzSDmCT8Yet3W7jxX1XHfqRs+yTPSuOo1rNF4HLpFxmoKSxRAlCwJqMRkCcy/9IAQRzkJLcLg==
X-Received: by 2002:a5d:6511:0:b0:204:62a:20fc with SMTP id x17-20020a5d6511000000b00204062a20fcmr11608559wru.352.1648927202329;
        Sat, 02 Apr 2022 12:20:02 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id i74-20020adf90d0000000b0020373ba7beesm7313698wri.0.2022.04.02.12.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 12:20:01 -0700 (PDT)
Message-ID: <d6989ea9-9e84-0022-aff0-c75b0e3203e2@linaro.org>
Date:   Sat, 2 Apr 2022 21:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220402073234.24625-1-biju.das.jz@bp.renesas.com>
 <cf7728fd-b5c8-cd3d-6074-d27f38f86545@linaro.org>
 <OS0PR01MB5922B49ED5DADA5DD3DDA60786E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922B49ED5DADA5DD3DDA60786E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/04/2022 21:05, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
> Thanks for the feedback.
> 
>> Subject: Re: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
>> RZ/G2UL SMARC EVK
>>
>> On 02/04/2022 09:32, Biju Das wrote:
>>> Document the Renesas SMARC EVK board which is based on the Renesas
>>> RZ/G2UL Type-1 (R9A07G043U11) SoC.  The SMARC EVK consists of an
>>> RZ/G2UL Type-1 SoM module and a SMARC carrier board.  The SoM module
>>> sits on top of the carrier board.
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>> V4:
>>> * new patch
>>> ---
>>>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml
>>> b/Documentation/devicetree/bindings/arm/renesas.yaml
>>> index fa435d6fda77..f61807103867 100644
>>> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
>>> @@ -405,6 +405,8 @@ properties:
>>>
>>>        - description: RZ/G2UL (R9A07G043)
>>>          items:
>>> +          - enum:
>>> +              - renesas,smarc-evk # SMARC EVK
>>
>> I see you are using same compatible for different configurations. I think
>> it should be rather a specific compatible (e.g.
>> renesas,smarc-evk-r9a07g043). It's the most detailed compatible, so the
>> user is expected to check it and have the answer about specific board.
>> Here it won't work - you have three different configurations with the
>> same, most specific compatible.
> 
> SMARC-EVK is common to RZ/G2L(R9A07G044L), RZ/G2LC(R9A07G044C) , RZ/V2L(R9A07G054L),
> RZ/G2UL Type-1(r9a07g043u11) and RZ/Five(r9a07g043f) SoC's.
> 
> For consistency I have made similar change. So you recommend to change
> Other SoC's as well?
> 
> SMARC-EVK is common carrier board and We have a SoM module which contains SoC.
> 
> R9A07G043 is generic compatible for RZ/G2UL arm based SoC and RZ/Five RISC
> Based SoC.
> 
> Do I miss any thing compared to other existing  renesas SoC's, please let me know.

I understand that carrier board is the same, so the SoM differs. In your
model to figure out what type of hardware is it, your choice is to
compare two compatibles:
renesas,smarc-evk + renesas,r9a07g043u11

If user-space compares only last compatible, it get's only SMARC, so it
does not know on what hardware it runs.

Maybe I am wrong, but the combination of compatibles should not be used
as a specific description. IOW, only one, final compatible should
determine the type of hardware.

Therefore in your case it should be:
renesas,smarc-evk-r9a07g043u11 + renesas,r9a07g043u11 + renesas,r9a07g043

That's my understanding of compatibles from Devicetree spec.

Such approach is used in other boards, you can check for example Toradex
and Variscite boards in arm/fsl.yaml.

For example VAR-SOM-MX8MM is a SoM and it's boards are:
 - const: variscite,var-som-mx8mm-symphony

 - const: variscite,var-som-mx8mm
 - const: fsl,imx8mm


The first const could be an enum, but there are no other boards, except
Symphony kit. Symphony can be used with other modules as well, so there is:
variscite,var-som-mx8mn-symphony
(notice 8mm -> 8mn)

Best regards,
Krzysztof
