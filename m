Return-Path: <linux-renesas-soc+bounces-10477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B86319C6099
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 19:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47AF11F21653
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 18:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A38821764C;
	Tue, 12 Nov 2024 18:41:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58855217476;
	Tue, 12 Nov 2024 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731436914; cv=none; b=VuKNSy14ksKFpiaOBM+beFw0pJ1+afAX+eaiYQ/7nAyTeMUs6jp/8ycJIvG9xzzuIqsEn3JqfXB/bfjD3l1BS2s3TwaNL9EV42xeNyhfkqMkZPsIzxpNzQ2v7AA5X0tZczbKgpJb71s4CJqU1ipbi/TZ2H7NZYfVXMq9UWlh/DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731436914; c=relaxed/simple;
	bh=41iyxx13QSoZL0ljBLNHJfFzk4RIgV1Y3g7Lpg/buaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWZ1QFSt56Fu8XmNXFzwmPe810JqUHXpyYqkWU2kERGycbp6cb2CetoIov41qjdFs9X0ubG3gv67gJ/ZNvAvaf0Q6urWpLm7suelAKvY5LeyDr9AeNgOFd9JthYaqgkEG0vonyK6lR0Xpy+q4r7ivimS7G3r+uZCfGN4d7H5a9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e33c65d104so50420897b3.3;
        Tue, 12 Nov 2024 10:41:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731436911; x=1732041711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ve2ZVPRXNdhaGzT7UXBp48t6+paKDDEaJf51GwqASjo=;
        b=RSD585Z/UZlTY2lXsbv8lkcl5LxE09ZMV56OYE3W8xL4fhxPCjCOn9kGSd3wNr/Qmx
         xckBb2vDrh4gQh0m+xTc3WOr1As03PPhyXGdBFBK1ehjVMF8Tfs8Yg2VePXU5+BfgJZd
         nW0TZdoMd/TGN4h0on/4exzgRFaT/uFFSlHzoRXNanoBIm3AjoVBUIoH2MUOFHxuSnCm
         +r4H/rdeYbI5hafjo2Xzww3jLoL+3fjJqL5hOSRW7ft2w2QlavTidPSWKFsU9VGAR+ne
         t+Zz4YUYnHYW5OcF/TIGtUsKUHSPsFN13tcK40vMSBKPc+f6nM35i1+75aHo2kQlMifN
         MsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJJ/2RgAI3vOTWE7ux15uNwNKKSAMArc354tjPDpNE2kTyuW5IvYDRxhoQtksB3GxrGxI23WZrACFENEt9@vger.kernel.org, AJvYcCWvxcQCvE9HN3/FqeJmeiGtwwYyI8s0fekyiohb90iHOdG9ZiVwD7mQIJB3aCp9uCOYWg+EZhyYr6ByB5LVCI3QP00=@vger.kernel.org, AJvYcCXK4y7mnvqnXjrfvJ9vlgxt26BYKNmO+nz5z06SZmnxMKUUdOi3gQuJWb+YKxxlNXrJBiPDVS5M9PA7@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ3Xa5WzkXTS8YJIv/Uj2KorSsoD4A2CJE6FVtvGN8jdSYkQmh
	NMKPlKbj1u8okjmGQURzER0nSNaOlRpsvLrRLghcWYkKf5iyO3rhS/EkVbK0
X-Google-Smtp-Source: AGHT+IFsZrmtDQ7eayZKSAOws1PloeHAz7lDsoh9Bqee6iDwBlQH8fT+3qHyQJJuxF5SNIOi5BT0Kw==
X-Received: by 2002:a05:690c:3702:b0:6ea:c467:a632 with SMTP id 00721157ae682-6eaddf9f93cmr180915497b3.35.1731436910953;
        Tue, 12 Nov 2024 10:41:50 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eaceb09a61sm26385357b3.57.2024.11.12.10.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 10:41:49 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e290e857d56so5712104276.1;
        Tue, 12 Nov 2024 10:41:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgMOU1yzYL6wdBHxoJgj72mLuEbRFe/HOD3TAh6L+wk1VWLIgpDp9ziDuga2YyZVx6t2WuJ2qGt8ne4b7g@vger.kernel.org, AJvYcCXOPWClYzjTOV/7tuIk50NK3C2CORRz/jWy/F09rL3lt1r3evgdtguendMy1SWrElynTKIrrkz4rYw6@vger.kernel.org, AJvYcCXoTtGnlNz6ha1187ooFLEImTXPUsZtB4dV1Y5gb6fY4y1fzBu3LwPG8RrkmE2Fd03GlFFb6A1ScUqgp/Noz8jVdnQ=@vger.kernel.org
X-Received: by 2002:a05:6902:2482:b0:e30:e5b3:390a with SMTP id
 3f1490d57ef6-e337f85a8e2mr16935363276.20.1731436909730; Tue, 12 Nov 2024
 10:41:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008220624.551309-1-quic_obabatun@quicinc.com>
 <20241008220624.551309-2-quic_obabatun@quicinc.com> <CAMuHMdUXj4QiSKdhf61xdDeu94=Hv0BXuCxykDpQwdY81_h2vw@mail.gmail.com>
 <8c987a26-d499-4ceb-905e-750bb24fcb08@quicinc.com> <CAMuHMdW050DuwkLuosiiz2Yt7d0Lq+C8jFO0+O0qbwsjmyf3hA@mail.gmail.com>
