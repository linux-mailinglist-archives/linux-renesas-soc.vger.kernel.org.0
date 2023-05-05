Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95F5E6F88A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 May 2023 20:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbjEEScs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 May 2023 14:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbjEEScp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 May 2023 14:32:45 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809A61CFD3
        for <linux-renesas-soc@vger.kernel.org>; Fri,  5 May 2023 11:32:28 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc34b98edso3253013a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 May 2023 11:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683311547; x=1685903547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztLxosjOmeC1BpFRao7gbZ6OTGksnveF47jlPSbPehQ=;
        b=dSeuLagTXheTsMd7lpqsYKZ6/z6BaU+Zke1Z1PhZV2OjqgC1REddVzMilKcLeGsSwS
         jTPPEaPDAM0EEjssZcjU83DRWcwc2zJPNZyH6yXSpUeito863IvXdngp9b7xscZPBoCB
         bkduEcXOpfWUxcRvp95vbkyO5vtiuEtRo3+o3IT9X0URBVIZWtqqsDpE84IVbDy1GRIn
         kgrQdFqzjYuccjvBFTQcXYMSJYL2tEd2JiCS0oQIL9mbAe6O61TQIELL4tWlfuUGn4OX
         hTYoK9SJ4pqjH6sfALnXzDw6yWuZOI6lMb6+M3d6MmemO2CFYjGGzUAPdnr9cJHP/H9e
         btEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683311547; x=1685903547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ztLxosjOmeC1BpFRao7gbZ6OTGksnveF47jlPSbPehQ=;
        b=Ux+N1YZY5QoBsBRAXzbJNtNyjvcfPQuAxFeU4N9uPbq298WapJilSrezV5ZUtwt+4h
         iBRFYICZyrE6hidBcbIpoei20menuetSLwmhMMfCb0BX1iwpUXBrT8VQnvW9hVm81QFk
         DKsYGUL3iO8I3kJIvf1ULzwKyMZKo4rjU3dOwVoWxN6rTX/Rk/lIstYYTJ94MRffc4HV
         MCc6uv+iAc6QkS0j+YqjBcjxNVngN6ZrE280V4wPFNgMq1W+BH/YA3P2mzgUDAndsYby
         fQiB8wybDpsLV0Vt0JZ2gvVxFWL0IYVt9qOpeEGGq/Ij+7guGg+3E7MZhwI+ZHmupYob
         Km9w==
X-Gm-Message-State: AC+VfDxE2T9QwobNlIT+bD7FSwm3Mc7T7XvKqZOH/xZi8X+KAHQEMDGM
        E46/9SoutInctYHqRxy5pJB51xL0kRId5zFHkFtmvA==
X-Google-Smtp-Source: ACHHUZ7lfyTiGGIcmWMJUPEzqCaBjt+p1pbp95aABkJMhWGhU/aeEZJ2ZVh3HyX4YCr18nV9zYyWbA==
X-Received: by 2002:a17:907:980a:b0:94a:74b8:7a79 with SMTP id ji10-20020a170907980a00b0094a74b87a79mr2118054ejc.59.1683311546844;
        Fri, 05 May 2023 11:32:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id hw6-20020a170907a0c600b00965f98eefc1sm470990ejc.116.2023.05.05.11.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 11:32:26 -0700 (PDT)
Message-ID: <c66bc920-14fa-e910-8c9e-2fcc154050a8@linaro.org>
Date:   Fri, 5 May 2023 20:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
 <20230505172530.357455-2-biju.das.jz@bp.renesas.com>
 <e2393abc-53a2-4216-cd85-1033560421ee@linaro.org>
 <OS0PR01MB59226713E010AF3F9030052B86729@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59226713E010AF3F9030052B86729@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05/05/2023 20:21, Biju Das wrote:
>>> +  reg:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: main
>>> +      - const: rtc
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  renesas,rtc-enabled:
>>> +    description:
>>> +      To indicate RTC is enabled on the PMIC.
>>
>> "Enabled" by who or what? This looks like some policy, so Devicetree is not
>> a place for it.
> 
> It is based on system design. System designers may chose not to populate built-in RTC by
> grounding XIN and XOUT pins.
> 
> Do we need to add this info in description to make it clear??

Yes, this would solve my question, so please include it.


Best regards,
Krzysztof

