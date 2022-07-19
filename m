Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67A65795DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 11:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235828AbiGSJN5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 05:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235978AbiGSJN4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 05:13:56 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE3B2494F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 02:13:55 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id o12so16640895ljc.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 02:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xPkeUGGqljFl4AGytjlDSXuCv7RrjwY2aVYb7ItSxZ0=;
        b=IydC834PfqL2kCcRnxI/9nfLkcNwE37+P2J5ZqRKY7HJU1ernPxh3kCDUELR4n984t
         ikZZx//IY6fzzLJ/CN2MufjsfIPY9ie/vP1p9UG1nSdseXCsHA5oPYEF7egAkeDacUfU
         lD1VYCbiop+tQ1ZT17HaF/XGDZdcYUugkdZhCJej1c3o9duvd2ca5gq8DPvTvDPzwu4d
         Cjmi+Q8K+YdL/wri8xfonUn0zGO1Tj6Ual3GLigbXo/6zbuRq95Q5zSt30cC0MD6RlqE
         Dy3JzbvcqGyOZzjQhZXHB1zpukuxynao7EqG/lCkZyXJ1MfvIgNfBSQLhJo6f9AnjpKs
         vaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xPkeUGGqljFl4AGytjlDSXuCv7RrjwY2aVYb7ItSxZ0=;
        b=aVNazWWnV3SM0pMkW54bNIiBnbxyCxBkR2hbovvVXO+T5ci+xd0FckZyQwEP/c0Oog
         IQ5PuJfW6/xM85sDZRneDdCGrhouvAHBa1EQythFEAsf+PrJAw0XX80J54Bt4u/DsK4c
         6yTg0Xyr6KgsGO7aA32BBrlBEQ5Eku1UxxIvWXj5Lynu3NizCcNEU38EpDkhI68YhEhZ
         kvce0aGXJ8hM4pUvIiu+XYx0nTsfNbP+o5v47scJHcVe8B5YLTT8usUaMv9KYl/SsR4U
         Joq8DY8WmYkVyLx3xLI7ZqD7+bHg4Nfy/uTFCvzgAzvtvTrPj89lKDN1NgAmzwcbi0DF
         SniQ==
X-Gm-Message-State: AJIora/1oPCWxp+PiC3SKhWZmZhNjQMec+o02RWglauK7l9MDilriZiT
        LF3MhSqyQYUN97c5uBKVU+hCKg==
X-Google-Smtp-Source: AGRyM1teRK3yNuFe+WsSAguuqc0wfWpdBC+zgUhTnBCubi8bMgrfs/0fzb4kS4r7Uc5Gc2PQuJZ5/g==
X-Received: by 2002:a05:651c:1587:b0:25d:7844:5910 with SMTP id h7-20020a05651c158700b0025d78445910mr15413016ljq.325.1658222033840;
        Tue, 19 Jul 2022 02:13:53 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id p4-20020a2ea4c4000000b0025d6c8cfafcsm2562736ljm.93.2022.07.19.02.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 02:13:53 -0700 (PDT)
Message-ID: <16a53bbd-beed-2290-e9ca-e9a9e8146488@linaro.org>
Date:   Tue, 19 Jul 2022 11:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: usb: renesas, usb3-peri: Document RZ/V2M
 r9a09g011 support
Content-Language: en-US
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
 <20220718134458.19137-2-phil.edworthy@renesas.com>
 <40224cd7-0e71-7f5a-47c8-142539312f21@linaro.org>
 <TYYPR01MB70868B846CAB2F7124148771F58C9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <b26f2353-c5f3-16f4-11c8-63068baeada5@linaro.org>
 <TYYPR01MB70865ABE033AAA53FB228FFDF58F9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYYPR01MB70865ABE033AAA53FB228FFDF58F9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
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

On 19/07/2022 11:01, Phil Edworthy wrote:
> Hi Krzysztof,
> 
> On 19 July 2022 07:38 Krzysztof Kozlowski wrote:
>> On 18/07/2022 17:24, Phil Edworthy wrote:
>>>>>    phys:
>>>>>      maxItems: 1
>>>>> @@ -43,7 +65,15 @@ properties:
>>>>>      maxItems: 1
>>>>>
>>>>>    resets:
>>>>> -    maxItems: 1
>>>>> +    minItems: 1
>>>>> +    items:
>>>>> +      - description: Peripheral reset
>>>>> +      - description: DRD reset
>>>>> +
>>>>> +  reset-names:
>>>>> +    items:
>>>>> +      - const: aresetn_p
>>>>> +      - const: drd_reset
>>>>>
>>>>>    usb-role-switch:
>>>>>      $ref: /schemas/types.yaml#/definitions/flag
>>>>> @@ -78,6 +108,27 @@ required:
>>>>>    - interrupts
>>>>>    - clocks
>>>>>
>>>>> +allOf:
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            enum:
>>>>> +              - renesas,rzv2m-usb3-peri
>>>>> +    then:
>>>>> +      properties:
>>>>> +        clocks:
>>>>> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> (See below)
> 
>>>>> +        interrupts:
>>>>> +          minItems: 2
> +        interrupt-names:
> +          minItems: 2
> (See below)
> 
>>>>> +        resets:
>>>>> +          minItems: 2
>>>>> +      required:
>>>>> +        - clock-names
>>>>> +        - interrupt-names
>>>>> +        - resets
>>>>> +        - reset-names
>>>>
>>>> else:
>>>> narrow the number of items
>>> Sorry, I don't understand why we need minItems: 1 for
>>> interrupt-names/clock-names, but then I'm easily confused!
>>>
>>> None of the existing users have any interrupt-names/clock-names
>>> hence they are not in required. The rzv2m is the only device
>>> that needs them so the driver can get them by name, and hence
>>> it sets minItems: 2
>>
>> They are not required but they can appear. Nothing prevents it, based on
>> your patch.
> 
> Ok, but instead of 'else: narrow the number of items', shouldn't I
> set the clock-names/interrupt-names 'minItems: 2' for rzv2m as above?

Yes.

Best regards,
Krzysztof
