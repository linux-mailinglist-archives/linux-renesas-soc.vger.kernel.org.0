Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 566F26BA7F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Mar 2023 07:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjCOGmQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Mar 2023 02:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjCOGl7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Mar 2023 02:41:59 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2064D6427B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Mar 2023 23:41:58 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id eh3so15498009edb.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Mar 2023 23:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678862516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JIXjzxii1/4RxSe1vNe7xHzVG/q5AELRooPPCE9bfyU=;
        b=fgEE97L8dTGQXH3uESbqc844ZFPyv9QhmZVrW1kovSXBZY5mJTFeuTo6Vwi3RMRAye
         PVnOwYwMDT8TXsN6n5uKPDXdPG6TGsQa89rUmdn6fHxrWlxv1UsVCOzLUxRik1rlYlzb
         JhMFq1HT4u6jiogDeGfY9ZDaLeRVkNL0lqxv3czFB6jrpBNB/f8fLqXKXXOHD2kNYydl
         rzolhB/OOfU4M9zSHPwQw9MpJW/xrTCV/TrAq0izrHYh0HXxMsNKq0dbY9wlNX+Jigj/
         qFvP0XXKxHR9NkWuf/D1oMBO2z/eOORYKpQG6vI74tV+jJwMk8a40+PBmqIq3h+b/1Yz
         6akQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIXjzxii1/4RxSe1vNe7xHzVG/q5AELRooPPCE9bfyU=;
        b=Z0iwLjHLJlcRVGUYMGjh34JgIUJrvnijmSKZMBs07A2eltjZ3A+Ry/2uuTEGQRWbIj
         1I0+QWLA6t1VNGu1PX+CQH920QUoK84b91z4dnEQr8uZjeS/msVu4R+OHU3GJpyxcETi
         f6AwzEAaxmeyC3g4Xi3KWhtpL9hHO4a3XGcL2J9MTmm1Jukr7gI23MG+JLY99RfvQKHO
         rC0raJyGA8RjthRZ5xIDxYL8L1bNlMbwwHTiIhUYgxlt9HvU15521oDq0COGoE1Dod0J
         +72MjhMvLNsFJiOUgRrQ3HSzwkBUOBpzYr5lQpF78kEQGUbE0+hRydtCLvcLSPu6fyNN
         ByVw==
X-Gm-Message-State: AO0yUKX2MWHkwGtifG2EW6J8JILV9AYrUw61ZrXfS0omYK9HePqqZrQ6
        e0SXkML9iIpFM/z62QfnhrWOuQ==
X-Google-Smtp-Source: AK7set9l3DKQuvkti5Zl3R6fosANWwW1ih/kNgyLe2tTV/nFBhwKoAralyQTc+4vayyvw5hNbYBIZw==
X-Received: by 2002:a17:906:d210:b0:922:6bde:2530 with SMTP id w16-20020a170906d21000b009226bde2530mr5471626ejz.32.1678862516652;
        Tue, 14 Mar 2023 23:41:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id op1-20020a170906bce100b009222a7192b4sm2044078ejb.30.2023.03.14.23.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 23:41:56 -0700 (PDT)
Message-ID: <bcc08093-2406-be53-9983-e04a8d595f72@linaro.org>
Date:   Wed, 15 Mar 2023 07:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: rsnd: Update example
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <ba4ec999dc152ea1f113253e497c093b8789d414.1678790879.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ba4ec999dc152ea1f113253e497c093b8789d414.1678790879.git.geert+renesas@glider.be>
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

On 14/03/2023 11:48, Geert Uytterhoeven wrote:
> Miscellaneous updates to make the example match reality:
>   - Correct SSI resource region size,
>   - Complete half-conversion to new-style CPG/MSSR bindings,
>   - Add missing power-domains, resets, and reset-names properties,
>   - Use interrupt binding definitions instead of hardcoded numbers,
>   - Correct interrupt flags,
>   - Drop double blank line.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

