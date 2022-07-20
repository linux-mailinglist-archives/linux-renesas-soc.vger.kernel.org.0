Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7C2057B238
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jul 2022 10:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbiGTIBW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jul 2022 04:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbiGTIBV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 04:01:21 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9CBF61B06
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2022 01:01:20 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id n18so28962719lfq.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2022 01:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KvELuko9Gh002C2GLIwsGHndFGxCFwNGi9hqGyiMy2E=;
        b=aHgyFBJJbXAS2lxk8rEpRx4vB5X7uNIRUgKX0mEljwZlKQlHqRM1A8DQ0RCx9b1q1R
         Z5INnsQBL2ccCUKTsnfR85ev2ymoXLm1HN29JDs688YUGwQjRqzYngivxlDZzzmgusmd
         nGKMamOQDQFhI2JJOe0ubgoQH9Szwa8U5rXU23CSuAtKLR2aFJsDWOeMGr6qrMC24aaN
         xbNdxaISBeiRfk1kMEXOS26CPn6Cm/8q0c3DfcjHC7X5ZX3tg1m4huT2z5nz9JiSihC2
         ex+yKvN5tyignw3IZ0ZjfyEJ+UekKitQTeIofhI43IVqvqpTFPQRZrWuko+j+kbpyf7V
         8OuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KvELuko9Gh002C2GLIwsGHndFGxCFwNGi9hqGyiMy2E=;
        b=PGth2C8CRtp/acG5J6xoA2t6J5TrQljzs7fOOnlO/0BOQmvzA5r/l4VXkg4/X8qIhl
         ZpKXzF/w/SlbCGxnSMfUsRThTDnSl602tmW1jBlp94oiI1q9EEeco7LQDqP8O/6LKvlQ
         C2qeFp6tCvENMzJDNzNa6TCELWA1QvdoTupKikLf9HRVI4D0atxWfkA71chtl9Onh2EZ
         cnSVVrGoTSnDkNMBYDjzaW+XH+/t5dgCIZfWTUWUWVrrTlQUlgadN/AJIp+B1yFmxksa
         fDycq8gYShakB8rikpl3Qn1qtIYtiPLld3Ljo5OyxwNW5x6nDhLq6CmzZZBMf2xW+9aj
         1VaA==
X-Gm-Message-State: AJIora/HmwVGo2Wp81Kpz8FL3JMqwHY4F+1+YZ6694QEM4OW6wLzoedY
        Q1ML4LBG6aosxFDxKo5ZBaGOFA==
X-Google-Smtp-Source: AGRyM1vXMXJNr9XMk0aZdcZihPw3vNyEwCm7X08NhysjxfWWJCUgtWt8w2MXo+WJ+3rqtpmtakgM9A==
X-Received: by 2002:a05:6512:39cf:b0:48a:15f0:80b6 with SMTP id k15-20020a05651239cf00b0048a15f080b6mr15939377lfu.19.1658304079050;
        Wed, 20 Jul 2022 01:01:19 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id w16-20020a05651234d000b00485caa0f5dfsm3698009lfr.44.2022.07.20.01.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 01:01:18 -0700 (PDT)
Message-ID: <3747a527-67c8-21ff-7cb8-2205fcb2a669@linaro.org>
Date:   Wed, 20 Jul 2022 10:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: timer: renesas,cmt: Fix R-Car Gen4 fall-out
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <2e3863ae32e17d49f41111580f195dd34e2b769d.1658303544.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2e3863ae32e17d49f41111580f195dd34e2b769d.1658303544.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/07/2022 09:53, Geert Uytterhoeven wrote:
> Restore sort order (by family, followed by type).
> Update the conditional sections specifying the number of interrupts.
> 
> Fixes: 525b296185b4b0ab ("dt-bindings: timer: renesas,cmt: Add r8a779f0 and generic Gen4 CMT support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
