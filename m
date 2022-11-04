Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72831619ADF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 16:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbiKDPDZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 11:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbiKDPDC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 11:03:02 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125B9337
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Nov 2022 08:02:51 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id fz10so3184940qtb.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Nov 2022 08:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXpJ0TQUpxsncyPGT+WrGCwDjQwyOyScZvMWbiWmnqQ=;
        b=BTL7O5jCNWCOVPuY/W40A9ZQpJfM1th2R1rLnajP5f+y61WwyFbrbuDfXZllXv3nOw
         EaxLzQqMTBPWjreEnFuO489x41xDipMLGIUF3aPN3DXO3r8Nzm5Qi+gCRji21E1SvZBc
         qFPh6a1SFScn8hdSQ97lFfZB4UroUGC0JyB5x5cZiXlBoNjRPqirSLrCvcrDTdS5rLEp
         vFtiEs05Qnk8upbNKke7jCYnCwFmrlokkq+ugOi6yOdVFNYdu5D5lO4dkuTk5xx6/xw5
         odgfl6nt2QbirMsBcWl/2EcIru/BnQA1XG/fnvG9TeCf+1/EnoWwpihfEieSn11hQVqC
         RNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXpJ0TQUpxsncyPGT+WrGCwDjQwyOyScZvMWbiWmnqQ=;
        b=qFmpbqayCXiIS516oeei3IgYVF077fMvoIWBSX0jvJVmEQ4CfRpjd/gOK8vwdMd9Wv
         03r2XP+olO4DwlLGZTeg0RIt3SCvF7vh7yUy8TXOz27qPibRAHmyuCNgLjG13l0El16T
         HCVYg+6x2MxehDnf9XoRpCNHFTj3FBcXdXudrv6wOc40pDd1hlzy2wPwVCUixp9pRa2O
         7UJPkQYuBhkNrV1IXSpsaXjUFmJZebgN4p3hVdSk7ED0oEiaKmeXVUXnLD/NOlkLDmvd
         UNADkmB/vfP0xlx9KX83z2WBBrXQXMxPk82fEte0AXPN8609MNFuDw4ggDEVTn0p+xQ3
         8Msg==
X-Gm-Message-State: ACrzQf2al0un48ZRqxed/0gqdhro+L/mduscI79TD4t65ZrGtOv99YGm
        1sb6pTIwtlEefrMqcXGVlpvJgiJLv0sXVw==
X-Google-Smtp-Source: AMsMyM4QZrngiG0bu3jk1wIYWPjd1b8g3GWApE0yPPTfPQmCWWgetB8x0HMeHLzSqxFQgwGjQJRn5Q==
X-Received: by 2002:ac8:1e90:0:b0:3a5:6891:3488 with SMTP id c16-20020ac81e90000000b003a568913488mr2315350qtm.49.1667574170399;
        Fri, 04 Nov 2022 08:02:50 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id d11-20020a05620a240b00b006b95b0a714esm3203256qkn.17.2022.11.04.08.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 08:02:50 -0700 (PDT)
Message-ID: <dc6b70bc-c82d-9540-5cb7-e7a249359a78@linaro.org>
Date:   Fri, 4 Nov 2022 11:02:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] dt-bindings: pwm: Add RZ/G2L GPT binding
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20221104145938.1782464-1-biju.das.jz@bp.renesas.com>
 <20221104145938.1782464-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104145938.1782464-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04/11/2022 10:59, Biju Das wrote:
> Add device tree bindings for the General PWM Timer (GPT).
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  sending to avoid bot error for the next patch.

Then subject maybe:
[DO NOT APPLY PATCH 1/3]
?

Best regards,
Krzysztof

