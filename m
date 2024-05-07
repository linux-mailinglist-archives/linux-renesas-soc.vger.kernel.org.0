Return-Path: <linux-renesas-soc+bounces-5210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ACE8BE6FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2024 17:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A74A82824E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2024 15:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35AD16193C;
	Tue,  7 May 2024 15:08:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA280161338;
	Tue,  7 May 2024 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715094529; cv=none; b=PHEP1RdO2ztJLqf8SNZ2Z1OwSVDOl8KUPANFhhEfE0HsJy7TW3qRnf+5i51yEuc2dMXwsaqGUWribXp0V9F8CCqoFITj2GPuhwfaO2YCGh01/HQH4L6rcEfvp4bxEDe2/1Obuh5LoDg2wo9OyFcW+I1PQTocSwkwP+hiWOA33Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715094529; c=relaxed/simple;
	bh=WJx05AdhqH/Yl0neVY65uOiOs7cbbo6THRsoqaHvmjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Brc26FK/hvWqt2ANWZ0U9Qdiqnzg0Nq0GFztifqYHmLOc4C0op0Yy4xVTze7ZWkzQ/2YhVbuc8QtSVV0vtuhCzAzpIvgwjCeHhJRxT/ps5EkYZXsf1w2Qg/C8tymBxALRRPiXkpWDU2K0hA4VZbz2P2yGQXKt5hgPnymDpv6190=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5acf5c1a2f5so1912044eaf.0;
        Tue, 07 May 2024 08:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715094526; x=1715699326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjPNY+YN3AvsteCp9o4WA9jTEFYIMLWbrrEz2tsoKMc=;
        b=hTEaQejw5ybID1/18QakMwo8uyBchqKvmdLgUCbdHgzCz/5ZL0aAJPDJ/vMPbvd0Ux
         ruBTASjPChjEbC/6CeGrh26PKxq/bfu/7CdERHPNIalg0vBsE8y20VJe3+xtVZBSlVjC
         wZbWthSAUqyIKfu0jwtN7yBtew2cKXoyP8+9qQTnmxq88sOpiHTZmshaPkeu+0FXSfhu
         b5ylJGvCbIIPXjBi3P4Q6WXo7o1nFitvZJW8l3G6yqvDf+YoFf8ZUiFfRljl8VA5wy0J
         XC7L6cBkrylnEmtgo2Qf6mzzK9ztw6L4/xjMf5QMSszmmsxpkV9oUSKHVzKbNA4OWtKr
         bEvA==
X-Forwarded-Encrypted: i=1; AJvYcCWY2yh58e60WunGZ+cbkPyPQMeINQkm05OpWJKZXNz62Jx/xm2xkuUz/md2zJK2EC4nalWgertRM5j3cSwcSj4sHL2knEqT9v+ldzit75MMkhqumR40XMl5Wf8yczRrWsk9BoMmN/GqqyahZa0To2A=
X-Gm-Message-State: AOJu0YxASaE+iEPdy8RWpy10l0j9CY9upvweprrmkOedQupsaF0OUJ3s
	LFz7+ETBBpV2P5RkIXrBosO78tIQ8JVUq/tx1X3Jx2cuozuJx+DAT6dyEzIh
X-Google-Smtp-Source: AGHT+IFrONYFfsmw/Rp6uGtitJR9BYULwjKYiXOUu9TjQd4ZFLv4R4KGRnnnpuJ+7RCeCfHy6i5Snw==
X-Received: by 2002:a4a:dc4:0:b0:5ae:fe80:7dd3 with SMTP id 187-20020a4a0dc4000000b005aefe807dd3mr12823690oob.7.1715094526186;
        Tue, 07 May 2024 08:08:46 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id dy11-20020a0568202d0b00b005a46d5bd558sm2438589oob.45.2024.05.07.08.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 08:08:46 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c97dab75bbso369376b6e.0;
        Tue, 07 May 2024 08:08:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWerrzkVk1BboDW8cQu8TZoXqcUCfYp0SCMYiAuKZMvH0EUgdPwKMoDMBolOcBJ+wyGTsZkToPxefbJzthaQIUM8OwPpF773pRiAVAY2k0EQN3tvgPE8md5rlmtSDwweLDOaiEsYajz+N2dKZb8hGU=
