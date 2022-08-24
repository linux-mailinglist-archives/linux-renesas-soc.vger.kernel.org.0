Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1F659FA77
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 14:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237388AbiHXMwA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 08:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237253AbiHXMv7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 08:51:59 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A980F82D39
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 05:51:57 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id l1so23323152lfk.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=0TuW2xQ2dHEAX2VuSflBzrY44GKwjJbFHupy3IUl/18=;
        b=Eb27nBagWPJfWxAw0LkLVRMjTsYgGR+bfjcemf9c0v6wo86pWGNYzPOWKLW1SdzgGi
         0igufXAj/2mnAF2/AaGyx/PE/RDNAxUNosf49tdNFKpkPc2zt/oDcEHGxjD2Nt8hC31p
         jgSTKdtuoh0HgeOByVHOw55bIvu5X1DkIfVGagh5R/tpMBvNI5v1qLWkp70/t3zcHjqQ
         Lu5/H+Q2UkvjZ3Mc515s3mzzPmx5/gdVh/vS2goMSzHSX07+bD7KONwK46lwbL84FV62
         ThFX8jDrPMbh2cotTTXYwTeV+uune/kLz+N/ZoQHUpCuHtBNE+j76Dgbr1+OWkEbUO3w
         wAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=0TuW2xQ2dHEAX2VuSflBzrY44GKwjJbFHupy3IUl/18=;
        b=2EQYAY3r2f+XtDAPzB7EanS8cLeJGqUAn6de0dtneWYzBUo56sEYXqqg1GmQc1lCaK
         x6we8OUXUnitLlNFkQOLcbJBtUJ3tyX1ezbUlOhHim599WE5nRIjf8IiNiV2RHi+A3Ck
         kFipqr3VXE9unyoEpJI1YNr7Rh3vS4z9h0/2mUnwcpfuB8KG0+STizq/36f6wmtLY0yO
         X8qonIThykMnQ5YbRyYtLl2Fa898jrymGGK2knIZUlBjfbux2zD3RKIOy5M2OxBlKUgu
         hGJE7DwJ3mblgZbB3G3fRDzwiblS4QLAJCYccX5tPtaD0wmTkRnihbyL4j+ChDB1aRow
         Lt9g==
X-Gm-Message-State: ACgBeo01UEdGDWzWROd6E/QHTW8DPe4NwvrYEaZVJQu9+Bqrpk2vz2Qv
        VJ8QoXGtoaJ9X8sr/woF90i6rg==
X-Google-Smtp-Source: AA6agR4yZjpivxeswgNyIq6jPQbfQ6fnoDvUWR7N5sObanybYz2aTAebJigHEIIOB+PzliOaoHwZLg==
X-Received: by 2002:a19:4918:0:b0:48c:e6a0:c8d8 with SMTP id w24-20020a194918000000b0048ce6a0c8d8mr10274409lfa.679.1661345516094;
        Wed, 24 Aug 2022 05:51:56 -0700 (PDT)
Received: from [10.243.4.185] (213-212-21-103.static.ip-only.net. [213.212.21.103])
        by smtp.gmail.com with ESMTPSA id i21-20020a196d15000000b0048b08e25979sm2997261lfc.199.2022.08.24.05.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 05:51:55 -0700 (PDT)
Message-ID: <747d4b9a-b521-4b73-d887-ca2411e243b4@linaro.org>
Date:   Wed, 24 Aug 2022 15:51:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] spi: renesas,sh-msiof: Add generic Gen4 and r8a779f0
 support
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220824094327.33685-1-wsa+renesas@sang-engineering.com>
 <20220824094327.33685-2-wsa+renesas@sang-engineering.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824094327.33685-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24/08/2022 12:43, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml | 5 +++++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
