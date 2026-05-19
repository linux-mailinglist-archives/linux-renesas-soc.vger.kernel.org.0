Return-Path: <linux-renesas-soc+bounces-32821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJKmFe91DGqihwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:38:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DDA580ACC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0954301384C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 14:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D4F46AF1E;
	Tue, 19 May 2026 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCaHPohZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C0C3BCD31
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201516; cv=pass; b=q2DRv2CDoGKH+EGAgrmw9iKgzgjwDMT4Ts2OhOzvJhVf7X2El4NsV2kHozwFNPmjSjo2YHIiYtp/UYzLS9iYMI/kvBSmN5efL9hw9bYW7sIXHqj/Z33QFUMb3oIL6TAInIK5Pn6UTtdf5+y8JuDajlU+BCgxKprLe3+TAU+JTBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201516; c=relaxed/simple;
	bh=cj8fMYGGV50JmuPH7dRsygkr0LOScVOWkGLEok5hm1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyObCdjTM6R9qlvBDZYbolnblNRlM1JwYXpLadhqA8F48mFShjRoaqthn9EloNPCrSKPgjKrYiBzkTF+CD5FVUtlX9uo2qvr6G2wVQHdj0+O3t7Fcv5YV7s7T66AKsYhonuC50IsCk5grAZJzO8mjtRuqkgMR1Q+l5Tc6p7KsoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCaHPohZ; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d734223e4so2344267f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779201513; cv=none;
        d=google.com; s=arc-20240605;
        b=XQtwcXq6zW41SfwBqZwAL2FaZuFMB7DGbdAfZ+0ITCpFbZWGVr5r2i9JaTlTdHIWBC
         eaivt1Y1RLoxC9oh18ASuEkC3ga8Y4JqacCcEShzJQmIaAISzyF7mAsaHDtrhW+zrTme
         whJPc9Pv1CgEFFmoVd/UVdQ9JW90p8Hpya1cBqlDXT8mz2KDYA6KEBlLFChj1ySPmByp
         6RYFtPkqOW2QR1NS29JHYf1SooI3DZvd+UhaVfsHe9ByHo8Yc3D9BfrsP3YPPgqapW3U
         Ci9QjDzWMf/cBAuzZ6ham/sBw+Oc94LgurDMSjc8dlDLLhI1TGB6Et1wpHy1G5Ocj16U
         VJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8B0kUihN/kZA4O0Fnbmlk4Xoxc4WIG8UJmCytLrBe7g=;
        fh=fA6IhXkTDEVkPmnDZUZ11uSgUabakk+bZsnWL5Ts/wc=;
        b=HtWIdZH26S0sg5BP4muU+zAhzBBv92htuLxCyAl+AAFDguWrJ4LMzsKYrNAYypsqLH
         5tZwWqTX1xc9kf28oOzj4LleNrww6Af+zBS2XV+f+tXCw/pIJLHO1Ov8RQQR2+4TO/R8
         R37xYt/cPL6ps5i+gApJkhajC29ZcWwBJgeJtwzlDCV5sLTNz0v8jPxzXg+rqef8v1we
         1GbHXL52GMPTfCLhN+iTZxa7vw0wyK7c95Cvk+6dBiqnce9ElBv4j+GXGablWDyz8s+J
         5eCLEordxeTl/16puH+/0Po79aE2J3aYbhV/fjBM42AZ9uxRqMSN9bC0/0eFj+AeZeKu
         enSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779201513; x=1779806313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8B0kUihN/kZA4O0Fnbmlk4Xoxc4WIG8UJmCytLrBe7g=;
        b=NCaHPohZtYO/I58mVjHwW7twI6RUFQE4eNDYKyYezif9e7RdL8dQZq7BaQmz7XS/pC
         fNbXv8qhD1fFrFbMQwKnEn5HSjcR2liwTnnDxbEJrA7ypSldP+qVQGekw3Zky38fb3K4
         tQtiRolB+milGEmLfhOKvDL37UPxm9vboI5OqLIbsuVY9+bZ8/h5iTHRRqxlPF1FuMvV
         cxksloucOHcb2NKODfRraRJRh/PT5iqLq+sTHe19j5mq7GMath1hFT2R10lx0CaZXuVM
         9aZ7An2HgnpKjaIIVo47bnIpSjWlH7T5KfDCGGsmiOu081YD7TNMaeedE+fmNlp2DBf+
         engg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201513; x=1779806313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8B0kUihN/kZA4O0Fnbmlk4Xoxc4WIG8UJmCytLrBe7g=;
        b=CJUIAo8KQDV935sK29rwulH5dqHnCgokKENVrpsfasf5dfF2wVeAe433PCoXodC/Cy
         qFTCQQDarnb+cMqk05nPIoTpoe1UBKKsZ3d6Bj2Bl2AcoZF+11KNHbScIWqszlk8H1Fe
         epZAe1oUhXX4eQ+LEjN1yfpGmU6Lt+jw2N38Okj0bcem1v55YSLSVj5qTHdsNP/8Im/L
         QltTCTKYsF1cPFPyIcQjcu28BTiN8embh8xJM3wz6C7wkUFbhUN7HBDMXGQ+e67NUTNc
         /IE30d2hwQUGxtOgraBWCTwIOMOxaYFkXUW6LrC10mEz/nHnoMZw/dECwaj25VeHvMO+
         6QSw==
