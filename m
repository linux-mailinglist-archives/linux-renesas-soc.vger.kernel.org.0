Return-Path: <linux-renesas-soc+bounces-938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555A080EBE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 13:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDD70B20BCD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 12:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE1E59B41;
	Tue, 12 Dec 2023 12:34:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCBA94;
	Tue, 12 Dec 2023 04:34:51 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5c85e8fdd2dso54732597b3.2;
        Tue, 12 Dec 2023 04:34:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384490; x=1702989290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gixohUWj8lEiiL/Hj5BW3YXAXVJeKoara5/HJCCibOs=;
        b=tvqwmf5X0bKIkSsGsfli/uzIYMErwTrYLF2TE5D3aa0Y1E3nHQBpmgNSgLkz4LOlct
         xEXABlyggoQyWdr5rJtD3qkwMxCPk3iPNXc1P9YFZJHpPF8qf8fDfVgc+sH8v4wVmLgM
         yjKWlYo/qZW40ltAxzsHgXoJ9cv/JdZHiMfW5c2KmqbxP0uAKtZl2RmCFJl6HxdAtgkt
         FVHNa8pukLxQr9i2IDibRoFCwfawrFWm/F9LJ+QGsX19epjyObCAk1RLSh4nHFkz54cc
         TV7BXHcBQpCdrGdIcCuv8tD/UginQRrD2OkyawfZPfartIhoOO54+L4udLoaC8DuJJY8
         we5A==
X-Gm-Message-State: AOJu0YxdpNKHQTZfkc7AN3vnvkldknJWPk4vExF4wTPyzN0loWJbkzTK
	JdPadsnc//Iwd5VC8rDgl6mFMm3k0rqI/w==
X-Google-Smtp-Source: AGHT+IE9PJVHZ2P+o2snQyFgfEbNDWXuMm6RxRdeV64xGo+fhDF1BBnEBkd2bL4O+96eTy7v6JXr8Q==
X-Received: by 2002:a81:c202:0:b0:5d2:1b58:174 with SMTP id z2-20020a81c202000000b005d21b580174mr4678183ywc.25.1702384490172;
        Tue, 12 Dec 2023 04:34:50 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id u13-20020a81a50d000000b005cc8b377fe9sm3678678ywg.121.2023.12.12.04.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 04:34:49 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5c85e8fdd2dso54732307b3.2;
        Tue, 12 Dec 2023 04:34:49 -0800 (PST)
X-Received: by 2002:a81:71c5:0:b0:5d7:a9b1:eb29 with SMTP id
 m188-20020a8171c5000000b005d7a9b1eb29mr4793745ywc.78.1702384489333; Tue, 12
 Dec 2023 04:34:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208113218.3001940-6-ardb@google.com> <20231208113218.3001940-7-ardb@google.com>
 <CAMuHMdWewWJ1msJTcPNcbAf296gt+Kait3ECXjsJrSN+uerWyA@mail.gmail.com> <20231212122955.GA29310@willie-the-truck>
In-Reply-To: <20231212122955.GA29310@willie-the-truck>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Dec 2023 13:34:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnqSpFUvT4wb4D=sHgBzQvhv_dWxn59scgUawoRAatNg@mail.gmail.com>
Message-ID: <CAMuHMdVnqSpFUvT4wb4D=sHgBzQvhv_dWxn59scgUawoRAatNg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64: fpsimd: Drop unneeded 'busy' flag
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@google.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Tue, Dec 12, 2023 at 1:30=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
> On Tue, Dec 12, 2023 at 12:27:50PM +0100, Geert Uytterhoeven wrote:
> > On Fri, Dec 8, 2023 at 12:34=E2=80=AFPM Ard Biesheuvel <ardb@google.com=
> wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > > Kernel mode NEON will preserve the user mode FPSIMD state by saving i=
t
> > > into the task struct before clobbering the registers. In order to avo=
id
> > > the need for preserving kernel mode state too, we disallow nested use=
 of
