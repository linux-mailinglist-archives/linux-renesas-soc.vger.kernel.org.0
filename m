Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4598551F97F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 May 2022 12:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiEIKR3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 May 2022 06:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbiEIKR3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 May 2022 06:17:29 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83B4175693
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2022 03:13:34 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id i19so25780677eja.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 May 2022 03:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0xoTftvO13nDPeWxkxaESCBhFFg1iVl2QvG7QGICOR0=;
        b=NDDydlOHyc33xtI0JzcYJGundePyxl3xul0/+3AXdRZX5Xv1hCix/6QyiwIelnrU+k
         ZQIzRdSIErdMxAXfwvJaiVGSHBKm9m32oMxGvUyF8tUlCyeWLS8B+eqrZi3I55gEb4aN
         bGzjs8A6frKayg7X2afs/1VZI41kQ4uu/fic81zOGDZk++fQ7RZKUuSQML4/45PHavMV
         CIPeoSw88wrGdCSxuLe0+j6FgiMMUIk5TAIviR/9mSGXzKnRAshqZRBs0Pu1fFpulOEv
         SD5rA/oVQTtrVukv47NnYuhXW9zFVsX+6oQ4zF728uJD1LuKBH5eQ84DbXirdO2kOG+Q
         yrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0xoTftvO13nDPeWxkxaESCBhFFg1iVl2QvG7QGICOR0=;
        b=fScEBQqWDNqPiHYiKwDS+g3B2Km3AJ5Cgo83SFloayIQM6feCuRMTjKaZudbLM21hW
         /p2MxpbkAzNzNX+U+avmGPEpo65sDgCVG7W8LDPQskTy5v5K1LGsAzfV6ldBD6DruHm0
         7FfwQImqveR5YG3ZcfBt5HQCtm/n7oX6WtiZyEbMJ61S7E47iQg3S9s7/DX9Ak4UoRVN
         rF9CfCqdtS6GWi5E6AwLDRl7tg2NGRjkxhAHa2UcuVvXqcrpCjaHezXIjKDV2Z8Sxw2C
         zBkQxjh/NYKTzy2tqCQFQs4moIOHPIDAMWLoIEdW1xWnQwS/tWPHBsZq93wIiCIOS+9U
         zNLA==
X-Gm-Message-State: AOAM5336dW25HNh1rD2s/QCHz32kyePvLkIGrXakfQjcGnsEB+rVUgYk
        LhlOGryY/AuV5V2wjvLZ8gF39pAOSxEjoA==
X-Google-Smtp-Source: ABdhPJwKC8OvJOu8sXy4x4s3VGYugkZrlXtp+VFJ5OO9uf8CfVqpA3kLiWLO1QwCO57CtX3/IIGf3g==
X-Received: by 2002:adf:fec2:0:b0:20c:6ffb:9598 with SMTP id q2-20020adffec2000000b0020c6ffb9598mr13147702wrs.418.1652090519741;
        Mon, 09 May 2022 03:01:59 -0700 (PDT)
Received: from [192.168.1.41] (176-182-171-101.abo.bbox.fr. [176.182.171.101])
        by smtp.googlemail.com with ESMTPSA id k3-20020adfb343000000b0020c5253d8c2sm10850424wrd.14.2022.05.09.03.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 03:01:59 -0700 (PDT)
Message-ID: <a2e37ea9-8d71-88db-adc9-47e921932235@linaro.org>
Date:   Mon, 9 May 2022 12:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] thermal/drivers/rz2gl: Fix OTP Calibration Register
 values
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220428093346.7552-1-biju.das.jz@bp.renesas.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220428093346.7552-1-biju.das.jz@bp.renesas.com>
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

On 28/04/2022 11:33, Biju Das wrote:
> As per the latest RZ/G2L Hardware User's Manual (Rev.1.10 Apr, 2022),
> the bit 31 of TSU OTP Calibration Register(OTPTSUTRIM) indicates
> whether bit [11:0] of OTPTSUTRIM is valid or invalid.
> 
> This patch updates the code to reflect this change.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
