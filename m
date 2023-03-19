Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC2126C0157
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Mar 2023 13:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjCSMGK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 19 Mar 2023 08:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbjCSMGJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Mar 2023 08:06:09 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239B210277
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Mar 2023 05:06:06 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id eg48so36654546edb.13
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Mar 2023 05:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=pVE7uoVyhC7NdVaNDMAae95yljmhHJ/vy720gGm9Wcwipv7UjfXSfsHinpMhTLeopx
         cr5RClkReTYivfC2IY5U5wY572ezvC1yCkHd7LIEj1HuYvbps2jMciS1PvOubx3Phpzv
         lfp5ymplUDgbfL2kaHoUaSBUbvueNoyQOpkFwxacSddt2OvHyx9V1IRGsXLNxNuNI8tR
         pzgJjPJtO1SL+S6dW0blVTikGk2hVBMbyclcg2gesIeegLGn9Mb8DIqUUNj6OWGRux4X
         VlPpEjmVgeM8W8fsbY1qaNuRHoxHO642hfuMBJ5aK+5ziENTS4/JD82wADP8gHrLT7H4
         rITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=4iEv4gfE3hx9go5ApY3SWnjVMGMdOPMBzlwbanKu5lPSQ1IC2l8NComIaOIMEqzci7
         nn4k6VbdN2gxYFcq18LOuN5M2yoMxSPEGDgjO+sjqhKQ0+90RHllUX/e0djRnHsnC+rh
         DmuBUONG/CuUg8n6XwamR870jgKNIbAL+OjIKKCu9IM6R+B+wSFAFXO5hYn/JaNWpyLU
         bGsrQ1wxTL58OvHt708LrDnJd4lkHe57oi3veexsRX2Kyka66nXEBVYPslA6DJ3ri6ff
         0owafjy2X56A8eaUdbesCsCEl6o3La4nEsgLpCxTk8npqUShYeP5OXkEmezDTdfy7DFm
         yJkQ==
X-Gm-Message-State: AO0yUKWhjtfBCAbwXK6AxtXB/RK2wSe8Re/vU6AWy63CgxlX6X1km3ic
        VItMt50TVr4gw0NPovXbdlCjZw==
X-Google-Smtp-Source: AK7set+IUACGutO71vcC7FVNze5yyNjfDWDHleE0EpSa6MxZnLDTstSEjlod2kahf5dchF8sAdB/PA==
X-Received: by 2002:a17:906:6886:b0:924:d90a:6f97 with SMTP id n6-20020a170906688600b00924d90a6f97mr5311713ejr.13.1679227564671;
        Sun, 19 Mar 2023 05:06:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id h5-20020a50c385000000b004f9e6495f94sm3473945edf.50.2023.03.19.05.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:06:04 -0700 (PDT)
Message-ID: <6d4dba0d-14eb-d9a4-0d16-b0c141b0c733@linaro.org>
Date:   Sun, 19 Mar 2023 13:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: display: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230317233626.3968358-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233626.3968358-1-robh@kernel.org>
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

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

