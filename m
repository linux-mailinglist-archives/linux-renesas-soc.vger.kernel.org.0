Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94F461FDBD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Nov 2022 19:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbiKGSkS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 13:40:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbiKGSju (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 13:39:50 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CF7209B9
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Nov 2022 10:39:22 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id b9so17670143ljr.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2022 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXLngX/j4wkIy1a9aDZYAsscBJK84bs835gvLoMQ2Zc=;
        b=p8s+8y6nA/RKsg3W8UDwn8HNzn/gBM6qW6RG7gK8bdc292ji3GV+aDWGh5vApUo0uq
         +Odi5dDni2uXQwbXnQ1jIOgzSLRQumhCDOWwO72eZCCynkcgpZX9mwRMX9eLyzdbdK+5
         hn3IrZTJEKrKjKYbwEYrImjf2d/zSNtAkUYrm8LXJLV4mAC6rFk2dPQdDs78VgVPk0Dd
         BWjVYJM1/g0O9/sdh8nCMw0TvzWFi/yvQ7HmnkECjdrclsUawmgUtpGr4Oc2nK+aTU9w
         4N5DPRxM3qvwevZ8b67FeGbQ55tJlwrctmZCJlFsyfnFp4hgvXKd298LdVqGaQFPFJYE
         mDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXLngX/j4wkIy1a9aDZYAsscBJK84bs835gvLoMQ2Zc=;
        b=Yh9BARFjyc7Z3fW/CfFcVxxuYMYcNWtXwv7nH/c6cUofyB/aSK9WPXx/1aeou1tCwg
         SZbzDHyhRgsnz+dFFYiCp89rFvIG6Lp6H27/8Yby0dbYMijS+5pZRu8VI8tWBCLtyBOh
         K8OFRyE+3ZtzVKYpv7wMqpTebfJcWWvLSOY7GHlhXo+FrhjtNXaDui4UtHaAkZ6GKCGN
         aUt9O6tX5eMGgSdwBiG3FY4v17iAl68Jhb/XPZJulPkLtlLt+zXVhydoxyZIW2o3SeW8
         fXkwOFp4HB98WIrrc1QqdZTMpf3uy5/WuT0POGaFe9SIsSZureCftYWvlsIpeWC6QSgq
         2A0g==
X-Gm-Message-State: ACrzQf1Sfb21JW1sblaxoqFWKEM+aVkXZJLZhvmJpxTxRhkgo6XJWuer
        BlW97/BLseqYO3CVsP7/18v8mg==
X-Google-Smtp-Source: AMsMyM4YviYvRTH1ZcXzreVIUAoZYJF8ybIxlPozw8btQH80v3fQT2qIb27GiXzyEh97+9Cs7j19iQ==
X-Received: by 2002:a05:651c:1047:b0:277:6939:e278 with SMTP id x7-20020a05651c104700b002776939e278mr11515026ljm.522.1667846360840;
        Mon, 07 Nov 2022 10:39:20 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id o12-20020a2e730c000000b0027706d22878sm1360533ljc.94.2022.11.07.10.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 10:39:20 -0800 (PST)
Message-ID: <a6193f07-18b8-687a-7423-09ff9918e00a@linaro.org>
Date:   Mon, 7 Nov 2022 19:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH RFC 1/5] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/G2UL SoC
Content-Language: en-US
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221107175305.63975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221107175305.63975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107175305.63975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07/11/2022 18:53, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document RZ/G2UL (R9A07G043) IRQC bindings. The RZ/G2UL IRQC block is
> identical to one found on the RZ/G2L SoC. No driver changes are
> required as generic compatible string "renesas,rzg2l-irqc" will be
> used as a fallback.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

