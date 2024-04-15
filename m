Return-Path: <linux-renesas-soc+bounces-4624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AB28A5429
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 16:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39B041F2278C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 14:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA6B8529B;
	Mon, 15 Apr 2024 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2nqzbcM5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C667880C15
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Apr 2024 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713191487; cv=none; b=a3ju2GOdZBYuFoabl3eTw8BscVjNca/xAfDOFYkQC8cAvFOLxwyCdJiRaeejKw94s+Qe+Gj5SohJrWoXAKtMXsSNIPzFqK/XP6D17LoKhYMfvQ1Mraq/xpjIZhMJH/FFJP58aVo/fffrD5xS5TokFMoPMX47ZrNjVINW0iQjFJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713191487; c=relaxed/simple;
	bh=ITYC7z7GV55n6mIB+damxcuLZWxyZG3dP037z76+qQ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m5AT52DQWA6yqRcVQDBOvCs8YLTNDzWNnvJYvkbTfXeUxIhqqXOR30QUpUN6ITNJGvCYv7U0KVZueooCQDBYHbalmQQAiWjGksBsr5RzQmaf9MAt1wWVzJVMaVv545A2J5OBVwFZ1lWApCRZR0MK/zvsNAO+Sc3fL3ABZpMaIs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2nqzbcM5; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5d5a080baf1so2349847a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Apr 2024 07:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713191485; x=1713796285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3c2CdFnxXRBnmzc0kZKqWJbmgAhAN/X9RQGLQm4qlas=;
        b=2nqzbcM57gPI/2TpPx7+PlH9N3yFxN+xAXfTCwAs6JUNLUFbA7l159Gtl2xCMnfWwn
         +DHky1MEgJfU3PBlL3vQWc3bHDV8O4/0XhtTcRr+K3zPJRocI5NNcbeosBc9p5ufgncP
         GPQ7KAehkefVHwbyOti5Wp69be2ZgE0Gvb4VWNgKNE33dDBad/CnP428TEK1B73h1e5t
         X6kg18mymJydA0JWL0gjJis6NAkkbNXkxNF8E3BYRYncfA+dgKUYzbEXO35VB3+9UxrZ
         1xR8bSyADvxZB1Haahx/HrZEeaVrg8Y76p/FGOwUsncIM2ylqHHx3BE5hlV8sKD7Scfr
         DoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713191485; x=1713796285;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3c2CdFnxXRBnmzc0kZKqWJbmgAhAN/X9RQGLQm4qlas=;
        b=I2SKkOo4sex3RRsEK5D4vHYDIYoGY+JoGTNJ1xhW/cKsX1dhjMpfLbdw7HJ7weH+/V
         WxE2xd2RKoCawVRNR5i1F5kBPU2VXRlPx0De9WDJQ3kZFspx+oHYogceN2WjzfARlfoi
         y5Y34SMNM7ozD/rjJ89yI8iOGkzMWqyVelkj0XXMnG3+4y4COn2+lrNcJnxaaKNOkv5k
         GSTl/rpxd9aOL2/j4+2HW1gDpM2rG9iEuTAHTDd5zGaoxqZ8QNlHL4YqV5QcyrgkuLXh
         P2MpmPG1fIX9lta+U9bo5Njfzd9d1PZivWjtY+o+uU9UZUcF9OXa0O0dOz8TeXsH06HQ
         v/Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVR07zfNAqmSZ/1EueOU5vdMQprzCRVvN7k684teKI0B87KIdF7NbkVdsfhdREvgTAKM8QJJgpDtLRV+SXzscaShGk51oPBreWoLOopo3nMg7c=
X-Gm-Message-State: AOJu0YyauNW9tzE7pQ4HSD7dRmLzix0+7Mkl1QoM8MchCUcDZbhZWJKQ
	D00j5mypXbS+j5Rua/Wmgcyu3bresF4QCRYsgUl3zzB2OYzImrTv3D+4kquZIl+Ym7WdvjzoRtr
	CIg==
X-Google-Smtp-Source: AGHT+IHuch75LMAnc1U2ltEvl5EQtMTtzEb/8rE4LBdYCN+wg04KdOcX1kaXCFsKcUY8MvFdl8nCoh4Cvw4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:ec02:0:b0:5dc:bc92:23c4 with SMTP id
 j2-20020a63ec02000000b005dcbc9223c4mr27975pgh.12.1713191484874; Mon, 15 Apr
 2024 07:31:24 -0700 (PDT)
Date: Mon, 15 Apr 2024 07:31:23 -0700
In-Reply-To: <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240409175108.1512861-1-seanjc@google.com> <20240409175108.1512861-2-seanjc@google.com>
 <20240413115324.53303a68@canb.auug.org.au> <87edb9d33r.fsf@mail.lhotse>
 <87bk6dd2l4.fsf@mail.lhotse> <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
Message-ID: <Zh06O35yKIF2vNdE@google.com>
Subject: Re: [PATCH 1/3] x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n
From: Sean Christopherson <seanjc@google.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024, Geert Uytterhoeven wrote:
> Hi Michael,
>=20
> On Sat, Apr 13, 2024 at 11:38=E2=80=AFAM Michael Ellerman <mpe@ellerman.i=
d.au> wrote:
> > Michael Ellerman <mpe@ellerman.id.au> writes:
> > > Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > ...
> > >> On Tue,  9 Apr 2024 10:51:05 -0700 Sean Christopherson <seanjc@googl=
e.com> wrote:
> > ...
> > >>> diff --git a/kernel/cpu.c b/kernel/cpu.c
> > >>> index 8f6affd051f7..07ad53b7f119 100644
> > >>> --- a/kernel/cpu.c
> > >>> +++ b/kernel/cpu.c
> > >>> @@ -3207,7 +3207,8 @@ enum cpu_mitigations {
> > >>>  };
> > >>>
> > >>>  static enum cpu_mitigations cpu_mitigations __ro_after_init =3D
> > >>> -   CPU_MITIGATIONS_AUTO;
> > >>> +   IS_ENABLED(CONFIG_SPECULATION_MITIGATIONS) ? CPU_MITIGATIONS_AU=
TO :
> > >>> +                                                CPU_MITIGATIONS_OF=
F;
> > >>>
> > >>>  static int __init mitigations_parse_cmdline(char *arg)
> > >>>  {
> >
> > I think a minimal workaround/fix would be:
> >
> > diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> > index 2b8fd6bb7da0..290be2f9e909 100644
> > --- a/drivers/base/Kconfig
> > +++ b/drivers/base/Kconfig
> > @@ -191,6 +191,10 @@ config GENERIC_CPU_AUTOPROBE
> >  config GENERIC_CPU_VULNERABILITIES
> >         bool
> >
> > +config SPECULATION_MITIGATIONS
> > +       def_bool y
> > +       depends on !X86
> > +
> >  config SOC_BUS
> >         bool
> >         select GLOB
>=20
> Thanks, that works for me (on arm64), so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Oof.  I completely missed that "cpu_mitigations" wasn't x86-only.  I can't =
think
of better solution than an on-by-default generic Kconfig, though can't that=
 it
more simply be:

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 2b8fd6bb7da0..5930cb56ee29 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -191,6 +191,9 @@ config GENERIC_CPU_AUTOPROBE
 config GENERIC_CPU_VULNERABILITIES
        bool
=20
+config SPECULATION_MITIGATIONS
+       def_bool !X86
+
 config SOC_BUS
        bool
        select GLOB

