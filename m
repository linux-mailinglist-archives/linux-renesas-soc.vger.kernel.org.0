Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24A4D643F96
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Dec 2022 10:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234421AbiLFJRl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Dec 2022 04:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234826AbiLFJQd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Dec 2022 04:16:33 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01493220D6
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Dec 2022 01:16:10 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id z4so16508883ljq.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Dec 2022 01:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nSz8+pdzVOvO17mmGP1PwKitaiaqBA0sMFckD9UpIz8=;
        b=bF7aDatVUWwwHFmYq8p+W4TB9+kDOfdUJgkLUAEalM21QMbDFEPI1W1nnH+5/Y/jKH
         zHjgOiwFTzniV9CrNh1lMlnmhL4Vuo9XhdXvJnBwX91UmAI9DeX1ket72WcxUYyxBD+N
         2rMaYpDsSEVHHbYj1x57wfg4bUwPFFEK0yrWD3MZTiaZgKfsXKZv/uw0j3eXg7VsvP35
         aLL1meaCDJdkEgFOn2al3FRv3Mo63jXDIGbiy3o4MghtDitEuFV4iAvFjsEcdeqnp/bg
         VVfW/IyQ2oIph+wPv4fgyDExBk1aMzJMqO4H0ZFDE/WnXMfMAlZl/9fr9pJpIHtue+0K
         5xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nSz8+pdzVOvO17mmGP1PwKitaiaqBA0sMFckD9UpIz8=;
        b=cV7+sFtPHnkDvKbnX8QBiZM8ffAxxLnCC070YxaQf9P9N/gKs9QF8KIMfzkiTcqz4a
         mmmp5L11HbdNr1sA6QeXY6zzaJHG2Bi4TlfARiv6a84+criUuvJJFmV6RucD4roau79r
         AdFe9V26+upZKxXn6japsqAwGuCT0j61RWrzYAd5qqVSeXj5QGSaYpmqyNXP9oTWAmQn
         ERyIs5bHGtu5L3fUTfoghg5/PRHwH2nsFlQITQTDzRhpHE7JeBppSjAnswFsE7vESRdu
         krii/Utc42zpneV3tlkbpIzlMZ0NoSE1vyFPZq+xYBioZ30lozs4QcDUA+j7Zo7LNUxd
         QVSw==
X-Gm-Message-State: ANoB5pl9lnvWTdou76y0Y1VfJ0pTKLEo8fcPxInPmekpKny7zicqTHSJ
        MSwMkmUnMzjJMXAAfNBFSzovAw==
X-Google-Smtp-Source: AA0mqf52hPel6Y7yp0GvQe24wYR3MQwPfgyyDGxL0XTTjSrgY2kcLkcne0d6WDnxB9zk3iTNPDFRlw==
X-Received: by 2002:a2e:c52:0:b0:277:9bf:9411 with SMTP id o18-20020a2e0c52000000b0027709bf9411mr19869694ljd.504.1670318168431;
        Tue, 06 Dec 2022 01:16:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b26-20020a2e895a000000b00279e0b8bae7sm1077010ljk.65.2022.12.06.01.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 01:16:07 -0800 (PST)
Message-ID: <0565a333-3bb7-89db-735d-56006405bda4@linaro.org>
Date:   Tue, 6 Dec 2022 10:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: sound: ti,pcm3168a: Convert to
 json-schema
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Damien Horsley <Damien.Horsley@imgtec.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1669980383.git.geert+renesas@glider.be>
 <9f2a2474ec71dcc2a76e868295202a8c425a5d41.1669980383.git.geert+renesas@glider.be>
 <b105572c-96fe-dbad-c435-43233cfb25a7@linaro.org>
 <CAMuHMdXG39BoMScDpH_Cxc-BXBKZHxyQqe6MJMEhnerN3yU6Uw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdXG39BoMScDpH_Cxc-BXBKZHxyQqe6MJMEhnerN3yU6Uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05/12/2022 09:00, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> Thanks for your comments!
> 
> On Sat, Dec 3, 2022 at 1:13 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 02/12/2022 13:55, Geert Uytterhoeven wrote:
>>> Convert the Texas Instruments PCM3168A Audio Codec Device Tree binding
>>> documentation to json-schema.
>>>
>>> Add missing properties.
>>> Drop unneeded pinctrl properties from example.
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> +description:
>>> +  The Texas Instruments PCM3168A is a 24-bit Multi-channel Audio CODEC with
>>> +  96/192kHz sampling rate, supporting both SPI and I2C bus access.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ti,pcm3168a
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: System clock input
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: scki
>>> +
>>> +  reset-gpios:
>>> +    items:
>>> +      - description: |
>>> +          GPIO line connected to the active-low RST pin of the codec.
>>> +            RST = low: device power-down
>>> +            RST = high: device is enabled
>>> +
>>> +  "#sound-dai-cells":
>>> +    enum: [0, 1]
>>
>> This is a bit unexpected. Looking at DTSes:
>> 1. I see in ulcb-kf.dtsi with cells==0, but two endpoints. The dai cells
>> seem unused? In such case shall dai-cells be skipped if we have endpoints?
>>
>> 2. in k3-j721e-common-proc-board.dts has cells=1, but user's phandle
>> does not have an argument, so practically it is ==0? The user -
>> sound/soc/ti/j721e-evm.c - just gets the node and does not use cells,
>> right? So even though dai-cells==1, it does not matter, because user
>> gets its own parsing?
>>
>> 3. The pcm3168a driver also does not have any xlate function, but it
>> registers to DAIs, so all uses should be with cells==1 to select proper
>> DAI...
> 
> I have no idea (DAI is magic to me), and hope the audio experts
> can provide some input...

It is a bit of magic to me too. Yet I think the correct usage of this is
with dai-cells=1. I think we can skip the choice here between
sound-dai-cells and endpoints (to allow only one) and only fix the value
here to =1.

This would also require changing
arch/arm64/boot/dts/renesas/ulcb-kf.dtsi to dai-cells=1.

Best regards,
Krzysztof

