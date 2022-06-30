Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C6A56156B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jun 2022 10:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiF3Isw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Jun 2022 04:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbiF3Isv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 04:48:51 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC8941993
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jun 2022 01:48:49 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id o9so25560813edt.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jun 2022 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KJ6oqzacpWT0tfg5DNbwZFGWq7BtF7yMtkVN7HxcDnk=;
        b=tNO+oZo9shQdh1rhNWDOTosr5geu8ztqOhGSN7j0kUgWKRvrTDNpKMMQTxwugbtmoO
         eTQkFwTN5/tFn8QUJ9KoVI+ocrRCGUBL00/1JEOeHcl8PW0KwQv/rvIJe4EgJ9vbbNDq
         3YCN25Rm7P4ptDfHHe/qjx2zazpEJbfRq1r/Ud0YyjKBppd4eBph+AtNEGkqt20bU3pB
         AHiJoIOTXky5f8d6vG5gO6foGmgLQTNzQ9HB77R0gNExx6L3GKaebwFGQY3ZatD3hVYa
         BSfnovPSQAsQ+vn+kI8/vwt0vdt/brsr8BuVk27z4bOXYjlhTu+e82O16agQGYg7qd0N
         nrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KJ6oqzacpWT0tfg5DNbwZFGWq7BtF7yMtkVN7HxcDnk=;
        b=FmLSxLjBmHszUn9f0mLrh3I7epvrIJp7lgZiq6lg7Eyhj+4E09fXEhlPWtFiDHlT76
         kwojgt0Cyot6SvaiI0un2c6thOWMhNx5C4RMi1KPrQbY+umsy/UT/HALUWC4KrAPLcj+
         bZucF8a9oDlhFEfFl4WDLn7J2jo0XMAKkQT6deYWBai7ABtebW6M0kdZ4RJGhx6LIECP
         z2fYdaCR6/vR4eYdPuXbTpxazWHdu2JWcHQXPGRvyOdGnt1GVy+UgWvW8KYr2GXsh3qn
         FLIQzmg/1QeQnpbeMqxmHcuYL+h5VN8PLue/ThYjbT1q+t17B8VId4GSVCEiwxkULjKB
         d2sQ==
X-Gm-Message-State: AJIora9czSks8+gXfFmmmkokPrWDwKZJm06tM5nGpQhc2+jh1S2RKejZ
        DTBwp4M2AZvzAGyXjdjeVWiDDg==
X-Google-Smtp-Source: AGRyM1sYlD7GgYsvG4haXeZ+OfvqtO8Fd9dImoUw0WI2NrSxwKr0gKtRg+uGeYRy9i0ZqtRk4XeXtQ==
X-Received: by 2002:a05:6402:11d1:b0:435:d76d:f985 with SMTP id j17-20020a05640211d100b00435d76df985mr9900795edw.8.1656578928360;
        Thu, 30 Jun 2022 01:48:48 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z4-20020a1709060f0400b00722f069fd40sm8714366eji.159.2022.06.30.01.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 01:48:47 -0700 (PDT)
Message-ID: <c04c3691-7be3-afc5-4f95-2b06ee402c0d@linaro.org>
Date:   Thu, 30 Jun 2022 10:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/7] memory: renesas-rpc-if: Move resource acquisition to
 .probe()
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Mark Brown <broonie@kernel.org>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <cover.1656341824.git.geert+renesas@glider.be>
 <2fd9b9e3f60fe555d9dcad499c90e3ec869aa96e.1656341824.git.geert+renesas@glider.be>
 <c65d6a94-b5c2-e2e4-6fdb-b7982d291e01@linaro.org>
 <CAMuHMdW=s42sfFwimizTsNjyKue+W9NasTOG0jgjkgkoKv3wfw@mail.gmail.com>
 <bab4d845-330e-c7f0-5dac-a96caa93a39e@linaro.org>
 <CAMuHMdUuU4qtfYh=hpY9bWMLKAnz83Oj8f=M9_iUxmR+Zetsow@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdUuU4qtfYh=hpY9bWMLKAnz83Oj8f=M9_iUxmR+Zetsow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 29/06/2022 20:48, Geert Uytterhoeven wrote:
>>
>> You sure? Except rebasing I don't see that. rpcif_sw_init() received the
>> rpcif so it had access to all fields.
> 
> Yes I am, don't be misguided by the name of the local variable.
> The rpcif structure is allocated by the HF or SPI child driver,
> and thus not available in the RPC core driver's .probe() function.
> The rpc_priv structure (as of patch 4) is allocated by the RPC core driver.
> 
>>> I agree patches 1-3 could be moved later, if you think it is worthwhile.
>>
>> This would not be enough, it has to be first patch to be backportable.
> 
> I can make it second? ;-)

Why? The point is that this commit should have Fixes or Cc-stable tag.
If you make it depending on other non-backportable commit, stable folks
cannot pull it automatically.

> Note that that still precludes (easily) backporting s2ram support.

But S2R is a feature so it won't be backported...

Best regards,
Krzysztof
