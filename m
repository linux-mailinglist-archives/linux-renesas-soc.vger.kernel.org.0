Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B33B85AFEAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Sep 2022 10:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiIGINt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Sep 2022 04:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbiIGINs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2022 04:13:48 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7DDAA347
        for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Sep 2022 01:13:46 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d2so2002549wrn.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Sep 2022 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=mbkRCkxOuTpK3rCdT2NdC/a3ZTao5Ps9WmVjhIiZvls=;
        b=sk8Pm679kCWo06LlDl21EZc/HmWpPNBEeJP8bUOaaDthi1z+mVK1yZW9dP3APJWwLK
         WQSj+BRhoPO2amfmoOEJcHDCD2Peg6PSwTivvgK+aSpO+RqG4t5t8ZTdofiUUnrgr3lL
         7AkuSuz5lV2jjMSAiqbC9Gj4Mv4NzajshOOJsI4ghnoj4Eoq9jaAVqxdwNF71jB9R28O
         YcIta9ZSV4Dd9kLdjcEviBNy44QypoTufBTizlDJoTwoTlJNJRK84vKqD05TiivJSZIj
         BPCIAcqAaABlHvQGbFlBIdfcgb/dGcagQWo9r7wd+9omVp+IRAa+cWABdErD/u8IrG3G
         TOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mbkRCkxOuTpK3rCdT2NdC/a3ZTao5Ps9WmVjhIiZvls=;
        b=GyMhTiuHmPQLWTXg7Gb81T9mse7Pm90bPpKBTlCRY5CcEUQlUGoUccl7Be58CDL7xD
         x47u5XTbfaMVfQF5D5WlyjGGuqpnNn2UD+Qz6OnsA7hilBK6K/lL6P//9bUVra7tcceQ
         Q9kwxajdN7XCfzn7AY2tdAJRzUjPmnbT9UyO/c3xuElDZ7siNTfqT700E1dKyxBA/8iJ
         +LFOCguSySALiNypk+FXEKVsph9ujJHJPR0KKDInsvDqu8hlQQIh5araETwTPWjR/may
         Fx6lN7/15gNb0AzVe4n1Bjo6FJpX3KFaAH7qHLooHBhjX/lUM0Vqwl5Ft5SMCqBm2lYJ
         gxYw==
X-Gm-Message-State: ACgBeo30k3A0NyPIKydPFB81yml57P0DRLYx7zWeyHnBLgXWPGtigzTW
        iOmUE0g4tq7KlEJznw52IHU+Ag==
X-Google-Smtp-Source: AA6agR4831QEpmYjEGZLA1k1jv1O4NZM4dYSRTaEMkIMcSOZBh3MF+BHVfh5m/Rh5jmx+OZnNPjTmg==
X-Received: by 2002:a5d:48c2:0:b0:228:6226:381a with SMTP id p2-20020a5d48c2000000b002286226381amr1239472wrs.366.1662538424970;
        Wed, 07 Sep 2022 01:13:44 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id h13-20020a5d504d000000b00228dbaea941sm5194810wrt.26.2022.09.07.01.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 01:13:44 -0700 (PDT)
Message-ID: <f467244a-64c0-a938-fd88-2f014c520956@linaro.org>
Date:   Wed, 7 Sep 2022 10:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND PATCH] clocksource/drivers/renesas-ostm: Add support for
 RZ/V2L SoC
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220907080056.3460-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220907080056.3460-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07/09/2022 10:00, Lad Prabhakar wrote:
> The OSTM block is identical on Renesas RZ/G2L and RZ/V2L SoC's, so instead
> of adding dependency for each SoC's add dependency on ARCH_RZG2L. The
> ARCH_RZG2L config option is already selected by ARCH_R9A07G044 and
> ARCH_R9A07G054.
> 
> With the above change OSTM will be enabled on RZ/V2L SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