X-Forwarded-Encrypted: i=1; AFNElJ8JEKa9c6WmncZ+xbyXRqQiIFdTdJJVvgiH/dHpPczFjxZKgmF9QOB/+GM5MFdXGQALKnPWpSLcLUKLFYHBbYQmow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2yGyrIJOPk8ZE1kVBXQ9YS+JxNruaBFsA5424g++XPOTYxbiu
	6GM/LKNDR1ApL8J5MyURI/WjICJH6CW7rGGrSj8gi7kSK232oNrz0XwrbMoXHhfRZ5XFeo2wLyA
	YhEzWHlbymIPNcHREKHmmC7hTsu6B0x0=
X-Gm-Gg: Acq92OFXsabQmTYZYHYi/vxaxbJosFdRU3KFNmx4JnfeNuhUOhZKbj+kekQp2rHZPF/
	FxEsaI3zCJI1gxcNF5Qtj+v71alB9eLYioEcGve1hoTn3LOktoQVvRrOjoZnrHr14WSERS2BFEl
	iPNXlTGy8c242vPA5DDceXlNbVx/t56OaP2arXSe0ehCmsslUWthXfZYtzNLCPF18JQu/Y3H4ku
	k+I5LXXVeL8CKWQQmAHAWZA9/k5juV3enlN4rryf/uY44s1y4vx/hMPzLcvws5WmVgZpTFlOd+r
	kU9gfefagZJYslYsQAcPcUHeXA5lqM/NHxc7+Wv0FPUlxcbjiABjOzJBUUXU9dPlb5AD
X-Received: by 2002:a5d:64c6:0:b0:43d:210:2b2d with SMTP id
 ffacd0b85a97d-45d958e057cmr39062509f8f.31.1779201513379; Tue, 19 May 2026
 07:38:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519133025.618255-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVKOdzThVMOcQ1K9crUkyDutvuZsP2-5v5++SVFHkgtOA@mail.gmail.com>
 <CA+V-a8sFNjp9euEEfBf3BoscjU8W3isRT_pnzd7J4QsuiN6qfg@mail.gmail.com> <CAMuHMdWZGv6BwjGwRhU+x8iE2pXtOSz21RG64bsNoPQQCjTVjg@mail.gmail.com>
In-Reply-To: <CAMuHMdWZGv6BwjGwRhU+x8iE2pXtOSz21RG64bsNoPQQCjTVjg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 May 2026 15:38:06 +0100
X-Gm-Features: AVHnY4KUmVmbQaA9sHRIcWj7rBu76G43r-b8iP8pGkSNUit944VTI5cgfQcFjvU
Message-ID: <CA+V-a8ujJ5AL8S6DABmZjmJbXMQ=umPDCZZfXsgyuj-9mTt3GA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mmc_test: Fix counter tracking in mmc_test_alloc_mem()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32821-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bootlin.com:url,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: E5DDA580ACC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

On Tue, May 19, 2026 at 2:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 19 May 2026 at 15:44, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Tue, May 19, 2026 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Tue, 19 May 2026 at 15:30, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Fix an counter tracking in mmc_test_alloc_mem() that causes a kerne=
l panic
> > > > during error unwinding.
> > > >
> > > > The `struct mmc_test_mem` uses the `__counted_by(cnt)` annotation o=
n its
> > > > flexible array member `arr`. While kzalloc_flex() initially sets th=
e
> > > > counter field (`cnt`) to `max_segs`, the allocation loop needs to t=
rack
> > > > how many elements have actually been populated.
> > > >
> > > > Previously, leaving `mem->cnt` at `max_segs` meant that if the loop=
 failed
