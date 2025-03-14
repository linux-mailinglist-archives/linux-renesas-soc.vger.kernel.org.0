Return-Path: <linux-renesas-soc+bounces-14366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293CA60F5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 11:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D75431B60963
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 10:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0838A1FCFD3;
	Fri, 14 Mar 2025 10:54:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501811FCFDC;
	Fri, 14 Mar 2025 10:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741949670; cv=none; b=LCZftjNyMoEYJpzXU7O9M6WeaRRERoTjrbd1Ou5/Sq5zRbgoL1i6vUEkCZm3/PIa96H6aZWtbungwpUM8vBEdBqynCZXaUjZCMm3V7F3E3S2Fx11Ls8XbMijXO/b3p6mbaitsmhonJdFv+jBPXbYEDMOa/OSJAKPnqdMpyxkI8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741949670; c=relaxed/simple;
	bh=U7hbrn9XaN0PGMYxrHmvqv5/+Hu7RKBywzmpPmXY+0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZx0F1jPqDDjdcSJBjEvf2Ub4zHpf2wyODFinhzRcHwAdEEuFUKm5sh5LZBQNkHcfOXUPH6/LQn31HUzQOpNoNDATl/9/zzjPbE0LNSKf6GPUikd6N9niTJE+9SsaYCIkIv37Ia8rLu/HXa6zwvsA5H1x4aMdnfmWyn8p2xhN+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-521b84da5e9so826527e0c.0;
        Fri, 14 Mar 2025 03:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741949666; x=1742554466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwCjo8jeP1quTpwRHbPfKkc0tX1nODWz/OO30aMzMGI=;
        b=sJMNqp4O/+/hU+bdvSEHcuq57LwlVvBIP94jck2/q0/BeZ5K6bjCjI9XpIfr9Gx3by
         i5x4aDCbr8snvTXLNK+ZaMmFlUepLIcFhlqvEhj51OD0rg4QnqGrC7DLjYoipL1oVZ/p
         DUW+yqTHclwvb9KpuNgECMbmn3A+XwNa40vk6iRNJU45P1bC9Ag5iiiGg/89stoGD50E
         lfX29I6S8K+X+Ssczb3n4FQZPug7XtGGSh0UK5jG4QvzSm/LuXS1R7IdH2WjGCxtwVla
         e1H32FYz3N3gd38iX/+h23+MWhN5XDysM9If1xUJTFQ+NepMr8JE/YDaCaTXZW+gcumk
         o8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUoWFYhGCEjC8DRHz5tXJG/3BexFgtzWbz4XMG8y8GGL3Hp558YIRQbSgsqInze6McqBop8SW4rF8eD@vger.kernel.org, AJvYcCW1bj9tQJNdPNew9j2Sv2Qf9fuVePOSotaRDHw3shfPQkERe82uHRE100Omn98cmH7R+hI0CN25gg19wul0R6exJLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjaNohmpETAsfI4JIHquKFYxg/y4IeRPnq0SScV886Sjxgd6MY
	l5qNaPZ7MgTKzihYKHzPjzEqfEs8qZaFSjVFe52QB4KdnSLIib/SXLFBRBknLl0=
X-Gm-Gg: ASbGnculMhPW+z8b6jCgVt1vnV/08xqcSfEqLPPBGPSL6o6DyPZcSBydum3pQyNgb8d
	S1uHvjHToqmDRg92W3uLH6+BQwnzZdyOrrZdPzzLn5H64Gbb7AWwCfxI0yDpGLpQ8OMirH2bwy0
	McS8xRpZk4/Oo25lq1QkdNNKXfGvHy6JcI+/e0vCvbqy2KAFrhEg9gJLWljJ4nONBKcVu+hqBH4
	isiW5uTzqf92yRYo6FQqTj6wsh9vwJQ8d9V2ll9C0XOYOnLZHMjJVzEhg+Qgc1U5nNsr36kvyHV
	vKRLd9b0MKpKU2ro6GgYRDgtFHVCh9KjdkFtiECe5znE+dzmTQuXrHuQl/cXNkWq+R7tdYdNa2J
	mAhg5s0A=
X-Google-Smtp-Source: AGHT+IEXYPtEjWnszTKKYYF3BxOuhlLMQOjoW7Uq1O4vlKsfE/HKT4C6ZtsVomDWBHd292pTY2/WAQ==
X-Received: by 2002:a05:6122:659b:b0:520:420a:a07a with SMTP id 71dfb90a1353d-524499f5a44mr855536e0c.8.1741949666373;
        Fri, 14 Mar 2025 03:54:26 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5243a5d23f5sm569235e0c.27.2025.03.14.03.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 03:54:26 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86cce5dac90so861968241.0;
        Fri, 14 Mar 2025 03:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXGHRvPzu8DphFzDU6iUMCkEYTPY9zcsQSe1S+zgbOkbV/WZ3C/qqYJepx4SluUKXyUqJ0/fByCx19Y+E3pfqcv0w=@vger.kernel.org, AJvYcCWENdacYOhuoNeGV2+y+8lldBCZt+8SGoqae8uWELZPEj02ZXzU4gbOQwyfKYyr1FUXXittFDdPD8Z+@vger.kernel.org
X-Received: by 2002:a05:6102:5122:b0:4c1:a2b4:aa0c with SMTP id
 ada2fe7eead31-4c3831470d6mr839350137.10.1741949665825; Fri, 14 Mar 2025
 03:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309184326.75452-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250309184326.75452-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 11:54:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnGgHXykkiR125EjpE5jPar7HfJWQbtWsAaWdBQPRqxQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoFE8Mog7HjKPJ0tSH5i4f_9Cw6r0mpj-YuUh4RZB_uPbKhlc91k-taRzs
Message-ID: <CAMuHMdVnGgHXykkiR125EjpE5jPar7HfJWQbtWsAaWdBQPRqxQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Remove undocumented compatible micron,mt25qu512a
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Mar 2025 at 19:43, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Remove undocumented compatible micron,mt25qu512a.
>
> This fixes the dtbs warning: failed to match any schema with compatible:
> ['micron,mt25qu512a', 'jedec,spi-nor']
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

