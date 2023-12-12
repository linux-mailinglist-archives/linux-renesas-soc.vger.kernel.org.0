Return-Path: <linux-renesas-soc+bounces-940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D27A780EE29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 14:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D1302816C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 13:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ABD6F63A;
	Tue, 12 Dec 2023 13:54:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D618CE9;
	Tue, 12 Dec 2023 05:54:47 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5cd81e76164so55614927b3.1;
        Tue, 12 Dec 2023 05:54:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702389287; x=1702994087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNbMKqYMdM9bzzRoCwwd3USCG1/Ds1GVbkB7985iSBg=;
        b=auokTerr3Lm+rQcOmiRr5mA4YvgNRuOg0cHgq6U25NVRVkx0QHncn91hbE6vWwz8Jl
         SQAegzoRqoxvZpNE24kKkBbPlHEbumKIFT0hRNFbzWwtQTBJ+r+nzzzcAKxCE2+r7O3Z
         Yx3JVi+unsutAXONn3BHP4gYBv+a3b1gY/3pJg0qcTYRwd4cgpOhnrAJzIm+yb5Ili0a
         VrQRcqUvTfF0nES/xFsxmmHrqt2TO11KpqsoIR5rFRFd8tLL/j5xkQOn6cbvG0m9otyO
         P1/RdLGbeg/M4bxNLHJp1kXodPeweP6s9DETAQgx++nF4/DTYWAtgxeSSX/sdRHiXMKf
         o1AQ==
X-Gm-Message-State: AOJu0YxT6eRqXmKcDrWpR6KUDmKrawy3UIXE1mJNhgD+7Rar2fdziaEg
	kgAh9NQAXDs3RKr64mfYHEiRVM7NXN5Vgw==
X-Google-Smtp-Source: AGHT+IFnCOGHcFBpsXBrpvFbTYDbKRb0PrZAb7RoD3zM77Vc0VP49L2i9lJEsuO5fxbYH5KHDv/Hdg==
X-Received: by 2002:a81:6003:0:b0:5d7:1940:dd73 with SMTP id u3-20020a816003000000b005d71940dd73mr5095459ywb.73.1702389286552;
        Tue, 12 Dec 2023 05:54:46 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id z20-20020a81c214000000b005d900a949ccsm3751812ywc.97.2023.12.12.05.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 05:54:46 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5cd81e76164so55614757b3.1;
        Tue, 12 Dec 2023 05:54:46 -0800 (PST)
X-Received: by 2002:a05:690c:448f:b0:5e1:859b:2479 with SMTP id
 gr15-20020a05690c448f00b005e1859b2479mr1464755ywb.19.1702389285959; Tue, 12
 Dec 2023 05:54:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208113218.3001940-6-ardb@google.com> <20231208113218.3001940-7-ardb@google.com>
 <CAMuHMdWewWJ1msJTcPNcbAf296gt+Kait3ECXjsJrSN+uerWyA@mail.gmail.com>
 <20231212122955.GA29310@willie-the-truck> <CAMuHMdVnqSpFUvT4wb4D=sHgBzQvhv_dWxn59scgUawoRAatNg@mail.gmail.com>
 <CAMj1kXFhzbJRyWHELCivQW1yJaF=p07LLtbuyXYX3G1WtsdyQg@mail.gmail.com>
In-Reply-To: <CAMj1kXFhzbJRyWHELCivQW1yJaF=p07LLtbuyXYX3G1WtsdyQg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Dec 2023 14:54:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWca4Mhuqg90b5zJhRJ+HneNjzHtXC3w24_k=t182ryfw@mail.gmail.com>
Message-ID: <CAMuHMdWca4Mhuqg90b5zJhRJ+HneNjzHtXC3w24_k=t182ryfw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64: fpsimd: Drop unneeded 'busy' flag
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@google.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ard,

On Tue, Dec 12, 2023 at 1:59=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
> On Tue, 12 Dec 2023 at 13:34, Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> > On Tue, Dec 12, 2023 at 1:30=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> > > On Tue, Dec 12, 2023 at 12:27:50PM +0100, Geert Uytterhoeven wrote:
> > > > On Fri, Dec 8, 2023 at 12:34=E2=80=AFPM Ard Biesheuvel <ardb@google=
.com> wrote:
> > > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > > Kernel mode NEON will preserve the user mode FPSIMD state by savi=
ng it
> > > > > into the task struct before clobbering the registers. In order to=
 avoid
