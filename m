Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7586F4B4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 May 2023 22:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjEBUYi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 May 2023 16:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjEBUYh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2023 16:24:37 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4618C19BE
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 May 2023 13:24:34 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-94f109b1808so842613966b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 May 2023 13:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683059073; x=1685651073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FAP5+T0AQPPWVGjUzj6Gp3mW/JMTiKuIUYsnFgYhswQ=;
        b=NJYkk3wI7OyuRtfmOnLkIalgQ/aeDFtg/tFwISZUM+cbGyarbrNG1tv90RzlvaHp7e
         i6/hFBOUjgwMzcDmRjkH1UmrDTdteDYUTpXW22cX+hGKVkg7Uh95XthqmeE3uZgVU45J
         aaDB01HafyigQNTc3/rmL5bbac1yevcnsVlof/nUruQnUrJ7Q2M8rFTPUkJhNlaaxIrx
         7ML7NRtt/TRZm8VALjqmIqyDnrLT/dkz8jyUzjSwFte98W+qxhABY4yQUeXLg/8nGSl+
         hKRB2oE/AdkJV+NjLQyPSB9LSvVbxTIv9x5UvXBDbG3NYnyA/Go5W8/4Yxs5KJYH/aTg
         xKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683059073; x=1685651073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAP5+T0AQPPWVGjUzj6Gp3mW/JMTiKuIUYsnFgYhswQ=;
        b=lTVDPq9/HPKkictrRgzSvWlP9M5ut4gMnx8ZHtj+IvkdYjMMQDRpjqTUrLmfDssSQl
         yrNDzBFvlu4Mz86sEkRIpdzVjATyRgq+rpMf+sIZEQgFC2GAW/W7YjsYkJvkbXDeUoUx
         C0vMcIr7mgGv5MU81DqvbjJXkwAAQPgNf3jsXaPWh9/GMsLUmXUI3o5bsZSm51RaaCxs
         sf2SiH8rvefHwpfLepYZY++3wrGPJ2kk5VUyPeML5SIdVI4Q3Od4pDFvjp8H7AixcPeU
         tifKWTqp/J78zVyPEB57ZvHRM9shF6tPu46hjvZvxTaEWWxOTi54zI/jPhP8mf3/M2Qg
         wMPA==
X-Gm-Message-State: AC+VfDzoyTxR7d/pGw+YKEfTyoQnaxC/LbOEVGoKIP2UMiuBbo14xwzM
        kvRgbHVLCVDXc/KIWLbaJP85XA==
X-Google-Smtp-Source: ACHHUZ6tGZigxA9xLQcXsvRYC/KR4pGA5kUj0slFpPi+DJmR6Nm5T0wU5/IY39X96VZ+ZX/LSSA2zg==
X-Received: by 2002:a17:907:2cc5:b0:88a:1ea9:a5ea with SMTP id hg5-20020a1709072cc500b0088a1ea9a5eamr1051052ejc.65.1683059072786;
        Tue, 02 May 2023 13:24:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:37be:eda5:e303:19e0? ([2a02:810d:15c0:828:37be:eda5:e303:19e0])
        by smtp.gmail.com with ESMTPSA id s4-20020a170906a18400b0094f1d0bad81sm16378503ejy.139.2023.05.02.13.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 13:24:32 -0700 (PDT)
Message-ID: <68d2fa14-5504-cee1-5278-bd138c499b9a@linaro.org>
Date:   Tue, 2 May 2023 22:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 0/3] Add Versa3 clock generator support
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230413152648.89089-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB59220C350DFB9C221C801907866F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59220C350DFB9C221C801907866F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/05/2023 16:18, Biju Das wrote:
> Hi All,
> 
> Gentle Ping.

It's merge window. Ping, or better resend, after it finishes.

Best regards,
Krzysztof

