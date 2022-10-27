Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C6D610568
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Oct 2022 00:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235082AbiJ0WNP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Oct 2022 18:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234967AbiJ0WMz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2022 18:12:55 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A27AA5715
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2022 15:12:54 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id c8so2753493qvn.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2022 15:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eVhx7mgT+CVk5bKjBjI+5XvBoPbMSGCTA36IBpxQ1Dw=;
        b=GlATrHR3ms+zGVAblXm+SiNyD8N9stZ6iKV8V4kEyuWzyranSTDCsk4u1Chwn24JeK
         x0g7H1Fd4JDPOGZgGJ634iskgF+JDeXIug8LoslxXBRilJ5GhXSEQfelYOIHRx5AnxhB
         4YkRAqRUXtYJuH4ebbpbXSrsMlWxlTs/vQ5rTxqlsBuBnrZqcj+E35lYCSddQQoMTZ/m
         bp5iX9nyavQNBk4ssB+IDjhTgRhMaLRV4GvFzucZUUTsSutmIq3n3+v3S+ov/I2OmXWg
         7iGb/8zGTXPJibCyFA3arxkyGrp7b2g8C9kK1nvKBAo+fEDCEbTqHrGjFxf35TYxnR/F
         kalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eVhx7mgT+CVk5bKjBjI+5XvBoPbMSGCTA36IBpxQ1Dw=;
        b=kG1FxkZmRiwmE0l+rOTHGsHAn7bMwlkiBrFTu8pgT2eNTs3Iblk9YEiJS+OJcDHOQt
         W3STYFZthLIlGLBNZR/TWNv0Oez3MpYk8Fm2D0WcBD56u9XQwS4c8nPy3RcyZTs+cV+7
         wRGDjehL1TZlhq8stD0x547r7yZ5EAgarSBPHExIQLg7fjihTSpt/Zp9HWIvJqqFWDgk
         INiEZaz7Z4nBx1exzBtEz3YQSAudgf1jEu6/2BZDVK8yLoxlcbJ7nJuXBNXqReryKWCA
         2j2JRhNL94OoZ4mUGyPnEkEj4l+xcCOd3JXjfqz90e5ow7Vdu7NeziXDBkr4oCXzfZ9V
         NJNA==
X-Gm-Message-State: ACrzQf0jnI6nrzerRTi4cIpquSk7PeuREmhqUyQat55OirSA+cdFXwRw
        LHP7QjJXLrCsNgxmjrTDbrmemg==
X-Google-Smtp-Source: AMsMyM4DSzWsbaz7UdKjTZ+Ghy21FWwvjj/SHawjZ2RjUEwbO8bdspC1C49Pd7uIzZITyqojguKa2Q==
X-Received: by 2002:a05:6214:5286:b0:4b3:bd06:e0ac with SMTP id kj6-20020a056214528600b004b3bd06e0acmr42814950qvb.129.1666908773817;
        Thu, 27 Oct 2022 15:12:53 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id de13-20020a05620a370d00b006f9ddaaf01esm1764649qkb.102.2022.10.27.15.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 15:12:53 -0700 (PDT)
Message-ID: <548fda02-21da-718b-7ac4-f610db6ec15e@linaro.org>
Date:   Thu, 27 Oct 2022 18:12:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 1/5] dt-bindings: timer: Document RZ/G2L MTU3a bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20221027144844.85149-1-biju.das.jz@bp.renesas.com>
 <20221027144844.85149-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027144844.85149-2-biju.das.jz@bp.renesas.com>
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

On 27/10/2022 10:48, Biju Das wrote:
> The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
> the Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer
> channels and one 32-bit timer channel. It supports the following
> functions
>  - Counter
>  - Timer
>  - PWM
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Modelled as timer bindings.
>  * Fixed the typo.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

