Return-Path: <linux-renesas-soc+bounces-26187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5C7CE97C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64A29300E7B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 10:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F132D46B3;
	Tue, 30 Dec 2025 10:54:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772142C033C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767092072; cv=none; b=IjGbBnMXm9+plwQX2YCLN/3Lf7ZswZ/Z3xZheKHxc6lms+XhOukCMDUcw7JjoUEcT6NYHwPyHfUfCueVBZMjyjJd9TjfamxkjsQpMN5TeuTZ3UdnvJwMG30wYksvsftyrSSl7z0i14FVy9aSQ5ySeR+OkYJETLRe60NLFCuGfcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767092072; c=relaxed/simple;
	bh=n+dXJoOKZeBbPUciWDQkGiNgkFZrYi7IYQf5OWjWcCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcPI8TiN227I4BDustMgoBLBWgKTkFFT9LWRlMSkPMPqGM6azyUn4S7JmS/JyNrUF6edl5NJoEfZf2AvkYeMeNgHBogO/Tn3HPm3F4/Qt+Dp1+3ruiykuHb1kVawSUE0Byc1Rc9xI9tfaYEtdSz94CPiNHPzkQWQmmMmX6fFIVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93f56a97064so2317044241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 02:54:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767092069; x=1767696869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzvD8u2a9iQw7SPbPh5M/gD9i8/QWB7pr8kaxpQDqVY=;
        b=B9QH9C8tgRRjmhTvYI9CPBQKqEKGQT6afGjR5LBSQN6m2wq58K18OwBBUO/Wcj4k0k
         f2TYxXY91+YxZa3EIXodXU4OpH+81GI1UpSnoAyLn7FmF368kZT7MZE3ZSnVNXgswk5Y
         +YWh1CCV2EDBC+bn34O8bu524DbyYqMZXMddqWYZcz55ZlY6pNRJRVr1/VbF8kkooXag
         A17Va8GgWT0KfN1V//nsi/2m4m9wm1aMSXt26v3vaLk/Tvuho45MRHJB6ORtrOylaGvc
         eoZGRflUQIuzlfz9EvO4h/xTo6sngsKriDBPxmM0Dttbulx3W5IRIxSCxMUwOFtl7LWg
         IMsw==
X-Forwarded-Encrypted: i=1; AJvYcCVnLTb6HZGHKV90gTVfqBrnUTZ5vAt0s95NifdyThT6fTTVR2Yl5M3p5qphYaJISNhjWxqTVwChtLqcSlDS7eaUhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqKXNdTTKKcvpC4zn25esp63FemnCLrV4SV0REiTQF3KiCyVkQ
	GTpr3KdQ7UBZwMRvVQedb0XOq/O8mTCHyXQArmStJTUxO8DpLEafzOzZdJ2bKq0+
X-Gm-Gg: AY/fxX6oJfQ2752XyqrUWnSxM0yamdwDae00OgfdnEXbKPsCVSieKK4JfWKLGz5TCM4
	aUjKlNz5oE1kLEdWGNWnvoLBSl87x9m71Y2jXSiwg3rA+P08z5XkqR2sqqcnxTZ2rBe9zdlbvkT
	pitKVhptVNwIdahoQssk33J8PNiaOaWOJ9QduC2KWTgePuztsgbiZZdAQe3z03IIittFTxZI2Dt
	/V5dl+wGg8x0hJ1kOe1q/5C+xf/aIaXS3fj7O92AtOSm6i5+hsblD724XJt65Kb+kGCtx0Y1orI
	fWiU5nInNk5xFIVcnHPQ9kp6lj4TUnCxG6xXKdKCSjxpK3eCWh9IYcUMdgQkgtkg8z+SsdsRsEd
	R7bzyuCylmZnCGq9EfOIhT9C4PUHmtKxq1thevlI1YpmTNQJCP4hwIjystzn2F8VfF9rY/GlmBp
	e9UX8JKt9dwgj7S72SaFvuxu15CkoaMwN1PI2PN6LXfzkavSZd
