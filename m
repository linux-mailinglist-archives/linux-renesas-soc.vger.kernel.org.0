Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A78B362E3C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Nov 2022 19:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239986AbiKQSID (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 13:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239454AbiKQSID (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 13:08:03 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B106D48B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 10:08:01 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j4so4175094lfk.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 10:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABvTsAaVT8uEdnB1wnBUP0233+pp89h9PKGzrpb1Gbw=;
        b=AFMMqZv66bqrJYFluWXzBw2qjrraX1EIjlIoZPqAZCgh4SUhVcd7ivqS6P5k/fcGHM
         xD/AyeELz57hPpT3juyz2QK8p6MCB/n1ZILs3fC/4RAxaRxUZ/r7n2fBAV4Cf9vvbQjX
         sNI6OR9Srz4amp8Q4sp4QaozyOHCj84Y6EXlGWJLb9mRogNyjnCOeDSmJek9fsYyFEvh
         KuG28+f2CZe2f+puIPGq3cZ0q4F+GMZzWIY0lSZ2rdoQ5TOPIJxH7GBjjZgOqzKYAnSa
         zT0fauHWNnrtxMYKR2aUgWI9AE7CUPGfg9HqQ6XWQLs195iUgSE/L675oNWHEBrONrjN
         lLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABvTsAaVT8uEdnB1wnBUP0233+pp89h9PKGzrpb1Gbw=;
        b=tpGZUQKvSy6Wf0rzgf2zrmTQX5L9ECBUDRW9+pJWbz4ORJduD0kyFROksZDovlTuTl
         9BR0JQyF4gwUZ8wxBDTMZ1YWEz02LFmb8OMC697+T9hUk94iDzMAvo2wyOoFZYG13cdm
         5jGjDZugwSKCyiDJf2JbVcMKTW22RNsDqdlPrssp/ogpLLKtPe2fjnXLK6znw1RuHhNA
         FvEhmIvS6jsg33ESRg6E5c8nmMN/XjDXD2p0okP9aFsnJmfJrMGgHRbsjRXNA8Vgo6Wl
         TGOm8YRTK1OYyoFSRSPOXsOGTZfuCqOzYdat49oDE3yWeGahb0N44EEsAdaf4RUMkS8l
         H6dA==
X-Gm-Message-State: ANoB5pk3/A1s8qIW741DE6KI5oOQatnYQ2D1xWEL6STqWD9UeWWBhHbK
        wiz802mCg2dHfwYXo28dDX0MwA==
X-Google-Smtp-Source: AA0mqf6JCWdyhVYcx1o2AIifLbE4I5mtYp/W5qyGJV7q9ik8WmJ6EvWzInclK0E2rdzF+YWlaIPRNg==
X-Received: by 2002:a05:6512:a83:b0:4aa:f944:f7ec with SMTP id m3-20020a0565120a8300b004aaf944f7ecmr1234490lfu.467.1668708479905;
        Thu, 17 Nov 2022 10:07:59 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i29-20020a196d1d000000b004a459799bc3sm254028lfc.283.2022.11.17.10.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 10:07:59 -0800 (PST)
Message-ID: <6f6386d0-4489-9e6e-355c-beb223c96684@linaro.org>
Date:   Thu, 17 Nov 2022 19:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/8] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Add r8a779g0
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-3-tomi.valkeinen@ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117122547.809644-3-tomi.valkeinen@ideasonboard.com>
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

On 17/11/2022 13:25, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Extend the Renesas DSI display bindings to support the r8a779g0 V4H.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

