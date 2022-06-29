Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3660956078B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 19:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiF2RoQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 13:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiF2RoP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 13:44:15 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3A41DA78
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 10:44:14 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id n8so9273578eda.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tVekIMrtplwlYMH10GYN3NLEVF7rPzw2Ll0nVajDUj0=;
        b=w9vxn/UmjXGR/AxVPDa1AWAET4ZJSi/d7RKxJWbXb7NdzNnJmBooZ3j04DTGg2aRmv
         tLPrXK0sXmcc+VPM9SnLizG97ehS7Wgm5m2GgA5Y/E4F+mSUJXnfqgUkhNW1qbd9Vbuk
         3Ku48VOLtWJW7RyymLVXW+QViJ949T9Cpv5uNHg8Ii5/eClbUPoeb/EK4c4PddVjOiOc
         lmCz+tWzOphiK7etLDCgy2KJd1B0za2hnkJ1Uis67labgAnMFEuqxFukByyYRGGnZeI/
         EZx8HDGnCJdPxUiYOf3z4h9gyfvL/maNLCyHKmpGAIbAO0fCEmF0pKDKQjKy6BtB7Hlb
         aNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tVekIMrtplwlYMH10GYN3NLEVF7rPzw2Ll0nVajDUj0=;
        b=wVgGOqEWfXAWxET/2+RL5QHrnTdGTijq1irBuw1bGwUrACeaFLCwFOETrEmHi6xbJN
         srMKKdb4UVh7Atdmt9GS8kE58SrJKw8+ERZKOH3ZosNn1U+wefGgcGJfZwtZ/rjiS+cX
         9PBq6VVoC9q9aydEWRu0RKykRKVup7x9ZeItVWtb8eXAAKPfHrGD0q6ar/YvvSrPMXta
         UjGIiMyVFkL40qwE7EhxPhjDoJBQY2Khjm+mIBBvz3b6ttG+UIzIG9fzdLF9+79SwQqT
         ZMjaIPvaeEPnvArEbMgmxsLIC3/8LURZIXfWpry2W2xbPm1MSXUNnNTbjmmBNBTF9i9L
         WTig==
X-Gm-Message-State: AJIora9urOtwUP80NKCd8ECuyI0Syfd0SyKlC2We8xh+pyZNkzMrIL8/
        wKM8NuA8bTqJp15Jeyp6ZO/Juw==
X-Google-Smtp-Source: AGRyM1ua6BwpBragxQEeeAoYqEOJa4FdY4s48iFIdywyOYpjX3jiRhNVEbP0A5P0HdINP+n6ybuMGw==
X-Received: by 2002:a05:6402:847:b0:437:62bd:bbc0 with SMTP id b7-20020a056402084700b0043762bdbbc0mr5713257edz.285.1656524653206;
        Wed, 29 Jun 2022 10:44:13 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j12-20020a1709062a0c00b00722e1bca239sm8074199eje.204.2022.06.29.10.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 10:44:12 -0700 (PDT)
Message-ID: <c65d6a94-b5c2-e2e4-6fdb-b7982d291e01@linaro.org>
Date:   Wed, 29 Jun 2022 19:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/7] memory: renesas-rpc-if: Move resource acquisition to
 .probe()
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1656341824.git.geert+renesas@glider.be>
 <2fd9b9e3f60fe555d9dcad499c90e3ec869aa96e.1656341824.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2fd9b9e3f60fe555d9dcad499c90e3ec869aa96e.1656341824.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27/06/2022 17:31, Geert Uytterhoeven wrote:
> While the acquired resources are tied to the lifetime of the RPC-IF core
> device (through the use of managed resource functions), the actual
> resource acquisition is triggered from the HyperBus and SPI child
> drivers.  Due to this mismatch, unbinding and rebinding the child
> drivers manually fails with -EBUSY:
> 
>     # echo rpc-if-hyperflash > /sys/bus/platform/drivers/rpc-if-hyperflash/unbind
>     # echo rpc-if-hyperflash > /sys/bus/platform/drivers/rpc-if-hyperflash/bind
>     rpc-if ee200000.spi: can't request region for resource [mem 0xee200000-0xee2001ff]
>     rpc-if-hyperflash: probe of rpc-if-hyperflash failed with error -16
> 
> Fix this by moving all resource acquisition to the core driver's probe
> routine.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This looks like a fix, so how about putting it as first in the series,
so backporting is easy/automatic? Plus a fixes tag?

Best regards,
Krzysztof
