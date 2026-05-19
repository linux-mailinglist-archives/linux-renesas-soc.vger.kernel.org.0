Return-Path: <linux-renesas-soc+bounces-32795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGSBOHQ3DGoKaAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:12:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 504EC57BF64
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F0393067E82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB5948165C;
	Tue, 19 May 2026 10:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAMvRBcC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26548124D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185153; cv=pass; b=D41mFLoj+FqzBrA5rfOx3JOYJSAT01Ez0U5UKABe+6J7IkSmKkO4BWC8B6sm6njreywpWXThj6NrSZx6J0cZy9fFqGw53NgwPgbPavrbsU+rX7gn3DC1tlxEm5tCzHxCCjSXdYUc128B0PqJRxaTjpL434SI1paJZx/ydfcb4Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185153; c=relaxed/simple;
	bh=czyUKy/5TRWEYZwJjc6/HYigu7VtwCQiu37oSpPfG88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDBWxBi5YeqihKYR3fQw2VTpX8wZvEXlaCub/+zSALOnaoYFDY2OTPqrGXWDpQU+QgvZBoJLRTsMumkmn0a0H4ZHr4zRrY8CaJQPT9YTv7IHVclUNFrUfNlYS+ZZSkJfDsuHZak7KUUMH36SAorzConOVDe5CjgwmvuBiurjm5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAMvRBcC; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45562c41ec7so1990921f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 03:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779185148; cv=none;
        d=google.com; s=arc-20240605;
        b=Zvuw5yJJ3lL5iUxxYSgkMIXjOVXyTXRCQ1zJoAiCQj0JfqNiu/P44G3wKFldpsNTN+
         HAHq9/PF0/+PXD13RJAq/fT2cEgeM4qb+ELGpUic4ac97suS+iQ/NNi085AxphdNE8gZ
         20KMx1hFI/sXwHYtgV9GXilB6fUMatAJ6oEudq/eCy2ERhctkHlHFwyw9AGGNoyIksF4
         HOaKBr+gG1tK9wCjWcpfSvn3U4xeVwF3VvG76GBHKACF+1F8iWs2KeeAu8To/9UNL5j3
         cawDW3NQ/8YAJOLkl3RBXgq26/5CL3qP74GKjDDlkL5ACa+ofcaaz8GzLwuVbpUFQWyC
         QyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RiYL6/RjiqiIsp067U9+dXVTX/+7ETKrZ/JSTHkELaY=;
        fh=a33FfbcGE97lcLBmNVEnYZA1Ucp4E+kgVkrcmANLV1w=;
        b=A+XYzPPhepRz+dacWhTDOAFUEH7l8kW+GK47c63z0CcEorysp7kXTdkSHDYVVC3tRK
         haSk389dHBc4EYQ6kwkeSmUYUcMQcAmytIJY6cgNJUotiG1shTXHRiH9UExax48CeRlT
         qOSjOYHxAyOHWSoru4Q+oHxcUa3x97rdhIYfIBg+29zMMOVP7gmFX7ZPENa0aDA0Dx63
         gbcrrJjxOdOfTMjCc++wXz0RRp6dnkm6PTiXY8V3SW4nmhNx25BJC+lpwVDyrqdFpanK
         p/8DKk8++KVd6FRvtNavQ2xFNSQhjAM4GcgdwSQITAaZ7kAAaiqkiU/jr17s7nnU4N59
         SYzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779185148; x=1779789948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiYL6/RjiqiIsp067U9+dXVTX/+7ETKrZ/JSTHkELaY=;
        b=IAMvRBcC7KgDVLtKWKI4ISN4eoS0ZjDPL79AexCe/c+r27PAdyN0x4u0I74uCq9seA
         DSSGiqsjKnspvetARzkTs2IErDsUBGILVDOOYv5XaJteVxLswnn4xC4pYhXNZZiOtrzk
         qEtSy7fw1V7AAmmrdMhZKUtf0HH1jRaDC2TUnLTJFaNSse1qc7j2UmSTPqpwCf/JRayX
         +d/EYPH8bZr7TOVnGUaprz0L+5hC017w9wapEVuKd47n/raWnUAXRhFtnh+h+/csOTg4
         tXvfn3qce/LnONJ/0fY2zKFoIcGtZJPuSEIoggNHq3hw0vRGVnKsKMj7yAn3x8uIZwRt
         hPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185148; x=1779789948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RiYL6/RjiqiIsp067U9+dXVTX/+7ETKrZ/JSTHkELaY=;
        b=jgo7I4I+8O+S9e7Oa03njH8jOAr6FP9JmYnW71epn9lL8osNDjVhTOLBuWhPxyzVvk
         RDPoEMf1u4aOyPZonztUuiMZlcrFRDJ6/7Pzj2ZtQbQlZZ1r4MR6D98by1zD4vBuphhz
         a4ftF1DbihIOixNG4tG3KzY1E6ukFYgCuImEjv22kmHo+G4Op/4gZyBbTP/KG8Q8byhq
         7uXXb/czX3Wf6yLwYeOKSwcSkJ03ZcSoR/guZ6L5omZ9GXN0Im+V4CYd6THBvxyFPclZ
         KHm8YowfVqIOboDdKUu3EDa0VWHoa2L+JfZD+/Ecq00xgk1rSisFiI3TwZDwShyAGK1E
         /ptg==
