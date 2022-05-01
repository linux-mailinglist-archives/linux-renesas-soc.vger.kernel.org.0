Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E86F51634F
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 11:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344273AbiEAJFy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 05:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240930AbiEAJFx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 05:05:53 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FE169482
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 May 2022 02:02:27 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id d6so13566841ede.8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 May 2022 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KIDtXcj8TQd+YafrZ5yRz2cziBcsJX8ezqsE7UZYplg=;
        b=Hl8XeMnkXALtptw2FYW6rCflZvdLx9kR6W36RBZo3y2ltZklJltkuJYuUgDOlvWGjF
         qHXM7HaADhfeSvj2TLDobwv35ESMjX8oubQSEgruy+sTy6CAG4DVQh41+jWMq4/GuhKJ
         blaJU4Pb33kH6MoQdZObraeGG1Qr+vhe+/OUd+fRR6KuyFUu+O1RBGkJ7Wf5mZM3fGjL
         C2dWnWPf3Ny2g9Hlf4o5Mm6+LCQm5ROFEZZ3qrjsftDe1wgWdyhTdu1TCzlRwyxQLuyO
         VPJXwjiyHwgkGPFr2IOZNUlthWf4xHIkog0Lla1RddF4U3X4x3vKAqIenUJDTfW6PKnF
         fHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KIDtXcj8TQd+YafrZ5yRz2cziBcsJX8ezqsE7UZYplg=;
        b=2ZqqLEQLJCxtIdUP85te8u9snbLE1+KaoJ8ODsSCcd8TbSoh4SD/+fjhV4nhSS6fbG
         1FW9P76i5iZD/YoORcvXDWGF4wHy27UL2+g8RMR4ncvksD3T3kAdqq9RQFRyRBI+bvsh
         H+6oOCm4Fs+JTfnO9qXA2yO6BSpAdWOH5ihnRGi75+WSG+1KfMg8G/QzQ2h0O0WyNB9/
         pb1FP8cqTpXwDPs12tD4S26mV5fCA0sTkFWdgzjFm35iLz3jnjBMSt6hIlD0Z4/xVGiC
         HB63wvD2cI1f4njX/5HgFPuBAGZ5Ye0bRYTLPb0RUSG0TjyL7RzoLAACmnFS+owOc5Ds
         wIYg==
X-Gm-Message-State: AOAM531xqenUnRsvFraTPt1rNd4KDRqclakqBAVz0ba0tv927b8oxtW6
        YO5rKRxrzzLfhN2f6fxUHTVtLA==
X-Google-Smtp-Source: ABdhPJxAUIyEAfeKsEf35taG1v1IEHsRVRKPqV/8YY0DtpTrjBDoO4oRUZXowVKrwooJsoLjelomAg==
X-Received: by 2002:aa7:d708:0:b0:427:b5ee:b8f2 with SMTP id t8-20020aa7d708000000b00427b5eeb8f2mr2905698edq.404.1651395746065;
        Sun, 01 May 2022 02:02:26 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id dq10-20020a170907734a00b006f3ef214deasm2410067ejc.80.2022.05.01.02.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 May 2022 02:02:25 -0700 (PDT)
Message-ID: <a2df5f24-f8e0-0c7d-3d2e-579444d27187@linaro.org>
Date:   Sun, 1 May 2022 11:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: iio: adc: Document Renesas RZ/G2UL ADC
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <20220501081001.21563-1-biju.das.jz@bp.renesas.com>
 <9ddec6b5-5c64-883e-5894-9a51e82cdc3d@linaro.org>
 <OS0PR01MB59228D766976EA8063D8F0B086FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59228D766976EA8063D8F0B086FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/05/2022 10:40, Biju Das wrote:
>>> +    oneOf:
>>> +      - items:
>>> +          - const: renesas,renesas,r9a07g043-adc   # RZ/G2UL
>>
>> It's not a list, so no items.
> 
> Ok you mean. Get rid of Items and Just use - const: renesas,renesas,r9a07g043-adc   # RZ/G2UL

Yes.


Best regards,
Krzysztof
