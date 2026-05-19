Return-Path: <linux-renesas-soc+bounces-32806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WObZLWZdDGrMgAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 14:53:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C2B57F10A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 14:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 294713019519
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5064DD6DE;
	Tue, 19 May 2026 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4OLNhkS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C693F4BCAD7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779194953; cv=pass; b=sCEMKQuCNwWs8XEnR5VIzUDRWghGxedaq55edBWjXp1UD8+7kBAYp+pAacYP3AJUtHF47Edar2eD/8W//IQOCYFGYQJqtVcVIk/K/jALnex0Mgu+QoK2H/Kv8tHcncYOhzNgeIo31QkPJUsR/V/LmbeHq9+bpez95G3CD5GfNbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779194953; c=relaxed/simple;
	bh=z5bbYmTfV3f1fUZkdMtjKau2veIkDy6z1gsrRWGyj8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mey5Xc0YmfLa0svMMoV+nbefFu9U6jBx8r42ey1/BAj7FmmwCPA25YJ2YVjdWHt1Dc+2xKCMdaJIUBtvNtl3DUcT5h7TfW6bdW1SRZSVLVx714wE7t9pmlQXQp968kx9JK8cuTl45KPIh8KVTIiUDJjOdQwjY2Mvnu8ox6jqSf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4OLNhkS; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so778114f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 05:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779194950; cv=none;
        d=google.com; s=arc-20240605;
        b=QIwgiQGcmuwD4U0kWRVRTsQBrx9NhcRgQec30VN4m1cZ1AMLKcWEdcBSnkAJWoHhCP
         eid/4aw4Q7AV3eynOX9uaQvCmg3eFhWZVf/hNrdcLarjs2/I9rRWnfgeKn4G6NuOh/U6
         rF09aF1n+/57pfpp/TgEQwub5qqQbErUv6j9EsmcSTozAA9Vggq0IjbVfExJALXWbGsq
         Whyw65t89QCQgDaojXsTABTKYtkQTulE7e0jAwk9HWErYs771OcK77Eu70GQYgeHT1/H
         oo/BhQkITol6aOBKkGPAKr9MUKka3fNKxRTXWZShJ/9O9wMnQJ/QfDg5WxRqyP0detCi
         C7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gxnCZT3YkTibvlG6nqfkBDd0n82IagINu/+G6406bZ8=;
        fh=ZPX0glhK/CmUhSjtiIGGS7k968xVYkANE3ucwNqu2Ss=;
        b=dYaMkHTlJWj4nOpfAwfCeUT7s50UFtoNvCVT0OiGqaxR4DqIhzPzLEE5KB9sS2qLas
         qZEpKjB3D1LahBKKgIyvHgDMfz6fMtiCvGnfvpKgH7QNqFKwpH0PML2LkevPI6YEeuGo
         8khjdOQFy3Ko0bp/JN6lOAvwqV1kQ9Bx/uxGnW/D5peUnr4D2vdI3i4GbGkLY1Jmg1kf
         4YxeCdsJuwkpWIsak0+9ONJBcrWOa+zh9ZNSIPVQWvSlsehXnG63itIex9g6kvr40Inb
         JO6D1i0XZaTEjur6J9Fwm3DENP7Lpj1xR1jYZN2jOOZSoxUU/ZQvgMtZt6Z9WJchfh0c
         Y3Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779194950; x=1779799750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxnCZT3YkTibvlG6nqfkBDd0n82IagINu/+G6406bZ8=;
        b=g4OLNhkS8VablrP1HElVY7Q/0N0Y+TcJ74gDDNB7zG9gYb1ehYT9sIU+KZ7a5M9bX4
         wCoE3/1cJCBkYYGS0NtGXqM30ShwsML9Ot1uPlF6oWSJBvFIEkkvkbO4ypoxzK3k/V8i
         4QneTYESYwotGCD10AQ6Zt56S7RVAmscKXitKaPlFw3dkx/R2WWRaVi1RXLfcZ3itc5R
         DS6/J/mj7ojC3nQda0sSeH17LR9uUgVkR1gr0dcCMt4NG29dDwiag3MWuo19povkzUwZ
         pdPCbdF2OcoW0hMg8YjRNfISBGN8xAdXrteJesITVcpvw0hg0YFD17d3c85HnmBVezam
         UWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779194950; x=1779799750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gxnCZT3YkTibvlG6nqfkBDd0n82IagINu/+G6406bZ8=;
        b=U1dRzYgWqi7y9WelVNEBOym7b8c69F4y5yd5ivgPpyaVnQF5ZFppGxPtybujDJCQur
         wQL6htl1A1nc3fotJCdQ1iV5Jb5kNHlCeY1Mz/mJOW5jMRwmfc4iUP7ChWRsEW+VMQPS
         URGR6eo0fNWLrQs/pfIZNQm5BX4QJzfvFLHCeT0xw4G3vISwhVccMqXA0yhCZ/6reX5o
         fEJfc9t3Cc+QUIQgq3qYDYPuqDvAjQuO/QaGmG8rQUjdwmmu2m2evXcDLoL1k2LafQW4
         5NIeq1O6iB5OV40+bl0WcCmVzjcg3JUenX7kqP6UryRUTvIqzDBEpj+hXHeB0oBMFRmb
         OW7w==
