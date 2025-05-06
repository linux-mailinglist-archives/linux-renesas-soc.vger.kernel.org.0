Return-Path: <linux-renesas-soc+bounces-16717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15577AAC46E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 14:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ED6B521FCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EEF27E7ED;
	Tue,  6 May 2025 12:42:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542527F198;
	Tue,  6 May 2025 12:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535346; cv=none; b=HMxPzL6D2TPjciXqHmbsSfOPFg2gi9yxDXtWSkFhujn6q272eNJa6YJD7fOkwDURVbkqKcpUkEfMIUCOOOXVWIbtXEew5Q9ujm9y6jYO8rYa9KnnhROxL+LHl7cAtmXklVRGGMGAPrUZH3J+TJceVjnUIx0dstUVIXceUqvboqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535346; c=relaxed/simple;
	bh=HU9EGDp322J7O4wXqzbIkr8Ft6u6cjgXLOxMbhO4bvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7kjhq5xbbsAgCfgs6C11joNkaZ3g1+EmVNaPx+He0DGGyXIfsTfMGl7iyAlPjZ2w2oJJKzU20SZmX0/xdAEEiuvVSfKrsZP4zTADd2t8mzDVnC/oNQtbNigpgFxCLFHkEeWD/JhfaFKcQWO+PxSJLUd3Wgyyz0Hukz1lm50HGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4c32190386eso4674646137.1;
        Tue, 06 May 2025 05:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535342; x=1747140142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KktmeAFh0iInvvBLcrYESanNohFTS/OHe3yXdSHV54=;
        b=YGVeKVo8QXHEp7pP+/9+9JJzBfx+E54msuRN3o1soeW+P2lkdWSSCo2wn27Emh+JoI
         vW6dkCJqFAsOvwGIfQnoxRCuZQS5UqxY/9EW2sN45ddfJF/9yE09mKK8asjJQO8yXVQf
         ZMeGM0SGQ273YJUUy3FKK3aEHhEdnchMmBJtP++PwLTdjVNvK1Qp1hgmPsG+ZMxoketi
         IZ7CR3Yeg/adRL3SRmMdT/MGiefSmOzX7SHeuh2qsRiStrPynyNWwHwHDwfiO+mfhZaO
         pKGC49gn0VDCAjV8trpJ1a7RgJ6IaqoRwOXyUcMk+DaYzt4rZdubO03LEdBD47uXZH5e
         Ch9g==
X-Forwarded-Encrypted: i=1; AJvYcCVJxcRx7hTC5P6GLlkVOVc8RZp2T81hhxtnrbxe9lSm3JzBDHP6MESVemr/EHBDgTCiozrjwe1KRIP1x1s=@vger.kernel.org, AJvYcCVir0BpKW2se6WJva3Ovd8ni1++jAgVo/4dDYsbRNYT/QQ9Z34c+1iEcvYwcm/k+e59ZUfwImdVwc9wMB8iygZ0Mc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS1lOHS/hD0ANt4qJRoQFrm3cAlLoXRUXAA4P1h3oLqgMh52yX
	OuLyTy13wCTjPRJKCg33+q3ZEBvs1PM2HxXiDnehSwKJYbKXH9ONNaTdwfxR
X-Gm-Gg: ASbGnctnkt8BRpOrDCFGgcrWmal6nSJCMneC66NF324lr9BHvFObJ9Fly+5mPbBNiJx
	qh8maxOIdnR7mj6yIXXjKrdwqKG46quEmUaQU665aOy+cLnR+MD13d0DRlStEbLJlWpHxqB0GXL
	TFspskjWTuOXrIlq+w5SFVpIRpWaOfXrAfjnmF17dMLueEhdT+xPci9z1Ow+ZWtw/9bldyK24BS
	2dJEFwEX2TRgRA9VvePd5AXdJMhkmrv2K61x3eVcCSxnFZzgOUJzVoM5+oSIvU/LfHS4cdXsRN/
	yrzOZ5ITOYppIYoe9zb721o+eefzwc6m/IZdo+VyWdt8Aw1xqCzuAkqrPD/HvJn4yPVU96qbwdq
	YE836BgiphjDJXmzKiA==
X-Google-Smtp-Source: AGHT+IEa1NpEOt1JGhC9oLcld+t2aLwJFMEXOyDxhX+GCs4A+AA5T6pMxd1dNAURlhWxMzxYuUfYrA==
X-Received: by 2002:a05:6102:91c:b0:4bd:39c7:804d with SMTP id ada2fe7eead31-4dc628034e8mr1995725137.0.1746535342250;
        Tue, 06 May 2025 05:42:22 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4daf2671776sm1734251137.26.2025.05.06.05.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:42:21 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5240a432462so3559356e0c.1;
        Tue, 06 May 2025 05:42:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWplitGPHteppr8mYggyU6PDWi8qU3CQlsgDZzxeQY30RxvUZgjwELr8jX9XOL/pk6KbB+W23ObtPFFnnzK36eH5c=@vger.kernel.org, AJvYcCWukJbmqZRnD3RKvj148zqKxG7nuZP9SHlMIfBAQoZgYJmFb+byHDWef31pA69/BxeF9OOqvPnP4UabULE=@vger.kernel.org
X-Received: by 2002:a05:6122:3663:b0:521:b3ee:4970 with SMTP id
 71dfb90a1353d-52b2637e2edmr1645488e0c.2.1746535340941; Tue, 06 May 2025
 05:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
In-Reply-To: <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 May 2025 14:42:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmvHZPwppQR5OxB7QB9NOWxRWoVkiMFS-6ScdYw=ywTg@mail.gmail.com>
X-Gm-Features: ATxdqUHw7Q2NW_6-Xmvb7jxJeESiwPHSgjGO1YW2JZ65Esp2QlMbSSehpB67yV4
Message-ID: <CAMuHMdWmvHZPwppQR5OxB7QB9NOWxRWoVkiMFS-6ScdYw=ywTg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

CC arnd

On Tue, 6 May 2025 at 12:52, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 06/05/2025 12:47, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
> > ensure the Ethernet driver is available early in the boot process. This
> > is necessary for platforms mounting the root filesystem via NFS, as the
> > driver must be available before the root filesystem is accessed.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Same comments as for previous patches like this (even the same?): you
> are supposed to use initramfs for your arm74 boards. Even armv7 boards
> use initramfs, so network driver does not have to be built in.

Are we? When has that policy changed? Why are lots of network drivers
still built-in?  Making network drivers built-in for systems where
development is done using nfsroot has always been acceptable for the
arm64 defconfig before.  For things not critical for booting, modular
is indeed the preferred way.

arm64/defconfig is for development and testing, not for production
(which famous kernel developer said that before?)

> For example all of our setups use it thus we do not have to populate all
> other vendors with our own drivers.
>
> Sorry, but I am strongly against such change. Kernel is already way too

The kernel will grow without this (it will just take a few more weeks ;-),
so that is IMHO not a good argument.

> big and with KASAN it does not fit to boot partitions in some of the
> devices (and I cannot change the boot partition size, at least not
> without big effort).

arm64/defconfig does not have KASAN enabled?

> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Doh...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

