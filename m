Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0A157B6F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jul 2022 15:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbiGTNDd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jul 2022 09:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236626AbiGTNDb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 09:03:31 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1535A5246D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2022 06:03:30 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u14so13035484lju.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2022 06:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oS9S0ewjWGe4uqnnpaCel1o8MvWZNDvKgAm19k3XX+g=;
        b=H37uszrJW67c+UkJjrwbxG0D8SLe6gn5lw9zrWXJ13I4daTrldbqF7UQTd94IcNujL
         jrrzG7L2TI8KonkNoAJtsa+ks/6vUNZs5gxMkHaAb4kdARoeFNAUHp7ADWGVh/gCWt6T
         NqF875MtNhTZbPmvLjQrn7uIsOj3M1Nmf4x+pLOvvZvud8YaPvkVBny7lAlDfFNk70wD
         hOQYCFVm/tgeVEK9FBfpHC5KG/l1i+ZcjEScTfn640sp7h0v993GMFlz099yj/qfIeq9
         Z50W2SLnUCMENb/G0Crmvr4DWH5epLDhasogjJ/JdreCRBAx6Q1g9HRwCEaZyjXW/yPK
         VSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oS9S0ewjWGe4uqnnpaCel1o8MvWZNDvKgAm19k3XX+g=;
        b=qWq35AVXEbNFGX1kI3j0dcPIWLswPhfaKmQhAIf3nBfqtO7sQFam1ALemOeV3b44Ih
         J18TJr8egIly8tCCsKMFZ8dDoaYhj+Ubi5OzPFNn6gIswJay7o/nXik2ezVI76oIbchX
         Pplj8D/M5Y4dS97i9ydQVWU6mTtE6UUato8k95aBiqTf8oVOqtvwNIj6HrcRPawc8Lto
         vQYZ/HCXmNSyYePec21IPdO9AH/C9dbzd00nBLOMD0A0qwlmoA7jLBR7TcDfv1nmVL7T
         1z6CrCg0yk5oqKoec99KBjx3nrND2hOB52oUqJFnxhtvAjHW6UPzhA164Xf0fom7qhP5
         aMYg==
X-Gm-Message-State: AJIora/2ldIrHN0aG3TnVnlBQRgt9gLlhb74Xocr8HnY8LdYHMgO2SoG
        gzgZC1biIXbLxqECC8syj6RbqQ==
X-Google-Smtp-Source: AGRyM1sfY4f9ZydlfjO4OnX8I0kU/3y87JaLZvtwOWJV7KCaMZm6sYliFZmtqvGvRd7BemumOq7T/g==
X-Received: by 2002:a05:651c:102d:b0:25d:50bd:a976 with SMTP id w13-20020a05651c102d00b0025d50bda976mr17777334ljm.326.1658322208475;
        Wed, 20 Jul 2022 06:03:28 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id i10-20020a2ea22a000000b0025d9552fcafsm3224064ljm.97.2022.07.20.06.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 06:03:27 -0700 (PDT)
Message-ID: <d96f8f71-0207-4d28-5bb2-222a528e5b6a@linaro.org>
Date:   Wed, 20 Jul 2022 15:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] dt-bindings: arm: renesas: Document R-Car H3Ne-1.7G
 SoC and boards
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1656072871.git.geert+renesas@glider.be>
 <f816f58d1c3fbd0605589e7648a43d78a4e1e694.1656072871.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f816f58d1c3fbd0605589e7648a43d78a4e1e694.1656072871.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/07/2022 10:08, Geert Uytterhoeven wrote:
> Document the compatible values for the R-Car H3Ne-1.7G (R8A779MB)
> SoC.  This is a different grading of the R-Car H3-N (R8A77951) SoC.
> 
> All R-Car H3Ne-1.7G on-SoC devices are identical to the corresponding
> devices on the R-Car H3-N SoC, and thus just use the compatible values
> for the latter.  The root compatible property does gain an additional
> value, to sort out integration issues if they ever arise.
> 
> Document the use of this SoC on the Salvator-XS and ULCB (with and
> without Kingfisher) development boards.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
