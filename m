Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99AB2745D1D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jul 2023 15:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbjGCNZo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jul 2023 09:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbjGCNZk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jul 2023 09:25:40 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1AA2E6C
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jul 2023 06:25:34 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso54193215e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jul 2023 06:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688390733; x=1690982733;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IOndpcYQZRei86HjTSa6sLCOIMedJ10F8ZmbDKThl2M=;
        b=vd7G70PqJmphoqcC5/iGI9byEgifXwK6Rj3mJrKjAIB8uLw1hpzkudZj36bLUzAfkk
         CjzNWks5k2enqZ83uiheJk1bPKP4uBNGIYPZq9fUuff3p2KtuZ3rqJncJyFJqF58Wk11
         z3wyE/Lpomy7vrHjrlZWBHS1lrFctL5sXDGQirjHnrOynrP0Lsyxy/RUFfpaiizpZ15D
         m2niLhmeobmjKoqyeci4H11VdTtxm8S2YpJ4x7pVGDNNw+N9JpOT8TaCH2LRBE6AMkMV
         2n86A3zQAeyy55sfLbSPXNIM5/Y7R6C5jvxqBMMqtnupqZrKysuVl4uSym0zdS0BCsLV
         ydtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688390733; x=1690982733;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOndpcYQZRei86HjTSa6sLCOIMedJ10F8ZmbDKThl2M=;
        b=NsdWNfIYNn58fTUSJztmCopOt8uiusEzuF5QsgnzsBxVhhmhyeNjZqNKa3LrGPv64P
         P2iFo7aHhQy/3wfEBeige5GxbaMl92y5oQ2h9ZZkXrHYriDfvrNG4eVT0kdm1/yeKjrW
         7KiCb5qeVyRuuJ2spY0BU1pcJs7T1iGypuWOnRGLtZ/mHWH21oHosxhyyonbQeM0Vv2B
         PI316u7ZRa1KAWhwLDUSJNuByoazC8hmFq4nOgr+anVZkAXK4Xav7xeY8PHrfYnIVzHp
         75bXsyQmNJA8269lgKB/cDLv0MuGWIbcSf0G5YKqFuM1XzFqXKV2FjshnXB+NyOvCaVL
         hmlQ==
X-Gm-Message-State: ABy/qLZ8FpvJf6kqEzyNs2Oj27C3ThXjzdK1s1wolIy+Gg3p7Qr5R4Cr
        Xehz4V0HVASzTJT/yRgkvj4LwQ==
X-Google-Smtp-Source: APBJJlFRFQcvat3EQxFgB5SI6iSmXIGa31iU1VkZvt3I+z99Hnaof/6yj4+br2u7++97LUjZHWQZuw==
X-Received: by 2002:a1c:790e:0:b0:3fb:db66:8332 with SMTP id l14-20020a1c790e000000b003fbdb668332mr1599049wme.40.1688390733118;
        Mon, 03 Jul 2023 06:25:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf0b:9dd4:190:b74f? ([2a01:e0a:982:cbb0:cf0b:9dd4:190:b74f])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c205300b003fbc2c0addbsm10279849wmg.42.2023.07.03.06.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 06:25:32 -0700 (PDT)
Message-ID: <1ed2eca7-b5bf-8d25-d38e-15022a8c8a39@linaro.org>
Date:   Mon, 3 Jul 2023 15:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/07/2023 20:23, Krzysztof Kozlowski wrote:
> The DTS code coding style expects spaces around '=' sign.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rob,
> 
> Maybe this could go via your tree? Rebased on your for-next:
> v6.4-rc2-45-gf0ac35049606
> ---
>   .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
>   .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
>   .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-
>   .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
>   .../display/rockchip/rockchip-vop.yaml         |  4 ++--
>   .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
>   .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
>   .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
>   .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
>   .../bindings/net/mediatek-dwmac.yaml           |  2 +-
>   .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
>   .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-
>   .../remoteproc/amlogic,meson-mx-ao-arc.yaml    |  2 +-

For amlogic ones:

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>


>   .../devicetree/bindings/usb/mediatek,mtu3.yaml |  2 +-
>   .../devicetree/bindings/usb/ti,am62-usb.yaml   |  2 +-
>   15 files changed, 30 insertions(+), 30 deletions(-)
> 

<snip>

