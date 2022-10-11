Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 341AA5FBC76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Oct 2022 22:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiJKU4D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Oct 2022 16:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiJKU4C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Oct 2022 16:56:02 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225EC7B1EC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Oct 2022 13:56:01 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id r19so860335qtx.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Oct 2022 13:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phcPnw7dcuc44KZUYWuewvfBJldUOZylGEDx3Dgbnv0=;
        b=gK4FDT0XfqsXAXX3i8tlIpULdYgu2OgwQyekBVF0lAI5uZlzTod7m7alpHDagNuvQN
         +cKK6rNGWdF7RHXNn0laAF2Zjn1fmjP4efEUQFNwVLOrnNUVXa4Zg9Bo3tifS0A8xE4T
         gzoj0dTLVoc18GkfWJ8BvgrbzODRQI6BFppUmuOAqiL1hyIEqYWJcvFr5ugrmq+ZD3b4
         j/DuK2MUeZQ65DGyWyGLbUQLvxjk2e9BuE05egL/J7YYsBh9GuzGfKp8RVdzTCaUXYZw
         CUfcTyBtO6ZAnlb4m7aKlYMfZwNtFBE3DcMvvsf6f0F6cUDkYIlhDC8pP1bm5VhUDuzG
         G5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phcPnw7dcuc44KZUYWuewvfBJldUOZylGEDx3Dgbnv0=;
        b=hbS2IaoYJdYIVTiD9cPhXTCbMYoEBVF10Difqf1j6cvQB8P4p9idmh3XIdJ/PRbvBg
         YDk4GToPWSJa0X5ANHp1+K06EoUy5Kx9Ax7xui1eOy9Wi/BbQIvd1n7rGCIgQI/jY2Ge
         RQ9O8VAXZgtk2q6abaU6q1BXVOExtl7HVmKYu7IJ6JxHVjoZDmiXVXg/yZTrmxahZ+jv
         1lfRa1n717rUNcC/dgzgJ/A0VUuAp/TWr5tK5b/M3kSAMCMsGi8Z2CqugyG3C5ZX/WTq
         rE/15QO1yG20cw/VsJ2rMTewjDo9MfweZshKvtPEtOeLEi0x1YBq31I86z0UNRyr8uRE
         yO6w==
X-Gm-Message-State: ACrzQf2LZh3/5yl7OS2l0LPMK+OauPKa0sF0Ou4gFMQ/B/WF7PZx/xq5
        XCU6M9GeDNrt906fy6rH9zJJc7sVoLHKxw==
X-Google-Smtp-Source: AMsMyM6wAwKQMZAUfQJqFyV8DsusO7fUVSBbFhs+ADw1XJksa8IPxzDLSb4QIsAiccDZ/GI8YgecTg==
X-Received: by 2002:a05:622a:1650:b0:391:b2cb:6d42 with SMTP id y16-20020a05622a165000b00391b2cb6d42mr20933512qtj.643.1665521760300;
        Tue, 11 Oct 2022 13:56:00 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id l7-20020ac84a87000000b003996aa171b9sm6248217qtq.97.2022.10.11.13.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 13:55:59 -0700 (PDT)
Message-ID: <7b8f1097-e56d-2cb9-337d-c7d771eca6e4@linaro.org>
Date:   Tue, 11 Oct 2022 16:53:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 4/4] mfd: Add RZ/G2L MTU3 PWM driver
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Lee Jones <lee@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20221010145222.1047748-1-biju.das.jz@bp.renesas.com>
 <20221010145222.1047748-5-biju.das.jz@bp.renesas.com>
 <b701187b-d2aa-eecc-0052-d611d1f45807@linaro.org>
 <OS0PR01MB59227CF4B0D4CA846E24298C86239@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <219922df-5bba-e6ae-fa89-60a9b319424b@linaro.org>
 <OS0PR01MB592269EB3BAE686A2F74B48286239@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <f12dfcd3-ef5c-b422-c00c-35cef082a3ff@linaro.org>
 <OS0PR01MB5922E406D2711AA6B8CD632C86239@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ddfb11e0-0704-1600-d89c-ec8ca1650c38@linaro.org>
 <OS0PR01MB5922130811695F9B906EA62E86239@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922130811695F9B906EA62E86239@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/10/2022 16:43, Biju Das wrote:
>> Subject: Re: [PATCH v4 4/4] mfd: Add RZ/G2L MTU3 PWM driver
>>
>> On 11/10/2022 16:35, Biju Das wrote:
>>>>>>
>>>>>> So no, here and in other files - don't put subsystem specific
>> code
>>>>>> like PWM or timer into MFD.
>>>>>
>>>>> Where should do we put, if there is single driver to be bind
>> against
>>>>> "renesas,rz-mtu3" and register functionalities for pwm and
>> counter??
>>>>
>>>> Again - how binding is related to this problem? If you have
>> separate
>>>> drivers, e.g. counter, timer and PWM, all go to their respective
>>>> subsystems. Counter goes to counter, timer to timer, PWM to pwm.
>>>
>>> How do you instantiate these drivers with a single compatible
>> "renesas,rz-mtu3"?
>>> If it is separate drivers.
>>>
>>
>> With MFD framework and mfd_cell, just like many, many other drivers.
> 
> They all have compatibles for child devices, right??

No

> Can you please Provide an MFD example which has a single compatible and 
> Multiple child devices in different subsystems??

There is plenty of examples:
git grep -C 4 'struct mfd_cell'

Even the first search result in MFD directory fits your needs, doesn't it?

Best regards,
Krzysztof

