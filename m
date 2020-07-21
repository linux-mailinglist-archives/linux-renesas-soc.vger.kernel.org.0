Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E5422807C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jul 2020 15:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgGUNCF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Jul 2020 09:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgGUNCF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jul 2020 09:02:05 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFBBBC0619D9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jul 2020 06:02:02 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f18so2784882wml.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jul 2020 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c8CUr//Kxp2XCh4p6o730T9o4S7sMFdJMOUtCj1j6F4=;
        b=bw8uGSatbx8JEykSQdqB4/pM6Y5W9YDJ+HrxrycGB/KKnlgQ1tGqqHaUo3ruAesCkO
         KtJDfRbnxdgUxEAN4bdt7jLN87iY1/p+TNpMW8dXeLU4R9xLk5aGfbra3RJxOo0Vcaf2
         JEsw8ACHXnyWjtbd1+TjBHTxd6GcBA6geynHphcAgndy7Mgg4hx6rRexdP2OJe5tUaU/
         S5fYg8NTAqtDnoSia3nE64JcjLfVQZHsf5ljwqvq00kEYlNZ4jz84xde/BxXLrfCQsll
         huoeg1XC90jTwBsIGsEVek/8qiMkAG97P0SahInpY655gh7e4RcFF7D8WARCYcbeKQoH
         Lkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c8CUr//Kxp2XCh4p6o730T9o4S7sMFdJMOUtCj1j6F4=;
        b=Su8DgYrYGSOJwYk665aMW4e4OlK6kBkl8ZwWZT+dO77kGKzdgn3bNc4LGf1pA1Q+T8
         LH4XDofXDooM656oLrFrjOy9jkAxjxeUvqG8tu/3QaowmJXyT0qAbL4uda/TIA3K0DkY
         zvQkBHhnPq5mEae9KKgld7jHee9v7TXYaaRlVzFTTh9NOpPUcdtVaWSwe0OX5huNx9Ni
         Z9LX8znuUZWWtmsf/aw4dOcJGVhPgNbsGYqxf/mVsSVdRAopx7G68PEDYgEnovWmh5r6
         OsQagjpRI9/q0QDHXno+aY9HUAFbq256gPN500SutSm/vvTH3Gb9sgN6jCuf73R87Udu
         RPGQ==
X-Gm-Message-State: AOAM533cbrquiZw/aHAcA7WNAODh0fkJ+c2ekZf1Bp5aHCceeTfhDSZm
        jIxswY32BruG09j1N1rSrTox/A==
X-Google-Smtp-Source: ABdhPJzfVYzFbylj/GkvVDxz4XsySFZ6mPsa4CopGsWKPMcR6Tu3vl5J2h6j93Hj0owhSUKAB/vj1g==
X-Received: by 2002:a1c:a557:: with SMTP id o84mr4005676wme.42.1595336521352;
        Tue, 21 Jul 2020 06:02:01 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c144:5385:c824:85ce? ([2a01:e34:ed2f:f020:c144:5385:c824:85ce])
        by smtp.googlemail.com with ESMTPSA id z25sm3125273wmk.28.2020.07.21.06.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 06:02:00 -0700 (PDT)
Subject: Re: [PATCH v2] thermal: rcar_gen3_thermal: Do not shadow thcode
 variable
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>, linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20200610003300.884258-1-niklas.soderlund+renesas@ragnatech.se>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <72600ef0-54f6-cf88-1443-48e5c024fa50@linaro.org>
Date:   Tue, 21 Jul 2020 15:02:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200610003300.884258-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/06/2020 02:33, Niklas Söderlund wrote:
> The function rcar_gen3_thermal_calc_coefs() takes an argument called
> 'thcode' which shadows the static global 'thcode' variable. This is not
> harmful but bad for readability and is harmful for planned changes to
> the driver. The THCODE values should be read from hardware fuses if they
> are available and only fallback to the global 'thcode' variable if they
> are not fused.
> 
> Rename the global 'thcode' variable to 'thcodes' to avoid shadowing the
> symbol in functions that take it as an argument.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
