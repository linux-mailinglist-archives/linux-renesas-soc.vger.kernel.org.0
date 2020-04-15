Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902CA1A98BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 11:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895445AbgDOJYX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 05:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2895375AbgDOJYT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 05:24:19 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4579DC061A0E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 02:24:19 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o81so10957330wmo.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=25hsR70J4xkR7QjWib9TX4C/RIJl6X5HgsLKdDMfcIM=;
        b=MZISFk0+SGdYrIGleUjYyNyFlKlBZtpvcsFKyJMVxKBrgMGYtPYkcBrS4bRdkEp/7t
         IW0OdNkkEzJjOHq32c8nyyFfVBOA0CWrvJjsIloNh7+9VO5CUroLlbNB3EdfC+VubzHW
         RKiPdet4ElIC56WiuMenvtixe2coFc0mPjdD569+2OT9S+0GbYhuHmAMDdAJ2/wquaHH
         afuwBSmcYlb9MymeQAxl6jMcXisGmnphb0nXiXzgHpPoKvx7ynmkS1jh5aDHDA3xUcag
         t1mwgvkRTAPwn/Ml63NOIpJfKAurHTPzOMenfettsfMf8meyF+86UE6hMxa9KMhNgPe7
         /dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=25hsR70J4xkR7QjWib9TX4C/RIJl6X5HgsLKdDMfcIM=;
        b=WuB3mQa995HIFriol1AP7fpvAQS3K5VX1WPWKFRD329oXy519zRfztCiXmUxQrFDSf
         IME5sg1cGLuMxH9yYSgFzYq1zZ73i9RD/LOTy3n43trg3TkaXG2EgATa/igtHLhm6dRi
         Z/h5TOwFOjXafhx1GYKd2zZ/JLAzukop0eGLQxZ7pslHTGbRJ2YzEKL63nf+Qi+afKQn
         bx8WsEdQxzyQUSQYh4ZdhRkJ/PyM1KuVsHTUi+x9uTqstMC/VQo8t/o9jHoxrARIUNqi
         DraPqRkBt3REeoJbbhpcVHPoyXN0FDuzIPj1Ay/8HKhLBdCLTKAnmRaWostCctjRXAGu
         VsVA==
X-Gm-Message-State: AGi0PuZEY6VH1H/tZf/KaKUHneBS69rlXGOfw1X8uN9PH5kgE55eJEtJ
        bFN1K/aH4SQGwOySJOqvXZHI0vqq5CE=
X-Google-Smtp-Source: APiQypI1L9Xj03pMeY/s2kTnKETE0bYjImrIZAgEBCHLd+qOzGsuktY5U9KyEtfeFWAbhU8Q4g0UeA==
X-Received: by 2002:a7b:c10d:: with SMTP id w13mr4131241wmi.78.1586942657950;
        Wed, 15 Apr 2020 02:24:17 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id e1sm12258399wrc.12.2020.04.15.02.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 02:24:17 -0700 (PDT)
Date:   Wed, 15 Apr 2020 10:25:17 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org
Subject: Re: [PATCH v6 3/8] mfd: sm501: Use GPIO_LOOKUP_IDX() helper macro
Message-ID: <20200415092517.GF2167633@dell>
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be>
 <20200324135653.6676-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200324135653.6676-3-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 24 Mar 2020, Geert Uytterhoeven wrote:

> i801_add_mux() fills in the GPIO lookup table by manually populating an
> array of gpiod_lookup structures.  Use the existing GPIO_LOOKUP_IDX()
> helper macro instead, to relax a dependency on the gpiod_lookup
> structure's member names.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
> While this patch is a dependency for "[PATCH v6 4/8] gpiolib: Add
> support for GPIO lookup by line name", it can be applied independently.
> But an Acked-by would be nice, too.
> 
> Cover letter and full series at
> https://lore.kernel.org/r/20200324135328.5796-1-geert+renesas@glider.be/
> 
> v6:
>   - New.
> ---
>  drivers/mfd/sm501.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
