Return-Path: <linux-renesas-soc+bounces-32815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GWBJCxsDGo8hQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:57:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 541CD580194
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5964E303D5EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F373403F4;
	Tue, 19 May 2026 13:55:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58313ED3A0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198925; cv=none; b=AGodiAnp8ftfStiIfE8aD4CQjLR1IpUPj/r1qKy7zbESoAcLrMqfJEJ0L8cK0YRpK0zfk4s70OspW9Xu4u1eS1CnO1c3Ywa7u6pNbZtIdcMKicESz08mO9/HO8HD5LOjyrQNOwoaQAHoY4N4Faq/9CDg2b2oDJvVU6WP1VwyfcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198925; c=relaxed/simple;
	bh=ropJiXj/HBYvwp5Msa8W8dOE9wVAViMdDjVNcwFpVB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3SdlmAGGvRwMIO0vwSUkhVm34dpk0kO9y6VQvKdM39gHlbWrZv604ZlJy7diGhm9T1dI/M+p0XKSGVyVvMGuv+fmdl6ZxKVqLkXGnAXhokvYV30hJi2rMutLh+lcf1gTEX/Dfidgx8Ow5TO94wrCwSXyZlvI9rLnVr8w1WY1XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-63127c440ccso2586593137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 06:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198922; x=1779803722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2hf4+Ek9YRT6fN0h/tFO9bOB6UgGg8JC36KgrKL0v3M=;
        b=BVeRPv2zQT6Cb+pXeu9gx5YSjGmNZIl+pV69c3rKZlQTRo6XjSvHxXGAkSBWwRDEEC
         rr3e1oxlMahTUsNFF7mOJSSvWk1P2CTd90GTIOkvcswItbU7nv8OZRsob5MBPheWPLmv
         Yh5UovBTfT+JyZaKDrMfNyYb90ZuEeMxuqfci9IkoZw/+B7eSQHG5DoqPe1D5A6p4LDE
         nbwIANCBYN+MvUybzpqASW45JCuzWp/cylUkN/PiT5dJu519fqChRq8K3HOJ6edck8de
         jG+C+aCZbZ3VXTMhDmdaDLdqy5OIKe9in0AhbOOvbdtP63+y88N+RR28URo42nT4cOaY
         vG5w==
X-Forwarded-Encrypted: i=1; AFNElJ/hagZX8dRdFijG7FeRH7RQSuQsVy4IqPemLM1ho0UF8Q5BbBS+Gztu7k0UH9EY133Hk7QpvU1QYbpy8cLkZ9BBiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9i12ge/V/MDUMFmPgWaRF0RIr0RmpF7p4StJLxkiRZIUcVHHW
	mk6YumZ2a1hB69weOQr8nIHRa+DMdm1v+0q987VkVD5lMVEAR5fj+Pr3RmzTjMiO
X-Gm-Gg: Acq92OHxutrh8tpLqEFIUNMzd1bm5K8MuTSF/u61Bl/wHTQn2DnoSaCh2uMJAcoV/I+
	GvPCmLEIG/FzDuYU99sUgz0I/XFuFKkzsoLbJGBmyJPKcUqhoCyTej0f0LME9mx4MwTZA0sWrrR
	o593BIzPfwurRfIKws1iTXXiHUDj2ffc7KEC/sp81oh6szFuEdjsrKgnr4u4Xspl4UtOlHp12H0
	u0qLC688LBL5IYxWH2/TnLISmzVWP6Z5LLj6OO0YbHaA7ZqHNz+gr4HtsHjkn7k8DPJIZOCnq5Z
	T6wU/ZgYUNFzM4aOQuXX1/U5pPjTgZkCro/gpU1HRg9bBz9f97Oi4Yrl8SlNcte9EY6AGI4iyRi
	Nh7Ur9nHfJo3931J4Q9LOWhVKiu2BxgxoFK1hvmS76Ln/L+IzxJo/p9+aYNoMhIWloNUml0TYXJ
	f6VaIKsGncp30v0wCoTstPSJYdUnngKzYZV7sGGv/T1fKb28ocYtB8eBL6TYUonILBSRiz52hNy
	B8=
X-Received: by 2002:a05:6102:2924:b0:610:1c78:9531 with SMTP id ada2fe7eead31-63a3f6948dfmr9898953137.24.1779198922424;
        Tue, 19 May 2026 06:55:22 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63ce6ce2edbsm6477526137.8.2026.05.19.06.55.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 06:55:20 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5780c38ecb8so2058818e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 06:55:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+/WS0mUwwAlVT1VGC1ZNRiLjYG0VdwXnDgWwDTm+yzHkYD4CpYFHqKrrSXC8qzNCseJJSana6HkJJ8gLv5x7UY5w==@vger.kernel.org
X-Received: by 2002:a05:6122:4b8c:b0:56c:ca03:b668 with SMTP id
 71dfb90a1353d-5760bfb8ca9mr10883102e0c.3.1779198919511; Tue, 19 May 2026
 06:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519133025.618255-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVKOdzThVMOcQ1K9crUkyDutvuZsP2-5v5++SVFHkgtOA@mail.gmail.com> <CA+V-a8sFNjp9euEEfBf3BoscjU8W3isRT_pnzd7J4QsuiN6qfg@mail.gmail.com>
