Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9924D2F2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Mar 2022 13:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbiCIMlb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Mar 2022 07:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiCIMla (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Mar 2022 07:41:30 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A011768F1
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Mar 2022 04:40:31 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id l1-20020a05600c4f0100b00389645443d2so1388337wmq.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Mar 2022 04:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4s6Mt6bV9KJzPwA3PnUDcbbpV/tJaB+XPizE0569IJQ=;
        b=dg3XnY4EVcBQh9xXHjE9FppjdwOVIl6rowvTrGYTub1VkRFmyyQ6tq4YJd3dJcj2EY
         W7uNuYxLhoVsZB8/pO+GdxPGon0+hVzwUlJUEflr9H1ypGgj6oY0MpHSjsazFYUOQQ82
         nsQyOjDpy+bZq2XKgK38/tmfd1ReOOG/y50t4DXRDQ5L7nkg7JSJwPip3SgAw47nLimP
         XVVbOF+eQcbSShM0H8BDcUEPR1TAebQmjP8ko/gQlCsYUJBXrxxpUr/uEpaYrrAaVrMH
         1U1zmhDyEFi7VKyM8/MpdXjioOwTW6IsgYj2FP+h4rViKb94BEMs721OUlCtJSurAi3z
         lKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4s6Mt6bV9KJzPwA3PnUDcbbpV/tJaB+XPizE0569IJQ=;
        b=mZDrnlfQOYtOKCTC/BFcbiNO22qKetuhxbC7Gdp7GDB5zUq6fgagkPtzj9O6Nt3Q62
         CwVQmmYHQBDZmzYBXujVA0qbM5qGS61fom6iT+Z3tmLy7B2MqTzOKThF2zMAWHtMUVRD
         Bh7i2dtaUhZD2vGVsymW7T9XSGlGtHn5ZIdLXAliMxSMdeBXes/ZXUjaUKRAyAfzR0lK
         IAyiN/EL1QZAw6YfGX6duoI+FbuXQQ/vzQwK7xMHFrQmNJo9S4l+rPFGfi5298YnbBhU
         eY2axPeC3ZkyQ8yuTjQ3a3nPlNxXHXDZjAzDF4CoaES2HGGIpJ2a0wetWmYrjlgeGoA2
         hxSA==
X-Gm-Message-State: AOAM531JF9OQqzQk70Qth7PYVAf2jrpIMi2HyXQquvIbulW9MY4wXJ4E
        SOjwl6IMok4CgjYcxuo4KnX4/Q==
X-Google-Smtp-Source: ABdhPJwpo9Iy8u1qG3DrI51vHYFtmGEESb2kVdFOe9UpA5tbOD1050hXgpLahBisUU+9Y5lHnSJC5w==
X-Received: by 2002:a7b:cf30:0:b0:389:89bd:6d32 with SMTP id m16-20020a7bcf30000000b0038989bd6d32mr3236341wmg.12.1646829629570;
        Wed, 09 Mar 2022 04:40:29 -0800 (PST)
Received: from ?IPV6:2a01:e34:ed2f:f020:1ffc:39b4:7538:de29? ([2a01:e34:ed2f:f020:1ffc:39b4:7538:de29])
        by smtp.googlemail.com with ESMTPSA id m13-20020a05600c4f4d00b00386744cb31bsm5186444wmq.35.2022.03.09.04.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 04:40:28 -0800 (PST)
Message-ID: <073f3d21-f544-4c75-d20b-ec7ef533e5fc@linaro.org>
Date:   Wed, 9 Mar 2022 13:40:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4] thermal: rcar_thermal: Use platform_get_irq_optional()
 to get the interrupt
Content-Language: en-US
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20220110144039.5810-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8uTtUjj2ccHDqB0TKfKw5KO-joPv0umw1fDP4cz6sUj2Q@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CA+V-a8uTtUjj2ccHDqB0TKfKw5KO-joPv0umw1fDP4cz6sUj2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/03/2022 12:59, Lad, Prabhakar wrote:

[ ... ]

>> ---
>>   drivers/thermal/rcar_thermal.c | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
> This patch is not in -next yet. In which release v5.18/19 do you plan
> to merge this in?
Right, I missed it, I'll try to catch it up for v5.18-rc1, may be with a 
second PR.

It is in the linux-next branch now and will land in linux-next tree

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
