Return-Path: <linux-renesas-soc+bounces-15438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 649F4A7DCE9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 13:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C84E7A4851
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 11:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B382459D9;
	Mon,  7 Apr 2025 11:50:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA9B245007;
	Mon,  7 Apr 2025 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026625; cv=none; b=FBWDUlG8KBN17b63TetI3obSD/2behXzrNmnu5PKvTS8Pw3vlMBaaNXnOQ4MFlZL6DjDTTgpHjQ9J76Qe9YLTlJF3NQQUyNSLY/BmIVua0a6PIL1SVwl+W91PK0pQV3B11BD182sAixYchnS9uUhFXbfeEe51ST6YDAV7I6OyPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026625; c=relaxed/simple;
	bh=SBJ+XKatKMigaFjkefrUBkQQ75OwEkiHbOg7E9kxTUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WReFOzbhrh/atUlJIdhcz/rXYHjTxknC4pVDwc+jYqS1d547baWmmMS+tHfriCfmiYMUIajQN5Oci7FsVio0QIbBUi38lTa6/qSxtU17xGXP9BvLSkV9WzOvj90y9Rwtik4unqid6GHTz3nZReqdn69ax4lRck6OvCCYLOG8/HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5240b014f47so1885587e0c.1;
        Mon, 07 Apr 2025 04:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744026620; x=1744631420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4+pLFMxzNKF7wuYEtBPsrpqj7a4qDgMwXzKwK/DCEs=;
        b=V1z8G0huK/WdVg2Z92QORzeNVH5FtYQAu4oYo4lKBB9hBmEpTF+GV2MnR7+zGp1K/e
         D4Pl7/8iw5hDtGvoWTUXOX4ZbKKoZQ9sGxRm10hPrwJQELoZ4tTAeUr6veQHFiAqKlhV
         oeVkB6HJofBdMMiTIOq71P0Yt1o+zSIJVP5DxLxKZkyJO5h6jOFk71kj8zAXJ6MKi+pV
         msF8C+mlXVlWDku5PFE86ykHtaON+07cyPDIBT59wm/TAvxFUmkGkJXcHmpI9mTEhVGO
         gj8SjTu6IZOg5ee8VbjjlrTkljB2SLEcPLQcybGrT90oqiByFMCgrR1fODHSVnlTmaH3
         1gOg==
X-Forwarded-Encrypted: i=1; AJvYcCW18L385voJTHQ6cCnb9NfPCO0vRPW4lsEdL+oMXDYHkASr7mOGEXYdlEKIsuS4R5nZSsKMw6DMxXhKRXw=@vger.kernel.org, AJvYcCXHHKN/7ozYMy+aOAh5OQLZMXqrO0ZMjqeKsSEs6gKWOeU3e5s5bv2mEui7zzj5D4dt8F8SRzmdiX5mNlDufixUS/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPMdljDYsmmtw6ES8wddJMei5GfZbf3tBQKZ2eirHlxtXMyQVI
	PWdoRZt4qcBuLBcGTBuu1suoixeujREEz9cKBnPIkaqCXWAoJgU+odMV9vou
X-Gm-Gg: ASbGncvpN78djszIrsYXfitPHGTVtglkm5gq3XMch2psN7rA35jIlj3vBMjdFWIQVn5
	4VpOb63SlRPEavAFyEQNn84uQYHbXojvCg1lMXCHJh4tAAS6Wq5fdDpI55xqyfM6BVvi1bAGoSs
	IrL1Xko0Y/n+S96AbfPvj7mkJa348sZ/zg15WnKaIlCDzpTEO/euUYZiLVwwio3HNYnnOaWn30E
	WE9fzebC+yoQUtQI6eYbG1ykMZ7rZYCHQ/rMu0V/o3qBBrACEgM6ge6ir4hVKXeSRNasbFgarqD
	ukj+Ta7hDeRR78uQiXJ/HSw3m884N4Bun5eTgLFWKifIISg8FLpJi0hCk2rCsh+J0RIV3lWUG2J
	ajnUmp7/9BmDmEgx7Sg==
X-Google-Smtp-Source: AGHT+IE3W3F9VA8JhK75TlcsKzRw1dbSRwp3sk1z8hFq2mzXqSVOaA+kE2EqBvulq+Oog/J5uTux0Q==
X-Received: by 2002:a05:6122:168c:b0:51f:405e:866e with SMTP id 71dfb90a1353d-5276444bd32mr7512188e0c.1.1744026620304;
        Mon, 07 Apr 2025 04:50:20 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5275ade8fd9sm1830042e0c.5.2025.04.07.04.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 04:50:19 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86715793b1fso1785131241.0;
        Mon, 07 Apr 2025 04:50:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqFGW58Z9d1lTx8sk+x3RyNtPrh211nea3OIOxcxT8t+dy6iK4UVuXJmeCQqrgKT+0Kxn628vFFFsvbU+sRG/Q2Ig=@vger.kernel.org, AJvYcCWrkaDA/7jxQCjjoTjeKSAFf3IwhJL500p2XBe0i7Y8zhqaHguqRza8gP8+KtXk0xz1FO/dUeD4X2XgMJI=@vger.kernel.org