In-Reply-To: <CA+V-a8sFNjp9euEEfBf3BoscjU8W3isRT_pnzd7J4QsuiN6qfg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 15:55:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZGv6BwjGwRhU+x8iE2pXtOSz21RG64bsNoPQQCjTVjg@mail.gmail.com>
X-Gm-Features: AVHnY4If75BE1VFsoTcZFsczakSSYimGh11UdyDyK4f5gTnPlxJ8oEAkRkMK1OM
Message-ID: <CAMuHMdWZGv6BwjGwRhU+x8iE2pXtOSz21RG64bsNoPQQCjTVjg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mmc_test: Fix counter tracking in mmc_test_alloc_mem()
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32815-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,bootlin.com:url,linux-m68k.org:email]
X-Rspamd-Queue-Id: 541CD580194
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Tue, 19 May 2026 at 15:44, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, May 19, 2026 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, 19 May 2026 at 15:30, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Fix an counter tracking in mmc_test_alloc_mem() that causes a kernel =
panic
> > > during error unwinding.
> > >
> > > The `struct mmc_test_mem` uses the `__counted_by(cnt)` annotation on =
its
> > > flexible array member `arr`. While kzalloc_flex() initially sets the
> > > counter field (`cnt`) to `max_segs`, the allocation loop needs to tra=
ck
> > > how many elements have actually been populated.
> > >
> > > Previously, leaving `mem->cnt` at `max_segs` meant that if the loop f=
ailed
> > > midway (e.g., "Failed to map sg list"), the error unwinding path in
> > > mmc_test_free_mem() would attempt to clean up uninitialized trailing
> > > array slots. This resulted in passing NULL pointers to __free_pages()=
,
> > > triggering a kernel panic:
> > >
> > >   [   66.172845] mmc0: Failed to map sg list
> > >   [   66.176722] Unable to handle kernel NULL pointer dereference at =
virtual address 0000000000000000
> > >   ...
> > >   [   66.432747] Call trace:
> > >   [   66.435191]  ___free_pages+0x1c/0xc4 (P)
> > >   [   66.439119]  __free_pages+0x14/0x20
> > >   [   66.442608]  mmc_test_area_cleanup+0x58/0x84 [mmc_test]
> > >
> > > Fix this by explicitly resetting `mem->cnt` to 0 immediately after
> > > allocation. Then, move the existing `mem->cnt` increment so that it o=
ccurs
> > > prior to populating each array slot, using `mem->cnt - 1` for the act=
ual
> > > assignment index. This guarantees that the counter accurately tracks
> > > initialized entries for safe error cleanup, while dynamically expandi=
ng
> > > the `__counted_by` validation boundary ahead of each flexible array w=
rite.
> > >
> > > Additionally, rewrite the cleanup loop in mmc_test_free_mem() to use =
a
> > > standard forward for-loop. This addresses the unsafe post-decrement l=
ogic
> > > in the original `while (mem->cnt--)` loop which evaluated and decreme=
nted
> > > the counter field before indexing the array, and avoids a potential i=
nteger
> > > underflow/wrap-around of the counter field if the cleanup path is inv=
oked
> > > when `mem->cnt` is 0.
> > >
> > > Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v1->v2:
> > > - Started with cnt =3D 0 and incremented before assignment to ensure
> > >   accurate tracking of initialized entries in mmc_test_alloc_mem().
> > > - In mmc_test_free_mem(), replaced the while loop with a forward for-=
loop to
> > >   safely iterate over initialized entries without risking underflow.
> > > - Updated commit message to clarify the issue and the fix.
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/mmc/core/mmc_test.c
> > > +++ b/drivers/mmc/core/mmc_test.c
> > > @@ -318,9 +318,8 @@ static void mmc_test_free_mem(struct mmc_test_mem=
 *mem)
> > >  {
> > >         if (!mem)
> > >                 return;
> > > -       while (mem->cnt--)
> > > -               __free_pages(mem->arr[mem->cnt].page,
> > > -                            mem->arr[mem->cnt].order);
> > > +       for (unsigned int i =3D 0; i < mem->cnt; i++)
> > > +               __free_pages(mem->arr[i].page, mem->arr[i].order);
> > >         kfree(mem);
> > >  }
> > >
> > > @@ -356,6 +355,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(un=
signed long min_sz,
> > >         mem =3D kzalloc_flex(*mem, arr, max_segs);
> > >         if (!mem)
> > >                 return NULL;
> > > +       mem->cnt =3D 0;
> >
> > This is not needed, as it is set to zero by kzalloc_flex().
> >
> Actually, kzalloc_flex() automatically sets mem->cnt to max_segs
> because cnt is annotated with __counted_by. Because of that implicit
> initialization, we need this explicit reset to get it back to zero.

Only when your compiler supports it[1].

OMG...

When I commented on the LWN.net article[2], I considered only the case
where the compiler is too old, and the counter stays at zero when the
user forgets to initialize it explicitly.  Now we have the opposite
case, where we need the counter to stay at zero :-(

[1] https://elixir.bootlin.com/linux/v7.0.9/source/include/linux/compiler_t=
ypes.h#L549
[2] https://lwn.net/Articles/1063295/

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

