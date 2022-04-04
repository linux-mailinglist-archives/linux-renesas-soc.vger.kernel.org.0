Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5935D4F1556
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 15:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348025AbiDDNCt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 09:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240690AbiDDNCr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 09:02:47 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A033CA6B
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 06:00:51 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bg10so19779006ejb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Apr 2022 06:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q92Xc9QiHC8WoaCP7uwqJSGaLpKEhrIW/gDrYeWfshc=;
        b=NbyY+oGjNrh82uX/+eMo5EhxIHymiPf3zN4INfdey1KAvy6cfdSpbLQveEEnd2JoRP
         sDGqHujaUwxATYcbD4rhKn+zhzHwaE+jiq5mRn9JqfxgN/amxP57h0k2aExFzlYmyKbW
         m34rm5tLVH0f/cn4PzjkDrYhm89MY5dEE6k7+ZQIXRNP3WkhcuhE0Tp6X7OsXpS4vymr
         0bj09GPTvhiQ768jX2/UKseJqUxZaJEUK0clTnDxvXYil0+Epqg4W3ZhO5aQEs0K+dUW
         MzBbZ6JC3PrTDa963sG8pvaZMvhVnprse4LjizKYPN7vDqs8iGaxdnuihi0eCg5oToSL
         MLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q92Xc9QiHC8WoaCP7uwqJSGaLpKEhrIW/gDrYeWfshc=;
        b=FrPog1gEdWK1hEqpysyhtSLvXS2mIxOSmJ5308278Ej7HNDUNMmMwucTmoeWdimlHY
         pb1wR5FTpHao9fkuFGlE/uc4UYd2jQpRE4zEamtCXb5PvFNF+LAHJywlcx4zHpPKrjoz
         /9axcfPBbYBWaSUTjqytYXkitxLf7cC60M/RonKXKapCNd1cm+xQbnvsBWdm1/ost8HW
         RTQLEgIXJg12yyBsmDjtoOv1lLsbFHf6FDlcgQzVmbGewtrdAos/rtp0bIY2u04M3EmE
         93j+aCXJ+FslJV3GRecFvHbaDQW2/ARxOwXSTAblI8oyX4gFObrsjRTZ84ElGSTXdc2U
         PUmw==
X-Gm-Message-State: AOAM533y21ZXjKL3Q/TRo/2a9VEX2RxafZsxI4QFj+F0/m+9/Ufr16EX
        ZwgkGI+7b2HyeVnuR8sLqImOCA==
X-Google-Smtp-Source: ABdhPJzQr+HSQP0/z4woZxe+Q2DcrL3ZbuVhX5b/9OXlbGx5R/hCcbq2hhnSqxdD4xeWvXUHVyQ9Sw==
X-Received: by 2002:a17:906:c104:b0:6e4:a223:1af9 with SMTP id do4-20020a170906c10400b006e4a2231af9mr10251821ejc.441.1649077249502;
        Mon, 04 Apr 2022 06:00:49 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id y14-20020a056402440e00b00416046b623csm5527959eda.2.2022.04.04.06.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 06:00:49 -0700 (PDT)
Message-ID: <a480eb35-4d27-8e40-4b34-9ed269ec6ccf@linaro.org>
Date:   Mon, 4 Apr 2022 15:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
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
 <d6989ea9-9e84-0022-aff0-c75b0e3203e2@linaro.org>
 <OS0PR01MB5922C1100BCF87341534FC6E86E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <e3ebc5d0-d2bc-b5a8-1b19-5e0c2f3d7c41@linaro.org>
 <CAMuHMdVTjHx8St_LxvMy1UfkRqNxZ1Dz0YYNXKMAhqouUxiW0w@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdVTjHx8St_LxvMy1UfkRqNxZ1Dz0YYNXKMAhqouUxiW0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04/04/2022 14:29, Geert Uytterhoeven wrote:
>>
>> User-space is one example. We don't limit to this. Anyway, the
>> compatible is the main way to check it. Machine is just test, not
>> compatible, not part of ABI. soc_id and revision could help, but these
>> are separate ABIs. They can be not compiled-in and then you have only
>> compatible.
>>
>> Regardless whether there is another way for user-space to figure out
>> hardware, it does not change the fact that such usage of compatibles
>> does not look correct with Devicetree spec.
>> "...They
>>  allow a device to express its compatibility with a family of similar
>> devices, potentially allowing a single
>>  device driver to match against several devices."
>>
>> The "renesas,smarc-evk" compatible is not the most specific one, because
>> different configurations have it.
> 
> From the letter of the spec, this is indeed not valid.

It is also invalid from logical meaning of compatibles... The generic
compatible (SMARC board) is not compatible with a specific SoC. It's the
other way around.

> However, we started doing this several years ago, as the various
> variants of the Salvator-X(S) and ULCB boards are identical, and just
> differ in SoC (actually SiP) mounted.
> 
> E.g. arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts has
> compatible = "renesas,salvator-xs", "renesas,r8a7795".
> 
> While we could add e.g. "renesas,salvator-xs-r8a7791", doing so
> would inflate the bindings a lot.

That what is actually happening for example in SoM-like cases on NXP. I
understand that it grows, but that's why we have schema to find mistakes. :)

>> Again - you intend to use a pair or even a triple of compatibles to
>> uniquely identify type of hardware. I don't think it is correct - the
>> final, most specific compatible, uniquely identifies the hardware. All
>> other compatibles are just for fallback.
> 
> And what to do when adding more DT overlays for expansion boards?
> This would become unmanageable soon.

There are two topics here:
1. Whether we should follow DT spec. If no, why Renesas is special and
for other cases we follow DT spec? "Unmanageable" is not the answer
here, because other platforms will have the same problem.

2. If the answer for above is yes, we follow DT spec, then the question
is how to deal with overlays. In current code - I don't know. Long term,
maybe we need a way to append to existing compatible (to extend it)?
Some expansion boards do not need to change top level compatible,
because they only add constrained features (like Arduino shields with
some regulator). You just add it to DT and presence of new compatible,
e.g. of regulator, is enough. You do not need to change the top level
compatible.


Best regards,
Krzysztof
