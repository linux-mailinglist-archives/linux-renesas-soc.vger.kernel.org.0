Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5876F656F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 May 2023 09:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjEDHGa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 May 2023 03:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjEDHG3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 May 2023 03:06:29 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5131737
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 May 2023 00:06:27 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-94f3cd32799so19929966b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 May 2023 00:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683183986; x=1685775986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XK2q35tWDv3VQSltSdfoyzOXdvHaBUyg92IC37/Aq0=;
        b=DAi2xxVYCJERNu+Nqqp1mwUdplcRKK+ZkuDTy8A4P0QIv/1zSD5EJKAEehII3vRWHY
         GsfHSqJYQCd7phfXFhpAZ9SKx/Ff/LPVY26dqf9/EID2D013zMkWYeNOJBU/u/5DcALg
         MoQfqT4DdajTmvcoS+9GhCIRwkWjlsqQemkT+7+lNnAGBXMVHMtVV0PoaTQdR3gC62dM
         qyTgHb3eu2ibB7za82cp/uGUzgb5Y7JGOqV4U/0HeTMZdeoGaw9TzKG4akclVGOPt+jh
         HUjOcXuIaLc5rslK0FeqjqUPaIHMutTYbYIBtTMu5PQ8dUA5cNZL9MktufTTB8uM/Vme
         /Ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683183986; x=1685775986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XK2q35tWDv3VQSltSdfoyzOXdvHaBUyg92IC37/Aq0=;
        b=awq2o8p5I+/2C/rdq9UGXTswYyogT/XWLI5kPVxalnkidZZFq4ckM0rUJ4EzZUo4n5
         ll/TwR9pYKYPDhYymH0OK++MTRgiUxtPYW7anicfWiwFLkzYDGQnB/WovAvKOY6SseY/
         /BCBk8Panit/IzPFLnBdO4EOvjJ8G0xQHpLM+/3E5GFJWtb7xB/GVXjpfHlILk4xX+52
         Ej5ieQ0morsfmQLbCmSP0DKrvM6VZlUeFgRSpZ1VuKOPyBw56rdM92Zzr3ATgkNmMbzL
         xIPfARqIDnTWCXV1EY0eUhePYuTtJvmMAIFynM5mePKGN6k54mmKKcU/uinNNInCYk8v
         QXXQ==
X-Gm-Message-State: AC+VfDwZl9kFdYIaIRAvLP54Bm4d2c9zE1vn+5Qv97NlD+wm1VOftTZT
        uSqmqn8Sn0wrAIcAOsjIgmagmWFcEG+Rp/vITX7LTht9
X-Google-Smtp-Source: ACHHUZ73kYSNyqf1U1r/prYQfWWBa6cbLV8BF/SODQIugu1K6gU0X7Kb/vg2v9/ziMF1k66f867ixg==
X-Received: by 2002:a17:906:fe44:b0:931:624b:680c with SMTP id wz4-20020a170906fe4400b00931624b680cmr5579607ejb.29.1683183985981;
        Thu, 04 May 2023 00:06:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id jt11-20020a170906ca0b00b00958434d4ecesm15833039ejb.13.2023.05.04.00.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 00:06:25 -0700 (PDT)
Message-ID: <b018b7c5-1b32-098c-c642-f94286082ccb@linaro.org>
Date:   Thu, 4 May 2023 09:06:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXQa3-Qnyru_3=hccWjEZwZxriUHc8-5PrpwzQaxsy5Hw@mail.gmail.com>
 <OS0PR01MB592206A862585B47650CBFBA866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB592206A862585B47650CBFBA866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 03/05/2023 12:20, Biju Das wrote:
> Hi Geert,
> 
> Thanks for the feedback.
> 
>> Subject: Re: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC
>> bindings
>>
>> Hi Biju,
>>
>> On Wed, May 3, 2023 at 10:46 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>>> Document Renesas RAA215300 PMIC bindings.
>>>
>>> The RAA215300 is a high Performance 9-Channel PMIC supporting DDR
>>> Memory, with Built-In Charger and RTC.
>>>
>>> It supports DDR3, DDR3L, DDR4, and LPDDR4 memory power requirements.
>>> The internally compensated regulators, built-in Real-Time Clock (RTC),
>>> 32kHz crystal oscillator, and coin cell battery charger provide a
>>> highly integrated, small footprint power solution ideal for
>>> System-On-Module (SOM) applications. A spread spectrum feature
>>> provides an ease-of-use solution for noise-sensitive audio or RF
>>> applications.
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>
>> Thanks for your patch!
>>
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
>>> @@ -0,0 +1,57 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id:
>>> +https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
>>> +cetree.org%2Fschemas%2Fmfd%2Frenesas%2Craa215300.yaml%23&data=05%7C01
>>> +%7Cbiju.das.jz%40bp.renesas.com%7C37302c6f37b048ae260f08db4bba1f2f%7C
>>> +53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638187034978703511%7CUnkno
>>> +wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi
>>> +LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=qnhJGzPolFSsY1fN2p8BJTw%2FCZunFI
>>> +%2BWgZne6CXS0T4%3D&reserved=0
>>> +$schema:
>>> +https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
>>> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=05%7C01%7Cbiju.das.jz%4
>>> +0bp.renesas.com%7C37302c6f37b048ae260f08db4bba1f2f%7C53d82571da1947e4
>>> +9cb4625a166a4a2a%7C0%7C0%7C638187034978703511%7CUnknown%7CTWFpbGZsb3d
>>> +8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7
>>> +C3000%7C%7C%7C&sdata=86%2FKxrWS6oJZVpmTyYmKqJmRuBTYWqmqSlwMvtS16pc%3D
>>> +&reserved=0
>>> +
>>> +title: Renesas RAA215300 Power Management Integrated Circuit (PMIC)
>>> +
>>> +maintainers:
>>> +  - Biju Das <biju.das.jz@bp.renesas.com>
>>> +
>>> +description: |
>>> +  The RAA215300 is a high-performance, low-cost 9-channel PMIC
>>> +designed for
>>> +  32-bit and 64-bit MCU and MPU applications. It supports DDR3,
>>> +DDR3L, DDR4,
>>> +  and LPDDR4 memory power requirements. The internally compensated
>>> +regulators,
>>> +  built-in Real-Time Clock (RTC), 32kHz crystal oscillator, and coin
>>> +cell
>>> +  battery charger provide a highly integrated, small footprint power
>>> +solution
>>> +  ideal for System-On-Module (SOM) applications. A spread spectrum
>>> +feature
>>> +  provides an ease-of-use solution for noise-sensitive audio or RF
>> applications.
>>> +
>>> +  This device exposes two devices via I2C. One for the integrated RTC
>>> + IP, and  one for everything else.
>>> +
>>> +  Link to datasheet:
>>> +
>>> + https://www.renesas.com/in/en/products/power-power-management/multi-
>>> + channel-power-management-ics-pmics/ssdsoc-power-management-ics-pmic-
>>> + and-pmus/raa215300-high-performance-9-channel-pmic-supporting-ddr-me
>>> + mory-built-charger-and-rtc
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - renesas,raa215300
>>
>> renesas,raa215300-pmic?

Depends if raa215300 is piece of SoC or just PMIC. If the latter,
usually compatibles do not have types added.

Best regards,
Krzysztof

