Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C59BA5E6E75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Sep 2022 23:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbiIVVh7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Sep 2022 17:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiIVVh6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Sep 2022 17:37:58 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214F610253C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Sep 2022 14:37:57 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id ay7-20020a05600c1e0700b003b49861bf48so4537244wmb.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Sep 2022 14:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2mdfxOllYJwVRdzEV7h9el17e4oq172vAJjTd21Q7z0=;
        b=jsfPIJmWOgZfaJX6kkecbpYVT/1oCuB6d2bdaRexbLb/x6ZUWnFB3t3sYqNaqd/QRn
         twA0Cz8yNeUI2cFYUSI7Q2dIOvDV/cLhtcOSpPyGPtKXNqfEmpT3un7ZsRfO4eEvoffq
         NkFLvBrGaOIQezdQZ6sryYUntZfyGe2j1ie573SsDI6XEyU7+anyGCd6AiDuEcWymr70
         R/JSq4y3Nu7UJxdUvUONvbErsjD8EB/oQfWa+GfOKGVtKCD5KM+ZnE06ZCYWNZPp2kvI
         6TMhIggWKCpS61tDDE+CAn0Y/Rv6nZLDWBkrhuQDvjWcuQQrgqPvbhxSjn328KwrzfiQ
         xPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2mdfxOllYJwVRdzEV7h9el17e4oq172vAJjTd21Q7z0=;
        b=ADIaR0t1UdQkvkcozySyfICViE6W9lEbu4bZBqbSsmEKwPkvjWugdcZT8XroElSDWt
         moPrTTc5cPg5cyHa8C+0waGlKB+NEG773yR0/48XXWpLFR1V2C20TsVp+WFksOTLHJGm
         tgK4pVkxyejwBVQkMs/fRnHPMyK9Wpk6WR/Ejm0Ua8UFgdAeyiaqG4uPIuL9IW0ZfFfn
         Tv8zOPFYOPP9qGRYgFTCmRu/wqIVILkiRJyANgyec0jV2Ul699pX3DtKjsspIvFEQvzf
         nm93DFYV+D7+qmobRjgzHuiRg4qzWNgpJ/v4lcav3CQ4tFN4ke+TDd02SWXbuandTOK3
         JzWA==
X-Gm-Message-State: ACrzQf30OBsROnseA5siiA8Tw9WTp9osLkTk4hvhGh69C5uiN56GDhVx
        eqWTxiSozeSrQuMEGSz8c9Dj2w==
X-Google-Smtp-Source: AMsMyM5S0UBX0Ghlfv1ywW39XJFlFa4Ly/6L2oQSfG7pgG47IWz7TPf/iD+5l8jZsgrO+iL7LlDfqg==
X-Received: by 2002:a05:600c:4211:b0:3b4:6334:9940 with SMTP id x17-20020a05600c421100b003b463349940mr3807414wmh.166.1663882675578;
        Thu, 22 Sep 2022 14:37:55 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id bv4-20020a0560001f0400b00228d6bc8450sm5926835wrb.108.2022.09.22.14.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 14:37:54 -0700 (PDT)
Message-ID: <8672aa05-0269-f8c3-50d3-e23d3793baf4@linaro.org>
Date:   Thu, 22 Sep 2022 23:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,tmu: Add r8a779f0 support
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220830104921.7532-1-wsa+renesas@sang-engineering.com>
 <YyzQFheOv2Lg0t6F@shikoro>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <YyzQFheOv2Lg0t6F@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Wolfram,

On 22/09/2022 23:13, Wolfram Sang wrote:
> On Tue, Aug 30, 2022 at 12:49:21PM +0200, Wolfram Sang wrote:
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
> 
> Can we have this simple patch in 6.1 please? Otherwise DT build warnings
> will show up. Or is there something I could help with?

It is applied,

https://git.linaro.org/people/daniel.lezcano/linux.git/commit/?h=timers/drivers/next&id=fa7fc5243f9e7d64ea7e73c247218f22499c3479




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
