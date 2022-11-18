Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B603D62F680
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 14:44:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241758AbiKRNon (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 08:44:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241625AbiKRNok (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 08:44:40 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C70786C2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 05:44:39 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id be13so8284173lfb.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 05:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/+ARMgwEUQ2ZjYV3x5LOp06hHU3gkx8nkJq53hd/AM=;
        b=HlwyumjJY6+N19ORY47MsA/NLZCIyBuMelPwTJumpvD3CdeEeKejWMop+phGbN/lnH
         u8ThZeUmpT4qySPgX5osxpPz+SjA0M/sdfJSg8BXMfjv1kXxqhJej+hebhZKpnKS1wze
         2nxS4pNyZMjCQHnIfdDiBRdHt+a229wdH75J8klEou9kw1B0MPNedyje1utE/Jan8dcv
         KQ0xUoRpqAhhJ2u4SopjWisKs9uJUFWSZKo9VXNcsAkY9ipoFfgiVTkBUVft8f9XuwJk
         G2hPXoSe0eqGTZuNgXtPgnZ9bQDkbk6tWyD+CZj/AJi/3Fmq+bheBc1W6mtS/a2Ft2aS
         /mQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/+ARMgwEUQ2ZjYV3x5LOp06hHU3gkx8nkJq53hd/AM=;
        b=fbkllYzni4Ykfd1Rktbx6FTvSPB5p+oedQwHsie81M5G2F7ar5jeYtKqVx3Dk76ozT
         X97z8/Ghb3UoKdKm7f0s8nxvrkhBmlQLufYmp3nC17qHm8aABH1gjFnHvc+tR4gD1zZA
         z5TPL6WLJWuIdW2Y2UhCa6B1sMP8rdCOLQCU2w/zhvwalyU1UjEs53Lgp/4pCOR5xbHM
         88/nW9EUWRy3TQknTE2o2o2r4T8yAUoZ+uaDlw8nf94L3gGRwqjeUlUUrsdD3LIksEpW
         3WLITapVsKZnMA7OLHD0x0ks4gB18bNfylQVoxW7DW76dWYcAPwITgg+zuxnDbhwF8PI
         WJIw==
X-Gm-Message-State: ANoB5pn+/dQMy7QZvFmzK5HUzS7ukl4c4IAEB5dcrF4z35WD/ke7H6wQ
        Te9vCpOHK5zt+ANo489Av4a47Q==
X-Google-Smtp-Source: AA0mqf6UKHbjNVtOSotxDXFXi3D4LOpnccqG9/UpcyupKhuED0gX1s7yvo6ndRD72UxCkRYF3S16Sg==
X-Received: by 2002:ac2:598f:0:b0:4a2:2515:dc59 with SMTP id w15-20020ac2598f000000b004a22515dc59mr2307605lfn.283.1668779077549;
        Fri, 18 Nov 2022 05:44:37 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g2-20020a2eb5c2000000b0025ebaef9570sm658800ljn.40.2022.11.18.05.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 05:44:37 -0800 (PST)
Message-ID: <93fbbe8f-05d7-aa85-5f40-2d15a1b97c01@linaro.org>
Date:   Fri, 18 Nov 2022 14:44:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/Five SoC
Content-Language: en-US
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221118133829.12855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118133829.12855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 18/11/2022 14:38, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The WDT block on the RZ/Five SoC is identical to one found on the RZ/G2UL
> SoC. "renesas,r9a07g043-wdt" compatible string will be used on the
> RZ/Five SoC so to make this clear, update the comment to include RZ/Five
> SoC.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

