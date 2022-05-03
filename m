Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3DE5184E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 15:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbiECNG2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 09:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234683AbiECNG1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 09:06:27 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC3722B12
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 06:02:52 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id gh6so33388623ejb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 May 2022 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qbnGzeiR9n+jtdORIFMoIldw5poAE5Ic2SlWDsgrYLI=;
        b=D6ODiYiIAOq4680jRE0r6sz7NBgVaflE38879YIgVcTq+BgzTIur3abMKZRHdw4Pc0
         AHy3ffkeh2yYA6wAyommfVjIplN9+s1tgWJ5yCVxBB/ANFRBIToGgh0enXTPLE/lCKFH
         DRt23I3yJRpZatTL62UWKmBJ6izyAV6D6qDwQtlhanCwo8qXs6S3pj5nZvl+aCDQf41x
         RHFiQsHUog0on2w5ATGEsU9tIUqDSTg0vfpVyr7csPbAASD116vtblzcOOhgYevR7xBf
         yllAmtumhEcMX/P4+BGW/zxR4S8aDzH9CXu9BVobIghNMvhEa8hfva1Bf9bMDhCZQ0ib
         3ZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qbnGzeiR9n+jtdORIFMoIldw5poAE5Ic2SlWDsgrYLI=;
        b=0iUZQTsiefeCaXJdZ9ljT5LlL2SWS4WyQQIbOvLqhrrwVxG1h/J4UgH/+MSynDwMnY
         J8N42kyCcSgYJlNfSEsNJaqeULliZD6pxZxYADAM+4UYRalr8+u6GFMlYKFSow9VE+v/
         91v9fxdnCcaGKcFjYKaLWBKx/TfP1llZ8PwVlaD12BcemsZcX3wgGCHmrplNVeDRTor8
         hwwT8N3pUbanf4gxM+7t68y41X5FIDykiE5kG/gMUclIHPvSegQp9OjS5bHxjsYwZCZR
         FNOi6hK5pO5Av6z47n260RgbK6PePrNMDMsooWsydRKX5yp2U3z40+CLIbA1iMsjvzV/
         fDeg==
X-Gm-Message-State: AOAM532tb+W5/o+E3FcZUYdhC7V3iMK6Ow5MYaY7HXInANfmiwJvlET8
        UWNgZdPq1+qiaNinNZXdKmV/NA==
X-Google-Smtp-Source: ABdhPJzx5OTqy0DzCPuoSuaGWR/+9NH7Kk5UphcTdkN6WB1lmvnQYczzFaoz4B92b11pSHYTnAvakg==
X-Received: by 2002:a17:907:161f:b0:6f4:378a:c2d8 with SMTP id hb31-20020a170907161f00b006f4378ac2d8mr11365067ejc.289.1651582971502;
        Tue, 03 May 2022 06:02:51 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id qs24-20020a170906459800b006f3ef214e19sm4598147ejc.127.2022.05.03.06.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 06:02:51 -0700 (PDT)
Message-ID: <8d375385-3114-d372-4aa1-a5da9b740d53@linaro.org>
Date:   Tue, 3 May 2022 15:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/7] dt-bindings: serial: renesas,scif: R-Car V3U is R-Car
 Gen4
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1651497024.git.geert+renesas@glider.be>
 <c57ed00e85778380776330be6183c6861d843c22.1651497024.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c57ed00e85778380776330be6183c6861d843c22.1651497024.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/05/2022 15:34, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
