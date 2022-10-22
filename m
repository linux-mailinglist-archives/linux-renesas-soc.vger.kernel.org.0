Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C19608E94
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Oct 2022 18:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiJVQf5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 22 Oct 2022 12:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiJVQfs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 22 Oct 2022 12:35:48 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A64170DDD
        for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Oct 2022 09:35:44 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u15so6618352oie.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Oct 2022 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wTwC4Ee6yw0NAAZ3SkjkNV3Oq2jYBO7PuK3CzZZRGg=;
        b=HBvmicl1Fwkf7MAHF6WZTpDH21RnSjby85piUzyf1FMvYVRuNRNsMXaPW0Q75DjlGr
         IM93T0ucFwz1Y3iEYTgTbNraq5+JVZItTmOBBGpPJTxLrSHqwRsf5e9uNMxMeiP1r2Dp
         VrRGZTQ0pBEKBujkHQhsXE823QFI/+t1tnRMW+B6Lgvxd3EOZwjW88xmGreLn/DiVBvY
         tikviqf4KA4MNmvHi24AKn0qnqHU0PPPCAag5ZeqOM2w5z53xLMJqw63o2PvMENvjwv/
         jNOfDSJ99fCTwHzoMzitJDMzFyjgHsgLe8FDKzIQbf7DgeJQzmxbiXvtQviX2sfkkcgC
         zdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1wTwC4Ee6yw0NAAZ3SkjkNV3Oq2jYBO7PuK3CzZZRGg=;
        b=6rBMy03REjqDyMaNHEYiNyz71vWR4IiIZ0J7Z3pjmgTqc2cTl2O746mN6gHVAuGqUx
         miB+EP5clGvM4YPl1P4rz+Ziq/0hmzdUEeXyx6Zh21l+5JUEi21/mM3YP9JfCKeMPGMc
         VXqcXRD0o1SDDYE79FE3UGbnZcf5kgQzMQU8biPj8Y8PGyh3SMPgv1ntznJiurPDG3rA
         7HwSSMFbbyY6PyFeSZ9gIwwi3F7k2Ox9KP1cCDRuo/Wd8rd+7ICET6U74lb26EYKKcb6
         Ek032oCTh7sOzIZmfex/ela4zTYKdbLl41u3kSxwiMTXur/jH8u+Rf/6mzvO9tFMI/jh
         V2hA==
X-Gm-Message-State: ACrzQf3y3SkRrtuGCUuNNyUMXeCqheYQzbW3DYKveE6qTP3bAQ2kQ+iQ
        onCbwm19Fgpr+/OnBizxyVirOg==
X-Google-Smtp-Source: AMsMyM4o1osNu1n8drC4opFnWuBRqFxagfUvCY9kQrp6vhkVG0J46HyKHZ9MgpJvekJSSjd9/ktGog==
X-Received: by 2002:a05:6808:1717:b0:334:9342:63f1 with SMTP id bc23-20020a056808171700b00334934263f1mr29244965oib.77.1666456543234;
        Sat, 22 Oct 2022 09:35:43 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id c6-20020a056830314600b0066195c63f01sm2465033ots.12.2022.10.22.09.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 09:35:42 -0700 (PDT)
Message-ID: <d0a212ad-1f01-a824-594c-78c5424d5648@linaro.org>
Date:   Sat, 22 Oct 2022 12:35:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] dt-bindings: serial: renesas,scif: Document r8a779g0
 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <8a2d04651f04a97d652395b4d933af5c3c8d5b5b.1666360789.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8a2d04651f04a97d652395b4d933af5c3c8d5b5b.1666360789.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 21/10/2022 10:02, Geert Uytterhoeven wrote:
> Document support for the Serial Communication Interface with FIFO (SCIF)
> in the Renesas R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