> > > > > the need for preserving kernel mode state too, we disallow nested=
 use of
> > > > > kernel mode NEON, i..e, use in softirq context while the interrup=
ted
> > > > > task context was using kernel mode NEON too.
> > > > >
> > > > > Originally, this policy was implemented using a per-CPU flag whic=
h was
> > > > > exposed via may_use_simd(), requiring the users of the kernel mod=
e NEON
> > > > > to deal with the possibility that it might return false, and havi=
ng NEON
> > > > > and non-NEON code paths. This policy was changed by commit
> > > > > 13150149aa6ded1 ("arm64: fpsimd: run kernel mode NEON with softir=
qs
> > > > > disabled"), and now, softirq processing is disabled entirely inst=
ead,
> > > > > and so may_use_simd() can never fail when called from task or sof=
tirq
> > > > > context.
> > > > >
> > > > > This means we can drop the fpsimd_context_busy flag entirely, and
> > > > > instead, ensure that we disable softirq processing in places wher=
e we
> > > > > formerly relied on the flag for preventing races in the FPSIMD pr=
eserve
> > > > > routines.
> > > > >
> > > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > Reviewed-by: Mark Brown <broonie@kernel.org>
> > > >
> > > > Thanks for your patch, which is now commit e109130b0e5ec3fd
> > > > ("arm64: fpsimd: Drop unneeded 'busy' flag") in arm64/for-next/core
> > > > and next-20231212.
> > > >
> > > > I have bisected the following warning during boot (on Salvator-XS w=
ith
> > > > R-Car H3 ES2.0 and on White-Hawk with R-Car V4H) followed by a lock=
-up
> > > > (on Salvator-XS) to this commit:
> > >
> > > Please can you provide the output from the warning and, if possible, =
a
> >
> > Oops, how did that log disappear?
> >
> > ------------[ cut here ]------------
> > WARNING: CPU: 0 PID: 0 at kernel/softirq.c:361 __local_bh_enable_ip+0x1=
a4/0x1c8
> > CPU: 0 PID: 0 Comm: swapper/0 Not tainted
> > 6.7.0-rc3-arm64-renesas-00001-ge109130b0e5e #2383
> > Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (=
DT)
> > pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > pc : __local_bh_enable_ip+0x1a4/0x1c8
> > lr : fpsimd_save_and_flush_cpu_state+0x4c/0x58
> > sp : ffff800081703bb0
> > x29: ffff800081703bb0 x28: ffff80008171c6b0 x27: ffff8000800167fc
> > x26: 0000000000000000 x25: 0000000000000000 x24: ffff800081710a68
> > x23: ffff8000813c4008 x22: ffff800081703ca4 x21: 0000000000000000
> > x20: ffff8000800167c8 x19: 0000000000000200 x18: ffffffffffffffff
> > x17: ffff0004c27f2400 x16: 0000000000000001 x15: 0000000000000003
> > x14: 0000000000000000 x13: 0000000000000003 x12: 0000000000000000
> > x11: 071c71c71c71c71c x10: ffff800082086b88 x9 : 0000000000000000
> > x8 : ffff80008203ab50 x7 : 0000000000000bb0 x6 : ffff80008203b700
> > x5 : ffff80067e2ee000 x4 : 0000000000000202 x3 : ffff80067e2ee000
> > x2 : ffff80067e2ee000 x1 : ffff800081719fc0 x0 : 0000000100000202
> > Call trace:
> >  __local_bh_enable_ip+0x1a4/0x1c8
> >  fpsimd_save_and_flush_cpu_state+0x4c/0x58
> >  fpsimd_cpu_pm_notifier+0x1c/0x28
> >  notifier_call_chain+0x9c/0x174
> >  raw_notifier_call_chain_robust+0x40/0x98
> >  cpu_pm_enter+0x3c/0x70
> >  psci_enter_idle_state+0x28/0x78
> >  cpuidle_enter_state+0xe4/0x568
> >  cpuidle_enter+0x34/0x48
> >  do_idle+0x214/0x290
>
> Thanks for the report. I missed the fact that this is called from the
> idle path. The old code just set and cleared the 'busy' flag there
>
> Could you please check whether this fixes the issue? Thanks.

Thanks, that fixed the issue!

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

