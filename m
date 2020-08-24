Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9738024F9F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 11:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728719AbgHXJvn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 05:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729591AbgHXJve (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 05:51:34 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718EFC061575
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2020 02:51:34 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id u131so1527489vsu.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2020 02:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ye9+qKFbsMFveiix/CbGAMUuGY5KIVCJ33W9v6lnAlw=;
        b=qONrOZ7EHD7CCNP1anCs1Hek1QNF665bosrIamiK1TQpaGgl5O+TbeIeyLeOq4jar/
         q6yjRxk5nUEhb441yehDvnI193qNPq/tZtVgjmBSWvnWlF9oAy5rVZLKZ4rku+zQHQSx
         Xm5bSJyMOfmaK3eO7xiwZSpwa/oxVIymrNS3l1xJtFbssQ+ky62E7ADQ9/4T+kourMze
         fEkVPg0nQN5PifHhcit+PhMoCbTzl/6wG22q/Q45MW3TVFLL13m9INa1VVUz7jwKINT/
         m6OsjQlvKOsN5XHW3dnmcloW4pzLQprlZXAQUmilV4qu2zCrfTKwmU7s4SgSh9k5QvKi
         d9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ye9+qKFbsMFveiix/CbGAMUuGY5KIVCJ33W9v6lnAlw=;
        b=JhLH+nRC3TgbJisO2YpUuMKDk6TYI6jOZFT4F7GRe3iOcCNr0MrC9ncB8itSmPe8YI
         Wmku03Sp1OOw4ileN5xA0vpCskWdI3U+1QuitkJeMtbKmj17gxCQQ1kTvL3C3aAy3nIH
         Xm59K6S7m+tpTDGUM5ASbwOl8Qrp/95ZSKt3pq6PilpJFTXruwUNuIZuoZ5B8PK9m2wt
         3UREt3Y3SpDdf2FrNHpCG6IcOMo8sWh2SS0hBTUDVoJW1gprrbQaymb0Xd+sGzZmZJGd
         8ZZDdzI6T8ftBpKTFH9m308kcPkayBytHDYMsd5Ux+0MGXs3PG54gsNcYoUFm8kMtl+s
         CsSw==
X-Gm-Message-State: AOAM533dunC7Z+ovIiJzL2e4erWShQgfYCOjPXewytE83ZMAeAyGPF78
        7icMxEEIDWs55aZjjZURDtAIv39ULlQb2dRZ1f5kJQ==
X-Google-Smtp-Source: ABdhPJwTxNcMoRKm82fr4/Q4ygmBMhtEFAtZN64L8bM1j2717tZ99in3jeEisGmqasEx/iX4HyL0WhwxxdiygxZo0ic=
X-Received: by 2002:a67:e9d8:: with SMTP id q24mr1950040vso.165.1598262693633;
 Mon, 24 Aug 2020 02:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200817115838.2981-1-wsa@kernel.org>
In-Reply-To: <20200817115838.2981-1-wsa@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 24 Aug 2020 11:50:56 +0200
Message-ID: <CAPDyKFrE05SMwjGXn+DD-5XxDSKm8b-bFJHG03rqE638JYf9wg@mail.gmail.com>
Subject: Re: [PATCH] mmc: test: remove ambiguity in test description
To:     Wolfram Sang <wsa@kernel.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 17 Aug 2020 at 13:58, Wolfram Sang <wsa@kernel.org> wrote:
>
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> When reading the test description, I thought a correction of the
> xfer_size was tested, which is not the case. It is tested that the
> xfer_size is correct. Use 'proper xfer_size' to remove this ambiguity.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> This may be bike-shedding and I am not offended if you think it is
> minor. However, I ended up looking at the source wondering where is what
> automatically corrected.
>
>  drivers/mmc/core/mmc_test.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
> index c21b3cb71775..152e7525ed33 100644
> --- a/drivers/mmc/core/mmc_test.c
> +++ b/drivers/mmc/core/mmc_test.c
> @@ -2669,22 +2669,22 @@ static const struct mmc_test_case mmc_test_cases[] = {
>         },
>
>         {
> -               .name = "Correct xfer_size at write (start failure)",
> +               .name = "Proper xfer_size at write (start failure)",
>                 .run = mmc_test_xfersize_write,
>         },
>
>         {
> -               .name = "Correct xfer_size at read (start failure)",
> +               .name = "Proper xfer_size at read (start failure)",
>                 .run = mmc_test_xfersize_read,
>         },
>
>         {
> -               .name = "Correct xfer_size at write (midway failure)",
> +               .name = "Proper xfer_size at write (midway failure)",
>                 .run = mmc_test_multi_xfersize_write,
>         },
>
>         {
> -               .name = "Correct xfer_size at read (midway failure)",
> +               .name = "Proper xfer_size at read (midway failure)",
>                 .run = mmc_test_multi_xfersize_read,
>         },
>
> --
> 2.20.1
>
