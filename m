Return-Path: <linux-renesas-soc+bounces-12551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57389A1D42F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 11:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 963843A7C5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 10:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C541FDA9D;
	Mon, 27 Jan 2025 10:11:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223651FDA99;
	Mon, 27 Jan 2025 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737972675; cv=none; b=fgL4cLpY57KTd8g1xPI0e7fzwAsevUFtMtET0yKw/SqZ5NneYXaruBKEesawpAcVYRkjO1xgJYKlHomMaVjAgIWwS8OEM4yxfM1Oyz9rI6KCnn/kv+RmumLJUxmlyGoHngq1OZPDnkzu2DQySfUXvJ85Bpb1oDbQFuse9fEsGHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737972675; c=relaxed/simple;
	bh=+/eGD0dm0u5C8nJ8xe0IJ0r5Zm8pSInYDED0BjYx/rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSQsFA41Vcn3DlP1BfxLfc3w/fP9ihrjVC0IDQ/nuoCjow0XM/YJaOZHvrT2hRTwg2JtKHOs8FTy999knHL0K0FYEoie2j2Yp2riOT/dDFdY0gd1dwa/PGZySQsmeIaLUb2Sn9gPtSWFbt3rbdFiLNGd1+QSNsKg67+FPgYS8x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso9430608a12.0;
        Mon, 27 Jan 2025 02:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737972670; x=1738577470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rXimrNVmUJ2T+1xkOIS6Xv2e4XJVVv+Odxg6YrQzcU=;
        b=ddNSKWUj2YmdfxGfYi4WLqYm3266d6Wtr2eOuJdbGBeocA90QFkRbo5zGHSp2OZ9nM
         gsUJXxD4UkVFiwP3Ccdxq5hpgmFLusu21I2BqmiroVJQszsAISUQyUNqd+8oYNj7pez6
         z+Q6HIPRfjvROcujmF4fNDq16MgH5IQxUatIkyK5c42jR/2KdbiTSiOA6S6I4wGh+HWR
         XgrBmDCosMgMhH+sXEJ2h593vQDR4XvX5JokH4EAvfsoBhT+qD15eWXPAtHKW5IbWBii
         mDNtO9/qQcBywfqb9ue4pWWkcRYerYmVqJQVvl4WefGbmfDx7+LkOT0DcwFe8iTPdBsi
         XS1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtxxpDVJJSx/YPAfsa39uuYBSRb0QW+kfvR/fbMvfllPZPtYdnPfNhwseQyH+/nKC6Mv0o3hxSUW6DoUWLtdwKW8A=@vger.kernel.org, AJvYcCWVgVNCY4u/ChqvNxKOhC4v7sxzuLDR+a1KATJfWwQyhMtvWZKqTPmmnYdpS64AGNo2wiCXrsnpnOIwm5o=@vger.kernel.org, AJvYcCWfDnzkC3PJ01kDomtAy5lQiiSVqHzJqHb+f9TZI5ArcytEE60ji43BMranq54D6xp2ReOR6LPkKJJAMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgWHGtw+r2uiDsHkPcrZOa4FEUrXMNLToNdB7eFfBcrYyEa1ms
	GI0PRAsI1pepCII6ySB1TZYcunKq84W8EC07/ULXC93jfrz43n3S2ybbpC2M9bQ=
X-Gm-Gg: ASbGncvdOrPrvx6VsX4/7kBL97mwAiMbkGyA6CcKL5CyUmKi5J5X+EDbWxw3VUVkn3l
	1fs7YMZfyC9ZNq+AFT0o1Bo2BIGKNoRWW1vTLhLa6YM6gvnhRsPORLlbR+8Is2g7nbdWr0Kdx1N
	D9CvCbe9+vS+w/ysj+KohCC57mEQHN16FYihpmgujqxEhg1fYtsoHft4XMdIuzbqG0TI36MqHmv
	Sx+lt7J/8+gnqBydsi7ZlA2Cxcq9q8Gn50tZXqD7PZp+2DeQt8IaBFSEuogC98Z/nABI3DhKojt
	96ZbRYGWWihrNihOlwNkeL02eA+xVGc6i7OU/jmKtno=