X-Forwarded-Encrypted: i=1; AFNElJ/mV4jfKp29LOhCw/DbYSaYAUgiFwmP4eS2q2/UQhWafrFycKqjQP78hg2PDq5cEQfuMgg740qOzOKqgRa4sSyA2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqM5+QqD/XXCterektU86Zrhv63ziv+o8PBs0zLmAALfFDReGW
	uVLIycLP/q1wbMHkueBqyjIdqX5jAxpninE2kbDRnaZTfILJjEXwNrI7KbFmSXW2miqGhdSfMHz
	tnAtrfFljUhrBM5jmU6AXzSbu4b6Jkho=
X-Gm-Gg: Acq92OGhs+lQKH8nBapmTc+cRfoSpgtoxF04laFRJLOv+K1BGySt6zN0iNbbk6b8EiE
	AyRlFd+r1O6nK+FznHVacIhAC8SngbtJSUCX9KMbvklPpPaWAgqXNdNWW2N54mYv3juRKomZthx
	gI0qAMb5mR8KgVfQOkyrEIUMB9MLx8NNbAopwKHrckNlFAXNXpRJFeCx9r7vimSq7ZEydmXwg5O
	tLzGIWiJNG0Uov1sD6G8wpLOMtuS/oWoG/g41+4xzpU5PFNUz6S7vnMHEkKPNLFVDM7eSI2BXZh
	tE8djg+OjPi9WHD2tb0BPJHtcR/W3SYpHkSlD3/ReKeLkYzY8D0FTM9qCumpc6Vv3GZb
X-Received: by 2002:a5d:5d10:0:b0:44e:1984:5f3e with SMTP id
 ffacd0b85a97d-45e5c5951f9mr30114071f8f.31.1779194950039; Tue, 19 May 2026
 05:49:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513201315.3186621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV0BybWdKsPgB5TGg61U+E5u71Fu5KgXpj1sUuq-QcRQA@mail.gmail.com>
 <CA+V-a8t5NZP5QamrdH2-ViMcShcYh3czLsZ+0kkD_kjUodjTyw@mail.gmail.com> <CAMuHMdUZkD0VTdSc4VChuaLvEAZ1j=5_69u8Ef0tO+dwMi6JDw@mail.gmail.com>
In-Reply-To: <CAMuHMdUZkD0VTdSc4VChuaLvEAZ1j=5_69u8Ef0tO+dwMi6JDw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 May 2026 13:48:43 +0100
X-Gm-Features: AVHnY4I4917oez7RJMmKkLZjNlvjOWucXuN2H1DDq2uw9OwQGkIDoCLJP4CbJH0
Message-ID: <CA+V-a8uT+dkhKL7vAdFqAEX409keehC7RPOhKBTsL_dtEzMK_w@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmc_test: Fix __counted_by handling after
 kzalloc_flex() conversion
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32806-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 22C2B57F10A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