X-Received: by 2002:a05:6808:118c:b0:3c9:63c5:502b with SMTP id
 j12-20020a056808118c00b003c963c5502bmr9830227oil.30.1715094525810; Tue, 07
 May 2024 08:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325110036.1564-1-jszhang@kernel.org>
In-Reply-To: <20240325110036.1564-1-jszhang@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 May 2024 17:08:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUckNuraENvsiQ_QHmzNQeT_-9_jZvKZr5LuiFEJVFnmQ@mail.gmail.com>
Message-ID: <CAMuHMdUckNuraENvsiQ_QHmzNQeT_-9_jZvKZr5LuiFEJVFnmQ@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] riscv: mm: still create swiotlb buffer for
 kmalloc() bouncing if required
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jisheng,

On Mon, Mar 25, 2024 at 12:15=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org>=
 wrote:
> After commit f51f7a0fc2f4 ("riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC
> for !dma_coherent"), for non-coherent platforms with less than 4GB
> memory, we rely on users to pass "swiotlb=3Dmmnn,force" kernel parameters
> to enable DMA bouncing for unaligned kmalloc() buffers. Now let's go
> further: If no bouncing needed for ZONE_DMA, let kernel automatically
> allocate 1MB swiotlb buffer per 1GB of RAM for kmalloc() bouncing on
> non-coherent platforms, so that no need to pass "swiotlb=3Dmmnn,force"
> any more.
>
> The math of "1MB swiotlb buffer per 1GB of RAM for kmalloc() bouncing"
> is taken from arm64. Users can still force smaller swiotlb buffer by
> passing "swiotlb=3Dmmnn".
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks for your patch, which is now commit fc7a50eed9860d4b ("riscv:
mm: still create swiotlb buffer for kmalloc() bouncing if required")
in riscv/for-next (next-20240429 and later).

On RZ/Five, which has 1 GiB of RAM, i.e. a bit less for free use:

     Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
     Built 1 zonelists, mobility grouping on.  Total pages: 225792
     mem auto-init: stack:off, heap alloc:off, heap free:off
    +software IO TLB: SWIOTLB bounce buffer size adjusted to 0MB
                                                             ^^^
    +software IO TLB: area num 1.
    +software IO TLB: mapped [mem 0x000000007ef56000-0x000000007f056000] (1=
MB)
                                                                         ^^=
^
     Virtual kernel memory layout:

I was a bit intrigued by the "0MB".  However, that seems to be correct:

     mem_init: memblock_phys_mem_size() =3D 939524096
     mem_init: size =3D 917504
     mem_init: swiotlb_size_or_default() =3D 67108864

and it must be rounded up to 1 MB later.

Apparently arm64 has the same discrepancy, which I never really noticed
before (and I have no arm64 platforms with 1 GiB RAM or less):

     mem_init: memblock_phys_mem_size() =3D 2013265920
     mem_init: size =3D 1966080
     mem_init: swiotlb_size_or_default() =3D 67108864
     software IO TLB: SWIOTLB bounce buffer size adjusted to 1MB
                                                             ^^^
     software IO TLB: area num 2.
     software IO TLB: mapped [mem 0x00000000b9400000-0x00000000b9600000] (2=
MB)
                                                                         ^^=
^

> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -161,11 +161,25 @@ static void print_vm_layout(void) { }
>
>  void __init mem_init(void)
>  {
> +       bool swiotlb =3D max_pfn > PFN_DOWN(dma32_phys_limit);
>  #ifdef CONFIG_FLATMEM
>         BUG_ON(!mem_map);
>  #endif /* CONFIG_FLATMEM */
>
> -       swiotlb_init(max_pfn > PFN_DOWN(dma32_phys_limit), SWIOTLB_VERBOS=
E);
> +       if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &=
&
> +           dma_cache_alignment !=3D 1) {
> +               /*
> +                * If no bouncing needed for ZONE_DMA, allocate 1MB swiot=
lb
> +                * buffer per 1GB of RAM for kmalloc() bouncing on
> +                * non-coherent platforms.
> +                */
> +               unsigned long size =3D
> +                       DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
> +               swiotlb_adjust_size(min(swiotlb_size_or_default(), size))=
;
> +               swiotlb =3D true;
> +       }
> +
> +       swiotlb_init(swiotlb, SWIOTLB_VERBOSE);
>         memblock_free_all();
>
>         print_vm_layout();

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

