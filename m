Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0540B51F948
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 May 2022 12:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiEIKIn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 May 2022 06:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiEIKIl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 May 2022 06:08:41 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CBA2608F1
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2022 03:04:39 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id k126so8065530wme.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 May 2022 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ycQ/+6Ta9+mte/sUWQMV+qmIHIqajQfCeBORbOifyFU=;
        b=Vby9QUsO+j2WPmfz2Rz3WWtkCRCpSkEFrhPyH8qmd1g06onlpHiTJdhjTcWl8Qx38o
         B6Tt26DHvTwdkxI8KIGssdl7sG5nsgvC1gIshawhj+5Cs4WXavF7smnp6eiNT4qUIrqI
         zMvYvdfU+Mo3qiHTkKoVIBOovs64Uobs/8Dx9ZT6uh9Cpn2vQjWSvNHYOozomcGLr2B+
         bR0gryxm2iyPqHQLNcpYuuUKxrkzSjVksHzb0pt2Wfi48B+UqDdNJuQco5iCckcpMJlS
         zMUzpsTYVk/koh1WJLUnITm9oTIJMQHC9D3b+Jm6jnngRK/6h13gAxeRT9iWvCN8+Hcx
         qoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ycQ/+6Ta9+mte/sUWQMV+qmIHIqajQfCeBORbOifyFU=;
        b=HVgbFNtrCeOLW9kpZceOg70J5eL2hGR8lHuUHPxtk4mabo/nhdxQ/hQjc69ZDlTIoe
         e9b0eVOPTSLRw6FUV82gWH4Co+T6Ks+6QbhCly/XuqN5eW/kysbkNDa1bw9I7DM2U20c
         CguUuS5eVUlBqAPIG6Qk72dlsNyGl65tFp6xD7IuKtylCSuLTGeTg8cHcqYyVgiyVKeO
         jL8MW2QW6nhw6uQ0OHX9g8XyXPcLcs6yvvdfAKi09L3NLOA7dyy5W2SAvvcgv1m7P98e
         Zj94+90E9KdpnFvQBlg/HAR5E8KpwhW1lyQjbItEvDabZyLC5X6Tv7CNnc4G+JqW6nRy
         TSdg==
X-Gm-Message-State: AOAM533R22TdpMMINELgRYwhm0XJd13lP2mVzi5ne0dVzAiPA3/JFlpW
        lCz6eskdu3nBIQeb/pETVpiBNw==
X-Google-Smtp-Source: ABdhPJxPZF76H+CGBRbgX6YLx5a+QYaPfBWBP90yRaHKZNaP/CmEcjqLdUZwFR2vF4e4e7f8ZSEw5w==
X-Received: by 2002:a1c:acc4:0:b0:392:9dd4:fbcc with SMTP id v187-20020a1cacc4000000b003929dd4fbccmr14923623wme.78.1652090427648;
        Mon, 09 May 2022 03:00:27 -0700 (PDT)
Received: from [192.168.1.41] (176-182-171-101.abo.bbox.fr. [176.182.171.101])
        by smtp.googlemail.com with ESMTPSA id f22-20020a1c6a16000000b003948f4e750fsm3663187wmc.23.2022.05.09.03.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 03:00:26 -0700 (PDT)
Message-ID: <4a44a8ea-7180-7163-126b-641c59024e7c@linaro.org>
Date:   Mon, 9 May 2022 12:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: thermal: rzg2l-thermal: Document RZ/G2UL
 bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220501081930.23743-1-biju.das.jz@bp.renesas.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220501081930.23743-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/05/2022 10:19, Biju Das wrote:
> Document RZ/G2UL TSU bindings. The TSU block on RZ/G2UL is identical to one
> found on RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-tsu" will be used as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
