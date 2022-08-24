Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED0C59FA81
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 14:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbiHXMwK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 08:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237414AbiHXMwJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 08:52:09 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1646794EC1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 05:52:09 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z25so23878859lfr.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 05:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=qn9bLMzRw4TWagsZElRAxA7cKFvu2Mi/g+R4Ak/V31o=;
        b=ny8ePsgqdUMY2aOl5GLsn9h8H1FWPjRt+PjGl1/FzaqaQ9M1fECiwE0BAO0KoKAUqD
         HNDVxxt43whiV4mAcniuzN0VHo7iqMy8GGlYK2tTjUnMaC/qFVkTp4nOcN+CSa+nTcyn
         dz7y0jBYhXSiYgGUAMY4wAOg8A7no246xkYM8hN9UmeKW+GTiCdkrULiCAsuUIo25lHY
         le7f8DtwWmqY+BgRudkaXrE5z8Lr/My2e19M76+jzefjTeEsqYUu7JvRx0R9OnRWXsMt
         xocpy5usGfAonxeJl7sar9Ldl4NNbMztM2gZlBk3FE1c7qz/S2vsZqja0RnOySS1lOkD
         EuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qn9bLMzRw4TWagsZElRAxA7cKFvu2Mi/g+R4Ak/V31o=;
        b=qZOtuFbWNLGx62FddwmbNQmOcbXAaKuvk1WMywVQrGU5el43QBlIROr3gYGHCm+q3g
         GD1d9rvIWNRSvffhmNhl+7nY7CcFLGZ0C/cOq4ib+hLwFdV44KoRs9lwY8MAb1EHMvpz
         +Djs5MZJ4DWUkaOXiqsz04RswhHpRyn0z51xj4XQqNAONmIA2+U4SsBQqEl7Lbm1cuqv
         JKmH1uealsqYec27Zob9IqdWnC8a0ItbL2Lb1kWjKMFdjU1kjuJ+2iEjZHF1wkmvryU7
         Yb81dFX7zXi005JPk6s0Zo8p1b+V339WvNM3afKMwHWkKT1ywhV6C367rG2RF41eEwX5
         iw+g==
X-Gm-Message-State: ACgBeo1e5sV3cdbt0nYGXcq5KRfXr4wjXZytoAHN6GGg/wq3vlvP5ggL
        NW7gDlTvfitDTiwK/GG5+n7j8g==
X-Google-Smtp-Source: AA6agR7byK21kURSxHby1jwyhJHvEgjvPK+9OE+btQG1cQszbBV8p3p3jr1j4IFzhBHhpNLlelHrOQ==
X-Received: by 2002:a05:6512:401a:b0:492:b6b5:34d5 with SMTP id br26-20020a056512401a00b00492b6b534d5mr10121992lfb.570.1661345527495;
        Wed, 24 Aug 2022 05:52:07 -0700 (PDT)
Received: from [10.243.4.185] (213-212-21-103.static.ip-only.net. [213.212.21.103])
        by smtp.gmail.com with ESMTPSA id s20-20020a056512315400b00492e69be4d6sm1464494lfi.27.2022.08.24.05.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 05:52:07 -0700 (PDT)
Message-ID: <b2340a92-c083-bd83-aca1-fc2edccc825e@linaro.org>
Date:   Wed, 24 Aug 2022 15:52:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] spi: renesas,sh-msiof: R-Car V3U is R-Car Gen4
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220824094327.33685-1-wsa+renesas@sang-engineering.com>
 <20220824094327.33685-4-wsa+renesas@sang-engineering.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824094327.33685-4-wsa+renesas@sang-engineering.com>
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
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family. Hence move its compatible value to the R-Car Gen4 section.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml | 2 +-


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
