Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 662255099DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 09:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386229AbiDUHyp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 03:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386216AbiDUHyi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 03:54:38 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DB3DFF9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:51:49 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id f17so5414650edt.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SWnz07/ydUSDSFIRmRvvVdm20TH0m+rczRpHxI08538=;
        b=EwmR9yCZo4NDwqX1l0iMzrveU/Y7tFFwuzOLGL9RkQEcE/JqAECh2XqEp+X6xDFHOM
         J93ZttPP4flslham+xT8xhDfXTRpBs4Ge6Z/+z2Eato/JTYarti7C18gbvR2LmPJkzFU
         Njsif7tDcPHSlzj45tlm6+WJVL/vJ7PLjSJyVBv9OQv+vJj+L2FGmVXa6jtYrwpVZLql
         LLdPsV6ew7J0SFu4Rufwt5c2xgM9OtfPZVPA510Db1HsKbCweuageDeNttTrm408QwjK
         SZw6Ob5MeReu3WT9tlX6s95I6HyIrUtml6ww/ImB+A+RCEEdBSfGx9+t5pUGwhAoBl6D
         2YCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SWnz07/ydUSDSFIRmRvvVdm20TH0m+rczRpHxI08538=;
        b=K7/AD6dhQSZ9ses+8TcLDJMJl992SOsOf7iLaiWji4B00B1XXcHHemx9Gv34EkVte5
         NyL35sDuQkK5mqhrWvKamHjHtSeWQgv1SIQiVOhOeK9N0GTO2zxnKJJARJTPHrBaCCuO
         Gjaz3agEnbmMqNzO1IpdFBFHQznsS6k6HT6OfCr9rtHNPBOx9jHIY3fG0XhtpOfV/XCt
         7wei4YnDOgExDvkFFuz/TVLZqapVhpC6Dc9SljqvWHmIMjXGd8WSlIihVLDSz+b87WsN
         hAu7KmgEqyWeY1tCPB9uPAA9EpSr/U6MgvqKrcyQOMfDrIhEp0EOUwkGnN+BuD3XWgZG
         DrzA==
X-Gm-Message-State: AOAM532Yhi4aFrzZdTxpZ4D+qDnmo69H5JCw90dY8MqEPkeBce7lNKh3
        HWscx1IEbnAMPWGbJxRtGv51hQ==
X-Google-Smtp-Source: ABdhPJwsgt7zi76Zv2CQz+yv0v/+CbVB1kMAgrzEXSk+VepEHFrCcVidOiNP5TKdoT+PQBEhuT3oBQ==
X-Received: by 2002:aa7:cac8:0:b0:410:cc6c:6512 with SMTP id l8-20020aa7cac8000000b00410cc6c6512mr27561204edt.408.1650527508001;
        Thu, 21 Apr 2022 00:51:48 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p22-20020aa7c4d6000000b004209e0deb3esm11099378edr.30.2022.04.21.00.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 00:51:47 -0700 (PDT)
Message-ID: <efd15268-d851-c9fc-fe07-0ff40c851746@linaro.org>
Date:   Thu, 21 Apr 2022 09:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 15/15] arm64: dts: renesas: Add Renesas White Hawk boards
 support
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-16-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220420084255.375700-16-yoshihiro.shimoda.uh@renesas.com>
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
> Initial support for the Renesas White Hawk CPU and BreakOut boards.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  2 +
>  .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 45 +++++++++++++++++++
>  .../boot/dts/renesas/r8a779g0-white-hawk.dts  | 22 +++++++++
>  3 files changed, 69 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
