Return-Path: <linux-renesas-soc+bounces-32762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHOzHq33CmpZ+QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 13:27:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BB556B888
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 13:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3DF23033FB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C193F2102;
	Mon, 18 May 2026 11:08:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2D3F20E9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102519; cv=none; b=O5D6fwZbNOSD4m6oFmZr/uP7NAUkCEA0P1OYpLc7azqeQSi3OJnHS23oH2j6mf/I6shCB9uMmTIIRsRA+g8D6fERtkoqky7uKvoZY0N3OAp2j2xz+0hgPFf1n7xtR7oiNgnft7Iy6d8JiEgiJI5WpuE2h7Ic7zSeSnzj0Grl7TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102519; c=relaxed/simple;
	bh=PMRKc7cmQjcXH+EkLu8ARQjGDKAXvbHuRPNvuV2hbJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+qyDytzbI7FfkQWifrozSUXR8U4XvjdwN/8p7wMUW8nInxkUDxzJCgkHk8CDH1fi/t0wlX95nsmf1ob+Bxzk7RdjpYfmp+geQEbVjYf3+MQ1menDF/QDAzlyxi8mVSh46U7jVFN2T3x+slrnjLujoUEkI2DpcRjIq7lL2wPVQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95cd8b71105so1277259241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 04:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102514; x=1779707314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu+ZJS6PxzVr6PaR8SZzr/7K/mvYhij6WlM6YgqWCaY=;
        b=XjIDIT52beB5p//uefp6uzLhTtZ9YZvpqU4pkOSq07Olc2Af9/FxW3VlL8av77VwFM
         TSP0CCZz3M8wktnXtM8b0DJjIvskzhviAZmaaFWKANn8uYW7Q8s+SyAYCc18I9rxA2lo
         we4aLeIEbDJNo6zI5wnWwOpRCvdPSicneiSZ2t/DANDIliSpZvr0Svb16UnbuIKiQiqi
         lmpP1KKdY+nQ92AJRh8xKpXa95II+krlTwkESWz8OEoOYjsWquyDzLLKONhCL2DxP0H8
         XpDBVD+Po1fcN60B+vuY+dD8/hbC/CdIYi0s05z+d5NihfJTJBdPB0k6+cMNCC8Ymw4z
         +Dmw==
X-Forwarded-Encrypted: i=1; AFNElJ+j26xcKIE5Pd5RUndkVyiGg0zSGs30N4TN2WbwZ7FHs7L5u+Zd1WSpZEXSSIQ/gdX/VSY3d7VjBu77YMEAzQ3TNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA6dMgcz/LlRGQ61T2XXcU4RQz0s/spu317804RswxQb5VofRY
	G0sbsgWT9HOUcY0XBLdRzb/HjXng+sCKxOz+s+cm5RqU9LgoUL8cXQUlEapEro9W
X-Gm-Gg: Acq92OF+fR09DyEnPG8zPqhlN+fro6Qt2IpPEkYx3nVLec6DzPSX6vEECGphJnqbyDX
	e80ixloWRXHJVS5MmVIjpa3D2tTkkqzW72K+lwVUebCHDWz8ggZMnR4KGmv6ISIaUK1tBo2Q/gm
	ySlcm+ES9ebq1hpnMyf5jYAhGKlLQ5i+f8nbNfGKi39Mjt8ZxnSb5SlY8fVIK0JHKaS4x4CTpdk
	oDIFh3QZ9l3H+Ax+51M8f0tFGqJcIJJcphrH9utjFTfOMT8qqkl9A5TvBQAexFak1uHzQhl6k0D
	kWGiJq1oTVpmiesYGx6CjIS7AYnNwDbtpL94P1QwpHmrtXedmdw9N6fRiWJEicDxsQ1Xs9K53XK
	Y89+VLh4e9a3G0mvKEPzdnu6WRVe2l+IcVRrIgVJXzs6WQIgsN0opkdiueaj3SJX581cQ6bckro
	7Qv0dg4QIFCU4iyWAMTwPyw+Ms6tLicmrRagUIvz6C+XFITWLULWbJNaDoz+T+fXhqd6/e7GEcl
	Vw=
X-Received: by 2002:a05:6102:304d:b0:5ff:e39d:9f93 with SMTP id ada2fe7eead31-63a3d42ebbamr7458924137.11.1779102513676;
        Mon, 18 May 2026 04:08:33 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63ccf18cfc4sm4442330137.2.2026.05.18.04.08.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:08:33 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-57512b86273so1648096e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 04:08:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8cmyJL6gSRds2MXH+1FODIaZenH4lzwgE2FZKJgWpHQd0DEPd+/IrKaflWFdnB/GkmWHHkDgcDiU/GBhsErTmi0w==@vger.kernel.org
