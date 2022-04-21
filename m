Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9725099C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 09:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386108AbiDUHs4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 03:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386435AbiDUHsP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 03:48:15 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D3020F73
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:44:07 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id g18so8210523ejc.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wFOM3aTz+LbKb8gZOMS549nd6n0GmljjOzNeZ6+Ou1w=;
        b=ynkd2EDJs/zVMNdxjBj8nHfyCctK+pnpZavAb7r/eORAjJ3gr1daobIoECVEI/nv9Y
         tW5rBB5vk6+trcfRUGAbuavqwTiN2s5omn+NsVRJyYcxKLNzhKe5Hw0ZfhGcagQcNH3k
         nuiagjIChOJEkJq4SdpMw8VRKvPcOmxW+UZ6LjtXmT/CyuvHN5xqM3zXXqVkMVouxzKE
         TRJelcv5j9l5skWNXJhgE7bYectcTt1odNP7SoLe5abu3haL6s836memBK07VFTvqCFt
         v9p6yyoAGVNynA9l+aMTTDJWbPnVB5iKVvxAlVR0X+gHFut8dGdVUWzprUMg5AviU2sx
         cOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wFOM3aTz+LbKb8gZOMS549nd6n0GmljjOzNeZ6+Ou1w=;
        b=EutRkCFxfgQIm1ur2TEvL67NJtJpNmqZXljHY60GR3RKW9LG5Kxmc1n6IHgsmneq2E
         BiVA6euNTUqpAMJRu8CdMPAdG7rOE0UQyLtAvoNwYOWH3XMTdNRIwyfHSy3kyeRU7h7c
         x6dNB0wIyOUOy9/tKn7KVpbIkeo8VxkSDRnN+doDdFfhQlDLSmGnJRJsRS+/cyYFD2Jl
         /JEAYxiJu6KHozpkIycU4yfmd3vcZJDb13DcnaCvk96m8SHWEtZqWb9JeDPjlv8KooBu
         Gc+/awhyc8HAmsPFdnuW/Jdn5EUYgGvbLmY4pUFOgvpcV8H8rEbIbjjc9uQQbI5WRfSI
         KElQ==
X-Gm-Message-State: AOAM532sgS0Q/BPDukPEpdnWxkVhQfk5/Zq63rs/cdqkPiSy/4hQ1Hvv
        PdFOAHdRbNFbOttgnJQetHDAsg==
X-Google-Smtp-Source: ABdhPJzWkBkZe1WhiJd8P+EOyRLym8rU+7Ih/yKEoUvviZF+KrrG6fVJu09hs2cLspSwCIw389MaHw==
X-Received: by 2002:a17:906:3104:b0:6ce:6b85:ecc9 with SMTP id 4-20020a170906310400b006ce6b85ecc9mr21560466ejx.339.1650527046224;
        Thu, 21 Apr 2022 00:44:06 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ce21-20020a170906b25500b006e89869cbf9sm7538142ejb.105.2022.04.21.00.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 00:44:05 -0700 (PDT)
Message-ID: <ff0711f5-0e41-9aae-0b2f-381f272481bb@linaro.org>
Date:   Thu, 21 Apr 2022 09:44:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 05/15] dt-bindings: power: Add r8a779g0 SYSC power domain
 definitions
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-6-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220420084255.375700-6-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/04/2022 10:42, Yoshihiro Shimoda wrote:
> Add power domain indices for R-Car V4H (r8a779g0).

Are these values used by renesas,rcar-sysc (r8a779g0) - patch 4? If yes,
maybe just squash it?

In any case:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
