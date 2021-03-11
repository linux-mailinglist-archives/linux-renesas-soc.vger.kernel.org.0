Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1773370F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 12:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbhCKLPP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 06:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbhCKLPD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 06:15:03 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD1BC061760
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Mar 2021 03:15:02 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v15so1396594wrx.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Mar 2021 03:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pfw8w/HowfodcVJewDtKiPaknmOGY7Z3Znp/juepW0w=;
        b=pMq+mgbzgL0btaJAfs2U4scqRZM4N3inTNQB9QqD1R80YsX3h01j7q3/mPhPrinWi5
         kL5nqsw5FEPv0Ot+Nj/smfEl9yl5oAGPhPPAo2C9EAlCEio1nj+hIv114TnXWpmLw5vV
         9dCV5N01D8vvUWwncMq4DTRdIpy8z9nIgkhTSzFRH0WA4SLh16mBhweGKchyeUKzedLW
         F/YYIwIrXUGxvO062rTgHjxiS5WrGyIYBPsSEi+2/umSpbWRaA1PfP6OSai2q4/EYld5
         IM9R51W+kl4XcAkW+h3Dfjgj9wuO3ICIHa2Dv2YnbB3WcVISjaLf2ziHkOrpdQc2y1Ja
         0QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pfw8w/HowfodcVJewDtKiPaknmOGY7Z3Znp/juepW0w=;
        b=dlIxqRgTHpWTYwdUuTLf7du1OFcIoMRXv0xcBeNz3EuZuF6hmacnizuoUIHETJjHQu
         yqaeNR5AwqNhxoTzOf2+kllmc7SqE0jBDZyj7vzB60WwdZRtq45Q1q3uPeO5G4JsiOcE
         QYddJ8AS/2iETLMX6WOFK2GHUnI5Zm5vCiBJCK9vCu53Bs1MkZoB5w+ARgg8qTNuFacP
         IRuuurNAVh5SU8WcKteBLGzlt5FQ8W9tA25/lLG5JOt8TRiS96EfLpVwqtWL+yQhYXgg
         oTssmLJFZHSSE/vjWRnBksOgpwUajwyoE1YzMqAK85YTI4trZRL8ChVDZlmsBDXwwZmX
         CiwA==
X-Gm-Message-State: AOAM531KcUfVxnK7/V7/wr3ULcQQuOXGnssApad7/lkc2DON8Q+UprY4
        v+wRMx5YVR5wMhkiLn2gBwjZdSoC91pA6A==
X-Google-Smtp-Source: ABdhPJysBDa1s86qN51h3Y8q5+eEiPIVWUWb7o/PTc7iLX5D+Yf7kQ1fsu0+0dIGD/HOLt6vCPHgjw==
X-Received: by 2002:a5d:638f:: with SMTP id p15mr8053813wru.220.1615461301559;
        Thu, 11 Mar 2021 03:15:01 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:84cf:7f4d:d470:dfd4? ([2a01:e34:ed2f:f020:84cf:7f4d:d470:dfd4])
        by smtp.googlemail.com with ESMTPSA id h22sm3638454wmb.36.2021.03.11.03.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 03:15:01 -0800 (PST)
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,cmt: add r8a779a0 CMT
 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20210311090918.2197-1-wsa+renesas@sang-engineering.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <29b70ddb-5809-d2e8-a07f-0926590afa0c@linaro.org>
Date:   Thu, 11 Mar 2021 12:15:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210311090918.2197-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/03/2021 10:09, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