X-Received: by 2002:a05:6122:2a0e:b0:56c:fe16:f54b with SMTP id
 71dfb90a1353d-5760c0a6a8fmr7462476e0c.11.1779102512538; Mon, 18 May 2026
 04:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513201315.3186621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260513201315.3186621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 13:08:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0BybWdKsPgB5TGg61U+E5u71Fu5KgXpj1sUuq-QcRQA@mail.gmail.com>
X-Gm-Features: AVHnY4J3hgDaRNuD4ScVRVVTPiyGFnGF31deZAtpvTXzLCoed5gLPEQJi9qAKiU
Message-ID: <CAMuHMdV0BybWdKsPgB5TGg61U+E5u71Fu5KgXpj1sUuq-QcRQA@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmc_test: Fix __counted_by handling after
 kzalloc_flex() conversion
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 01BB556B888
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32762-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Action: no action

Hi Prabhakar,

On Wed, 13 May 2026 at 22:13, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Fix logic issues introduced by the kzalloc_flex() conversion in
> mmc_test_alloc_mem() due to interaction with the __counted_by
> annotation on the flexible array.
>
> Bounds-checking sanitizers rely on the counter field reflecting the
> allocated array size before any array access occurs. However, use
> mem->cnt both as the allocation size and as the runtime insertion
> index, causing incorrect indexing and potentially invalid bounds
> tracking.
>
> Initialize mem->cnt to the maximum allocated number of segments
> immediately after kzalloc_flex(), then use a separate local index
> variable to track successfully allocated entries. Update mem->cnt to
> the actual number of initialized elements before returning or entering
> the cleanup path.
>
> Also rewrite mmc_test_free_mem() to use a forward for-loop, improving
> readability and ensuring only initialized entries are freed.
>
> Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/core/mmc_test.c
> +++ b/drivers/mmc/core/mmc_test.c
> @@ -316,11 +316,13 @@ static int mmc_test_buffer_transfer(struct mmc_test_card *test,
>
>  static void mmc_test_free_mem(struct mmc_test_mem *mem)
>  {
> +       unsigned int idx;
> +
>         if (!mem)
>                 return;
> -       while (mem->cnt--)
> -               __free_pages(mem->arr[mem->cnt].page,
> -                            mem->arr[mem->cnt].order);
> +       for (idx = 0; idx < mem->cnt; idx++)

for (unsigned int i; ...)?

> +               __free_pages(mem->arr[idx].page,
> +                            mem->arr[idx].order);
>         kfree(mem);
>  }
>
> @@ -341,6 +343,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsigned long min_sz,
>         unsigned long page_cnt = 0;
>         unsigned long limit = nr_free_buffer_pages() >> 4;
>         struct mmc_test_mem *mem;
> +       unsigned int idx = 0;
>
>         if (max_page_cnt > limit)
>                 max_page_cnt = limit;
> @@ -356,6 +359,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsigned long min_sz,
>         mem = kzalloc_flex(*mem, arr, max_segs);
>         if (!mem)
>                 return NULL;
> +       mem->cnt = max_segs;
>
>         while (max_page_cnt) {
>                 struct page *page;
> @@ -375,23 +379,26 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsigned long min_sz,
>                                 goto out_free;
>                         break;
>                 }
> -               mem->arr[mem->cnt].page = page;
> -               mem->arr[mem->cnt].order = order;
> -               mem->cnt += 1;
> +               mem->arr[idx].page = page;
> +               mem->arr[idx].order = order;
> +               idx += 1;

While looking rather ugly, I think starting with mem->cnt at zero,
and updating it in each step like

    mem->cnt++;
    mem->arr[mem->cnt - 1].page = page;
    mem->arr[mem->cnt - 1].order = order;

would still be better, as it makes the dependency between mem->cnt and
the size of mem->arr[] clearer (located closer to each other), and ...


>                 if (max_page_cnt <= (1UL << order))
>                         break;
>                 max_page_cnt -= 1UL << order;
>                 page_cnt += 1UL << order;
> -               if (mem->cnt >= max_segs) {
> +               if (idx >= mem->cnt) {
>                         if (page_cnt < min_page_cnt)
>                                 goto out_free;
>                         break;
>                 }
>         }
>
> +       mem->cnt = idx;
> +
>         return mem;
>
>  out_free:
> +       mem->cnt = idx;

... as having to set mem->cnt twice looks rather fragile to me.

>         mmc_test_free_mem(mem);
>         return NULL;
>  }

Regardless, as the patch looks correct to me:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

