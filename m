Return-Path: <linux-renesas-soc+bounces-21318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F74B43662
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 10:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 618E47B705E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 08:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901EF2D2397;
	Thu,  4 Sep 2025 08:58:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065F12D1916;
	Thu,  4 Sep 2025 08:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976303; cv=none; b=T22wIU0k1dCP2cMDZD7SfTrq15oGJJvIpoC2EYnzfGif16TTGo8PN/aRQEoFbsjaUI7vk3gSlJC4/uQnBIalbYGDcnUUaGNR7B5Bge+eqeZmDmJmqw2nQSyN2+pxYPhm6iGPPTPlYZFA/k8MlLSu+HcQbLT1NTqpupe9Uqfr8QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976303; c=relaxed/simple;
	bh=g8qOaQav8mXTG7NUPTOLm8W2uC66hNf4wEBj5Jpjy9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQ473kp7NGTDVFVYa09y3KRAH5psAXtigbumRMuE0VSrfOPAR4TEVGxD07s2ERmBoClqFI3Hug76rf/WzKxQSlJeF7YP3vpUeNH4YOOjcdb/Gh1xtvnSXuKMFk8vPgWhrM4qZ6exqJryxExifPDO3iaeJFLmXOiFHOLnFt+9QvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8942afd0421so247260241.3;
        Thu, 04 Sep 2025 01:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976301; x=1757581101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mf7qeMVDdO/hh/wSHvB0/S9IRpetU7zeKJmw3FtqwCw=;
        b=OufLGzKIuJ6roWoNHjXur7HoAslnsRo2kMZWdknzOKCHZV/m00rnuVi6qvpGgDttrw
         QCJerqRQ5jHWKcZJIVaIF1/DEa5uM/boPez6l5HrxRpwWlKiuv7KE7ZRc6duyFN0ThC1
         MKjxTNoCe+YoYRqY11Aq4LP7BZAcwAfgf1/j+f9PkiOrxCWNC5hCVRFmsrwni/uDVDv4
         kVrqQD5pZ+Mrawgkph5m12jdTlTBn9ap70BNOOn9erxkj2wVpLuS+a/I6qK0mNK7N1K9
         WU1gKmLPDc9meR3oyHlL+xuntGKjrO905Et4YWs2E/GrTPtP2EM6WUWSLSyUl5U4FdbY
         YfhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD/hplBlp9DSKJx15b9wB1dyj5HiOijw6cY4hWewcj9vVWHd9hj1mxw/jdDwu96j/zFu0Exr6UdeBmGWAVl69KaL4=@vger.kernel.org, AJvYcCUzjWgrQyLIgk4FmeK8boBMsppyqa2HY9NlK+wlf9z1d68k5XaixawSa3InZTzlBgyuO4Z1hrkEXB7I@vger.kernel.org, AJvYcCVePv2Rne0avDhA/0VgqRPF+tj/29TcBfUEcAn6jxeqBQsG3rLun0X3eFl5TQI/3M1e5tJiZddgypYW@vger.kernel.org, AJvYcCXmIRGGFLWb68OqBwOTikCKgWzUQmeIvBSDavZDzE6BXEpTfRTheQErWKjB+PVSaU2Q1gIjOFWhBSaEoX9c@vger.kernel.org
X-Gm-Message-State: AOJu0YznJ9MUdHChTmuDS/qkxXtHcA+u4vZNnjTQKlrOWjzojIGnG9BR
	IZBjhVZNhQReX7EQRQT0gKIzSFhVA8jIC0fW9ULdpG1EpmT5nydILKlKFPoEvHDK
X-Gm-Gg: ASbGnctQerkOFupvF/RozHZKcZDDbY2IOZ3mtOqBKrIzSB3pyOcHaTVtIfU1h0lS4MS
	2d91jGZ5sR/DHaazN5ECKrcD6YYJHUcs1ulN2B80L94sdqzVTRh0Gmp0sA0PkaRp8ukdoopvH5p
	R2oVqhJ7FGHWuJhetyQ/DCMFZ03vaNAU2hU3F7BrQ5CJBQCum9n0RwNuDR+6XeWCwUIj+jG+UiR
	zFF1455eepxh9gDTqBR64IHro5PKZwLbAlw9p96cT+EcB7ytWmieC9+s0icqa1ixBr9pgbzvJIt
	gzSo7wVmUlYwHlyNcJET0II6cIyxZLe7YtKSBCLZVODlrpHGHtqgd5SP/1rWVrIBTId//Y2pt5v
	HO5FhEXlLbfKSHa/6hVtYWmETDVwh2xPjVCnpyESWVfhT2vYoOg9hBhV17Hsp8zBRcvuUwhqQp7
	bF0Hm+Ow==
X-Google-Smtp-Source: AGHT+IG3kCelUM9oT8dqnH5oslsBJLLhYUQCqOyHf2vOncpmDahqoCn6+5KKMRNeMSk9D4kYHUB59A==
X-Received: by 2002:a05:6102:508e:b0:520:c529:d77c with SMTP id ada2fe7eead31-52b1b1f45c5mr5834839137.20.1756976300613;
        Thu, 04 Sep 2025 01:58:20 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-89a35fb95d2sm1994414241.15.2025.09.04.01.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 01:58:20 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89ea3532bfbso148785241.2;
        Thu, 04 Sep 2025 01:58:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1xZUt2dyGcIApNkaHdVkVljmHXcRGIf+s9HSKNXyO6OzjUZuJwP4R7HXl1wKllxQyEJJ4DkEsi2Wb@vger.kernel.org, AJvYcCUzid8zMUvToPsOw9XLj0C++Y7swPuFKCLNiFDR9jOx4nBTwyTnBoEpb2N+GD4yNMmgXFmt42YUNjNX@vger.kernel.org, AJvYcCVsDiN/Ehv07sNz7iclZho+Zb/CLfN8FIqjXERWWAeZz/oshgYKOGUP6yRSbLVbWcNPMfjR/YGmYM5wbC2z@vger.kernel.org, AJvYcCWXmJsTv7A3ZKN4Csl7sQmvwbNBu1vQdjz2nJKcmjcIFF/ieZew62GpJk3d6ghmf6mAHrmsDiFa7b69WwQ9Q/cIC1E=@vger.kernel.org
X-Received: by 2002:a05:6102:510e:b0:524:b344:748d with SMTP id
 ada2fe7eead31-52b1b2ea2a7mr7026962137.17.1756976299710; Thu, 04 Sep 2025
 01:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904071954.3176806-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250904071954.3176806-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250904071954.3176806-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Sep 2025 10:58:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXs8MrAwxQ2O-YrgG3EQoQY-jtX7+LGQ5T6uSOd3sas9g@mail.gmail.com>
X-Gm-Features: Ac12FXyz1X26Ahnp1-o9LPuMgQOMAfU7pqA9_BZ38MYL8Q6UEVoUm9wp4EP6TCk
Message-ID: <CAMuHMdXs8MrAwxQ2O-YrgG3EQoQY-jtX7+LGQ5T6uSOd3sas9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: renesas: r9a09g077: Add Ethernet Subsystem
 core and module clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 09:20, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add module and core clocks used by Ethernet Subsystem (Ethernet_SS),
> Ethernet MAC (GMAC), Ethernet Switch (ETHSW).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Dropped adding GMAC core clocks.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

