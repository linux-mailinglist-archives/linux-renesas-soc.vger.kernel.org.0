Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34418639D4F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Nov 2022 22:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbiK0VbO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Nov 2022 16:31:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiK0VbN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Nov 2022 16:31:13 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D1F6B7D3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Nov 2022 13:31:12 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j16so14625061lfe.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Nov 2022 13:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndDeJnwqwm6kB/SvuGOk72RxjCShlDfHw9rgdIIiqSk=;
        b=EuAuC8BbkcdgJ5SyNzJRzWwgYCO5UrN5YEqYhJEOVMuZr1vIQJP0q1RCT7V5YM+CQc
         Y6alRc8MMyz8cYcKzelO/z6ir8mqQJk3blNG6CivDOYDpBIAdm1/+NEmdgERutxdapoI
         V7ZvYC7laLh8rOtDencox4G3xjlH3JaQnvRM7Ec7cfQVX6W/KwGGkGzU5UVb3ndQLKrK
         yM6Gg1IQXpHDAP22mToVn3vRuRZ91sz4VnR71VlA33GpKIPtStBMyfvkLUuOS8qaKGBX
         YfJv5hSz7XCOC7i4WPWonMgH3XqA6Fy3BLisp1454vpdrBqkVozGjNGkHl+B0dLioKT2
         +4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndDeJnwqwm6kB/SvuGOk72RxjCShlDfHw9rgdIIiqSk=;
        b=XgOtUW/6pB+eEbdUALdCo12EKQNqjlDYT+Ox9jYSMFoKNhHBIPFy3bNtS4Bfl7oxrP
         w9HUhVFNsxggQCxXkY4xve1qw0NIEvtVhbKbMdTomgbySpxHEw3DC5D08MQtSCkzGaRO
         tvEY6NU96g+P38EtNvo1smEFPdC+fFBfKZQ2m2CNm//zDQgLQnO+uvdJ9q3Z7NvYtSCG
         0kpaRpZjgn6uqsnDpjcEVtk0nm+4hcQDdXgv/VQTwP9W54PmQ6K/7C92Pj9LExTZu5l6
         m1mOPVyPaXPOrzMOKE8tmnZlLOXyG5HFS517oeRj3KN9bVs9SHa1/+gCu6/vvTZ7M0X+
         iLig==
X-Gm-Message-State: ANoB5pmETZMo90Xkj6+1en708uVbA4iMTU6ziI+bKVUSTAF7uG+qJwm1
        PDulHL/Rh8IKKeBG4kN5tORyOw==
X-Google-Smtp-Source: AA0mqf5E84tiZKaMJsIeWFfqdi2kx/96mWE5cGhi/qRQc/2OJSAzW83D9xwrn7zjEmIUpuQDSdbrGQ==
X-Received: by 2002:ac2:58d7:0:b0:4b4:fbce:606b with SMTP id u23-20020ac258d7000000b004b4fbce606bmr4682991lfo.27.1669584671052;
        Sun, 27 Nov 2022 13:31:11 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r13-20020ac252ad000000b004b49025f96dsm1421692lfm.187.2022.11.27.13.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:31:10 -0800 (PST)
Message-ID: <b500e42c-f782-79c6-70ce-650e4ea32c54@linaro.org>
Date:   Sun, 27 Nov 2022 22:31:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Rebind fixes and misc
 cleanups
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Mark Brown <broonie@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1669213027.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cover.1669213027.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23/11/2022 15:41, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The Renesas RPC-IF provides either HyperFlash or SPI host access.
> To handle this, three drivers are used:
>   1. The RPC-IF core diver,
>   2. An HyperFlash child driver,
>   3. An SPI child driver.
> 

Thank you for the patch.
It is too late in the cycle for me to pick it up. I will take it after
the merge window.


Best regards,
Krzysztof

