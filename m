Return-Path: <linux-renesas-soc+bounces-15492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 860E4A7E583
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35BE41884E2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 15:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B84206F38;
	Mon,  7 Apr 2025 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aUG1uU6S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB357206F19
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041176; cv=none; b=odYg2oC5WFB1+6O1KaGan9+QEVuzdlVc90iRamYk8jEU1vPvsJINQWo8Sx7rheEExdxrISNfUQeo8fTMnWo+bvhOVoz3aJ2ZIfLXQAIJnLKMw6AtEkSQh+kgMpLsa8d5vtxpefWSvetOaxcpOWwqQLF7OlGS1V1Se4YJm1RJNeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041176; c=relaxed/simple;
	bh=3yAEh5s1GygKl6HhdpToiQkeOsg+sZZELL9UE4n8IWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNLoaYk6T6y2dGKq+upIy+04o4MQWvn/DbE7oT0E5ergd/NrZH1mM44e/Dildmq5i9xMRlQ4++dt1FRG44wLsRpD1shLW60cL9EBNoCLITfhWCLVDm/XBmNmihp3aWvZJoBCWiQbetRzRccqVugiW5lHcfWOreOgbFzX1adn0GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aUG1uU6S; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4774611d40bso652011cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744041174; x=1744645974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xXXoLwvzZrukEdlx3X/HwLUc1KrRLOBJumxqoeXr2k=;
        b=aUG1uU6ScLxFF//q0sKV/GqKf0DcZeC59rExvS2GFybi9o0nqe2te9cVUWJhNe5DT7
         qbOz5QUb1/fprKrb+8LG7A06fcrvkjIQqR+j9XsIkFPWexy6L3iTbfHTbDSwHrL/LTMT
         lJfrnvVg3VxSNTtiS4e9M7J40NUG5+gy7I7I6vlbXZt739VABA89e5j9RJTs+5pEIQw5
         l8jvoCPVF3A88hTwke0tOOgwlKwplx9gOFLfBvpLU0NxCLBEd5SmaebP/tF6GUamoUiy
         mueBnXbv3NP8wq5It98Dh1GSUofjXi1puNz/fzWwRehFLvocwAeQbEYEzFqbCz7Z1DJE
         GPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041174; x=1744645974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xXXoLwvzZrukEdlx3X/HwLUc1KrRLOBJumxqoeXr2k=;
        b=qEzbjezoqVjaGwOOHbYc+XjAkacS7PxkXAKjfsURcLK+aXx8/EPCLunJIghxLFhPEt
         lzKzXLCwlnzzxmfyJiGXzyHA28ios/P8vY6A8L+nt8SqdjG7+zfCBZCKEvTxCVUWJ/bz
         RxzIDF87bWDKAy0NPjEbl609gpn3ryM/Sfq3j4GQehR9RVB5KS4GNKHgXMQJ6zIFXItw
         47g03geIqosbba1OORNePP1j7GbV427tw1k00l3TCklf4LNcVzn/cMSVd/6DM823XIES
         CnxiZdobh/dQ8jD2IhDIawSGmjm8hTze/pgrP2D7tdCRYk9+SggdhYbY9/7dr0ise4f/
         LFPw==
X-Forwarded-Encrypted: i=1; AJvYcCVwpKjawErP1BPvVmu28CTLr8FpVn73zO/i2eT3GHRdb+K3QLdb38WEBQVJ2fxdohaVfEGLQg8XhqnVRbweGt0JWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx83mpx1j1a+rjelzBqQ8BbqFng84A4uMsYUfAXNIZbpyWNfVey
	w5AIBHId98zIOMQMzGKi8ISXBELp4kTjt33lzJl82xV5ccr1Juwrf7nByaWS6ldG8Z3kmn6u+12
	/504bBQ7UlpJbBZ6r3Afpbh9ZcAjMtMArHkAO
X-Gm-Gg: ASbGnctX1PULNiTSZiA9CoxTqSJXN5XKiIkLgDJkgSG3xuSRe9fc/Ym+tpSdtnPtXh0
	plD7c3s6dfdaPPv4eR/iTph95ykaj3LjiouzIHyNUgYLOkFzjSbBqSp08H2KUX5ujZbRtx8GSwR
	8HFS4Mk2FgMPCV61e6JvceKDc=
X-Google-Smtp-Source: AGHT+IFIBgZaC437wC6LFI2WkYOyO3PJh+Hp0KwQwHgd7KVbv0KJT81vcrxyQeuTbHfu7nS8KoS+po1riLdnTGeL6ck=
X-Received: by 2002:a05:622a:110c:b0:477:1f57:38a8 with SMTP id
 d75a77b69052e-47953704448mr313851cf.8.1744041173528; Mon, 07 Apr 2025
 08:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228182928.2645936-1-fvdl@google.com> <20250228182928.2645936-3-fvdl@google.com>
 <CAMuHMdVWviQ7O9yBFE3f=ev0eVb1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com>
In-Reply-To: <CAMuHMdVWviQ7O9yBFE3f=ev0eVb1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 7 Apr 2025 08:52:41 -0700
X-Gm-Features: ATxdqUF9nwle-L2yhrR-TnrIw4GPykG22raNMPvcz2hBIWJJmX1JDxamArUc2zI
Message-ID: <CAPTztWaAmG2L7L7x0boGG2aCNosJ8GHU=GiAQP-2nuP3k2650A@mail.gmail.com>
Subject: Re: [PATCH v5 02/27] mm, cma: support multiple contiguous ranges, if requested
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yuzhao@google.com, usamaarif642@gmail.com, 
	joao.m.martins@oracle.com, roman.gushchin@linux.dev, ziy@nvidia.com, 
	david@redhat.com, Arnd Bergmann <arnd@arndb.de>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 4:50=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Thanks for your patch, which is now commit c009da4258f9885c
> ("mm, cma: support multiple contiguous ranges, if requested")
> in v6.15-rc1.
>
> After this patch, the printed base address becomes zero on several
> Renesas arm32/arm64 platforms:
>
>   - Koelsch (R-Car M2-W):
>
>       -cma: Reserved 64 MiB at 0x7c000000 on node -1
>       +cma: Reserved 64 MiB at 0x00000000
>
>    - Salvator-XS (R-Car H3 ES2.0):
>
>       -cma: Reserved 128 MiB at 0x0000000078000000 on node -1
>       +cma: Reserved 128 MiB at 0x0000000000000000
>
>   - Gray Hawk Single (R-Car V4H):
>
>       -cma: Reserved 128 MiB at 0x00000000b8000000 on node -1
>       +cma: Reserved 128 MiB at 0x0000000000000000
>
> None of these have actual RAM at address zero.  As I haven't noticed
> any other impact on system operation, I do not know if this is purely
> a cosmetic issue, or if it can cause real problems.
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert

Hi Geert,

Thanks for the report! This is just a reporting issue with my change,
it's working fine otherwise. I refactored the code slightly, and the
!fixed && !multi case will now report base 0, because it doesn't 'see'
the actual allocated base. Let me send a follow-up patch.

Thanks again,

- Frank

