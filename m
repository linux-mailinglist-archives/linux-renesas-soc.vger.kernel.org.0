Return-Path: <linux-renesas-soc+bounces-32796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAgUJmk3DGoKaAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:11:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EBB57BF44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F36A5304D26C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B1248A2B5;
	Tue, 19 May 2026 10:09:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D73481FB7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185346; cv=none; b=V4u7r1fE5vxbnvslSbHxMeIEaSbOVCrsRDMalDx7BpBJPkLIfndQPfPdeRxytiWyWiFIvwZQsGRq6GLOMNgVeqXxEeAasOIxP7tgQcsnbN+lqRR7+1LboSkAJt+0Vt2HlrqEtatHewi2m9RvKtlzztlTZ+ycK/blcL3t0vyoPlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185346; c=relaxed/simple;
	bh=d5wqftF63M6yklv3zeLt4GQqpDKoy4cN11UgWv71+J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRHY6Ocpd7rgMVRTkeErqaP1of6+1pR/xP7laUgW2DpRbt0+XQqLoOXNW59CHDl9nmH5tOyjB2yiqMMRqJjUwky7AToHJ6Veua8dh5/XdaBGgh+hqdluR6k+kw9+kjlDehkK87BOqCc8vjvtTs50sdp1BY++CN3kBeFTMEKnnI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56f70865797so2103406e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 03:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185344; x=1779790144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxuVldO4eyfcDOsGEwUBhaeFLVJjGaNmFshsGT684kc=;
        b=HnljimifzM/Kb6IrXqOXHf1YuEnqzY30pEiDganoqhRo42JkPirStmVBb/1aLWtUgJ
         kMLtivcfr4PLK5d+iZgQSM239pkKORBMuRNbTc3lmaPoOKdydK+RKawW81dJKHkd20fr
         GsxvIbznNYNoYpwmiLGcDrZX+wm0owuJ9AxLBvHYT5J3txJXH30Tz02C2sqdC0v6kk86
         VLkdJBimnuPUdtqMQzxQuyKr+oIer6ZoS6EexIpJmXYrEcw0WYnlGs4ZJ8Xj152mG0N4
         8D69RLsuCMvrnTmoxzCeZFYUvTZHpc5yMnRQCH7twlYua0RUeiK5aNoz90TdphRlfH9M
         Mk1w==
X-Forwarded-Encrypted: i=1; AFNElJ+IbUueCWlenXfd5KNGlJQSv/al6HXIzkRR3fA/r9s4F70LheVBb1/a38uzrxbNHNyfw3YAFwIXfDgaH5yPKI1SqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlpH687cebTW5PIhbvj+xWOsN6snF8b66dK9FwN8U3+IPBfu5Y
	vrDAF+1u0UvlKkrCr+EapzOrbnQm+Mkj3LZr8I0EJ3S/7Wl//VJ8Ta6oVaaGGXDv
X-Gm-Gg: Acq92OFOrtc19Q4WbGgT5PCGaC51FSFJZK0EZv8si7IDAaUJ/4cBn7dtO8R2NLAa4zz
	7f1zWu9Eo64kTRcoptnHuszxVUFY+EGzhqZGOKG2mfm/ZcUtuHe5weC1duY2l7ML/Z/Y4OMgLyi
	8Q95B5ZCipJSo8xrBdmMxrpeTFxlCN759WzUyz7nQNfK4oJAETtoauKB1U2LaVSK4dZ8Iw0weA/
	GJTn+SKM+4EfgvrXnUapX3p0OcU1hFQMMDEUXipscJS2d1jUtuozBSRAvTeMAI0qyXQjicgsTYS
	hngPqnnpTRg+A0jAb/Db3kTrXlC/uHeUHzAGchQzeuF32Zz0wvfUfNg2gKjM8UUa7Tpmgl0AeSG
	TcV5zQOMFqNpU0gxg6xwZY6pYOz5jkVsPn3PGrn7RBavByJKOVGJtrK6aSqbgt+g45+vm05qJBq
	hq7PhD26Zl2yM8IEsd2uR1elqCl2DqFwk6EdCk9SAyWumGlhEZ5e4VzT0ENPsE6uP1ybM5VuvXX
	WU3oLRm6g==
X-Received: by 2002:a05:6122:3213:b0:56e:f1d2:c3ca with SMTP id 71dfb90a1353d-5760be3b42dmr10922564e0c.2.1779185343964;
        Tue, 19 May 2026 03:09:03 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760fa5bfb6sm7748664e0c.10.2026.05.19.03.08.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:09:01 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9568159ee07so2338770241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 03:08:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Ryglhqu0/lrWIbYvILxTgCZuBWcpNvbjHJYxMj44pOzNU3BFxp16ek67mf9nJH1Gv8AisCEwnXO7T2g+Koyr8HA==@vger.kernel.org
