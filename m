Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC26337303
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 13:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbhCKMsm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 07:48:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232940AbhCKMsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 07:48:40 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216ABC061760
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Mar 2021 04:48:40 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id c76-20020a1c9a4f0000b029010c94499aedso13121528wme.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Mar 2021 04:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jMNZouCo+1d5H2qWe/E7v+XNod/8+AQam22rkwP2KKA=;
        b=QUHZ1BWWfdEGRB5rbq3mipANwBPkD+F2tpV4supyTsOy7VEZzRfN3rvu2yud2Kli9h
         wF+QSGCF2/4/DH/pWNe644paV0E1njkJ/IJN0+pNKZYPaXXoAN7v513Wa6Z9ZfLpaP1X
         tQ/Etby7JXq0/NQEo5yhhqT9pwulG2e16a7aINt4f4JKMJ/tZqIXOv1mDa6drsyA27n+
         T82mR/jnw+DEyHUs8LvSo7xALMKzriAJQgcgERWxlWWKQx/Ts7FM0W3o4H9RQHNMWp1P
         yxn0uYzcnzs874pz9rlLsMb631BtaGVx3w4qckyIa2a8reqQqnppEhWgDrtMLKSbTld4
         4DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jMNZouCo+1d5H2qWe/E7v+XNod/8+AQam22rkwP2KKA=;
        b=mKgzzPwVpqu22wnjtcFC+g05yLEFSwIordEmp/1oZeCD6ZXSQaF2YbNEKJT4TbucX8
         iZvCLIVraR2lgh7x7Cgd8LJ/goha2UzqbPzA28wNbdTow7TGPvjp2Udw/J32m5kpd/4t
         gBP+8t3jFmMlcInu4cBYeNIdINiJkA5JgojvPqs8oMmN6MTgtRXRx0ZGngOHb266p1r3
         NkWCBVNNbo/AEyE7hVprmePDED6N7ulivnZqJ06RFiLtmftqR44mCUhqHADkX+GQIQxG
         jA8M9+arHwXBMZWTvsCvqqcZbFryepF+WQM5BWPiSeSHXT3XLqVradEU+L4mv2Rpmykp
         lkJQ==
X-Gm-Message-State: AOAM532P8DNBPQcLVijJKeTVGI9RGOyDrK5gHylM4bIYk9Vcou4baDpH
        4o7Mb7Qf810XZgMhpBFycbU1Gg==
X-Google-Smtp-Source: ABdhPJzuaxJPHXi3Nh525ggNHV50ohFSD47KiR8c7yxtF8V/4Ky8cAZWJ7CVoDWvCchokk1x9tx6bQ==
X-Received: by 2002:a1c:a985:: with SMTP id s127mr7932529wme.158.1615466918578;
        Thu, 11 Mar 2021 04:48:38 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:84cf:7f4d:d470:dfd4? ([2a01:e34:ed2f:f020:84cf:7f4d:d470:dfd4])
        by smtp.googlemail.com with ESMTPSA id i17sm3723262wrp.77.2021.03.11.04.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 04:48:38 -0800 (PST)
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,cmt: Document R8A77961
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>, devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210211143344.352588-1-niklas.soderlund+renesas@ragnatech.se>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <760cc031-f770-1aed-7ac7-02181e27b625@linaro.org>
Date:   Thu, 11 Mar 2021 13:48:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211143344.352588-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/02/2021 15:33, Niklas Söderlund wrote:
> Add missing bindings for M3-W+.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
