Return-Path: <linux-renesas-soc+bounces-18927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 148DFAEE3BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 18:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56E8A3B2D8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 16:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282D828FAA7;
	Mon, 30 Jun 2025 16:09:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8CB28C5AC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jun 2025 16:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299749; cv=none; b=h3NRBNrUh4PWu6TXVUsRtUz4q4b4jMbfajwxP5fWi6Xbw0uYHQTB6xoVfmFhDBDmHhszMdgvdUCfjsqIAu4enwvA5ZzaCR/lqPAqt0dmxi96FGZtBknRagqPKzVpcDRaeRyB62jH27u1kkcDtxYUpcEaQLW/VaFa5tGKZ1+/LMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299749; c=relaxed/simple;
	bh=4wtKSUWnowYLHZTRCxMpuJjLMo4cJlr9IICx69OxmN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sv46hDQGGflk+DgJyJh2CJ2vxgBrauz945HVBqo4gwZDMPlbyIefoEJ19PRH9Tq/TcAe6ifDs5R8O3Z1bXy0bEdzPEgjd4OsvVE9ktyescUtejUmx9jdNkJu5P6wYFQOfMIEyZ3xsR4zV1L21L7zJ57u9a+Ku6uNTfoVcPDRFSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a44b0ed780so29069121cf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jun 2025 09:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751299745; x=1751904545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ESUYQIUUEOXWfvuUjT7YbrJEqAbPIXkMFZKy7WGl1Y=;
        b=gk3l1RIZ2EeQud2pbTu37MjwAZ0/Qc/zXGxl1gE8ERwgDLMfBFin4srIUz/p9DE/3m
         jPNuu3xthcWDjJvn4gf+8LVH5I/08VOTXiN/hS1TeHl5784eVW1Wr8FI7UNWD/YPQTFX
         xo3uBOZIi6Ux35ASURW5evt5iFJeJBVLuUVzXihmOhpmBguGTCqeldwni9dbUKVuKOoi
         J4/TNTNqCF4ZmLBN+4uCFeZBxkImUXpAltjdSwzIVQPmOotZPxiX7Ncq5My3eLkVMt/I
         guf+rum6NA3slbA4/9dpsFvClHOWyidG2PhCf+w1Ifea1Gw7/mo68/Cf6b7ZGBlc9Dna
         Qisw==
X-Forwarded-Encrypted: i=1; AJvYcCW8bLhOn0kyxcgJgVVvGpKs30SBq17GieNKeLS3x99TCtzfLFRciOJG/cYEMTsIZbEFXM/rqjhwDECK39WRUP2+bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYcU/Y8aehDvoF9RuBieyCe3EXBNgJ1NPSkMArF4Ge34mZe2NB
	Jj2JkhEMoCfB53mc7FPxD7hW0GZP5AFRjWxuLjv6X6Debi6n3FxmV6ssHUqMrtN5
X-Gm-Gg: ASbGncsj8gPlezCIwlpwE8RQ3YGRH++XowDZ0GWlSfUkxhJVG46ID+slYjrwRMSfL/U
	vTSJ+D9vbtdNqXL4G05pGw0KEi7taR8x377PX/ALAevj/E7JzhMFaXhlvODbDj3zZV4AXcrKaGO
	7EWcCNHJdiAURrD58tbZeJKkaV5gnGHaOf+sdkM57bSa13TRIA4BB9PHQUam5FBnbu+ShoJxnel
	vR0O/1OIe1SBavNCCiLX0WhN+Xc8ecyAi5XuVvTEmTCHcyk8rV0X7V/DYx7Hh+mE9ZCAmmCFJ7t
	BjS63Hm0s/z+6K/KupBeM2Ho3aPjXOWHh6P8/JwOB1OssBfccvE3xpTqMzj872fVOX0uiqMwnaW
	a19dZosM7AoZFnLHi+C7fY1ZTB6zA
X-Google-Smtp-Source: AGHT+IFaPxdRi4Ewdhj/cmfSoyXuGLmYJWPzh2lQk/hh4uLa0OjLt4pkf1/2xBEzPpULZ9cIuJ3BaA==
X-Received: by 2002:a05:622a:5888:b0:4a6:f0da:82ab with SMTP id d75a77b69052e-4a7fcb2a6f8mr250632011cf.52.1751299744481;
        Mon, 30 Jun 2025 09:09:04 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57c78dsm60851111cf.58.2025.06.30.09.09.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 09:09:04 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d09ab17244so222080785a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jun 2025 09:09:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtZVl0/saVPBAYlR9Y4TILz1VJWgbj3/50FPtV6VGbugHAzp3ZFqjcdgiWyJNiiUs6FlEyNTqnPevyvwb1NgKG5A==@vger.kernel.org
