Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D83A1518394
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 13:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234960AbiECL7F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 07:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233357AbiECL6s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:58:48 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D43E59
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 04:55:16 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g23so19539784edy.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 May 2022 04:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RsWMvsmankAz2Ahn+DbAt4arL9+JR16NBdL+LU7v7k4=;
        b=F4gqa1jl9VMtIxOu/N8N4nicXtRwCs6f75qUbI25ZEX1LQwddiBmzMx+7h13eSavNV
         RlvIFLO37LLuOYC/izH7/1+oGwoOX4d16ECCAQKE2R7l0RrdOqjvTEd5FtvtirvyNNhd
         ZTSt1jvIeXdqN9BVGRyxVUqVRst7KlYBpCS8K58qHjPQjQAmw8ovlx+0Fr1bH1YBx1r2
         cY6rkgkecGT30V2HhOPDAuldwP6KEPeO0CqsN1DK1+Ne90SXBiWjfg0y/nz2912y/0W9
         QJLkAPgo9d1iKnWxwQ1RhLGN0v9iVlBA/0bPLj7mD7otAGhgD/iUWd/F2749u/VrzCHl
         kG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RsWMvsmankAz2Ahn+DbAt4arL9+JR16NBdL+LU7v7k4=;
        b=4G/HCtoXuGXZa7c2FA0CpY2xi82MLkJj2Aadxb/iErS1qOx2bUrLbW8QWiTTlFGzik
         6T8FTAGDtY3QFuOdumznzWy7IXIrh02Ci4xK4ygRDGJAUCPWjorui1PD3pTBxWDcHjAX
         Rr2OeC642XJ5gJEi+VzebjAD8qbK3S+dev/K9e5/ggiu7CkJv8vj+xpOX0Bn945RRfBe
         kr3mYdOUCt08H5Pp1h44IciRPF83GYeSSaMyzDFhnZ+6cgqqg0t5LDrXAv0n9bNP4Kav
         iQqWQ4+P8ddhpHqRDUmTfkaKMx3kN5x9yw/3T4FbivdIC4Rzzj8mqGE5k7jIWPZR93vr
         8ZUg==
X-Gm-Message-State: AOAM533p0YsEWCp+GwMyC/4zEtIBZwS90aaasdnj3zYhIRCS6HSMjP4P
        dr/tuoP2J9Y8TJPKx70f3+XyFQ==
X-Google-Smtp-Source: ABdhPJxJq5CzTBBvynaEapc4P34xLA6Af3QsCG3tcr+V93mC799rePumnjXKXMJK1UuoxUH0lofBaA==
X-Received: by 2002:a05:6402:3695:b0:427:b16e:e1b4 with SMTP id ej21-20020a056402369500b00427b16ee1b4mr14505835edb.117.1651578915095;
        Tue, 03 May 2022 04:55:15 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id em22-20020a170907289600b006f3ef214e5fsm4514278ejc.197.2022.05.03.04.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 04:55:13 -0700 (PDT)
Message-ID: <55d287f7-3c68-19af-c99c-0feca1d8e8e6@linaro.org>
Date:   Tue, 3 May 2022 13:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] dt-bindings: soc: renesas: Move renesas,rzg2l-sysc
 from arm to soc
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <5f124fc332b4b866f5238ada7ac000f4639c88c3.1651495078.git.geert+renesas@glider.be>
 <a47015888f99476a5206a556dce93503494d9a73.1651495078.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a47015888f99476a5206a556dce93503494d9a73.1651495078.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/05/2022 14:40, Geert Uytterhoeven wrote:
> The Renesas RZ/{G2L,V2L} System Controller (SYSC) DT binding is not
> really a power-related DT binding, hence it does not belong under
> Documentation/devicetree/bindings/power/.
> Move it to Documentation/devicetree/bindings/soc/renesas/.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