X-Google-Smtp-Source: AGHT+IG7HvEgRaRL4TM44K3YKbA8gxG16rp1cDIelqU86itu7eY3HUqMmjex6iznV8Krk0VttUTE4w==
X-Received: by 2002:a05:6402:845:b0:5d0:cd85:a0fe with SMTP id 4fb4d7f45d1cf-5db7d339cdamr32609426a12.25.1737972669856;
        Mon, 27 Jan 2025 02:11:09 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18628919sm5249996a12.25.2025.01.27.02.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:11:09 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5db689a87cbso8531135a12.3;
        Mon, 27 Jan 2025 02:11:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGHx4Ixx+9dMfwTV5QUbV9hN818b4ukP/3wkq10FxN1atz8b36CvVLgYw9bEU7bag1F7p964OiVxkMDA==@vger.kernel.org, AJvYcCVs0RJsg9b5p0I1j2CDK/upLaBYUB0/kUNy8ki0OrdgXVX87fcCpLBrTkrcclou9qaSGOoinUeldUq3XeqdKJbMtwo=@vger.kernel.org, AJvYcCWjEl9Tek1SOHhhRe1OtOcvWqQOFN9Jdg2zmliNPSf6sKfDQcuYPsPeF51ik4Dr2+9aJX3313EzQsJXrPc=@vger.kernel.org
X-Received: by 2002:a05:6402:2711:b0:5d9:a55:4307 with SMTP id
 4fb4d7f45d1cf-5db7d33933emr34599399a12.22.1737972668435; Mon, 27 Jan 2025
 02:11:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126064521.3857557-1-avri.altman@wdc.com> <20250126064521.3857557-3-avri.altman@wdc.com>
In-Reply-To: <20250126064521.3857557-3-avri.altman@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 11:10:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUjkwgo+PZBfcp4c2nqQcdezzo=LCAjmHgLhUhS2FcSRQ@mail.gmail.com>
X-Gm-Features: AWEUYZkAjkEIij01nJVLZw9KKkp3I5vb0EaOCUTIeqdx54OnKkAd7GgPwZhhdbw
Message-ID: <CAMuHMdUjkwgo+PZBfcp4c2nqQcdezzo=LCAjmHgLhUhS2FcSRQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] scsi: ufs: Fix toggling of clk_gating.state when
 clock gating is not allowed
To: Avri Altman <avri.altman@wdc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>, Bart Van Assche <bvanassche@acm.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Avri,

Thanks for your patch!

On Sun, 26 Jan 2025 at 07:48, Avri Altman <avri.altman@wdc.com> wrote:
> This commit addresses an issue where `clk_gating.state` is being toggled
> in `ufshcd_setup_clocks` even if clock gating is not allowed. This can
> lead to a crash with the following error:
>
>     BUG: spinlock bad magic on CPU#6, swapper/0/1
>      lock: 0xffffff84443014e8, .magic: 00000000, .owner: <none>/-1,
>     .owner_cpu: 0
>     CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted
>     6.13.0-rcar3-initrd-08318-g75abbef32a94 #896
>     Hardware name: R-Car S4 Starter Kit board (DT)
>     Call trace:
>      show_stack+0x18/0x24 (C)
>      dump_stack_lvl+0x60/0x80
>      dump_stack+0x18/0x24
>      spin_bug+0x7c/0xa0
>      do_raw_spin_lock+0x34/0xb4
>      _raw_spin_lock_irqsave+0x1c/0x30
>      class_spinlock_irqsave_constructor+0x18/0x30
>      ufshcd_setup_clocks+0x98/0x23c
>      ufshcd_init+0x288/0xd38
>      ufshcd_pltfrm_init+0x618/0x738
>      ufs_renesas_probe+0x18/0x24
>      platform_probe+0x68/0xb8
>      really_probe+0x138/0x268
>      __driver_probe_device+0xf4/0x10c
>      driver_probe_device+0x3c/0xf8
>      __driver_attach+0xf0/0x100
>      bus_for_each_dev+0x84/0xdc
>      driver_attach+0x24/0x30
>      bus_add_driver+0xe8/0x1dc
>      driver_register+0xbc/0xf8
>      __platform_driver_register+0x24/0x30
>      ufs_renesas_platform_init+0x1c/0x28
>      do_one_initcall+0x84/0x1f4
>      kernel_init_freeable+0x238/0x23c
>      kernel_init+0x20/0x120
>      ret_from_fork+0x10/0x20

Note that after "[PATCH v3 1/2] scsi: ufs: core: Ensure clk_gating.lock
is used only after initialization", I no longer see the above BUG(), so
I don't think it's a good idea to include this log.

> The root cause of the issue is that `clk_gating.state` is being toggled
> even if clock gating is not allowed. This can lead to the spinlock being
> used before it is properly initialized.

Which doesn't mean the underlying issue no longer exists...

> The fix is to add a check for `hba->clk_gating.is_initialized` before
> toggling `clk_gating.state` in `ufshcd_setup_clocks`. Since
> `clk_gating.lock` is now initialized unconditionally, this is for
> documentation purposes, to ensure clarity in the code. The primary fix
> remains to prevent toggling the `clk_gating.state` if clock gating is
> not allowed.
>
> Fixes: 1ab27c9cf8b6 ("ufs: Add support for clock gating")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Avri Altman <avri.altman@wdc.com>

Seems to work fine on R-Car S4 SK, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