> > > kernel mode NEON, i..e, use in softirq context while the interrupted
> > > task context was using kernel mode NEON too.
> > >
> > > Originally, this policy was implemented using a per-CPU flag which wa=
s
> > > exposed via may_use_simd(), requiring the users of the kernel mode NE=
ON
> > > to deal with the possibility that it might return false, and having N=
EON
> > > and non-NEON code paths. This policy was changed by commit
> > > 13150149aa6ded1 ("arm64: fpsimd: run kernel mode NEON with softirqs
> > > disabled"), and now, softirq processing is disabled entirely instead,
> > > and so may_use_simd() can never fail when called from task or softirq
> > > context.
> > >
> > > This means we can drop the fpsimd_context_busy flag entirely, and
> > > instead, ensure that we disable softirq processing in places where we
> > > formerly relied on the flag for preventing races in the FPSIMD preser=
ve
> > > routines.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > Reviewed-by: Mark Brown <broonie@kernel.org>
> >
> > Thanks for your patch, which is now commit e109130b0e5ec3fd
> > ("arm64: fpsimd: Drop unneeded 'busy' flag") in arm64/for-next/core
> > and next-20231212.
> >
> > I have bisected the following warning during boot (on Salvator-XS with
> > R-Car H3 ES2.0 and on White-Hawk with R-Car V4H) followed by a lock-up
> > (on Salvator-XS) to this commit:
>
> Please can you provide the output from the warning and, if possible, a

Oops, how did that log disappear?

------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/softirq.c:361 __local_bh_enable_ip+0x1a4/0=
x1c8
CPU: 0 PID: 0 Comm: swapper/0 Not tainted
6.7.0-rc3-arm64-renesas-00001-ge109130b0e5e #2383
Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
pc : __local_bh_enable_ip+0x1a4/0x1c8
lr : fpsimd_save_and_flush_cpu_state+0x4c/0x58
sp : ffff800081703bb0
x29: ffff800081703bb0 x28: ffff80008171c6b0 x27: ffff8000800167fc
x26: 0000000000000000 x25: 0000000000000000 x24: ffff800081710a68
x23: ffff8000813c4008 x22: ffff800081703ca4 x21: 0000000000000000
x20: ffff8000800167c8 x19: 0000000000000200 x18: ffffffffffffffff
x17: ffff0004c27f2400 x16: 0000000000000001 x15: 0000000000000003
x14: 0000000000000000 x13: 0000000000000003 x12: 0000000000000000
x11: 071c71c71c71c71c x10: ffff800082086b88 x9 : 0000000000000000
x8 : ffff80008203ab50 x7 : 0000000000000bb0 x6 : ffff80008203b700
x5 : ffff80067e2ee000 x4 : 0000000000000202 x3 : ffff80067e2ee000
x2 : ffff80067e2ee000 x1 : ffff800081719fc0 x0 : 0000000100000202
Call trace:
 __local_bh_enable_ip+0x1a4/0x1c8
 fpsimd_save_and_flush_cpu_state+0x4c/0x58
 fpsimd_cpu_pm_notifier+0x1c/0x28
 notifier_call_chain+0x9c/0x174
 raw_notifier_call_chain_robust+0x40/0x98
 cpu_pm_enter+0x3c/0x70
 psci_enter_idle_state+0x28/0x78
 cpuidle_enter_state+0xe4/0x568
 cpuidle_enter+0x34/0x48
 do_idle+0x214/0x290
 cpu_startup_entry+0x34/0x38
 rest_init+0xf8/0x188
 arch_post_acpi_subsys_init+0x0/0x8
 start_kernel+0x4fc/0x5ec
 __primary_switched+0xb4/0xbc
irq event stamp: 15351
hardirqs last  enabled at (15349): [<ffff80008015d9bc>]
tick_nohz_idle_enter+0xcc/0x198
hardirqs last disabled at (15350): [<ffff8000800e27a8>] do_idle+0xc4/0x290
softirqs last  enabled at (15330): [<ffff800080010614>] __do_softirq+0x494/=
0x4dc
softirqs last disabled at (15351): [<ffff8000800167c8>]
fpsimd_save_and_flush_cpu_state+0x24/0x58
---[ end trace 0000000000000000 ]---

> pointer to your .config?

renesas-defconfig from
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log=
/?h=3Dtopic/renesas-defconfig

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