X-Received: by 2002:a05:620a:a816:b0:7d3:ad4f:ce0d with SMTP id
 af79cd13be357-7d4439a8318mr2015298385a.47.1751299744039; Mon, 30 Jun 2025
 09:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
 <109b5c25-f54c-4413-aa62-8e2ae621c8e6@linaro.org> <a263d600-4f62-4d40-864c-e0b0c42f6863@mailbox.org>
 <ef842208-069e-4471-8680-f945d5ccb1a7@linaro.org> <e6c51a8d-978e-44f0-bff1-efcd05617aa7@mailbox.org>
 <67da8003-ced9-4b52-a484-b37147068ae7@linaro.org> <32d302d6-b404-4814-9f17-fda5fe0d3391@mailbox.org>
 <5ff999e9-f0b1-4550-98c8-2d1eb7e97389@linaro.org>
In-Reply-To: <5ff999e9-f0b1-4550-98c8-2d1eb7e97389@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jun 2025 18:08:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKad84Yfsg=ZFMhzc2SxNmBT=NqWaHTGF9sh_12iNKYQ@mail.gmail.com>
X-Gm-Features: Ac12FXywMjoREQPTWoeAnfKEMIRlm_XHuzAH_qpPoDC1H1n0WbeRjxoMHk2x9xI
Message-ID: <CAMuHMdVKad84Yfsg=ZFMhzc2SxNmBT=NqWaHTGF9sh_12iNKYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Neil,

On Mon, 30 Jun 2025 at 17:34, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> On 21/06/2025 18:03, Marek Vasut wrote:
> > On 6/16/25 6:26 PM, Neil Armstrong wrote:
> >> On 16/06/2025 18:05, Marek Vasut wrote:
> >>> On 6/16/25 1:45 PM, Neil Armstrong wrote:
> >>>> On 13/06/2025 12:54, Marek Vasut wrote:
> >>>>> On 6/13/25 11:29 AM, Neil Armstrong wrote:
> >>>>>> On 12/06/2025 01:49, Marek Vasut wrote:
> >>>>>>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
> >>>>>>> alignment gap between default_address_mode and lanes members.
> >>>>>>> The ili9881c controller can only operate up to 4 DSI lanes, so
> >>>>>>> there is no chance this value can ever be larger than 4. No
> >>>>>>> functional change.
> >>>>>>
> >>>>>> The u8 will still take at least 4 bytes and cpu will still
> >>>>>> do at least a 32bit memory access, so there's no point to change
> >>>>>> it to u8.
> >>>>> Assuming this layout:
> >>>>>
> >>>>>    40 struct ili9881c_desc {
> >>>>>    41         const struct ili9881c_instr *init;
> >>>>>    42         const size_t init_length;
> >>>>>    43         const struct drm_display_mode *mode;
> >>>>>    44         const unsigned long mode_flags;
> >>>>>    45         u8 default_address_mode;
> >>>>>    46         u8 lanes;
> >>>>>    47 };
> >>>>>
> >>>>> I wrote a quick test:
> >>>>>
> >>>>> $ cat test.c
> >>>>> #include <stdio.h>
> >>>>> #include <stdint.h>
> >>>>>
> >>>>> struct foo {
> >>>>>      void *a;
> >>>>>      size_t b;
> >>>>>      void *c;
> >>>>>      unsigned long d;
> >>>>>
> >>>>>      uint8_t x;
> >>>>>      unsigned long y; // ~= lanes
> >>>>> };
> >>>>>
> >>>>> struct bar {
> >>>>>      void *a;
> >>>>>      size_t b;
> >>>>>      void *c;
> >>>>>      unsigned long d;
> >>>>>
> >>>>>      uint8_t x;
> >>>>>      uint8_t y; // ~= lanes
> >>>>> };
> >>>>>
> >>>>> int main(void)
> >>>>> {
> >>>>>      printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
> >>>>>      return 0;
> >>>>> }
> >>>>>
> >>>>> With which I get these results on x86-64:
> >>>>>
> >>>>> $ gcc -o test test.c && ./test
> >>>>> 48 40
> >>>>>
> >>>>> And on x86 32bit:
> >>>>>
> >>>>> $ i686-linux-gnu-gcc -o test test.c && ./test
> >>>>> 24 20
> >>>>>
> >>>>> Maybe there is some improvement ?
> >>>>
> >>>> Try again with code size included, and other archs since 99% of the users would be an arm/riscv based boards.
> >>> Doesn't that mean, that one some systems it wins us a bit of memory utilization improvement, and on other systems it has no impact ?
> >>
> >> 4 or 8 bytes less in a dynamically allocated struct which is by default aligned

These structures are static, and not allocated dynamically.

> >> on 64 bytes by default on x86, 128 on aarch64, 32/64/128 on arm32, 64 on riscv, sorry this is negligible.
> > It is still not zero, so why tolerate the inefficiency when it can be improved ?
> >
> > Is this change rejected ?
>
> I won't nack it since it's technically correct, but won't ack it since it's an useless change.

On arm32:

    $ bloat-o-meter drivers/gpu/drm/panel/panel-ilitek-ili9881c.o{.orig,}
    add/remove: 0/0 grow/shrink: 0/8 up/down: 0/-32 (-32)

Surprisingly, even on arm64:

    $ bloat-o-meter drivers/gpu/drm/panel/panel-ilitek-ili9881c.o{.orig,}
    add/remove: 0/0 grow/shrink: 0/8 up/down: 0/-64 (-64)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

