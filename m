Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533D97C7D44
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 07:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjJMFzT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 01:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJMFzS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 01:55:18 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A56BE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 22:55:15 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so2964520a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 22:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1697176514; x=1697781314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYHZdMFA6OQbagkrLvPrbN3TwwM9BrhoqWPjC6tbAtk=;
        b=NqjM2d63W9cMlsFqB+kwBGI6Zdb5Et0SdPJnSI74XlYSl7xneWpEc4G6feGNJB7cMJ
         gKD4EhWJkN7wKmiElaKZ7tBxCNiOGLLlOuYK+B976HEEkHDzVr9jK836VarI+NzaZtek
         TWDEHpVrXcfzczy67VqAzvlkc48jR6zicuRARqjJJ6rSFyQtPZ5FpiEBlMtIT577MD2J
         sXZVAicVnmFVsUtsYCX/+HTbEx8No4p1GAJMhq/YbqHdzEjmDP/Kmp4mKO8d+yjcCRXo
         TkY2PCM1efcj/XQ4PDvQxhichr7TEGaLtsHMWfyBaA68MN/ZGeZbkH9jwLdhSQG0i9fO
         Hdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697176514; x=1697781314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYHZdMFA6OQbagkrLvPrbN3TwwM9BrhoqWPjC6tbAtk=;
        b=v+cVa3ZWv9BDiA8lfan6K/bLuSOWIb80bJDPgu7pc7jFZfaQrsKiaeigNJkNEcIJtY
         YPPnJ0umlBKHzwXGae6oa5WHA6qCH1izsBqVv8Qzidob1vj5cNQYfRwS3NKhnCBqYx+L
         b1MZrRA5ubyvtbmsO49gGauorR1ore6XrofON61AR2cbVgHi5Fi9Kngwe7KhBg8XM6z5
         HYfNBxp+X7lRjauY7270ne9hJRB7UG0issGsd317uxxqexAyxD8o1IFUcf+FdadX2tqO
         /iad0MBa3/Q61EyU/unGxp6sl1W6wWbi/edllCOlNAW4li6m5aOEV45pOxNQVLT+tKiA
         5F9Q==
X-Gm-Message-State: AOJu0YyZEFVDzq57fQFXj8Kv3YaWVzlM9nlWt+WfRZNKvmwEeuQFGh9F
        riKXBnBlRpBti110bH7jtgsHFA==
X-Google-Smtp-Source: AGHT+IFFh3iNNCKrv7qa7ps1KepqR4A5yjCxBztpy/J6r0rr1ZsGCqYF7OpwdshOCE+3/c95sGEksA==
X-Received: by 2002:aa7:d947:0:b0:531:9c1:8271 with SMTP id l7-20020aa7d947000000b0053109c18271mr23383511eds.14.1697176514187;
        Thu, 12 Oct 2023 22:55:14 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.133])
        by smtp.gmail.com with ESMTPSA id f26-20020a50ee9a000000b0052e1783ab25sm11073824edr.70.2023.10.12.22.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 22:55:13 -0700 (PDT)
Message-ID: <acc14d48-7b9c-4d7e-a642-077c3841b937@tuxon.dev>
Date:   Fri, 13 Oct 2023 08:55:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: renesas: rzg3s: Fix dtbs_check
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
 <20231010132701.1658737-7-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVwO--GrdDP8pUHq-k5cVR31dGdvEM73z2E+NLEbD8GRw@mail.gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVwO--GrdDP8pUHq-k5cVR31dGdvEM73z2E+NLEbD8GRw@mail.gmail.com>
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

Hi, Geert,

On 12.10.2023 17:49, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, Oct 10, 2023 at 3:27 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Fix the following DTBS check warnings:
>>
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dt: /: memory@48000000: 'device-type' does not match any of the regexes: 'pinctrl-[0-9]+'
>>         from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /: memory@48000000: 'device_type' is a required property
>>         from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: 'cache-level' is a required property
>>         from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: 'cache-level' is a required property
>>         from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: Unevaluated properties are not allowed ('cache-size', 'cache-unified' were unexpected)
>>         from schema $id: http://devicetree.org/schemas/cache.yaml#
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi       | 1 +
>>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 2 +-
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.7, split in two parts.

I see you already did the split and applied, thank you for that. I was in
between choosing to split it or to have it like a bulk patch.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
