Return-Path: <linux-renesas-soc+bounces-12292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8801BA17F71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 15:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 678973A8883
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 14:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3D01F2C58;
	Tue, 21 Jan 2025 14:12:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B1063CF;
	Tue, 21 Jan 2025 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737468750; cv=none; b=QUgBwVe5OX8cetRS/wGiJYWM0YNffuk5mYvmlND4QSNNAAuDXwLdq+8gaRZtWjdqTimko14SlArD0gLupd2hFYr0hawADZ9yb6Mo9Q3m8TcB4EuZmOVbtsatMMmyPbik6RE0SlGtxqPd2soKMNBHQYLVtg1Pgdqx9Oq7BOYmwcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737468750; c=relaxed/simple;
	bh=8d1xyGGRRUDbsWoAx4CZpONU/wdEvYDRMJXdsa6NHF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okQaNlc1dYywVfuDrC7cGiCtp/YVM6tvSfUt0mbgt9dSQZfiwF37GabLtWNbhkM1RhYd/Rxc54IwpKnkdL5cTu13Z4WFWxTa+Ppp3J43zQoQGA8xassO+CK44N6QkZ0zRne6rO/b/ZhF1aEfyfP7Jd32PhIKRhr7vTfA+/ZkIEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d8f99cb0d9so44982376d6.0;
        Tue, 21 Jan 2025 06:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737468747; x=1738073547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8oTZmseEszzoElc60lFvfT022jB9In7rPk2BcTBU8M=;
        b=VadM1aykxpz89q5qsHUlbHD4u1LY/9VuiolLuFaSnF2hWN/JDCpvZ/g2tufCoJUGcn
         IOn3KJfjqlYSJR09eCQjol+b/wdqOuEs6eUuFIQI3N5jD3tHanaHTgTvzSWvhcGz4Bn+
         eEVd9LBgm+ovT1adw4Qli7ueqLJPdwlhaQ+CEdxd8B+LLhgboobExFbivkd2JmtgFUmE
         gX+Smmr8sSndPVnzIlorvhrYQjUfJMd995+9g3GVB510XtryBRPzbGjjCmI2pi0BWEzj
         qNA1VxnisrUWJHU2Jyb0GT9fZxjqjmQxsXZXbxcgEhhnDviC6Kj1zp/+7582s9GGsA8H
         gasw==
X-Forwarded-Encrypted: i=1; AJvYcCUDWEuWt/xDPtjBZbFvGLeAIZYN8NuBl8wBT1c+bzEAYw0SD6cJlW+/UG/R91gkRrQrfFWVdQc1hiX4sYBLJAhuch0=@vger.kernel.org, AJvYcCVEDrKD1WAtmIITHrMLTP9R5PXYQSvMyLms3TrZjchABEvtpYCkRxNOLC++SyMxa3pxJi8wehETCVcrQoc=@vger.kernel.org, AJvYcCXddekIi2YzIRSrtW9LxifPbKNSIsqJBeUj3mFcIkZrUlUJquyPXFpDMwQ3yhfGhmUovyNQxB4THmhYoIzepV2fJxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnGdXP+1Of4s4EwpUNJMeTWvmGdwKkzGTbhWCgLtmcMPXktVac
	vrtVP2kMBlU9F/ExW3M/WN1msuirJ3fgTfxaeTGjxfrRazvI+LmSj9VxowGN
X-Gm-Gg: ASbGnct35sfcwR35hI9CuOoXO0TQj0w861QhVId7OLStlzPGMUmB3hdwYjZiBeGHals
	ZYiH+zIGn+wvNRnz14V3uFvo5fh7nQgM/BRPhmf7/QP3OScVHTZaEvUpgKX9cLyMqEX1vWTyd1o
	Q+7vohRZPEqA8MbsjjlrGp/9I2yxyVyYVj+PCe5HE1nHi3MYkpyE8t5m9nhYF3RJp8EErPMXZbI
	hnhGeCjBSTzwtwhxA+kXFaXnE1c7hnwpop91xii9loNxXAmuDczgxAuvKMwV1U7zMhlpSnlf5vJ
	n438pwRIeGVT4+guP5Eym/yY++nO91y7Zd+2
X-Google-Smtp-Source: AGHT+IEn3VjNdm5CPHmRFov9QQUq1n6q8ABz4btH0afeSOzDiKolZ6JUe9qB9HNxLn0PY4II55aZWQ==
X-Received: by 2002:ad4:4eae:0:b0:6d4:36ff:435b with SMTP id 6a1803df08f44-6e1b215fa24mr277876386d6.20.1737468746750;
        Tue, 21 Jan 2025 06:12:26 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd39cesm51263286d6.82.2025.01.21.06.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 06:12:26 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6e4d38185so551149585a.0;
        Tue, 21 Jan 2025 06:12:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUn91FEUYKdo52jdABOOUeYmibDjfCywA8S+nHvIy24tPDcdNkNxpw0IHxnuhBNFUGGGX/6utZ54D9Ye34RKY4eAxE=@vger.kernel.org, AJvYcCVJ13p7FxOGtkoWB6/jcknxKYxM0dx8SN++ECEk1Ljn8TcTe3bjFIja2ZOoW1oTvc1bD6vtaAhxtw7oSokYLOBAYIw=@vger.kernel.org, AJvYcCXwMTT4VtZxf44ZyWiUL7tU0Ynm0LazcXN2ZZbQl4bhAVkWMZFq2/IN0DTF5AV8oeV7lmWtcOSnGaQlTF8=@vger.kernel.org
X-Received: by 2002:a05:622a:134c:b0:467:6dd9:c961 with SMTP id
 d75a77b69052e-46e12bbee8cmr267144211cf.48.1737468746109; Tue, 21 Jan 2025
 06:12:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
In-Reply-To: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jan 2025 15:12:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLvCNZtc2qYrsnMz5L0Hyr70x-Hj5NA8izYBH2tf=yFg@mail.gmail.com>
X-Gm-Features: AbW1kvYsY55i73e1PVArL78wxeKH_sS6kvt1IZKg6bpigHUm_wzZQ5psfq8v81I
Message-ID: <CAMuHMdVLvCNZtc2qYrsnMz5L0Hyr70x-Hj5NA8izYBH2tf=yFg@mail.gmail.com>
Subject: Re: [PATCH] ARM: cacheinfo fix format field mask
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thanks for your patch!

On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> Fix C&P error left unnoticed during the reviews. The FORMAT field spans
> over bits 29-31, not 24-27 of the CTR register.

Please add

    This causes a warning on e.g. Cortex-A8 and Cortex-A9:

        WARNING: CPU: 0 PID: 0 at arch/arm/kernel/cacheinfo.c:43
cache_line_size+0x84/0x94

so people find this patch when looking up the warning.

> Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/linux-arm-msm/01515ea0-c6f0-479f-9da5-764=
d9ee79ed6@samsung.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This fixes the warning on Cortex-A8/A9, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that this changes HWalign on Cortex-A9 (various Renesas SoCs,
with 1, 2, or 4 CPU cores):

    -SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D<N>, Nodes=3D1
    +SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D<N>, Nodes=3D1

On Cortex-A8 (BeagleBone Black, i.e. AM335x), it changes HWalign,
and causes a warning message:

    -SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
    +SLUB: HWalign=3D16, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
     ...
    +cacheinfo: Unable to detect cache hierarchy for CPU 0

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

