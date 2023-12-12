Return-Path: <linux-renesas-soc+bounces-939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F6880ECB2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 13:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4329B20999
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 12:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5068160EDA;
	Tue, 12 Dec 2023 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9jqWlAd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7A160ED7;
	Tue, 12 Dec 2023 12:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CECCC433D9;
	Tue, 12 Dec 2023 12:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702385984;
	bh=ZJ3Zdx0fX3NQihj0JShZVotyJOsphr5qchOSNYAhw5o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o9jqWlAdNi1BG8R3wvEBdsFVuKTQwdZVWWnZ67uQSd3XMiJMXWlFnSlxfD5nU4NG/
	 btBRgtBkWDS1Kj3YRrn6VQWGpqBDy4SQIBMSBtxoa+ELPOoB4M5KLiSR+O6VuWFIQb
	 Bf15B3ERCz4L+JE6M66Vf88u86yHlb8cdsK4Yypgl2JqDj8b+VKcMuYdzpkovmtDPk
	 7JZB3+7xzYL+ppkiMJZ/s8Zm29wpupTxNmJWupfSoKqUIV8A7QyPZnBLz102UUZTEU
	 Ip2vycpE5/zpR5ioBpgeCDIdIWpbv51UcXp5Z5DcTwA8WJN2GZ25iT18W48RigxL9h
	 TZPyNF6m8aZ0w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50bf8843a6fso5578281e87.0;
        Tue, 12 Dec 2023 04:59:44 -0800 (PST)
X-Gm-Message-State: AOJu0YxLfZPpIUQa6tF7I5uAQ1zgRvXPtIIlVMn4v45eDRy0pT+jmAD+
	VogWYhvoJn1vaXdmYu3lojIX5NEXnDrzoHoq9Fg=
X-Google-Smtp-Source: AGHT+IE4krpIUjVaxXeJUuILckgtFo+U5r+R/Z9Y4LZsRLcbhmoaRY1qICFXYm2vJNy+Omv1kPSVq7YzjTTJzBNJwFI=
X-Received: by 2002:a19:911b:0:b0:50d:13cb:9851 with SMTP id
 t27-20020a19911b000000b0050d13cb9851mr3292683lfd.9.1702385982567; Tue, 12 Dec
 2023 04:59:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208113218.3001940-6-ardb@google.com> <20231208113218.3001940-7-ardb@google.com>
 <CAMuHMdWewWJ1msJTcPNcbAf296gt+Kait3ECXjsJrSN+uerWyA@mail.gmail.com>
 <20231212122955.GA29310@willie-the-truck> <CAMuHMdVnqSpFUvT4wb4D=sHgBzQvhv_dWxn59scgUawoRAatNg@mail.gmail.com>
In-Reply-To: <CAMuHMdVnqSpFUvT4wb4D=sHgBzQvhv_dWxn59scgUawoRAatNg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 12 Dec 2023 13:59:31 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFhzbJRyWHELCivQW1yJaF=p07LLtbuyXYX3G1WtsdyQg@mail.gmail.com>
Message-ID: <CAMj1kXFhzbJRyWHELCivQW1yJaF=p07LLtbuyXYX3G1WtsdyQg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64: fpsimd: Drop unneeded 'busy' flag
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@google.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Dec 2023 at 13:34, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
>
> Hi Will,
>
> On Tue, Dec 12, 2023 at 1:30=E2=80=AFPM Will Deacon <will@kernel.org> wro=
te:
> > On Tue, Dec 12, 2023 at 12:27:50PM +0100, Geert Uytterhoeven wrote:
> > > On Fri, Dec 8, 2023 at 12:34=E2=80=AFPM Ard Biesheuvel <ardb@google.c=
om> wrote:
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > Kernel mode NEON will preserve the user mode FPSIMD state by saving=
 it
> > > > into the task struct before clobbering the registers. In order to a=
void
> > > > the need for preserving kernel mode state too, we disallow nested u=
se of
> > > > kernel mode NEON, i..e, use in softirq context while the interrupte=
d
> > > > task context was using kernel mode NEON too.
> > > >
> > > > Originally, this policy was implemented using a per-CPU flag which =
was
> > > > exposed via may_use_simd(), requiring the users of the kernel mode =
NEON
> > > > to deal with the possibility that it might return false, and having=
 NEON
