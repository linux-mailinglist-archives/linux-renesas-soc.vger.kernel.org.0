Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CD23AC606
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 10:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbhFRI1r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 04:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233562AbhFRI1q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 04:27:46 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F30EC0617AD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 01:25:35 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id r9so9763590wrz.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 01:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4yp7aW76jFlM4QGK/SoDKL6wd3P2t/udl1+SDe7k800=;
        b=BG0Nfd0nx1VHlxLzdTQQ3ED2RabTSSG48wjdiktWarSyDtWH7wtp8Y1jYIrLy7OMQl
         /uF5LWaFesJdjieJXeNov6439Vdf77ldaBKjP0JhiQstT4R1KUFcararw3iTBQ8Xk7eQ
         1mWOi9Qj50S9gcm2aftPRMri//xgOSdQ+cpyuBMTv702gnxQt3JQSYIOPsPFkgioT4RF
         TK9R+pLbiXomEAZ5gGXFX8nD4EQl44c/2KUw4IBPQnHJe3xbtRHz2qQjqZh43ye+t69V
         WB0MnQasYrm7AHeQfDJ/QEmnwNJlXq25RvMH3TUk18nZIXpxzneC/e0ESgKf6Ls1QLeh
         abqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4yp7aW76jFlM4QGK/SoDKL6wd3P2t/udl1+SDe7k800=;
        b=sJjv/KfW0Xlt4jcsgWYiUW9TAUYo2HGPsmJqIWaBCnn9BK6y6M3PSrlTR+DEVPHEdZ
         Ap3AIbToKlO3XP56epRd0+i9UFrzVUU6wJciamYePCITGh7UDFcPUTI1CN0IsFSu9Xkz
         pT/or0IXyohTrWKCiGymEiT8XS64I2zr+j/QY1JfqEu9Pdz1k59VxJ2EiP244OLXhdKn
         9aliChfEnbnq21luaEiVqlBJ7llvYID7i/eGD3ajilg4rgw2vYRnmXGrqomGLmQTjEYx
         ASwUCzR4zHldr4bbChFd6UbSNwjMqo3ELkrd48EedMTgVv5G2EbuwtO6zffJ0taBF4pY
         eauw==
X-Gm-Message-State: AOAM530ZeY2QpkAxO3xpZh8P+pH4SFDlU1vpBGQc6RRyPDks/RYMi3dU
        JbqRoOyY/XanESaBQ8+gTpUyTw==
X-Google-Smtp-Source: ABdhPJyTirQETOkkN7vwg+3NJQ/zG57MMk4RQWhF6OW951WA7/4o1C6UqRnF1tjfF87SdRedMYT15A==
X-Received: by 2002:a5d:5683:: with SMTP id f3mr11126026wrv.61.1624004733764;
        Fri, 18 Jun 2021 01:25:33 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:1042:9733:3014:e2b4? ([2a01:e34:ed2f:f020:1042:9733:3014:e2b4])
        by smtp.googlemail.com with ESMTPSA id r10sm3805289wrq.17.2021.06.18.01.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 01:25:33 -0700 (PDT)
Subject: Re: [PATCH RESEND v10 02/11] reboot: Add hardware protection
 power-off
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Kees Cook <keescook@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "agross@kernel.org" <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Matteo Croce <mcroce@microsoft.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Josef Bacik <josef@toxicpanda.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-pm@vger.kernel.org
References: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
 <e83ec1ca9408f90c857ea9dcdc57b14d9037b03f.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <cb86a545-69d9-9fc0-6fa6-8ed2f786c5ae@linaro.org>
Date:   Fri, 18 Jun 2021 10:25:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e83ec1ca9408f90c857ea9dcdc57b14d9037b03f.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 03/06/2021 07:40, Matti Vaittinen wrote:
> There can be few cases when we need to shut-down the system in order to
> protect the hardware. Currently this is done at least by the thermal core
> when temperature raises over certain limit.
> 
> Some PMICs can also generate interrupts for example for over-current or
> over-voltage, voltage drops, short-circuit, ... etc. On some systems
> these are a sign of hardware failure and only thing to do is try to
> protect the rest of the hardware by shutting down the system.
> 
> Add shut-down logic which can be used by all subsystems instead of
> implementing the shutdown in each subsystem. The logic is stolen from
> thermal_core with difference of using atomic_t instead of a mutex in
> order to allow calls directly from IRQ context and changing the WARN()
> to pr_emerg() as discussed here:
> https://lore.kernel.org/lkml/YJuPwAZroVZ%2Fw633@alley/
> and here:
> https://lore.kernel.org/linux-iommu/20210331093104.383705-4-geert+renesas@glider.be/
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
