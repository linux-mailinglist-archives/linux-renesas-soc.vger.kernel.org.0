Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC26606035
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Oct 2022 14:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiJTMai (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Oct 2022 08:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiJTMah (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2022 08:30:37 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AADE17A94A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Oct 2022 05:30:33 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id h24so13201782qta.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Oct 2022 05:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nwFzTfmaI4aoP9ub3l+xxk91QEvLlkdEzVB8aFhbF8M=;
        b=GOpQigYwwWrtTc0MsrR0sgADT2xbbze/Spvqf1mCIvK0nTB7VqU254sOkVyTgaaQ6g
         XnOfwJpzvufp/3VqiIohSnhyU1v1U7x3IHjbJ5uz4AnMU3Mmu0L1zvLILTti72/xnzyP
         H976nafkHoX6i9s2HduXhGKo6FM9XrbP69tgduk9JzsZcXKnVk4lRh/teVGhxTYG/fxb
         XOIfr8v8vR4B4/b8b7kII0MK/IVJqEFQUbJ1SIB5ZFqUQ7HysEw7/+ZDRa7CmFm9N+4J
         3BEz5sHxO6CyS94uCwcponIV8DyZhZN3STu7lStGisyoQRS5LSVSGXDkcvdFwEmLUk+u
         Q1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwFzTfmaI4aoP9ub3l+xxk91QEvLlkdEzVB8aFhbF8M=;
        b=mG9S6CeYMhX48K6WPId1a1Kv2Xt//3JOdesU3LMRiKUG+TaG8Xc3FfLRVKUPjwJwQK
         2sPth95QictVXpA3bD/JdNKFA/0QvOzc1Bgj1Wcdid0Ai6898ZMyEkMhfP8mrZl9TnDt
         oX/BUoBkSEWdQJWPHCnq0rPuNc1yiA08K7G8Lo0X7y3dh2bw/aHFHdsaOmBj+x5O/+G/
         cAMoFvQcfxXBehZ9muAJ/l30CfvFaPRBumFdWRApGrC1IjkPXToBxSECX/LFNySiRBfv
         v961btvKrccTQBAHLgGZZ8JXKcFg7CHbdKwLiXd+ttWL9Jkt9P66m512U0QuLiX1jvbm
         7WzQ==
X-Gm-Message-State: ACrzQf2fcqBWfACKOttHIvgZO1TmDCKmItb2WR5GBCxvwm2ZBGIeNdpv
        0biO+b1sKBxbyUa+IfpClhAimg==
X-Google-Smtp-Source: AMsMyM5F9WV0Thpuu3h2+g2DvPdwv/u/qD/2u0zviGnfaQQrCmaqtd0WBCOF7oX5IGMKR+rIqDSxOQ==
X-Received: by 2002:a05:622a:214:b0:39c:de63:2580 with SMTP id b20-20020a05622a021400b0039cde632580mr10656012qtx.31.1666269032574;
        Thu, 20 Oct 2022 05:30:32 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id s7-20020a05620a254700b006af0ce13499sm7259659qko.115.2022.10.20.05.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 05:30:31 -0700 (PDT)
Message-ID: <5081381c-093c-5a2b-6e17-47733a3b12e7@linaro.org>
Date:   Thu, 20 Oct 2022 08:30:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 1/3] dt-bindings: net: renesas: Document Renesas
 Ethernet Switch
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20221019083518.933070-1-yoshihiro.shimoda.uh@renesas.com>
 <20221019083518.933070-2-yoshihiro.shimoda.uh@renesas.com>
 <11d6f585-bd9f-246f-29e0-719f0551e6c9@linaro.org>
 <TYBPR01MB53418699D3420682CB8B3F31D82A9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYBPR01MB53418699D3420682CB8B3F31D82A9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 19/10/2022 21:31, Yoshihiro Shimoda wrote:
> Hi Krzysztof,
> 
>> From: Krzysztof Kozlowski, Sent: Wednesday, October 19, 2022 9:38 PM
>>
>> On 19/10/2022 04:35, Yoshihiro Shimoda wrote:
>>> Document Renesas Etherent Switch for R-Car S4-8 (r8a779f0).
>>>
>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>
>> Thank you for your patch. There is something to discuss/improve.
> 
> Thank you for your review!
> 
>>> +  ethernet-ports:
>>> +    type: object
>>> +    additionalProperties: false
>>> +
>>> +    properties:
>>> +      '#address-cells':
>>> +        description: Port number of ETHA (TSNA).
>>> +        const: 1
>>> +
>>> +      '#size-cells':
>>> +        const: 0
>>> +
>>> +    patternProperties:
>>> +      "^port@[0-9a-f]+$":
>>> +        type: object
>>> +        $ref: /schemas/net/ethernet-controller.yaml#
>>> +        unevaluatedProperties: false
>>> +
>>> +        properties:
>>> +          reg:
>>> +            description:
>>> +              Port number of ETHA (TSNA).
>>> +
>>> +          phy-handle: true
>>> +
>>> +          phy-mode: true
>>
>> Why do you need these two properties here? They are provided by
>> ethernet-controller, so I suggest to drop them.
>>
>> I already commented about it in v3.
> 
> I'm sorry. I misunderstood you comments. I thought I should drop
> "description" on these properties and "enum" on the phy-mode.
> I'll drop them on v5.

If the enum on phy-mode is different than what ethernet-controller.yaml
brings, then please keep it.

Just remove everything which is already provided by
ethernet-controller.yaml (and does not differ).

> 

Best regards,
Krzysztof

