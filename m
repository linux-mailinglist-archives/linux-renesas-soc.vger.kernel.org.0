Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C88154FE110
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 14:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354313AbiDLMuv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 08:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355839AbiDLMsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 08:48:37 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A26E3DDC7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 05:19:40 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id s18so14500395ejr.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 05:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=B9+cI4IoL52revKm+mDw49Lnf0IFiGCiBvB1l4R4Zhs=;
        b=A6ZS7Z8yI1gNu2iwhHBbnSZ0QbwqlDVmSlNIgYrboFMCpplzOT5VRWB6uCvnftD4ED
         rA9JU84nd4w1lZ87TUCdGOodAaN/hWWeUmGfOWIikMdV2c6IrLSBBnSZGy9pETQxfNpv
         rEpYrUjQ3oi2z2VRoXouRjXsigMtkrGChaDBcTNBMnK74w713fbtoc/HFrb9RX1i7eEe
         TUsREoOo/BgbPe9u7sk1tsBXmY6a6VGYE0Yv5/t9mA9o7vClx/OIL7TxOg1qqDZNuRiJ
         47btEH27lFwN0nUpE2/xnkKki+WPoQt3EVRqd240hjir6hDDUH32RepsJNlVe395oYTD
         X+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B9+cI4IoL52revKm+mDw49Lnf0IFiGCiBvB1l4R4Zhs=;
        b=Q9nfo8r1B4ij8hu/yZQ5YfxZowbfe1DzQglUYWhMhD2yXBKnOSQzJ9lHbxrWe7lODs
         wkfy1v6Xawa6oZrhyEqYBzsoe2HSRnCn0fyK9gCGQXChQVZO/w7cIy03mQLrC5gdvyhY
         5cqGtCH6KramFrqkczvl9Q5lsyfcX05TcnKsCtmB5kokJRzBonAOSQ44vWg7YjqIu53a
         rr+NGICNqYg5jqB05kUTW6G4MaK6i0uUcUhCPNPPUcM05jR/QWPPL4hE5X89YXhNJywN
         jpLYcozf+t/F0MEYdV1QBMJFWdiFOi2BZj6dYW1UkwQoLMkl7qfUBgch1dPSPF4Wj+mx
         G8LQ==
X-Gm-Message-State: AOAM531r2DXra+venXRFlVqUQryf6FuHI0N7+7irLXZJwtMmWbPNy4YO
        AfD0oygVX5eD6JQHD9l2+mtP4w==
X-Google-Smtp-Source: ABdhPJxP5FPJxSzsun3ev7AJry3+ba7d3iA+/B0jezlSiH093DYefWri2aUuJXT5chMPrfaGPZCtxQ==
X-Received: by 2002:a17:906:7307:b0:6da:92e1:9c83 with SMTP id di7-20020a170906730700b006da92e19c83mr34466390ejc.459.1649765978985;
        Tue, 12 Apr 2022 05:19:38 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id g14-20020a50e04e000000b0041cd8db541fsm12509112edl.74.2022.04.12.05.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 05:19:38 -0700 (PDT)
Message-ID: <16750a7d-de4b-0bba-9513-c45560d279ba@linaro.org>
Date:   Tue, 12 Apr 2022 14:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] memory: renesas-rpc-if: Simplify single/double data
 register access
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <19358863deae03b1b26f473e878305a1c6e40d19.1649681638.git.geert+renesas@glider.be>
 <YlVJc3z1xXT2emIc@ninjato>
 <CAMuHMdUGkba3hiRJPEw26oBdc6_MK_eBO==Z9QeinaoeZv8Qbw@mail.gmail.com>
 <YlVLEnRaARVmWZnZ@ninjato>
 <CAMuHMdWAQ08K6NCdBGrY+-vBrsTQHi6UHaER4eCON1t9JEG1RA@mail.gmail.com>
 <YlVRw4ypp3+0Miz3@ninjato>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YlVRw4ypp3+0Miz3@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/04/2022 12:17, Wolfram Sang wrote:
> 
>> But that's not what happened. I even compared the assembler output of
>> various solutions.
> 
> I am sure you did. I just said "it looks like..." to state a reason why
> I don't think it looks prettier. But this turns to bike-shedding for me,
> just keep it if everyone else is happy.

I vote for removal of ++, because later someone might wonder why it was
incremented even if not used.

Best regards,
Krzysztof