X-Forwarded-Encrypted: i=1; AFNElJ+fn/0b4SaAlsxisdiPq7SJ+cn8HZlRHPjyRWBrEyg15NCcbLL6H9fHiVTUR5B4+TDpvCSL4+9iWDLisN+uCZvWnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6hWML24Kci8RR59PLN/63wDu9CfNOMLgKXPdObk3SVMoyhTl4
	YK358UGJQLwwTIIsUW5Pjy/pikkPWRXXy+LdRXlRbBoVvdnu2v35pUBeLbii/UJSP5J5ZrHefkL
	wYnQ3KVeGoSdEkN9f8olYW54tsMgfohs=
X-Gm-Gg: Acq92OGAPHi65g35+i85D9FjDdH3j/+994xulWrDAONvFNldtciKtJ5NysdUzqXMjxf
	s//zqP9VJLCj0QdGcaQNtnyJJFrDD35IJUOkArJ2PbJO+PJGs8in869SM2xzOSNMfRJTtBfTCg3
	TLcDJ2Ar/I9oHrihKEmiRIdjj2LX6Q7cNclH3JsIlihZsoNTqzmoxsSiUk1GEcEn6SGOCdy2jVE
	xt97NsC09HJgFJTEe6IyXimAhtGS6WnOJUrh1gNl6sZyVnaa2jHaeTNp8skht966Wg5s+tjyfMr
	B54rDLzLdU0nnvK4io0rTj4U+UovpxdqR2pobB9j1FJl7vDqQKZCVAZNhj6EsZZF3UF15zySXKb
	JFBE=
X-Received: by 2002:a05:6000:1787:b0:45b:d5d7:1f59 with SMTP id
 ffacd0b85a97d-45e5c5e3282mr30988684f8f.24.1779185148172; Tue, 19 May 2026
 03:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513201315.3186621-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV0BybWdKsPgB5TGg61U+E5u71Fu5KgXpj1sUuq-QcRQA@mail.gmail.com>