> > > > and non-NEON code paths. This policy was changed by commit
> > > > 13150149aa6ded1 ("arm64: fpsimd: run kernel mode NEON with softirqs
> > > > disabled"), and now, softirq processing is disabled entirely instea=
d,
> > > > and so may_use_simd() can never fail when called from task or softi=
rq
> > > > context.
> > > >
> > > > This means we can drop the fpsimd_context_busy flag entirely, and
> > > > instead, ensure that we disable softirq processing in places where =
we
> > > > formerly relied on the flag for preventing races in the FPSIMD pres=
erve
> > > > routines.
> > > >
> > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > Reviewed-by: Mark Brown <broonie@kernel.org>
> > >
> > > Thanks for your patch, which is now commit e109130b0e5ec3fd
> > > ("arm64: fpsimd: Drop unneeded 'busy' flag") in arm64/for-next/core
> > > and next-20231212.
> > >
> > > I have bisected the following warning during boot (on Salvator-XS wit=
h
> > > R-Car H3 ES2.0 and on White-Hawk with R-Car V4H) followed by a lock-u=
p
> > > (on Salvator-XS) to this commit:
> >
> > Please can you provide the output from the warning and, if possible, a
>
> Oops, how did that log disappear?
>
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 0 at kernel/softirq.c:361 __local_bh_enable_ip+0x1a4=
/0x1c8
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted
> 6.7.0-rc3-arm64-renesas-00001-ge109130b0e5e #2383
> Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT=
)
> pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : __local_bh_enable_ip+0x1a4/0x1c8
> lr : fpsimd_save_and_flush_cpu_state+0x4c/0x58
> sp : ffff800081703bb0
> x29: ffff800081703bb0 x28: ffff80008171c6b0 x27: ffff8000800167fc
> x26: 0000000000000000 x25: 0000000000000000 x24: ffff800081710a68
> x23: ffff8000813c4008 x22: ffff800081703ca4 x21: 0000000000000000
> x20: ffff8000800167c8 x19: 0000000000000200 x18: ffffffffffffffff
> x17: ffff0004c27f2400 x16: 0000000000000001 x15: 0000000000000003
> x14: 0000000000000000 x13: 0000000000000003 x12: 0000000000000000
> x11: 071c71c71c71c71c x10: ffff800082086b88 x9 : 0000000000000000
> x8 : ffff80008203ab50 x7 : 0000000000000bb0 x6 : ffff80008203b700
> x5 : ffff80067e2ee000 x4 : 0000000000000202 x3 : ffff80067e2ee000
> x2 : ffff80067e2ee000 x1 : ffff800081719fc0 x0 : 0000000100000202
> Call trace:
>  __local_bh_enable_ip+0x1a4/0x1c8
>  fpsimd_save_and_flush_cpu_state+0x4c/0x58
>  fpsimd_cpu_pm_notifier+0x1c/0x28
>  notifier_call_chain+0x9c/0x174
>  raw_notifier_call_chain_robust+0x40/0x98
>  cpu_pm_enter+0x3c/0x70
>  psci_enter_idle_state+0x28/0x78
>  cpuidle_enter_state+0xe4/0x568
>  cpuidle_enter+0x34/0x48
>  do_idle+0x214/0x290

Thanks for the report. I missed the fact that this is called from the
idle path. The old code just set and cleared the 'busy' flag there

Could you please check whether this fixes the issue? Thanks.

--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1835,13 +1835,15 @@ static void fpsimd_flush_cpu_state(void)
  */
 void fpsimd_save_and_flush_cpu_state(void)
 {
+       unsigned long flags;
+
        if (!system_supports_fpsimd())
                return;
        WARN_ON(preemptible());
-       get_cpu_fpsimd_context();
+       local_irq_save(flags);
        fpsimd_save_user_state();
        fpsimd_flush_cpu_state();
-       put_cpu_fpsimd_context();
+       local_irq_restore(flags);
 }

 #ifdef CONFIG_KERNEL_MODE_NEON

