Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367F46BE474
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 09:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjCQI4F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 04:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbjCQIz4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 04:55:56 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB36B6904E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Mar 2023 01:55:38 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id o12so17518567edb.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Mar 2023 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679043337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gxSX5L1OmpXcthvfw5MjweyMCmUxCbeZZbdbWsawBJo=;
        b=p0Utw7dcfsntbaYjKuVKxmYZs3+AC1QfMw5BYSbjjjouaZFQspDdIKPeIoTm8fioZ5
         FJNjSowwffLVKHWnGjJzqgh61X90caxvTMXc3zwcoA4DtyTLaPhx/tRqb21BkVRM4PyZ
         ZB6H7vK0DvtpuI31/rUfeiUj6pLETPLZPmaYW+YUTul8WwqQBk26xMMGkHMZAasuNlRF
         BA7bD53oFpVrsB8G/2UMbA9N4uzWmQk12Ppbrh7Y3NjxjBTO0zpQQJT62YV99SOvf1n/
         fq5JVkhQ2G2bHPphW6hxWm0lNzPe/YSCE7WHQHJo3fyGFHCJghJbbgk6aoG7aJUu0Sxm
         tygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxSX5L1OmpXcthvfw5MjweyMCmUxCbeZZbdbWsawBJo=;
        b=skL5wxDTKZwOiE5ISaiaL+UXeBjIsZajmGfjfUmf2BDaOSxhY7MQAaL16IGOOylVBJ
         N7A2ZEgR/SD53F1zwUKkPZxMlVomJaRHYdZnbqpWxjLnL/p3vuZQM+H280akwnNmC2fq
         3wGIAgIrYZv7sKTE7RS0U+cgCHfEJ7msWSbhN2RCtvcRbiHCmt1I5WZjtm5zNR/UkT3i
         uGvGROkCg7ixm7wXnR/7HgRGWFDOXhWrtbiSFifz03/fLoe/vJFrhugopV3kkiUS5b4n
         bjqSnByTGXFB2rFBZY+5M5SLZTtA1z5235+bYWee3VIOLmvckNnY46S39dUemtG4Nh3O
         HU9g==
X-Gm-Message-State: AO0yUKXfUozY7sh7P4RboqOyGZvo7pRahvUYrMSjQxMQ+aMKm/Y3JAfL
        ZsK0MEHIx12P740p20ZT36Ouxg==
X-Google-Smtp-Source: AK7set/JcZYMegW4uUuY2gSACs5BA94ZRDAXXR6jpkDT8Iq97dpw13jDjyDiTrYpyN/imNVXwbwQPA==
X-Received: by 2002:a17:906:4d53:b0:926:e917:133c with SMTP id b19-20020a1709064d5300b00926e917133cmr13567040ejv.47.1679043337365;
        Fri, 17 Mar 2023 01:55:37 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id gz14-20020a170906f2ce00b00923221f4062sm714787ejb.112.2023.03.17.01.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:55:36 -0700 (PDT)
Message-ID: <5d712ab6-915f-75c2-45e6-dbe57ebf5fc6@linaro.org>
Date:   Fri, 17 Mar 2023 10:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA
 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
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
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Miquel,

Would you please take this through mtd/fixes?

On 14.02.2023 16:26, Geert Uytterhoeven wrote:
> SPI EEPROMs typically support both SPI Mode 0 (CPOL=CPHA=0) and Mode 3
> (CPOL=CPHA=1).  However, using the latter is currently flagged as an
> error by "make dtbs_check", e.g.:
> 
>     arch/arm/boot/dts/r8a7791-koelsch.dtb: flash@0: Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
> 	    From schema: Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> 
> Fix this by documenting support for CPOL=CPHA=1.
>

Would be good if you can amend the commit message to Cc stable:
Cc: <stable@vger.kernel.org>

> Fixes: 233363aba72ac638 ("spi/panel: dt-bindings: drop CPHA and CPOL from common properties")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Cheers,
ta
