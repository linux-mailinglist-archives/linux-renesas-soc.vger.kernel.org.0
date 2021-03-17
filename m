Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F7533EC23
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Mar 2021 10:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhCQJEO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Mar 2021 05:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhCQJD6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Mar 2021 05:03:58 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00777C06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Mar 2021 02:03:57 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m22so1829298lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Mar 2021 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LSG6SWxWJuHPcTGZsM8iUu3d86J+/lNwY6mDj7224WA=;
        b=UGKLpSXdDmoB+C4NuBT8KY4xtf/f28WMZIQHnb5lsZlIP5bX+B0ZCW3guIxXfIUPTR
         mLPLkFV8Ea+Z0pM6G0nf/gC5Td0xkOS52ArLG/gfraw8twsUSc2o4w+7Tyaqh4ryuYaC
         RaggmExdqrKCsIzA+ymfQcyKbeDo7ykq1FizuQk4K0j8HPM3k1nOpXVZx0nkVnyyoTGQ
         D/dmO0xFB3tXmETETSKdDCUaDtTmB7K0pl2X42EGCKzhKia6eReXDBQnouuK9U/8CtpC
         ULzxjfFaI2n8hLV+ua7de19XM0PB60iiWyYhhR2kf3Z7c7A9pvwJl8VITeAy56Vhectc
         NO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LSG6SWxWJuHPcTGZsM8iUu3d86J+/lNwY6mDj7224WA=;
        b=pzH6GQEqFx6pbPX3rycZ23uV0hu9t9Fisak4+Y2DLxoOH93c14s9vTE9km362Wtwv2
         M3Lacz5eh0B9Xrg0CYRkzJBcmErT6YmjlmmOSw2KMzpQn3I7SyjZSSQ6bTB0tKenQTVM
         vS49zNvIfAkNwghAWSc8u6fyueYEi1WbsNoS/TvoPNTUulgrHnV+9kOFwtxVuwHa5YM5
         cXEGc8AMRrJ3BpW1zrFYaN8dPjeho+Zu7i7DBkjApTF6gCZtxOmDRQG20hQBgEkWJR/a
         P+EhfjzFfGPhrahMSkQqyU9huKFhpLR/dzp3sNaJ4BB8VmZo1GbmYunmqdO2tLSPKoU9
         dIDw==
X-Gm-Message-State: AOAM531m4nlQkd/KD/LH2VjB91CDxfj604dihe7JhidMZyhFMFnGkEz8
        bCNf4/VixmSNIhCU6b7+40nkHQ==
X-Google-Smtp-Source: ABdhPJz+AxefPj8WNgBe0rDOynqt7C842Pdth59qNgbPAVbqkKdtUk+HhyBcioxs9E9ap+QPhVvcKg==
X-Received: by 2002:a19:81d0:: with SMTP id c199mr1749394lfd.62.1615971836512;
        Wed, 17 Mar 2021 02:03:56 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id k6sm3430408ljb.110.2021.03.17.02.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 02:03:55 -0700 (PDT)
Date:   Wed, 17 Mar 2021 10:03:53 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hoang Vo <hoang.vo.eb@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] arm64: dts: renesas: falcon: Restructuring
Message-ID: <YFHF+ell2AsMNj61@oden.dyn.berto.se>
References: <20210316154705.2433528-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210316154705.2433528-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-03-16 16:47:02 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series restructures the devices nodes in the Renesas Falcon
> DTS board stack to better match the actual board stack structure.
> The DTB generated after this series is the same as before, according to
> scripts/dtc/dtx_diff.
> 
> I plan to queue this in renesas-devel for v5.13.
> 
> Geert Uytterhoeven (3):
>   arm64: dts: renesas: falcon: Move console config to CPU board DTS
>   arm64: dts: renesas: falcon: Move watchdog config to CPU board DTS
>   arm64: dts: renesas: falcon: Move AVB0 to main DTS

These looks good to me,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
>  .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 47 +++++--------------
>  .../boot/dts/renesas/r8a779a0-falcon.dts      | 39 ++++++++++++---
>  2 files changed, 46 insertions(+), 40 deletions(-)
> 
> -- 
> 2.25.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
