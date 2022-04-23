Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F358050CD18
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Apr 2022 20:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbiDWTBR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 23 Apr 2022 15:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236817AbiDWTBP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Apr 2022 15:01:15 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AABBB1C65F8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Apr 2022 11:58:17 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id m20so1526047ejj.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Apr 2022 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Iv9M4OkgtaRvCoiJAy8qzTnQXxQuFrI58JdJzyBH2yE=;
        b=EbWgnmv/cmUpjOe6imKJeQAc6QCEoIkIRTzxe/lO2PQZfTHet1FwlBblZTjEv2+Gac
         iqoIDlbxRS2vMEOKGYdOXU9Ts9TU9peEMj4w0W2ClFbCZtcFwNOc9eWEgF90o4SThHhU
         TQwTPaKTD0HW/BUndVc97qvcMh0IJ0aQCwEz5xcgm0PrQlArWSOtGlw50jy5ybX48EFj
         P82STRYG+upyaP7Y1dQ2l2GRaIfJtrXz1BVBKnii9LtP3jzyYvXS1FZXu17iXWb33YVx
         WFaWMmsnBcrWrVjD4QjRBQ6jkVX0M258JjehgTJEo+sI9f4Gl/f1c3zOZ+m96Cw9fV1j
         Hc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Iv9M4OkgtaRvCoiJAy8qzTnQXxQuFrI58JdJzyBH2yE=;
        b=NZi71MICG2OdhIBPl/AwT0p3HVCmsvXZMhBnmhzH84eDvR7of/9KOUyUap7RYSYCtZ
         vDqLWW2Rlp5xJQ42VaxcLD8JuBtl50AhFJSvcrAws+5OK0DUcHxkqgQJiEpfiFkuevRj
         UFnW7sW7+Moe7+xPasyE1Cz41x2QlMIaa70xe+kYJP9DkEmuowcAy4/qvTEcjMCXE0MV
         rXCU9M2L1F6/fLQxpsO/NB3cPd9yBeR4xcLGqxwKz6a5XeNy59bnpUzxzsGscocXSXOJ
         R0r9WtuKGxlgIA2OvW8LT2ZNgiVCTWTGXh8V/OH+R3BX3sb6rle8MgEWWJh6+VJlvwCV
         N8mg==
X-Gm-Message-State: AOAM531poQLqQ4/ac2aKaIHg6tsAlCzR5s9zcAh3+v3lLapRJREXupkR
        74qq246HOeBuo7YKWMGC4XuBTA==
X-Google-Smtp-Source: ABdhPJxHzEcfSa378ZqltzxferYBiM134gmVCHZYwZylv2DWpH7hlgv1Lty1aRMnN2dg7bCwN4Bc9A==
X-Received: by 2002:a17:907:961b:b0:6ef:fd58:8629 with SMTP id gb27-20020a170907961b00b006effd588629mr9240358ejc.589.1650740296313;
        Sat, 23 Apr 2022 11:58:16 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r15-20020a170906350f00b006e9c9cdb4f9sm1911965eja.202.2022.04.23.11.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 11:58:15 -0700 (PDT)
Message-ID: <e0a77899-8ffe-6cdf-bca3-846b00bed4f5@linaro.org>
Date:   Sat, 23 Apr 2022 20:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23/04/2022 15:31, Biju Das wrote:
> Document RZ/G2U2L SSI bindings. RZ/G2UL SSI is identical to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rz-ssi" will be used as a fallback.
> 
> While at it add a '.' at the end of dmas description for the first cell.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
