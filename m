Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 391F256090B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 20:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiF2S0p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 14:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiF2S0o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 14:26:44 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F2729C94
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 11:26:43 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id ay16so34291827ejb.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 11:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/64xgRiUt1vtjHTJICjZN/EEDL0sMvHlhgMluGbsqx0=;
        b=x2E4mYSLVh6dmMDXYftVhxRZrFhJRMJtLQeY1usKMwvluClkcCiiBN78Btu0KYl+rr
         VqWzaJIx/9upJFb2YZwy2jC8OCOL9QOTVaJSIzlL+u4LQpZWztNzn9d0IQ54v6HfxaWq
         qyE/rL2wCv/psLNSupk4hQ9d7ZW/Me2UtTq4zvMeeH7VN//7gc6tgOjR1pdLeciw92Zo
         O+4h8WNcFHiPaVci9RmHOwUDCcea+CuacUCBKxWlBhWAd+uSEtUg6X0gjaTgmc8XTcvb
         QpnEK0VgVlk53yf6eruRdTQIGKlco3P2ajT3gMWz6OIyLupkmxCBVAKvdH3abrmJhJnQ
         s0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/64xgRiUt1vtjHTJICjZN/EEDL0sMvHlhgMluGbsqx0=;
        b=hCD6qfPqQKTGqTSzI+NZ/qI7sOOicNzLrkoqNvUT67Xl3Jd+dYIkNK/MvUldodwEk4
         +zmSyki35AfZxnPLTalHRZXu1Zo+4SVd4x8hHkFbmLE3c8NLyWY33VNdSuP9eZMic5Xo
         uvaArPVCGbIjrmqDAj3tx37lcnb80bxxFklXptN1f0hYp01SzHfrg73f+6Vkt1vy4FDQ
         vS/NS0jqyKLVFUdQeKNhXspHEHsop30H0p/gA28CsXkqELENNDbL7AGKQnSMqUqdQ0w3
         cn+BCOaNdH7Z34vFYgxi2SY2eim1+LjHWhYrsYWNxXNr3PbxtHMncroGaLCPN1qih0M9
         lF8g==
X-Gm-Message-State: AJIora94hKO6ptm6/FJWLOhViK5gJXtqYnal3sa8fBZxTCLM+/5eX8ua
        ShGochVuiehM8Cc6vRPOkYYunA==
X-Google-Smtp-Source: AGRyM1sfeOEPxArayPtvXtsr5u5/zqpD7B812IZXeSbupwIKB9chVw1sBePnM8Kf/X3wTBnJz4Lgag==
X-Received: by 2002:a17:906:58c7:b0:722:f4bf:cb75 with SMTP id e7-20020a17090658c700b00722f4bfcb75mr4766353ejs.450.1656527201890;
        Wed, 29 Jun 2022 11:26:41 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id le23-20020a170906ae1700b006f3ef214dbesm7981432ejb.36.2022.06.29.11.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:26:41 -0700 (PDT)
Message-ID: <1d26b762-a2af-e717-c0c2-0a991bde5617@linaro.org>
Date:   Wed, 29 Jun 2022 20:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/7] memory: renesas-rpc-if: Pass device instead of rpcif
 to rpcif_*()
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-mtd@lists.infradead.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Richard Weinberger <richard@nod.at>,
        linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <cover.1656341824.git.geert+renesas@glider.be>
 <e313b7f9a856fd8546aabb20d44d10e3af6676c6.1656341824.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e313b7f9a856fd8546aabb20d44d10e3af6676c6.1656341824.git.geert+renesas@glider.be>
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
> Most rpcif_*() API functions do not need access to any other fields in
> the rpcif structure than the device pointer.  Simplify dependencies by
> passing the device pointer instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/memory/renesas-rpc-if.c | 32 ++++++++++++++++----------------
>  drivers/mtd/hyperbus/rpc-if.c   | 18 +++++++++---------
>  drivers/spi/spi-rpc-if.c        | 14 +++++++-------
>  include/memory/renesas-rpc-if.h | 16 ++++++++--------
>  4 files changed, 40 insertions(+), 40 deletions(-)
> 

I need some acks here.

Best regards,
Krzysztof
