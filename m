Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7072694069
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 10:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjBMJK5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 04:10:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjBMJKy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 04:10:54 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E321C13D43
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2023 01:10:52 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso10725291wmp.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2023 01:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=36yUUG+8mcMum6mQfeUKNP7sGg0Pm7G4E76xjrbQJik=;
        b=tM+5Sfcjpu9ggVH0LItxu2g2w3sRuyte7QVy9CFGRAcxsC0d63qdy2FiF91G+XGN6Q
         5qs42sMMxoAGCcT81cpApTTiOt/9iDIOcqYLd3Me0QSMrsiXGAOUZ207oiNF+Fq5T0vP
         xZdMXJ33NpIe3u/T9egAw9vbuxREqhDJCXUkOjD4nlRw7iDWkZmZFWIHiV5oknlLLcEy
         l4Ke97y2Q8XpdxNce4ygTRprHk6oj8auqn8/UL3QRbqg9Gmah5paJH0FgbVhidebJaTM
         wpy2gQl7y+55TmQH1M4gnwYWgjU2+nKhjso0HbgHjsVsu3NThoLUdVMrRPrHBXhi0p1J
         IgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=36yUUG+8mcMum6mQfeUKNP7sGg0Pm7G4E76xjrbQJik=;
        b=YXoL64KF+vqj3wiUKzWMjgZdd91K99hwaBSEteW6fj5CEzmPBqr+M9louxGcWvm9QA
         GbaaEVteX3pXkLBmrwRnDLSVIKzxX8aYiWuz6LB/6J3CPqPmCpc7pcqZaQhV9t8i8PbD
         j9fpml2y5eIODxa60Z1sLAAF2utINhoMZ3xXDAUP0P3o7G4RrLEAFBVs1ck5/OFyhW7L
         SMFWJkmVpQ3gZ5OwI61zyxSeSR0s3j+OoOttGcRdkPS+J6SmYg5Cq5t3OeZ7/ynQRueI
         bB6REQ65gUyVXpSsin/SeI9xtgIjVCQ1aMRl2Uyvsyu8gMdLt67lf0wTkDsNjaZBiQuu
         iNMw==
X-Gm-Message-State: AO0yUKVN92rw1riJ6AnYqwtpW2ylwogAjLwZzn1zEejTEyHkmNLbuPxv
        JqdlmLW0r3nJFITy1C5XDIWYPyFlyc0gx+UW
X-Google-Smtp-Source: AK7set8HZqIbTJigU0J6SCX45BvvABMJcmY8KPi8VDuppcJ7UtDAkXqgeQMfvH5CNPRezpX0jgvNUA==
X-Received: by 2002:a05:600c:4b1b:b0:3dc:98a4:787d with SMTP id i27-20020a05600c4b1b00b003dc98a4787dmr18835006wmp.3.1676279451486;
        Mon, 13 Feb 2023 01:10:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003dc1d668866sm16023479wmc.10.2023.02.13.01.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:10:51 -0800 (PST)
Message-ID: <5fd826d0-8c7e-63d7-59ed-a4a1e5e04734@linaro.org>
Date:   Mon, 13 Feb 2023 10:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dt-bindings: thermal: rcar-gen3-thermal: Add r8a779g0
 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1675958665.git.geert+renesas@glider.be>
 <11f740522ec479011cc8eef6bb450603be394def.1675958665.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <11f740522ec479011cc8eef6bb450603be394def.1675958665.git.geert+renesas@glider.be>
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

On 09/02/2023 17:11, Geert Uytterhoeven wrote:
> Document support for the Thermal Sensor/Chip Internal Voltage
> Monitor/Core Voltage Monitor (THS/CIVM/CVM) on the Renesas R-Car V4H
> (R8A779G0) SoC.
> 
> Unlike most other R-Car Gen3 and Gen4 SoCs, it has 4 instead of 3
> sensors, so increase the maximum number of reg tuples.
> Just like other R-Car Gen4 SoCs, interrupts are not routed to the
> INTC-AP but to the ECM.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

