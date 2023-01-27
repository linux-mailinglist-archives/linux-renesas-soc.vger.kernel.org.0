Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD2667ECC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 18:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234691AbjA0RyT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Jan 2023 12:54:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjA0RyS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 12:54:18 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33587F333
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 09:54:17 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j17so4033575wms.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 09:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WftSpJ7WE/jUXKaCUJvdceaq5KMTkCbj8hld7QKWwGw=;
        b=HGj8XkqWiDXf0PWUTv6/+a3BSiItoLG1Pmz5uM2BRaxET0P97js3G86d7vnpKbP1rz
         RKF9SEsrfKXWpN6AjD80EfMVSmSpp6kirV/JPFztoS5VLudgj2CPz9f+lxFv9jup7KVp
         3aMQdGNJB2K2E3foxUbteUfPsxUw1s7bdBvdbeaLfLaeADMllcCfAq1ByYW86y4ApJ5H
         1nh0egnrc7DlDVGzAaYHJWEsa/Hjzl9EkuNCzaIqQf6uxGZs1FVYYJQUYaZxGyrjIVHc
         zRi1txGSOrqs3EIVt9GH+NWAXyLLdlRU9nfUAMWRRPqe8d8Y8CxIC7O5iqOCXbE+v/7N
         H1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WftSpJ7WE/jUXKaCUJvdceaq5KMTkCbj8hld7QKWwGw=;
        b=EUF/EFOAfXVOhlrjji14RgAThI9dsHuRmSlm1H91Wk/SBmnSTZXjYK2rYIJk3P90w+
         XweHd2IZV9H7IrSL0KUNh/ggWar1uVMvHvMJPTGXT6qXQPTQHwfqaMMTT7NYcv0+HVXJ
         wJUd0EZdwWO5afPHwzENManXl1wLqFJX1kCVK7ge/yOGX3iBV69R2ynpC+6VTcy8mxM0
         gioBrMOrJTBVvIvKY21JTGIDP8rr20K4iABV9+lKlteCME3zhIOuYI1FSY6I4+luSwdS
         ml6IJZ0pFtW0sw3Jvbeb3jKP8AtGC3lQi4tGi0gnBKJaQwYumPq7G9B+8zGkcpkkOxHq
         3Qmg==
X-Gm-Message-State: AFqh2kqUNEAZD06YfEcYsTJ9eeoWD/EBhK8QFD/pazp7nP1dTndF7/mh
        WzDCbv9fHArJDY3w4fKkzmJ4RjctmLGwZxAL
X-Google-Smtp-Source: AMrXdXskWozT58aN3i41BbSuo6oT8IIxpvgn496airTkRhVybRRlduUr05dNjkIBJN64XagywlLE0w==
X-Received: by 2002:a05:600c:3c91:b0:3da:f5d1:c677 with SMTP id bg17-20020a05600c3c9100b003daf5d1c677mr38490147wmb.35.1674842056249;
        Fri, 27 Jan 2023 09:54:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o40-20020a05600c512800b003dc0b0e1e47sm9710746wms.48.2023.01.27.09.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 09:54:15 -0800 (PST)
Message-ID: <6faa66a5-8f86-1a22-df51-2c8fa62054a2@linaro.org>
Date:   Fri, 27 Jan 2023 18:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g044: Add Cortex-A55 PMU node
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230127174014.251539-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127174014.251539-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27/01/2023 18:40, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Enable the performance monitor unit for the Cortex-A55 cores on the
> RZ/G2L (r9a07g044) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> index 80b2332798d9..ff9bdc03a3ed 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -161,6 +161,11 @@ opp-50000000 {
>  		};
>  	};
>  
> +	pmu_a55 {

No underscores in node names. This is usually called just 'pmu'.

Best regards,
Krzysztof

