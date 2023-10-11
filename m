Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC6D7C58A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Oct 2023 17:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346948AbjJKPze (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Oct 2023 11:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346951AbjJKPze (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 11:55:34 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FB7B8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2023 08:55:32 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-533d31a8523so51448a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2023 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1697039730; x=1697644530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbOpE5VKjIMjXNX7bXqdn8URAwp8xkDDntfrb/FwR4w=;
        b=NNOzwli5kTV/9yJtYrGkGVtWGP/hZpk+/d78HayHgdUMZY+XrNP5f18uT0qpvinWOm
         HuJRLtOo8roU3dVfgwcWJ8//maXJDlaS0UdTsXP68Lk6XYyCMlBSQeKg1knvkobdrUtU
         ggzXhbKroqq5i1QZKy5pHVXwKbowCFFtNybBp2TOrmCW5AJ1IuVUrqZHkyDCvJoGOJPU
         pHkqPXu8TL5Glfgr9dN5D/ieUcCi+o23Q7xv4wbbhjMM5bQ6KRJCjO6/P+H5pAN5zxRE
         4mwEm4xyTXc4eEXrrlqVM3GUPVah4uepmkH2DIET6ggcMLo96tNFfZ+KLns4QElKGZp7
         /67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697039730; x=1697644530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbOpE5VKjIMjXNX7bXqdn8URAwp8xkDDntfrb/FwR4w=;
        b=ZY5C8VN9f/2U21yMjFPB+qF9X1ihPP55QsIbVqsgOsh3w8BoEXBCF4bAjGo6sJaYws
         6JQE1K0JnqjD/l4R5ZjWqTb1QPGABL8FWKXer2mWP+dQE5ImELSUw+LasDOibPDmABws
         MHkX8DAh9i7YEL3wvceA7Lb0MEpjPqjTjGNG1i5ey021bTt8wkLXIyFF+JIX5N/3NST9
         EWLyzZZCQ7YcybzhvoEpLB6YvCHo9v3NICC2veTja1mlvZNY+HGR8GzydFWiljcbrJ60
         dETFyOUjSa38ojdd8ULDqui8/YWtBQ87wGG0jsbBadS6KnLbpZJfJEgXECZJTE6ba/kK
         qDHg==
X-Gm-Message-State: AOJu0YyJHASecPorHRthLJ/vbXym5Yfl2Yjm/0ESaBqiQ73eef97cMuK
        LdYOL3slg4o5G0HKf78/upASJg==
X-Google-Smtp-Source: AGHT+IHtErofZM2x+uE8kBiPaK1/HljWwfQi6sW2rbSCUwN2JiCvdsMVCdEYynwvsBJNVVTBtUob8w==
X-Received: by 2002:aa7:c998:0:b0:530:ccf7:37af with SMTP id c24-20020aa7c998000000b00530ccf737afmr18702868edt.12.1697039729420;
        Wed, 11 Oct 2023 08:55:29 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.133])
        by smtp.gmail.com with ESMTPSA id ec22-20020a0564020d5600b0053defc8c15asm460905edb.51.2023.10.11.08.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 08:55:28 -0700 (PDT)
Message-ID: <fe375d1d-29b1-4514-963b-7a65a645a58d@tuxon.dev>
Date:   Wed, 11 Oct 2023 18:55:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: renesas: rzg2l: Use %x format specifier to print
 CLK_ON_R()
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>, magnus.damm@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
 <20231010132701.1658737-2-claudiu.beznea.uj@bp.renesas.com>
 <8226bd48-4297-0b32-c733-2e569114a934@gmail.com>
 <e1c9c2ca-144c-49fe-940c-9ca8ad40e377@tuxon.dev>
 <CAMuHMdW7jXSFx5kU6PKr55cXw2+Hu_J-Z4NdUk=m_2AxuaOC0g@mail.gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdW7jXSFx5kU6PKr55cXw2+Hu_J-Z4NdUk=m_2AxuaOC0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi, Geert,

On 11.10.2023 10:43, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Oct 11, 2023 at 9:37 AM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 10.10.2023 17:52, Sergei Shtylyov wrote:
>>> On 10/10/23 4:26 PM, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Use %x format specifier to print CLK_ON_R(). This is easier when
>>>> debugging as the value printed will be hexadecimal like in the hardware
>>>> manual. Along with it "0x" has been added in front of the printed value.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>  drivers/clk/renesas/rzg2l-cpg.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
>>>> index d62f1bc1f60e..764bd72cf059 100644
>>>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>>>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>>>> @@ -1213,7 +1213,7 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
>>>>              return 0;
>>>>      }
>>>>
>>>> -    dev_dbg(dev, "CLK_ON %u/%pC %s\n", CLK_ON_R(reg), hw->clk,
>>>> +    dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", CLK_ON_R(reg), hw->clk,
>>>
>>>    Perhaps "%#x" instead of "0x%x"?
>>
>> Yes, better, thanks!
> 
> "%#" is not very common in drivers/clk/.
> 
> And to me it always raises the question: What does "alternate form" mean
> for this conversion specifier and this implementation of vsnprintf()?

OK, I have no strong opinion on this. Please let me know in case you need
me to send a new version.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
