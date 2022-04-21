Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9D150998A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 09:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386083AbiDUHoZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 03:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240889AbiDUHoY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 03:44:24 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF30013D1B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:41:35 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id s18so8339810ejr.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0mWGoPQeeXb3JIgOuC6Z5yzEgMscPvxeNGmB5+cXvx4=;
        b=xUkZ4Es1JYsFeSJYLoOZnMmeL7KIn9SJ4+alJKX+k5i73/dJK76+r38TZBIn27+qwJ
         p48OfrYNWL23FZcLLZiCKgPYeEmL5hsTzdfIeQ8kxfXba2bGMkqQ5FjQbjUD5Q5BMT1t
         HUFeUk37daLD+zAFy8d7l2nGc6Ztcw5UhjcfR8AupgI8AtdwIpwCOl6stWFHPpOLmiOP
         tSXMU9UL+BAlX55M0Q6u00HFdZP/BOnUAgfaSCy3/kMAEW/pqI2h+Yk916nfSvnJlKpm
         DAp+XfrualX1EvtkWpZ6GJ9ATnGlFGr+lZOHhE3fDCEEYV82NWps7hNCpV4K1UZH0UfP
         zqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0mWGoPQeeXb3JIgOuC6Z5yzEgMscPvxeNGmB5+cXvx4=;
        b=EbNEKiZ5ASTzkUADKSGPjQsMIrngSbkYTO+fXSZrLKa7TZn7pp/4bQx0JFzPAez+wB
         zkvJ0+HLZ0lCrPKEKHhN2K5aV/V2ERYZZRKsXyUAe/AoBZsit88QT4jkkxuLmlw00xPm
         9PR5rmigFFuQTpCNvMM/t+dbXCT1uYUGHDxhgaE+wWtxvSaYIklkkplHpLbzPYke5B1i
         ncva04c0sEYfTmtJ4gm8cG1TCPXa2WkfYsjFFsRlh4fFvIIcueH9unXhIQQCROyrgPHz
         i22lgme9E0Q89DAZHwWlRj1a6RQSP9v7oODmDAodHRTMukEjUUA5dr2wemELuHyTKWF7
         NXjA==
X-Gm-Message-State: AOAM532Y2fwKohKP99XIepQSv+i1DFozRYC7t2KRxfdpnsqY4FJ5Iwvi
        FfYQ71YIpxipg8sgrS7KiffKoQ==
X-Google-Smtp-Source: ABdhPJw7mmmZUrY45OvG5dk1ZDa03KiPj1bXPfY40WHusxoaBzn9OWjAmWQtlIQJpFFy4fYqKGt4yw==
X-Received: by 2002:a17:906:c110:b0:6e8:3a96:996a with SMTP id do16-20020a170906c11000b006e83a96996amr21742540ejc.216.1650526894570;
        Thu, 21 Apr 2022 00:41:34 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e12-20020a170906c00c00b006e66eff7584sm7535179ejz.102.2022.04.21.00.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 00:41:33 -0700 (PDT)
Message-ID: <3d56dc96-e15d-54bd-f4e0-7f323c7aac73@linaro.org>
Date:   Thu, 21 Apr 2022 09:41:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/15] dt-bindings: reset: renesas,rst: Document r8a779g0
 reset module
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-4-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220420084255.375700-4-yoshihiro.shimoda.uh@renesas.com>
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
> Document bindings for the R-Car V4H (R8A779G0) reset module.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/reset/renesas,rst.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
