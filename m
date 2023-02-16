Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A95E6991CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Feb 2023 11:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjBPKjf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Feb 2023 05:39:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbjBPKjc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 05:39:32 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFA355282
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Feb 2023 02:39:06 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id gs13so1492414ejc.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Feb 2023 02:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sLrFLNHeU+0lLuzFD8IVs3u+DZSPRSwwfeLZdEjgDYM=;
        b=hn+vFzEL3ILDwPxJqj6OUOa9CnpR84xsN2Hr6TESe15oV73q3F3WW1o3f4JnPjRsni
         7LRG806AS5WO5/8YYqZzUTU51Dz2nKYeClgphuDAHOSKX5SqbHJ/bauW3dt9fUvykleU
         bts0uLzBeCDqAoaHXovdRxr1Me8hV3XTEqFWqPCa5w/u/egkC/xG+t5HrdGl9jUkit2r
         +gbXsnEMTS+Gmf7L6vpgpLJwxA8X9nIThTpBr+KYTXZWj6MsPIIPnE7vxDPfKEzqCCCU
         UQO365K6JJRkdxCSbnCDFq6/+U5NVLwp4w+y8o2+AHXFecOK0sdyI8TlTivmY2ZY/9c/
         39cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLrFLNHeU+0lLuzFD8IVs3u+DZSPRSwwfeLZdEjgDYM=;
        b=J4oBCBXoyd0X4OC4IBYRveeuuCWvKBEqwANSRnF9UIhOgomGXhQbfKkKht+CMVBvWv
         EBMk/XMY+CtRYgylWZvIR0JvSTn5s4qkZYBdTVgd9oYnruBsvMv+Kjkasr5HY6zZHTze
         gyC8a797GDu74ldLRQpKFDCfRorfcSDlmlpE6+eYpOLUQ3TPY5NXr+Q+AzVcwbJoJl8x
         MG1HKFrMhphTrVaogJNzA90kfG04UA2lISUEYXTiZd4koDezaPt3IIpg4Bk90qXzNGrP
         KECyCPBdXQkk6r6FrnOonyx+NNqPJtL+ZB1agTqctRR640ws97Bu7MgCDJhm0fn8vCK9
         7F5Q==
X-Gm-Message-State: AO0yUKWgTt3XAbit0TS/4WPILTfGmsokFyHfV6sSSlFmoMkitx77puyl
        YWKHrTABjgslg8E2qAwSLkKOjQ==
X-Google-Smtp-Source: AK7set9/CqKyWkEqPDvPc2d1jdxozbn09liDcmYzlQaGwfPl7/6w6LJzSsv7ImeZK73flh1q13DHTQ==
X-Received: by 2002:a17:906:d114:b0:88b:4962:b72f with SMTP id b20-20020a170906d11400b0088b4962b72fmr5900381ejz.20.1676543937987;
        Thu, 16 Feb 2023 02:38:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id kk15-20020a170907766f00b0087329ff591esm637089ejc.132.2023.02.16.02.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:38:52 -0800 (PST)
Message-ID: <028e8b51-621e-e0af-f781-b7395802601b@linaro.org>
Date:   Thu, 16 Feb 2023 11:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA
 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14/02/2023 15:26, Geert Uytterhoeven wrote:
> SPI EEPROMs typically support both SPI Mode 0 (CPOL=CPHA=0) and Mode 3
> (CPOL=CPHA=1).  However, using the latter is currently flagged as an
> error by "make dtbs_check", e.g.:
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