X-Google-Smtp-Source: AGHT+IEZgb4SRBhk9pxnJZts+LTn/hKcwrGVySnV4NOMb9C5MPgugzY/hyQZrGASlt+ziaAFbPmcQw==
X-Received: by 2002:a05:6102:5714:b0:5db:3b75:a2aa with SMTP id ada2fe7eead31-5eb1a67dac7mr10302749137.18.1767092069348;
        Tue, 30 Dec 2025 02:54:29 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1aad0d1csm10471512137.7.2025.12.30.02.54.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 02:54:28 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f542917eeso2338720241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 02:54:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8EnBCLXOhcq72aTchE8MeOVbJJy6lJgJS+FKU7Ntp9dyB5FpCEo3s2UwbbbL0I/dB1JG6xBuzIyTNMAF2kb0V5g==@vger.kernel.org
X-Received: by 2002:a05:6102:4a84:b0:5df:c228:288d with SMTP id
 ada2fe7eead31-5eb1a625997mr9697546137.8.1767092068698; Tue, 30 Dec 2025
 02:54:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki> <2556645.jE0xQCEvom@rafael.j.wysocki>
 <CAMuHMdVMFQebA43FJ53PBnd67C8fxWAC21cr4jWTGDwg-HV53w@mail.gmail.com>
In-Reply-To: <CAMuHMdVMFQebA43FJ53PBnd67C8fxWAC21cr4jWTGDwg-HV53w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Dec 2025 11:54:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWshJOjzD5DGzyRUG66jvPC6PPVBgaT=UdWy+XOk_T5Pw@mail.gmail.com>
X-Gm-Features: AQt7F2oPjvLlnFjiHoVfcNoEi_edNjmSUdAxY2W0zN_askdkWJqScjAbdJ5aP4k
Message-ID: <CAMuHMdWshJOjzD5DGzyRUG66jvPC6PPVBgaT=UdWy+XOk_T5Pw@mail.gmail.com>
Subject: Re: [PATCH v1 15/23] phy: core: Discard pm_runtime_put() return values
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Brian Norris <briannorris@chromium.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-phy@lists.infradead.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Dec 2025 at 11:34, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 22 Dec 2025 at 21:40, Rafael J. Wysocki <rafael@kernel.org> wrote:
> > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > The PHY core defines phy_pm_runtime_put() to return an int, but that
> > return value is never used.  It also passes the return value of
> > pm_runtime_put() to the caller which is not very useful.
> >
> > Returning an error code from pm_runtime_put() merely means that it has
> > not queued up a work item to check whether or not the device can be
> > suspended and there are many perfectly valid situations in which that
> > can happen, like after writing "on" to the devices' runtime PM "control"
> > attribute in sysfs for one example.
> >
> > Modify phy_pm_runtime_put() to discard the pm_runtime_put() return
> > value and change its return type to void.  Also drop the redundant
> > pm_runtime_enabled() call from there.
> >
> > No intentional functional impact.
> >
> > This will facilitate a planned change of the pm_runtime_put() return
> > type to void in the future.
> >
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Thanks for your patch, which is now commit caad07ae07e3fb17 ("phy:
> core: Discard pm_runtime_put() return values") in phy/next.
>
> This is causing several messages like
>
>     phy phy-e6590100.usb-phy-controller.2: Runtime PM usage count underflow!
>
> during boot, and s2ram on Koelsch (R-Car M2-W).

On R-Car Gen3, there are no such messages, as e.g.
drivers/phy/renesas/phy-rcar-gen3-usb2.c does support Runtime PM.
R-Car Gen2 uses drivers/phy/renesas/phy-rcar-gen2.c, which does not
use Runtime PM yet, but still relies on explicit clock management.

> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -190,15 +190,12 @@ int phy_pm_runtime_get_sync(struct phy *
> >  }
> >  EXPORT_SYMBOL_GPL(phy_pm_runtime_get_sync);
> >
> > -int phy_pm_runtime_put(struct phy *phy)
> > +void phy_pm_runtime_put(struct phy *phy)
> >  {
> >         if (!phy)
> > -               return 0;
> > +               return;
> >
> > -       if (!pm_runtime_enabled(&phy->dev))
> > -               return -ENOTSUPP;
>
> Adding some instrumentation shows that this branch was taken before,
> thus skipping the call to pm_runtime_put().
>
> Can I just put the check back, or is there an underlying problem that
> should be fixed instead?

I assume the PHY core should support both drivers that do and do not
support Runtime PM.

> Thanks!
>
> > -
> > -       return pm_runtime_put(&phy->dev);
> > +       pm_runtime_put(&phy->dev);
> >  }
> >  EXPORT_SYMBOL_GPL(phy_pm_runtime_put);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

