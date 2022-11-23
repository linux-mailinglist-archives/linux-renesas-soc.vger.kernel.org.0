Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B2E635A97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Nov 2022 11:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236838AbiKWKxi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Nov 2022 05:53:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236944AbiKWKxR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 05:53:17 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331DA12EBF7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Nov 2022 02:40:41 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id c1so27550623lfi.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Nov 2022 02:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2pM9FxyqpBfqOkWHZznQlsEGwgwUinMmoNOgEnKgLr4=;
        b=Ow0xVzWPkFoncMiJC03Spf4BHgUncJGI6fQ7W+eTFjCoE4X66chE8lsyYCE0hXnJx7
         ON+KOvz2pDbpILTd4dvyuUMLuxlKmRXlYf9Es+7+klAP3l/xiit/GIAUzTktA9aJvDZD
         3mS++ghxdsqW75p8bIsNImoQdk9YcbHpMvUlXo/UR+OEYN40/PtII+ME7+7e6TuQj5jI
         Ta+2In+MS0zfCDz1VP1h98e6BQYUGV+GWJUexUARWyB92ANYo35/OCJsZNLYMS/mzoQ2
         xJqC8DCG3gvepFdk2lxVPDUZGuHXwci5biqppPoX3RVOpbeW/n7bWRsSrR8lIdWnN+0W
         Yacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2pM9FxyqpBfqOkWHZznQlsEGwgwUinMmoNOgEnKgLr4=;
        b=VvBa2sfoO9SUtOawb1slB4PDmDCfKn8cByPxfzZgbkQkX8UH4kmmsUNLQtb19uFXP8
         iELAsiPeT83sg8UK/rzMg/FPm7lzEOVHQXJWq+s26apkATP2a8hd6UjoyVk0m1I1jF1L
         Q5SkXrjWQewJcQ50ACNST8pDfZI8lgmuSBMaRLYY4ZnWQ9T4eu9GPQcdT2DR8Zh3ojAW
         FGXaVnHrzawlJbj+gSu5OqUbLZmoeN4Q91LO11Eucqvai9TrHsKiv4N0yGoGlhXD8nW4
         h0OgQ2Xl0bMzP1LIVuHO3PhK6OAmIphduqBdsxB0xoYENHAtRFU+Rb12qviaJ9eIpgV5
         cGMQ==
X-Gm-Message-State: ANoB5pkgsVCuqVNUm935r32ryRYEQEhH28ZDAqG4o6vPhZFYMCIdHPie
        18i/xvVA10S2zJJbfxg6ELrIOw==
X-Google-Smtp-Source: AA0mqf65UK1CaHGngQBgykBf32ZTP2POeVhbADAETUeoSjm5v+P3xFmEI/+7eSZUzMMygcDjB106IA==
X-Received: by 2002:a05:6512:3b23:b0:4b3:abaf:b7c1 with SMTP id f35-20020a0565123b2300b004b3abafb7c1mr3193346lfv.39.1669200039533;
        Wed, 23 Nov 2022 02:40:39 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g7-20020a056512118700b004b4cbc942a3sm1653992lfr.127.2022.11.23.02.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:40:39 -0800 (PST)
Message-ID: <ef1eec15-4875-9ba7-1152-97a9b81330d3@linaro.org>
Date:   Wed, 23 Nov 2022 11:40:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi:
 Document RZ/V2L support
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
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

On 22/11/2022 20:54, Biju Das wrote:
> Document RZ/V2L DSI bindings. RZ/V2L MIPI DSI is identical to one found on
> the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-mipi-dsi" will be used as a fallback.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