In-Reply-To: <CAMuHMdV0BybWdKsPgB5TGg61U+E5u71Fu5KgXpj1sUuq-QcRQA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 May 2026 11:05:22 +0100
X-Gm-Features: AVHnY4JoB4T1br5m3mLltNKq-ucASMJuVjuTIoj0NffHxkPFdgR_H0jzHgpPrWU
Message-ID: <CA+V-a8t5NZP5QamrdH2-ViMcShcYh3czLsZ+0kkD_kjUodjTyw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmc_test: Fix __counted_by handling after
 kzalloc_flex() conversion
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
	TAGGED_FROM(0.00)[bounces-32795-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 504EC57BF64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Mon, May 18, 2026 at 12:08=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 13 May 2026 at 22:13, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Fix logic issues introduced by the kzalloc_flex() conversion in
> > mmc_test_alloc_mem() due to interaction with the __counted_by
> > annotation on the flexible array.
> >
> > Bounds-checking sanitizers rely on the counter field reflecting the
> > allocated array size before any array access occurs. However, use
> > mem->cnt both as the allocation size and as the runtime insertion
> > index, causing incorrect indexing and potentially invalid bounds
> > tracking.
> >
> > Initialize mem->cnt to the maximum allocated number of segments
> > immediately after kzalloc_flex(), then use a separate local index
> > variable to track successfully allocated entries. Update mem->cnt to
> > the actual number of initialized elements before returning or entering
> > the cleanup path.
> >
> > Also rewrite mmc_test_free_mem() to use a forward for-loop, improving
> > readability and ensuring only initialized entries are freed.
> >
> > Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/mmc/core/mmc_test.c
> > +++ b/drivers/mmc/core/mmc_test.c
> > @@ -316,11 +316,13 @@ static int mmc_test_buffer_transfer(struct mmc_te=
st_card *test,
> >
> >  static void mmc_test_free_mem(struct mmc_test_mem *mem)
> >  {
> > +       unsigned int idx;
> > +
> >         if (!mem)
> >                 return;
> > -       while (mem->cnt--)
> > -               __free_pages(mem->arr[mem->cnt].page,
> > -                            mem->arr[mem->cnt].order);
> > +       for (idx =3D 0; idx < mem->cnt; idx++)
>
> for (unsigned int i; ...)?
>
Ok.

> > +               __free_pages(mem->arr[idx].page,
> > +                            mem->arr[idx].order);
> >         kfree(mem);
> >  }
> >
> > @@ -341,6 +343,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsi=
gned long min_sz,
> >         unsigned long page_cnt =3D 0;
> >         unsigned long limit =3D nr_free_buffer_pages() >> 4;
> >         struct mmc_test_mem *mem;
> > +       unsigned int idx =3D 0;
> >
> >         if (max_page_cnt > limit)
> >                 max_page_cnt =3D limit;
> > @@ -356,6 +359,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsi=
gned long min_sz,
> >         mem =3D kzalloc_flex(*mem, arr, max_segs);
> >         if (!mem)
> >                 return NULL;
> > +       mem->cnt =3D max_segs;
> >
> >         while (max_page_cnt) {
> >                 struct page *page;
> > @@ -375,23 +379,26 @@ static struct mmc_test_mem *mmc_test_alloc_mem(un=
signed long min_sz,
> >                                 goto out_free;
> >                         break;
> >                 }
> > -               mem->arr[mem->cnt].page =3D page;
> > -               mem->arr[mem->cnt].order =3D order;
> > -               mem->cnt +=3D 1;
> > +               mem->arr[idx].page =3D page;
> > +               mem->arr[idx].order =3D order;
> > +               idx +=3D 1;
>
> While looking rather ugly, I think starting with mem->cnt at zero,
> and updating it in each step like
>
>     mem->cnt++;
>     mem->arr[mem->cnt - 1].page =3D page;
>     mem->arr[mem->cnt - 1].order =3D order;
>
> would still be better, as it makes the dependency between mem->cnt and
> the size of mem->arr[] clearer (located closer to each other), and ...
>
>
Ok, I will start with mem->cnt at zero; with this I can drop changes
in mmc_test_free_mem().

Cheers,
Prabhakar

> >                 if (max_page_cnt <=3D (1UL << order))
> >                         break;
> >                 max_page_cnt -=3D 1UL << order;
> >                 page_cnt +=3D 1UL << order;
> > -               if (mem->cnt >=3D max_segs) {
> > +               if (idx >=3D mem->cnt) {
> >                         if (page_cnt < min_page_cnt)
> >                                 goto out_free;
> >                         break;
> >                 }
> >         }
> >
> > +       mem->cnt =3D idx;
> > +
> >         return mem;
> >
> >  out_free:
> > +       mem->cnt =3D idx;
>
> ... as having to set mem->cnt twice looks rather fragile to me.
>
> >         mmc_test_free_mem(mem);
> >         return NULL;
> >  }
>
> Regardless, as the patch looks correct to me:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