X-Received: by 2002:a05:6102:854d:10b0:650:94b2:b209 with SMTP id
 ada2fe7eead31-65094c2070fmr3495426137.4.1779185339284; Tue, 19 May 2026
 03:08:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513201315.3186621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV0BybWdKsPgB5TGg61U+E5u71Fu5KgXpj1sUuq-QcRQA@mail.gmail.com> <CA+V-a8t5NZP5QamrdH2-ViMcShcYh3czLsZ+0kkD_kjUodjTyw@mail.gmail.com>
In-Reply-To: <CA+V-a8t5NZP5QamrdH2-ViMcShcYh3czLsZ+0kkD_kjUodjTyw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 12:08:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZkD0VTdSc4VChuaLvEAZ1j=5_69u8Ef0tO+dwMi6JDw@mail.gmail.com>
X-Gm-Features: AVHnY4KXSTDQjh_29RoOYl4VnSgomB8DY9x_PMa5sxwN-vFAI033A9vKOGLVEQ8
Message-ID: <CAMuHMdUZkD0VTdSc4VChuaLvEAZ1j=5_69u8Ef0tO+dwMi6JDw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmc_test: Fix __counted_by handling after
 kzalloc_flex() conversion
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32796-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 14EBB57BF44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Tue, 19 May 2026 at 12:05, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, May 18, 2026 at 12:08=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, 13 May 2026 at 22:13, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Fix logic issues introduced by the kzalloc_flex() conversion in
> > > mmc_test_alloc_mem() due to interaction with the __counted_by
> > > annotation on the flexible array.
> > >
> > > Bounds-checking sanitizers rely on the counter field reflecting the
> > > allocated array size before any array access occurs. However, use
> > > mem->cnt both as the allocation size and as the runtime insertion
> > > index, causing incorrect indexing and potentially invalid bounds
> > > tracking.
> > >
> > > Initialize mem->cnt to the maximum allocated number of segments
> > > immediately after kzalloc_flex(), then use a separate local index
> > > variable to track successfully allocated entries. Update mem->cnt to
> > > the actual number of initialized elements before returning or enterin=
g
> > > the cleanup path.
> > >
> > > Also rewrite mmc_test_free_mem() to use a forward for-loop, improving
> > > readability and ensuring only initialized entries are freed.
> > >
> > > Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>

> > > --- a/drivers/mmc/core/mmc_test.c
> > > +++ b/drivers/mmc/core/mmc_test.c
> > > @@ -316,11 +316,13 @@ static int mmc_test_buffer_transfer(struct mmc_=
test_card *test,
> > >
> > >  static void mmc_test_free_mem(struct mmc_test_mem *mem)
> > >  {
> > > +       unsigned int idx;
> > > +
> > >         if (!mem)
> > >                 return;
> > > -       while (mem->cnt--)
> > > -               __free_pages(mem->arr[mem->cnt].page,
> > > -                            mem->arr[mem->cnt].order);
> > > +       for (idx =3D 0; idx < mem->cnt; idx++)
> >
> > for (unsigned int i; ...)?
> >
> Ok.
>
> > > +               __free_pages(mem->arr[idx].page,
> > > +                            mem->arr[idx].order);
> > >         kfree(mem);
> > >  }
> > >
> > > @@ -341,6 +343,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(un=
signed long min_sz,
> > >         unsigned long page_cnt =3D 0;
> > >         unsigned long limit =3D nr_free_buffer_pages() >> 4;
> > >         struct mmc_test_mem *mem;
> > > +       unsigned int idx =3D 0;
> > >
> > >         if (max_page_cnt > limit)
> > >                 max_page_cnt =3D limit;
> > > @@ -356,6 +359,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(un=
signed long min_sz,
> > >         mem =3D kzalloc_flex(*mem, arr, max_segs);
> > >         if (!mem)
> > >                 return NULL;
> > > +       mem->cnt =3D max_segs;
> > >
> > >         while (max_page_cnt) {
> > >                 struct page *page;
> > > @@ -375,23 +379,26 @@ static struct mmc_test_mem *mmc_test_alloc_mem(=
unsigned long min_sz,
> > >                                 goto out_free;
> > >                         break;
> > >                 }
> > > -               mem->arr[mem->cnt].page =3D page;
> > > -               mem->arr[mem->cnt].order =3D order;
> > > -               mem->cnt +=3D 1;
> > > +               mem->arr[idx].page =3D page;
> > > +               mem->arr[idx].order =3D order;
> > > +               idx +=3D 1;
> >
> > While looking rather ugly, I think starting with mem->cnt at zero,
> > and updating it in each step like
> >
> >     mem->cnt++;
> >     mem->arr[mem->cnt - 1].page =3D page;
> >     mem->arr[mem->cnt - 1].order =3D order;
> >
> > would still be better, as it makes the dependency between mem->cnt and
> > the size of mem->arr[] clearer (located closer to each other), and ...
> >
> >
> Ok, I will start with mem->cnt at zero; with this I can drop changes
> in mmc_test_free_mem().

I don't think you can drop these changes, as mmc_test_free_mem()
does mem->cnt-- _before_ accessing mem->arr[mem->cnt].

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

