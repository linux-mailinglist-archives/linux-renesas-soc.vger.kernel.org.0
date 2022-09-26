Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2BD75EAC9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 18:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiIZQdr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 12:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiIZQda (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 12:33:30 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F841198FF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 08:21:53 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a14so7826778ljj.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 08:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=rVeM/2z2RL7wShJp3R+AGD2+tohyP4EZGs6J3R3DeLw=;
        b=Y4CaRVDxS8Y3JvTSmgkn8fJ/38atNIuEOaa8KUbLHQLKo0H4O8yL5pwp4n0vvNGAr5
         D0oZvX8o4dkGAgFUbQX7tJoY4c7Siwtk1eTBlaxrN2K7um9JpHKr18FwECQal7HSvCOE
         iz7PTEH0s1Khu18OkQPj8FQSkwtLf5AYaPU6aTMWgY1cCpcsKGf6AK+2mB38X5BCtva5
         JTPG/bmgzpyZvmJnSIbdVZ1Bq5UsWxbYKqmeTL9Lyna9Fmxt/vlGjjYmSIH35yR/XJbP
         6kGcNnjn01ku95H5z642Hm2BctzKIAhBXU/Krx3u7OYYzZ2pamoaHrQox2bCm6s2l1u0
         2Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rVeM/2z2RL7wShJp3R+AGD2+tohyP4EZGs6J3R3DeLw=;
        b=ofpyOKoei3gLYECtuylA6vH6p0+H54AcObBFAIO8oaLc9Wtq7pyAc+xR91irkdAAQJ
         O/+Ki/PSBLNV8ftr2sh4baFTGH7JME51khsrDiJFMI3WHq09WWMyR2Mogr4KavjDTG5D
         QPLRbJmojiEcAjbxrT+DmUmXtKRoDS7MmJhe6b638UGgK+gqCqVEqWRbskDBKEYcZpwV
         PIyw4myxtW0VHwE95+rSXmYLcMiT0wtmFJOpmVN3cH2MZ/ZjUVj54WKBU9wmPg4zAruo
         UxovyitvjTSi8xDjFBxRMtf9LvZf9kW24ZjWpb3TdH+7C8bSqLDERdy+aeKfliRFk8fX
         8v7A==
X-Gm-Message-State: ACrzQf1smjG0LUdtE28rFplnkzr/kNrY25n+zWyqGslsKGZOI6UR/BVt
        oh15w/4XlnfRtcBabH2kDkH2iQ==
X-Google-Smtp-Source: AMsMyM6TnBiGwylYUiIDQx8ZP/84Pe+VKWseD7Y9O/a6KvH0Gmnu7tIsrT/BNEF3Lb841xFelxuHKQ==
X-Received: by 2002:a05:651c:546:b0:26c:698f:a4a2 with SMTP id q6-20020a05651c054600b0026c698fa4a2mr8536230ljp.161.1664205702839;
        Mon, 26 Sep 2022 08:21:42 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k27-20020a2ea27b000000b0026c3e350682sm2412307ljm.14.2022.09.26.08.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 08:21:23 -0700 (PDT)
Message-ID: <47bcc9c0-f5c1-4308-8774-a7cf59ec2b36@linaro.org>
Date:   Mon, 26 Sep 2022 17:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] spi: renesas,sh-msiof: Add r8a779g0 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <a840ca8487cfd612fae2b20c98e93ae7c7f50ef4.1664204638.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a840ca8487cfd612fae2b20c98e93ae7c7f50ef4.1664204638.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 26/09/2022 17:05, Geert Uytterhoeven wrote:
> Document support for the Clock-Synchronized Serial Interface with FIFO
> (MSIOF) in the Renesas R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