X-Received: by 2002:a05:6102:f86:b0:4bb:eb4a:f9f2 with SMTP id
 ada2fe7eead31-4c8553aea85mr9265953137.9.1744026619724; Mon, 07 Apr 2025
 04:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228182928.2645936-1-fvdl@google.com> <20250228182928.2645936-3-fvdl@google.com>
In-Reply-To: <20250228182928.2645936-3-fvdl@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Apr 2025 13:50:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWviQ7O9yBFE3f=ev0eVb1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com>
X-Gm-Features: ATxdqUH7PH4vq6Q_RgYLRrVLiKbH_NIvyy9Ay2B6TtCJJJg26LiT8zWJ4O0OrhI
Message-ID: <CAMuHMdVWviQ7O9yBFE3f=ev0eVb1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com>
Subject: Re: [PATCH v5 02/27] mm, cma: support multiple contiguous ranges, if requested
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yuzhao@google.com, usamaarif642@gmail.com, 
	joao.m.martins@oracle.com, roman.gushchin@linux.dev, ziy@nvidia.com, 
	david@redhat.com, Arnd Bergmann <arnd@arndb.de>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

On Fri, 28 Feb 2025 at 19:30, Frank van der Linden <fvdl@google.com> wrote:
> Currently, CMA manages one range of physically contiguous memory.
> Creation of larger CMA areas with hugetlb_cma may run in to gaps
> in physical memory, so that they are not able to allocate that
> contiguous physical range from memblock when creating the CMA
> area.
>
> This can happen, for example, on an AMD system with > 1TB of memory,
> where there will be a gap just below the 1TB (40bit DMA) line. If
> you have set aside most of memory for potential hugetlb CMA allocation,
> cma_declare_contiguous_nid will fail.
>
> hugetlb_cma doesn't need the entire area to be one physically
> contiguous range. It just cares about being able to get physically
> contiguous chunks of a certain size (e.g. 1G), and it is fine
> to have the CMA area backed by multiple physical ranges, as
> long as it gets 1G contiguous allocations.
>
> Multi-range support is implemented by introducing an array of
> ranges, instead of just one big one. Each range has its own bitmap.
> Effectively, the allocate and release operations work as before,
> just per-range. So, instead of going through one large bitmap, they
> now go through a number of smaller ones.
>
> The maximum number of supported ranges is 8, as defined in
> CMA_MAX_RANGES.
>
> Since some current users of CMA expect a CMA area to just use one
> physically contiguous range, only allow for multiple ranges if a
> new interface, cma_declare_contiguous_nid_multi, is used. The other
> interfaces will work like before, creating only CMA areas with
> 1 range.
>
> cma_declare_contiguous_nid_multi works as follows, mimicking the
> default "bottom-up, above 4G" reservation approach:
>
> 0) Try cma_declare_contiguous_nid, which will use only one
>    region. If this succeeds, return. This makes sure that for
>    all the cases that currently work, the behavior remains
>    unchanged even if the caller switches from
>    cma_declare_contiguous_nid to cma_declare_contiguous_nid_multi.
> 1) Select the largest free memblock ranges above 4G, with
>    a maximum number of CMA_MAX_RANGES.
> 2) If we did not find at most CMA_MAX_RANGES that add
>    up to the total size requested, return -ENOMEM.
> 3) Sort the selected ranges by base address.
> 4) Reserve them bottom-up until we get what we wanted.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Frank van der Linden <fvdl@google.com>

Thanks for your patch, which is now commit c009da4258f9885c
("mm, cma: support multiple contiguous ranges, if requested")
in v6.15-rc1.

After this patch, the printed base address becomes zero on several
Renesas arm32/arm64 platforms:

  - Koelsch (R-Car M2-W):

      -cma: Reserved 64 MiB at 0x7c000000 on node -1
      +cma: Reserved 64 MiB at 0x00000000

   - Salvator-XS (R-Car H3 ES2.0):

      -cma: Reserved 128 MiB at 0x0000000078000000 on node -1
      +cma: Reserved 128 MiB at 0x0000000000000000

  - Gray Hawk Single (R-Car V4H):

      -cma: Reserved 128 MiB at 0x00000000b8000000 on node -1
      +cma: Reserved 128 MiB at 0x0000000000000000

None of these have actual RAM at address zero.  As I haven't noticed
any other impact on system operation, I do not know if this is purely
a cosmetic issue, or if it can cause real problems.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

