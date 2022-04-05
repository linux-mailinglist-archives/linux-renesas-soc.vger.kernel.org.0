Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED064F4095
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Apr 2022 23:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240660AbiDEOfW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Apr 2022 10:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244061AbiDENDw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 09:03:52 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723AA11D7A3
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Apr 2022 05:05:35 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id dr20so26090090ejc.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Apr 2022 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LUNkLUyRNupMlLWXUhgEyUjm31TUTSH8Cd6R4GiAGJ0=;
        b=LNnX5LUYQATJAnoNid8CPzZTLGlCIr9p9VGO8eAttCWJBo/5VJGIevh2Pj9hmodZm0
         ZvCcBzfdZPCxpItAaymntAh0uTKz94ovQ90nGEXGxYXxTIhXuyeiG6xGLvVCRsjn7y7D
         edshDT3uBGDXNSUm0T2S327Dqer1wSUNyN9h1Mee4wgF/v2V3eHWBhkC/nIvTp0aokGi
         b+uHjMSF36f6WMSUA7fErGz6Aj2gGlV844JeF9/tW/X8jvpaCvONJTKxDPLCdvdOvZzV
         Ix/qWdA7AKmSAJqbaujMAJcGpJEiRzGuA7fsYtmMKMcoI7wrNpEvPIbeO6RyqxQzlkiX
         VQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LUNkLUyRNupMlLWXUhgEyUjm31TUTSH8Cd6R4GiAGJ0=;
        b=cTZY1IkFCDUOA2vVWE24NCTeIjF2pcFvuI0mg8lRE0/xyYNS88mfhv51CZpwM29NLL
         Oa3fZ1QRSpruiMmKUEdKtE2CGDrjJAfau4bzUdRAMQgBS35bKU3qeXIKfaOJz59Qd52t
         FDSttMWOraE+SoF8t7J3DZp8X7M3ncYiZI1OjgUkQ6MNf8VwupwcA/Isg5f43FbRBKZK
         +CSN4TyFhfnpdB3hLEerO1lCl1rY/EpeuEtpypc95/P5v83zBxVhb87bwroMnA5YBfJf
         FzUVgosYIdAeW3QOqV1l7Dfh9HaUfgedH6jZTuhNPfGqrYY1/DS4GALYeBDKHLf51pAv
         81Qg==
X-Gm-Message-State: AOAM532CSXFuTd+iQGqvMYDMcOmtVS9HKev7QNIWDhB9l4nxn3qe1cJg
        mKnNzRXn49pqqjbT5QyWkIhvCg==
X-Google-Smtp-Source: ABdhPJyolJgteWfOXF/i6eLzkrBACK5iulqQNf8rSZe+oa1Sm461dxamaj2KU9OeBRhApSd+S+jSAg==
X-Received: by 2002:a17:906:b155:b0:6c9:ea2d:3363 with SMTP id bt21-20020a170906b15500b006c9ea2d3363mr3133647ejb.729.1649160333459;
        Tue, 05 Apr 2022 05:05:33 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id l11-20020a509dcb000000b0041cbaf0ce2asm4428436edk.6.2022.04.05.05.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 05:05:32 -0700 (PDT)
Message-ID: <b71f439a-98fd-52ba-7580-dfbb8cbffebe@linaro.org>
Date:   Tue, 5 Apr 2022 14:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
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
 <a480eb35-4d27-8e40-4b34-9ed269ec6ccf@linaro.org>
 <OS0PR01MB59225118A6FC3D9C58D9A00E86E49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59225118A6FC3D9C58D9A00E86E49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On 05/04/2022 13:47, Biju Das wrote:
>> Subject: Re: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
>> RZ/G2UL SMARC EVK
>>

(...)

>>>
>>> And what to do when adding more DT overlays for expansion boards?
>>> This would become unmanageable soon.
>>
>> There are two topics here:
>> 1. Whether we should follow DT spec. If no, why Renesas is special and for
>> other cases we follow DT spec? "Unmanageable" is not the answer here,
>> because other platforms will have the same problem.
>>
>> 2. If the answer for above is yes, we follow DT spec, then the question is
>> how to deal with overlays. In current code - I don't know. Long term,
>> maybe we need a way to append to existing compatible (to extend it)?
>> Some expansion boards do not need to change top level compatible, because
>> they only add constrained features (like Arduino shields with some
>> regulator). You just add it to DT and presence of new compatible, e.g. of
>> regulator, is enough. You do not need to change the top level compatible.
>>
> 
> Does the rules for compatible values (most to least descriptive) 
> also apply to the root node?

I don't see any exception in DT spec (page 26), so my answer is yes, the
root node has same meaning of "compatible" as other nodes.

Best regards,
Krzysztof