On Tue, May 19, 2026 at 11:09=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 19 May 2026 at 12:05, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, May 18, 2026 at 12:08=E2=80=AFPM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Wed, 13 May 2026 at 22:13, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Fix logic issues introduced by the kzalloc_flex() conversion in
> > > > mmc_test_alloc_mem() due to interaction with the __counted_by
> > > > annotation on the flexible array.
> > > >
> > > > Bounds-checking sanitizers rely on the counter field reflecting the
> > > > allocated array size before any array access occurs. However, use
> > > > mem->cnt both as the allocation size and as the runtime insertion
> > > > index, causing incorrect indexing and potentially invalid bounds
> > > > tracking.
> > > >
> > > > Initialize mem->cnt to the maximum allocated number of segments
> > > > immediately after kzalloc_flex(), then use a separate local index
> > > > variable to track successfully allocated entries. Update mem->cnt t=
o
> > > > the actual number of initialized elements before returning or enter=
ing
> > > > the cleanup path.
> > > >
> > > > Also rewrite mmc_test_free_mem() to use a forward for-loop, improvi=
ng
> > > > readability and ensuring only initialized entries are freed.
> > > >
> > > > Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
>
> > > > --- a/drivers/mmc/core/mmc_test.c
> > > > +++ b/drivers/mmc/core/mmc_test.c
> > > > @@ -316,11 +316,13 @@ static int mmc_test_buffer_transfer(struct mm=
c_test_card *test,
> > > >
> > > >  static void mmc_test_free_mem(struct mmc_test_mem *mem)
> > > >  {
> > > > +       unsigned int idx;
> > > > +
> > > >         if (!mem)
> > > >                 return;
> > > > -       while (mem->cnt--)
> > > > -               __free_pages(mem->arr[mem->cnt].page,
> > > > -                            mem->arr[mem->cnt].order);
> > > > +       for (idx =3D 0; idx < mem->cnt; idx++)
> > >
> > > for (unsigned int i; ...)?
> > >
> > Ok.
> >
> > > > +               __free_pages(mem->arr[idx].page,
> > > > +                            mem->arr[idx].order);
> > > >         kfree(mem);
> > > >  }
> > > >
> > > > @@ -341,6 +343,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(=
unsigned long min_sz,
> > > >         unsigned long page_cnt =3D 0;
> > > >         unsigned long limit =3D nr_free_buffer_pages() >> 4;
> > > >         struct mmc_test_mem *mem;
> > > > +       unsigned int idx =3D 0;
> > > >
> > > >         if (max_page_cnt > limit)
> > > >                 max_page_cnt =3D limit;
> > > > @@ -356,6 +359,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(=
unsigned long min_sz,
> > > >         mem =3D kzalloc_flex(*mem, arr, max_segs);
> > > >         if (!mem)
> > > >                 return NULL;
> > > > +       mem->cnt =3D max_segs;
> > > >
> > > >         while (max_page_cnt) {
> > > >                 struct page *page;
> > > > @@ -375,23 +379,26 @@ static struct mmc_test_mem *mmc_test_alloc_me=
m(unsigned long min_sz,
> > > >                                 goto out_free;
> > > >                         break;
> > > >                 }
> > > > -               mem->arr[mem->cnt].page =3D page;
> > > > -               mem->arr[mem->cnt].order =3D order;
> > > > -               mem->cnt +=3D 1;
> > > > +               mem->arr[idx].page =3D page;
> > > > +               mem->arr[idx].order =3D order;
> > > > +               idx +=3D 1;
> > >
> > > While looking rather ugly, I think starting with mem->cnt at zero,
> > > and updating it in each step like
> > >
> > >     mem->cnt++;
> > >     mem->arr[mem->cnt - 1].page =3D page;
> > >     mem->arr[mem->cnt - 1].order =3D order;
> > >
> > > would still be better, as it makes the dependency between mem->cnt an=
d
> > > the size of mem->arr[] clearer (located closer to each other), and ..=
.
> > >
> > >
> > Ok, I will start with mem->cnt at zero; with this I can drop changes
> > in mmc_test_free_mem().
>
> I don't think you can drop these changes, as mmc_test_free_mem()
> does mem->cnt-- _before_ accessing mem->arr[mem->cnt].
>
Ack.

Cheers,
Prabhakar

