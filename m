Return-Path: <linux-renesas-soc+bounces-12295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84026A1807E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 15:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAFA93ABF3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 14:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7054B1F3FD5;
	Tue, 21 Jan 2025 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iisyNLYe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1251F3FD2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jan 2025 14:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737471146; cv=none; b=GCfV6nSaeQYIQBneW+6yO9Nwh3Kvhw6WUT3ik5Pt6m7BAQYkxhS6/95KZYQakrQhTcVEiByQSgz9GCkbIpJSVy4N+zyoX9Qo5S5uTCh/0aXajKbTbtoF8PeTYCmWAjYB98Tkv9R/NzZWfabAIObgF6nP915ycaiFxNORGHiKciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737471146; c=relaxed/simple;
	bh=1egCw5s7NzI5hirqMoJt6T40crlHeSKMkXe0VeZC6QE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=STFMcV31xcQi1zvRvVJtAP6aPSVq4Ga6GklwtuPbsAMYNvivNuYeg443cIey5XxsQWEMhHC9QwT1GCxFX6UozM8tVSpRaL4cTeTF43ovBhIOXWruuBpLBr5FgImSg8LlX8V881ddnC/YvkHrcliVgNlleMYjR3ZM34OeB6FC1DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iisyNLYe; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e53a91756e5so10217048276.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jan 2025 06:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737471143; x=1738075943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sniiGLBlwlwVQE72YbXn9tSIJ0uzVlORMQYMI+fWlc8=;
        b=iisyNLYeghComOYUq0dH6OeL3uL76ksheekE88EmFPCst3ryjT9Fwo0BZtmOZKLX8i
         5Ndga9lDKB24wIad8nlIg157ZQjBtLJi8M1xAQmgvs55Hf4dekSmVx4M9ROmwvba9yQ+
         vkjr3+ic6KKuJIlHdV8PYR55In3qmUq0WmI0iSR7UNscY9+GDhOHjlXiswj8rvZB0Pki
         jg1ZhZc24GOuNyDeMTNPhA+c/wzfoVHwCzutQz+Q5MkVV1ZK6cRaZk5oYYH/SF3h+Sla
         FdfAU+ZY8wWNUQAFVZSA5hOELzIAQpJ7EFck29NgARvAE6qolhR2wWYWO+8qJ0mdl1bI
         bbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737471143; x=1738075943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sniiGLBlwlwVQE72YbXn9tSIJ0uzVlORMQYMI+fWlc8=;
        b=SEDEdsBBTLhQpYIlhGtsA9gREbsZVcH8CoNsG75TI76xMyzAz2m+EOqWFAVsRZYlMA
         pnfKmWrEewrj7fyt1jX2GLRe6Zpr0h+VoqtUV1wGgS6DSNq1Q1xmHMJDG+GWtWf84cqu
         K9bmmM++4BYV4yCnJBLECHwpfJoWc6kBL5o1j6re/KWrMcT9tdnS6bJ+PDcux53UkVcD
         55w7kX9xWJI1QVVUbxz5PGdHX5g4m6GeMgXjro6dCMHhOvJbghCvIdsUcxwGQyVRkQlS
         ell3XSYshfZ6sseOynLpbyuuK2iPDVBE1fPcrCW2NjowrFZLMlLx/kVCZvYFBkR7OiSQ
         aXSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYQSI9TG4UWwyXbI5HEab6vPSyJfzyTGryHqtxTNATNEoSgXKCx70QE9KA1QmMYCogX5PndtqCCcCFfPQYEefA/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtczU6d1KmCeJ9PpqokFLX5BKAPjmUNdf3cfzg1e+RfBHiYU8I
	/nJyd0dr5NXWf232CeHkml1ME3Dmkti6cppaTULb2louJtDr7fCp9UlMdw96Z6WEE9eK+KhBTRh
	9hfhaCYo8apPnyqubelz10Yp+ZfdcyRnCFs6WGg==
X-Gm-Gg: ASbGnctLlHCvhiJv3QohBfStTZJj3S2jFZY4HbdrhMc32JWDCFoTm7D3vv0IzPwc2iY
	5mOLr/p3OKqHHBwKZTkvEjZF2EJWYSfD/mBDYXxqbmWW2e/ddEaJXogQjsnhvF66+kQ==
X-Google-Smtp-Source: AGHT+IHAR8Oh5IZMK/EFhUxy82Sms5gJQlwLhipbAW1ZqvwX6pE5x6pYuPH97QTlNrx+1G0xVn/kn1tGS1MQfWri5Fo=
X-Received: by 2002:a05:690c:690d:b0:6ef:5119:6f39 with SMTP id
 00721157ae682-6f6eb90d631mr163457467b3.30.1737471142696; Tue, 21 Jan 2025
 06:52:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
 <CAMuHMdVLvCNZtc2qYrsnMz5L0Hyr70x-Hj5NA8izYBH2tf=yFg@mail.gmail.com> <Z4-s9UHBJZx9APeE@shell.armlinux.org.uk>
In-Reply-To: <Z4-s9UHBJZx9APeE@shell.armlinux.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jan 2025 16:52:11 +0200
X-Gm-Features: AbW1kvYT3J50S3fCbdFz3TPsLp6pmDCYH3eh_cCAu0j-x_otJ6Yo49o0bUKeGAI
Message-ID: <CAA8EJprB9tBoqUaZKnGrJQVPpRA86ynB6k42dOCW7HG-VTfhbA@mail.gmail.com>
Subject: Re: [PATCH] ARM: cacheinfo fix format field mask
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Jan 2025 at 16:19, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Jan 21, 2025 at 03:12:13PM +0100, Geert Uytterhoeven wrote:
> > Hi Dmitry,
> >
> > Thanks for your patch!
> >
> > On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > > Fix C&P error left unnoticed during the reviews. The FORMAT field spa=
ns
> > > over bits 29-31, not 24-27 of the CTR register.
> >
> > Please add
> >
> >     This causes a warning on e.g. Cortex-A8 and Cortex-A9:
> >
> >         WARNING: CPU: 0 PID: 0 at arch/arm/kernel/cacheinfo.c:43
> > cache_line_size+0x84/0x94
> >
> > so people find this patch when looking up the warning.
> >
> > > Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
> > > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Closes: https://lore.kernel.org/linux-arm-msm/01515ea0-c6f0-479f-9da5=
-764d9ee79ed6@samsung.com/
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > This fixes the warning on Cortex-A8/A9, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Note that this changes HWalign on Cortex-A9 (various Renesas SoCs,
> > with 1, 2, or 4 CPU cores):
> >
> >     -SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D<N>, Nodes=
=3D1
> >     +SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D<N>, Nodes=
=3D1
> >
> > On Cortex-A8 (BeagleBone Black, i.e. AM335x), it changes HWalign,
> > and causes a warning message:
> >
> >     -SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=
=3D1
> >     +SLUB: HWalign=3D16, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=
=3D1
> >      ...
> >     +cacheinfo: Unable to detect cache hierarchy for CPU 0
> >
>
> Also, has this been tested on CPUs that don't implement the cache type
> register?

It returns -EOPNOTSUPP for anything <=3D v7 (or those v7-but-really-v6).
And those CPUs are required to implement the register.

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!



--=20
With best wishes
Dmitry

