Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC6B5A5F50
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 11:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbiH3JZF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 05:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbiH3JYf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 05:24:35 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3983CDAB94
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 02:24:33 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id p18so7359510ljc.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 02:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=jPE8s2Kt3dUsxcnIqtLj7/AZOCEV2Z6WNW6ajJLpgAk=;
        b=Ea6rLBEAw2NxruDIka8fGE0ig2WFE573LHTZwMNbX63EMy06VT9zSACpuZQokMOoBP
         jDaiidLide0Uz+D7NRniP/2fdNahaCqr0GSO69ejL7ZicbQM/cwL1luIOZGNCny+Hawq
         guS6ZROfPe1QtK20nVh5XSGVAl4tg7g9iWcomlksV/eCl0ryxddQBRllFL53C3ByxINO
         5L2AV3Gt3MO1J0nmqjKRbaFo/utkhKH95Yv82jsYpGhyY8aKWZ5Nrfc7b5O7gj4QLbSu
         SUbsBYufYqvLLszGhKvQe41Fv30JS/vmoLXXiHk/kHFRwhM4IeRHEBOOcdCbvHgsL4j7
         Qm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=jPE8s2Kt3dUsxcnIqtLj7/AZOCEV2Z6WNW6ajJLpgAk=;
        b=ARbf/JG49icmWANsqrNSdF2UFXjeLJExTCoBQStr2z4IBb57TWhABXNUmAt7Ib9Hum
         3OhejQ8EtVnjoqG7npW/H3TNoT8GHY8DbxoKOIbgXOS8+lRi1ya9rN9hB7uih9/WdjKo
         sUy+ljY+HkWJJVZuEBLGw4VbdRGzD8N1uWM8Oq53z7et2yMlYeMUMTGChqv/HfJZcLy+
         kTL+uxtWKpkKEL4Zb5dsyQyZlbVwUM4H9McLTOgah4uPFIsQ7s+Fe3aCrbxudsy/OtWR
         lJZwT6kmQaHlov6iTbUs0sLrtywDDUzlI1Nq2+2ey2ItrJP3bH51L0PlybX/fMW3+WiU
         MhGA==
X-Gm-Message-State: ACgBeo3LeGoXg5N9TZIBthFeetheRVPzA2oLBi4neo75/jX4sqhaGCXQ
        c69/DM1RS5xxBED/eBHtHD87yw==
X-Google-Smtp-Source: AA6agR4KboDwVazwy87bAPg6mq5EfwSkiL2QxqhaNDrjmTJ+8TMDq6WdhJBaVmHuHl6DRaqCuPexUw==
X-Received: by 2002:a2e:a793:0:b0:267:3fce:a2cf with SMTP id c19-20020a2ea793000000b002673fcea2cfmr779943ljf.263.1661851471549;
        Tue, 30 Aug 2022 02:24:31 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id z4-20020a056512370400b00492c463526dsm613439lfr.186.2022.08.30.02.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:24:30 -0700 (PDT)
Message-ID: <d511bdcb-49be-53ac-ac4b-1dc8b5955dc8@linaro.org>
Date:   Tue, 30 Aug 2022 12:24:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Fix
 'unevaluatedProperties' warnings
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220829214730.5752-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829214730.5752-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 30/08/2022 00:47, Lad Prabhakar wrote:
> With 'unevaluatedProperties' support implemented, there's a number of
> warnings when running dtbs_check:
> 
> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: i2c@10058000: Unevaluated properties are not allowed ('resets' was unexpected)
> 	From schema: Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> 
> The main problem is that bindings schema marks resets as a required
> property for RZ/G2L (and alike) SoC's but resets property is not part
> of schema. So to fix this just add a resets property with maxItems
> set to 1.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