In-Reply-To: <CAMuHMdW050DuwkLuosiiz2Yt7d0Lq+C8jFO0+O0qbwsjmyf3hA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Nov 2024 19:41:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUjpyZEvwKpY1oQtqiqbXYcbZBh4-7pa3jacrFaCfKF=Q@mail.gmail.com>
Message-ID: <CAMuHMdUjpyZEvwKpY1oQtqiqbXYcbZBh4-7pa3jacrFaCfKF=Q@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] of: reserved_mem: Restruture how the reserved
 memory regions are processed
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Cc: robh@kernel.org, aisheng.dong@nxp.com, andy@black.fi.intel.com, 
	catalin.marinas@arm.com, devicetree@vger.kernel.org, hch@lst.de, 
	iommu@lists.linux.dev, kernel@quicinc.com, klarasmodin@gmail.com, 
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, 
	quic_ninanaik@quicinc.com, robin.murphy@arm.com, saravanak@google.com, 
	will@kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oreoluwa,

On Fri, Nov 1, 2024 at 1:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
> On Thu, Oct 31, 2024 at 10:06=E2=80=AFPM Oreoluwa Babatunde
> <quic_obabatun@quicinc.com> wrote:
> > On 10/29/2024 5:41 AM, Geert Uytterhoeven wrote:
> > > On Wed, Oct 9, 2024 at 12:08=E2=80=AFAM Oreoluwa Babatunde
> > > <quic_obabatun@quicinc.com> wrote:
> > >> Reserved memory regions defined in the devicetree can be broken up i=
nto
> > >> two groups:
> > >> i) Statically-placed reserved memory regions
> > >> i.e. regions defined with a static start address and size using the
> > >>      "reg" property.
> > >> ii) Dynamically-placed reserved memory regions.
> > >> i.e. regions defined by specifying an address range where they can b=
e
> > >>      placed in memory using the "alloc_ranges" and "size" properties=
.

[...]

> > >> Signed-off-by: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
> > > Thanks for your patch, which is now commit 8a6e02d0c00e7b62
> > > ("of: reserved_mem: Restructure how the reserved memory regions
> > > are processed") in dt-rh/for-next.
> > >
> > > I have bisected a boot issue on RZ/Five to this commit.
> > > With "earlycon keep_bootcon" (else there is no output):
> > >
> > >     Oops - store (or AMO) access fault [#1]
> > >     CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted
> > > 6.12.0-rc1-00015-g8a6e02d0c00e #201
> > >     Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> > >     epc : __memset+0x60/0x100
> > >      ra : __dma_alloc_from_coherent+0x150/0x17a
> > >     epc : ffffffff8062d2bc ra : ffffffff80053a94 sp : ffffffc60000ba2=
0
> > >      gp : ffffffff812e9938 tp : ffffffd601920000 t0 : ffffffc6000d000=
0
> > >      t1 : 0000000000000000 t2 : ffffffffe9600000 s0 : ffffffc60000baa=
0
> > >      s1 : ffffffc6000d0000 a0 : ffffffc6000d0000 a1 : 000000000000000=
0
> > >      a2 : 0000000000001000 a3 : ffffffc6000d1000 a4 : 000000000000000=
0
> > >      a5 : 0000000000000000 a6 : ffffffd601adacc0 a7 : ffffffd601a841a=
8
> > >      s2 : ffffffd6018573c0 s3 : 0000000000001000 s4 : ffffffd6019541e=
0
> > >      s5 : 0000000200000022 s6 : ffffffd6018f8410 s7 : ffffffd6018573e=
8
> > >      s8 : 0000000000000001 s9 : 0000000000000001 s10: 000000000000001=
0
> > >      s11: 0000000000000000 t3 : 0000000000000000 t4 : ffffffffdefe62d=
1
> > >      t5 : 000000001cd6a3a9 t6 : ffffffd601b2aad6
> > >     status: 0000000200000120 badaddr: ffffffc6000d0000 cause: 0000000=
000000007
> > >     [<ffffffff8062d2bc>] __memset+0x60/0x100
> > >     [<ffffffff80053e1a>] dma_alloc_from_global_coherent+0x1c/0x28
> > >     [<ffffffff80053056>] dma_direct_alloc+0x98/0x112
> > >     [<ffffffff8005238c>] dma_alloc_attrs+0x78/0x86
> > >     [<ffffffff8035fdb4>] rz_dmac_probe+0x3f6/0x50a

> > Please can you provide reproduction steps? I tried booting up
> > risc-v arch with qemu but did not run into the issue you are
> > seeing.
>
> It indeed doesn't happen on other RISC-V platforms (tried MPFS/Icicle).
> RZ/Five is special in that it is DMA non-coherent, and the crash
> happens in dma_alloc_from_global_coherent().
> According to the logs, the DMA pool at 0x58000000 is still being created.
> I'll try to debug this further next week...

I found the issue, and have sent a fix
https://lore.kernel.org/r/f8cef6845a6141f0277e31a71fe153612daae776.17314366=
31.git.geert+renesas@glider.be

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

