Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF497D4BAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Oct 2023 11:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbjJXJQA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Oct 2023 05:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjJXJP7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Oct 2023 05:15:59 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B8B118
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Oct 2023 02:15:55 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40859c46447so20744745e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Oct 2023 02:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698138954; x=1698743754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JE8y+1iY9V+lOxL/Y/HUmytmH2Hpxh0IphBYyIsG5Rs=;
        b=pvcw/2zUKWdE0VGeDQJgfuB4g9olMkkF3uK0PETpWf5rfIhIRvmTqIi2Mm0wDrusqV
         jaj24Q4JfQ78enD3/lXVaEl7DA+R0UC5UqUpLZffwmytNcb/23/2PYCYFtgZekQ92qVp
         KoReX6Ez7N03Q6tfTQM6FgqLXWCh3+RKXxlw++4dFb2Dhys7TqZVcNdFDO+77tozD8m9
         peC/R3vyk89jWEgsxNGZcMp/MgPd+WGjxgk5PQRRc/DdADxoGHhToNXwRjWzDlZxDdu/
         yzUAUb8P/dP5ANWuhHFeSbtKOB7UsPigcZ3Ldjq6gW/JuaSdg02XOxCuXP0i2EAel5bK
         GGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698138954; x=1698743754;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JE8y+1iY9V+lOxL/Y/HUmytmH2Hpxh0IphBYyIsG5Rs=;
        b=MBpthXpxG9UFNpCzhSXEpl25LcCrVAY59hmIVunItpyxdf4dC20E0ldNJwr7D1JfX+
         PQfEUpdjsr0fJ+qzmC1dfL9gSPads00RwRRxKI3/C07s4qiYQQ+hqA8uPonChyLEHsio
         Paw51b4fbQetvILf/Pc62mtsMGhwk4Tq6D/QC4Xvgddsn5uEmp63mIRufQ41XGumxV4F
         WFb0bpXMp08VY6AQhYP8etLbKnRQSVYUfjhywkswMtbkQQQh7AeUyi9W+EYeApwmeZ2C
         y9hlN710JLBYIBfDbfqRVgslgJe6rNrfuPcFFVkRr+yNqJvM88IlyqsDGwLKwX2JhfKF
         tpsw==
X-Gm-Message-State: AOJu0YxXl90P6o1lBhG36KmEHQxe1rnoo3LSCmX4VW8wfsr1sh601L0Y
        TAU37yR6z6k8jgdoXtze3cv2fA==
X-Google-Smtp-Source: AGHT+IFzXpf+5BLy2pE7WqZuSxii7DKas1PgREnHdhe6bzohB7yuXnIHgG+qpZ6vW120jhTN6iXB0w==
X-Received: by 2002:adf:cd0e:0:b0:32d:87df:6dea with SMTP id w14-20020adfcd0e000000b0032d87df6deamr9079492wrm.45.1698138954177;
        Tue, 24 Oct 2023 02:15:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id a10-20020adfe5ca000000b0032415213a6fsm9462961wrn.87.2023.10.24.02.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 02:15:53 -0700 (PDT)
Message-ID: <a58f3267-092c-4877-b45a-b2775b1d3312@linaro.org>
Date:   Tue, 24 Oct 2023 11:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH dt-schema] schemas: gpio: gpio-consumer: Fix false
 positives on nodes named gpio
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20231023144134.1881973-1-geert+renesas@glider.be>
 <4e2928a0-b2e6-4651-8cab-7f1c4d8f697d@linaro.org>
 <CAMuHMdVSx2G8A6wP+j0fNoFz1Y4+=R+diXc5pxJrn1FV65EBeQ@mail.gmail.com>
 <530b364d-1cdb-4905-a3f6-fd15c7aa1456@linaro.org>
 <CAMuHMdUg1t=McCPEFV9d0Jt=-oSDhzYznMWc17sbYvaVvueRfA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdUg1t=McCPEFV9d0Jt=-oSDhzYznMWc17sbYvaVvueRfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24/10/2023 09:39, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, Oct 24, 2023 at 9:33 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 23/10/2023 20:08, Geert Uytterhoeven wrote:
>>> On Mon, Oct 23, 2023 at 5:24 PM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>> On 23/10/2023 16:41, Geert Uytterhoeven wrote:
>>>>> Just like for "gpio", nodes can be named "gpios" or
>>>>> "<something>-gpio(s)", causing false positive failures.
>>>>>
>>>>> See also commit 80120fccde170902 ("schemas: gpio: fix false positive
>>>>> failures on nodes named 'gpio'").
>>>>>
>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> ---
>>>>> Seen on Linux, e.g.:
>>>>>
>>>>>     arch/arm/boot/dts/renesas/r8a7779-marzen.dtb: /: keyboard-gpio: {'compatible': ['gpio-keys-polled'], 'poll-interval': [[50]], 'pinctrl-0': [[29]], 'pinctrl-names': ['default'], 'key-3': {'gpios': [[28, 19, 1]], 'linux,code': [[4]], 'label': ['SW1-3'], 'debounce-interval': [[20]]}, 'key-4': {'gpios': [[28, 20, 1]], 'linux,code': [[5]], 'label': ['SW1-4'], 'debounce-interval': [[20]]}} is not of type 'array'
>>>>>           from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>>>>>     arch/arm/boot/dts/renesas/r8a7779-marzen.dtb: pinctrl@fffc0000: keyboard-gpio: {'pins': ['GP_0_19', 'GP_0_20'], 'bias-pull-up': True, 'phandle': [[29]]} is not of type 'array'
>>>>>           from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>>>>
>>>> keyboard-gpio is not commonly used names. Most (almost all) boards just
>>>> call it "gpio-keys".
>>>
>>> Most call it "keyboard".
>>
>> Most? My grep counted only 14.
>>
>> 520 for gpio-keys (not counting -polled)
>>
>> But sure, can be keyboard.
> 
> Sorry, I meant Section 2.2.2 "Generic Names Recommendation" in
> the Devicetree Specification ;-)

Yes, that's right. Keyboard is generic thus indeed seems more suitable,
because "gpio-keys" already includes specific part - GPIO. OTOH, we tend
to think about keyboard as something with keys for the full alphabet,
like PC 10x keyboard. How to call a node in an embedded board or phone
with 4 buttons or 4 keys in total?

> 
>>> Marzen has 4 keys split in two keyboards due to hardware limitations,
>>> hence I had called them "keyboard-irq" (using falling edge interrupts,
>>> i.e. no real key-up events)  and "keyboard-gpio" (gpio polling
>>> without interrupts).
>> keyboard-0
>> keyboard-1
Best regards,
Krzysztof