> > > > midway (e.g., "Failed to map sg list"), the error unwinding path in
> > > > mmc_test_free_mem() would attempt to clean up uninitialized trailin=
g
> > > > array slots. This resulted in passing NULL pointers to __free_pages=
(),
> > > > triggering a kernel panic:
> > > >
> > > >   [   66.172845] mmc0: Failed to map sg list
> > > >   [   66.176722] Unable to handle kernel NULL pointer dereference a=
t virtual address 0000000000000000
> > > >   ...
> > > >   [   66.432747] Call trace:
> > > >   [   66.435191]  ___free_pages+0x1c/0xc4 (P)
> > > >   [   66.439119]  __free_pages+0x14/0x20
> > > >   [   66.442608]  mmc_test_area_cleanup+0x58/0x84 [mmc_test]
> > > >
> > > > Fix this by explicitly resetting `mem->cnt` to 0 immediately after
> > > > allocation. Then, move the existing `mem->cnt` increment so that it=
 occurs
> > > > prior to populating each array slot, using `mem->cnt - 1` for the a=
ctual
> > > > assignment index. This guarantees that the counter accurately track=
s
> > > > initialized entries for safe error cleanup, while dynamically expan=
ding
> > > > the `__counted_by` validation boundary ahead of each flexible array=
 write.
> > > >
> > > > Additionally, rewrite the cleanup loop in mmc_test_free_mem() to us=
e a
> > > > standard forward for-loop. This addresses the unsafe post-decrement=
 logic
> > > > in the original `while (mem->cnt--)` loop which evaluated and decre=
mented
> > > > the counter field before indexing the array, and avoids a potential=
 integer
> > > > underflow/wrap-around of the counter field if the cleanup path is i=
nvoked
> > > > when `mem->cnt` is 0.
> > > >
> > > > Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v1->v2:
> > > > - Started with cnt =3D 0 and incremented before assignment to ensur=
e
> > > >   accurate tracking of initialized entries in mmc_test_alloc_mem().
> > > > - In mmc_test_free_mem(), replaced the while loop with a forward fo=
r-loop to
> > > >   safely iterate over initialized entries without risking underflow=
.
> > > > - Updated commit message to clarify the issue and the fix.
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/mmc/core/mmc_test.c
> > > > +++ b/drivers/mmc/core/mmc_test.c
> > > > @@ -318,9 +318,8 @@ static void mmc_test_free_mem(struct mmc_test_m=
em *mem)
> > > >  {
> > > >         if (!mem)
> > > >                 return;
> > > > -       while (mem->cnt--)
> > > > -               __free_pages(mem->arr[mem->cnt].page,
> > > > -                            mem->arr[mem->cnt].order);
> > > > +       for (unsigned int i =3D 0; i < mem->cnt; i++)
> > > > +               __free_pages(mem->arr[i].page, mem->arr[i].order);
> > > >         kfree(mem);
> > > >  }
> > > >
> > > > @@ -356,6 +355,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(=
unsigned long min_sz,
> > > >         mem =3D kzalloc_flex(*mem, arr, max_segs);
> > > >         if (!mem)
> > > >                 return NULL;
> > > > +       mem->cnt =3D 0;
> > >
> > > This is not needed, as it is set to zero by kzalloc_flex().
> > >
> > Actually, kzalloc_flex() automatically sets mem->cnt to max_segs
> > because cnt is annotated with __counted_by. Because of that implicit
> > initialization, we need this explicit reset to get it back to zero.
>
> Only when your compiler supports it[1].
>
> OMG...
>
> When I commented on the LWN.net article[2], I considered only the case
> where the compiler is too old, and the counter stays at zero when the
> user forgets to initialize it explicitly.  Now we have the opposite
> case, where we need the counter to stay at zero :-(
>
Yeah, it definitely introduces some tricky, asymmetrical behavior
depending on the toolchain.

Cheers,
Prabhakar

> [1] https://elixir.bootlin.com/linux/v7.0.9/source/include/linux/compiler=
_types.h#L549
> [2] https://lwn.net/Articles/1063295/
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

