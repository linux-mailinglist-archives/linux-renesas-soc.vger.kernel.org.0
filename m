Return-Path: <linux-renesas-soc+bounces-15166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67737A7664D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF2B23A3E07
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE3F20371F;
	Mon, 31 Mar 2025 12:45:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B524F203709
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425129; cv=none; b=Kw8Bvoti0AKA3nbTPigJL/OO7WeOjMUdGBBwJCuXPVz80WvtMyROEf+00zpBiVYTK8J9pou8ePOX0+8tWO1N9W2F59m3dQNrdGb72EbLU6hp/fGgZ/4Pbqb0CF4DFJeeroxe9/TcYDOBHv4NQiIhW2PKXmlk8aFdNUukuIsNox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425129; c=relaxed/simple;
	bh=NR/x60G6SMBxnGeLeRgeC7hamOkVgSP62yFTuFCUxrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEVrzPsD2Gep+yG2kxQ6iOximZVm8fz5kNKy/lLwNfHfooDkqjgrKYP6bmrIH89wK0EFVxaUHRlRDqrd91agWBFfRhlrMXCDMr9sxkILlzDIyFmwI0MqikX5U/VUM8flIulLuu/gyGhYQYDdl3yR5MG+fN10iB7A/EoYM4RXP6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5240764f7c1so1733734e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743425125; x=1744029925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oap2+0zeXL/X++JUWuapnD0YH7BET3qaKaIfHuEbwbs=;
        b=bgJUGv9zjc/j83j2e8NkG8z4DEsL9kVd0q2o0HOeqVA4Gq+HrfNXh11+ZRzns7veEK
         JxkhpnG2sM+y671iRVRXIqGpLq8/l25EesylqE5Mw5i0WhBSPgaYKk/i0jSNl2xYC779
         h634lWJfkC+4S9tkDlpeSY86DWQj+mDIXhB0QKOEHQ63BDNkzK2ZvwlfAQpsPgBsiLoI
         egWr0QnpxduM4W+KbdxeFD1wyjQqyO1d4X3T02uO7jaUhmrriouN+iG0QjVtl7NS0Ek5
         LNrKeiF9WkmnR/zpOo6jmX8aPPM8m5OOl1UuxHfHRK422KwJAbCtJ+JqWU85upFeTvvy
         nEfw==
X-Forwarded-Encrypted: i=1; AJvYcCXjS/vd5CzKXi+7VKa3thR0isxFVoUjT4puldxjuMITKi+hDBmJAof2waRUR+cMG0qM+xw9DHKbiH56DW1yjtdxvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLmSE77hD8i/bLbuoWyT3WAkI52eWmIMhCr525vQnKQpE5qxL8
	N+BATiHRA1YM4fUi/iNnLkJ3qKGqDTfC6l96mxolksVTDy3u7AnVkgWB91v0
X-Gm-Gg: ASbGncuwbF5XZeEMUL1uCwlBqqpET8mj5nqzYlDEtqzVCMY1niJi9+3o8zpvJBiyiuN
	r7D8A2kK2TwkxX8sSLEVOLkgpt5xlwpdRYEnt7qgn2nnzXsRLga+iPl3bUecaJ/AMR/Vz8CKG76
	m13MabkKe+6lK8z5JwnQ0cZQ1ZEs4XpqFIG+WlFtXgODyEtAcU/TvkuTYbJ0vO/gTxlahsipdIM
	s24l4h8tTOHnbaPNdPxYRtg+Ay6M0VeFnrssOermu4hdsuqSYCdjA23xCOOmakEy1P4tHtBtKdi
	tJnSKoczw3WKlIHfElaJmgYlpvp58KfUWmB4Bdf/ewnK7/yHlNJXcu7ZZZIHFPR6GyDo6cG8uuo
	eiBsstld8wsZZLdabgA==
X-Google-Smtp-Source: AGHT+IFmjKtJk5MpOl4EM8hH4ACBbRG79N0BJrWN9L8rV2qOnppSc3haTuEDGhVMkjkQlYwD/l42ig==
X-Received: by 2002:a05:6102:2c1c:b0:4bb:c490:7d6c with SMTP id ada2fe7eead31-4c6d387d98emr4946027137.9.1743425125336;
        Mon, 31 Mar 2025 05:45:25 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfc85f82sm1603377137.1.2025.03.31.05.45.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:45:25 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86dddba7e0eso1777563241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:45:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQuEY+3buo6XQvDv10gzTiweIt28wmydtbRYNNwDIsAkgNcI994LawuMZptqWMVaf6kLPFr8vKbhhW/hL47UY5Pg==@vger.kernel.org
X-Received: by 2002:a05:6102:f96:b0:4bb:cf25:c5a7 with SMTP id
 ada2fe7eead31-4c6d3874047mr4414594137.7.1743425124753; Mon, 31 Mar 2025
 05:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-8-biju.das.jz@bp.renesas.com> <CAMuHMdWEAVfQ0_Ffbw0eexhTnDDZFu2mDwx3zvL4s66XsBN6fA@mail.gmail.com>
In-Reply-To: <CAMuHMdWEAVfQ0_Ffbw0eexhTnDDZFu2mDwx3zvL4s66XsBN6fA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 14:45:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpY0xo-h8gSz0uq9YttZg8kBB1z1MnobhTe0dfwOqzhg@mail.gmail.com>
X-Gm-Features: AQ5f1JosfvbsRy908mN2FN4KTTwhms7EB165n7GQhbucZs7CDeMGpYLeZg1yGNs
Message-ID: <CAMuHMdVpY0xo-h8gSz0uq9YttZg8kBB1z1MnobhTe0dfwOqzhg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] memory: renesas-rpc-if: Add wrapper functions
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 31 Mar 2025 at 14:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 11 Mar 2025 at 12:36, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Even though XSPI and RPCIF has different register layout, reuse the code
> > by adding wrapper functions to support both XSPI and RPC-IF.
> >
> > While at it, replace error check for pm_runtime_resume_and_get() as
> > it can return positive value as well.
>
> While the change is fine for me, the function cannot return strict
> positive values:
> https://elixir.bootlin.com/linux/v6.13.7/source/include/linux/pm_runtime.h#L418
>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> > --- a/drivers/memory/renesas-rpc-if.c
> > +++ b/drivers/memory/renesas-rpc-if.c
>
> > @@ -519,20 +543,15 @@ static void memcpy_fromio_readw(void *to,
> >         }
> >  }
> >
> > -ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf)
> > +static ssize_t rpcif_dirmap_read_helper(struct rpcif_priv *rpc, u64 offs,
> > +                                       size_t len, void *buf)

Seeing how none of these helper functions are reused for xSPI in the
next patch, I think they should be named differently. Perhaps *_impl()?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

