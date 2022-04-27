Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53041511638
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 13:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbiD0K70 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 06:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbiD0K7L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 06:59:11 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C5B71DAA
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Apr 2022 03:50:00 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id i27so2555286ejd.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Apr 2022 03:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zMOUZA5eKdARsIOCnmVX/V2N+7HoLGRigXyC9Vya5Lo=;
        b=hfzKpaY0djQY+KdfgoBbORTgnmZpPtykmoilsBG0KL//SeXjoIY/tyiXrsTI8kmU2W
         TP/TXKkAwG1XOORbeERfcbSJu9FrX2rVIUk8CkL7+kY7Fr8k0cRfrI/dgRTJoTpwyO+G
         C6VzV7xntU+4ROWOilvIKiLW13+CVFgs/bs6sMBFp2BRqZoV4tROUDojGLaRpuRTfuE6
         tlL/MQuD+dsVzwg2cRkX4o//nyV5LhD1ZTJhZSpiPA3W9fc8DHA8MHE48g8NJtyOZi/a
         PbcfqqDY/zP1bcqDk/xXRTbyKg3lJVpe/KEb8DVse/oG0Yaf5BY9Fr3aHq55Fb6rKhIp
         eR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zMOUZA5eKdARsIOCnmVX/V2N+7HoLGRigXyC9Vya5Lo=;
        b=2+D7ZvCrzob/IlJpkHwKL6vWax78CiQMvLB41zWI4fc7Bnnt4UMtv/5UiKvkH+EbkT
         PuAq0bmY9ldX4IcanbOR2rosquNOOkJ1Fn9hmWid8DJCJ6JeOGQ26Yp0lIdIdGCdqPq+
         7Y5GBbCMrqcras37WNg1PPtfnLEn3gsqRwNGN1InZ2k4WZqI/aSz8XD3IXDkRRCa8tDY
         6ElLb8tj4SEYepsd3TphsbPZI4rn28OwrHJHY2QHXGcMZ9bw8Tkz3UOMJ/RgxkfVcCFM
         h/lCL4cLflczaHI1ieNvxjq272Qe2YSx7t7KVIqZ7H/edIxmQhBh/8IOVl3v7eJp/55f
         Wn6w==
X-Gm-Message-State: AOAM533v2cOmvKQsr7q9lkyQeEHpap7RA/k/asGBqacqkC78c0h62jHU
        /tXa0jLX0NIw8RY4Av7GewexGVaM34dZTA==
X-Google-Smtp-Source: ABdhPJx3K1lV0/cbEk+9/nhiGXr+v+OKrLJa90ju80K9a7upK/7bX+lOK10ihD1xhAXbJ433IqdLJQ==
X-Received: by 2002:a17:907:9702:b0:6e8:be82:f43d with SMTP id jg2-20020a170907970200b006e8be82f43dmr25980664ejc.67.1651056599413;
        Wed, 27 Apr 2022 03:49:59 -0700 (PDT)
Received: from [192.168.0.254] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906284b00b006e108693850sm6422409ejc.28.2022.04.27.03.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 03:49:58 -0700 (PDT)
Message-ID: <8d8ff44a-7ae9-1b8a-3d91-d046f8363f9d@linaro.org>
Date:   Wed, 27 Apr 2022 12:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix missing setting address
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Zhengxun <zhengxunli.mxic@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        zhengxunli <zhengxunli@mxic.com.tw>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20210818165604.22127-1-zhengxunli.mxic@gmail.com>
 <CAMuHMdWUVVnZXc4iXrkpyLFpr9w5X-EzuwvvFGQYAp+0=ZJbqw@mail.gmail.com>
 <CAMuHMdWpvuC2Cm41jCQm+rT8MZB5GN+Z0bPz941QzsHX17Ux-g@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdWpvuC2Cm41jCQm+rT8MZB5GN+Z0bPz941QzsHX17Ux-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27/04/2022 12:26, Geert Uytterhoeven wrote:
> On Mon, Aug 23, 2021 at 1:59 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> CC sergey's new address
>>
>> On Wed, Aug 18, 2021 at 10:57 AM Zhengxun <zhengxunli.mxic@gmail.com> wrote:
>>> In the RPC manual mode, if the data direction is not set
>>> (such as the flash erase command), the address misses the
>>> setting.
>>>
>>> Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
>>> ---
>>>  drivers/memory/renesas-rpc-if.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
>>> index 45eed659b0c6..9dd27c6307f7 100644
>>> --- a/drivers/memory/renesas-rpc-if.c
>>> +++ b/drivers/memory/renesas-rpc-if.c
>>> @@ -482,6 +482,7 @@ int rpcif_manual_xfer(struct rpcif *rpc)
>>>                 }
>>>                 break;
>>>         default:
>>> +               regmap_write(rpc->regmap, RPCIF_SMADR, rpc->smadr);
>>>                 regmap_write(rpc->regmap, RPCIF_SMENR, rpc->enable);
>>>                 regmap_write(rpc->regmap, RPCIF_SMCR,
>>>                              rpc->smcr | RPCIF_SMCR_SPIE);
> 
> This patch never received review comments.
> As of commit fff53a551db50f5e ("memory: renesas-rpc-if: Correct QSPI
> data transfer in Manual mode") in v5.16-rc1, RPCIF_SMADR is written
> before the switch() statement, hence this patch can be ignored.

Thanks Geert. The patch was not sent to proper folks and mailing lists
(only linux-renesas-soc@vger.kernel.org seams reasonable) so there is
little way it would be ever reviewed.

Zhengxun,
Please use scripts/get_maintainer.pl to get the list of people and lists
to CC/address.


Best regards,
Krzysztof
