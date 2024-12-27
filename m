Return-Path: <linux-renesas-soc+bounces-11718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A69FD52C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 15:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43929160D6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 14:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471941F4E46;
	Fri, 27 Dec 2024 14:24:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852BA1F4E4A;
	Fri, 27 Dec 2024 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735309490; cv=none; b=a9hsCnjSCR2XU37Wu9+GaY4jLLEchO3+yFRnTwZLnzkcT1SqyjI+SCVHMxBuPqGaz85ycJ1ZheuGtAR7KKHOWSH9KnbhZL4tawNC19OXkVLXF54OC0h7WLrYXZV++xovJphooH6Xqe+lzZV3n4WcYAgVVlLSIne1fPlKRKvesuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735309490; c=relaxed/simple;
	bh=Q28Qtfjo7anggSxXCfGps2SUeCN+BTsfryTHBViHt2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZ7IQhi5lWgJLNUEZysdqqwIB1scrivmXRZcoFemhhgiBoholL6A8+CZNzU08jDts4FTJUdqd//36hl+2v4LpCHIlz6YYwIKiY0wBkpgnI8G9gW82lggeEM+tItSOWSHrLvqovYJONFCQ6kW78JziisSbgAbbcyQCX55f2MGYIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso2481833e0c.2;
        Fri, 27 Dec 2024 06:24:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735309486; x=1735914286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awG014qrg/sHaNmPoK2PcJuPpVUu6o4ICHgEo+M4iT8=;
        b=wkOmWvF5vXxfasAuR6Y214I6hgLe/KBwSjPGHX0ZTmow0zm/Ku5WQNPCUkPosjM+bS
         jjc+z+TUktVk9L4fi/o9jwJA767kFnkgz/C4QePJZ2j9aqNb1b/Ej870HLTW09W4vclL
         zTJNeDNExpY4CoJ7ceCGbxOveqgCyCq3nRNE6feATwwUwDAc4APDGibJvjkNtuCgC8gz
         6nTMbrpauX4Y4Bu/CE1mIkkGL8dSIRTVPRa/UU8+2eCwhwFIvJW09oC2GDvY3QxNWCMH
         8z5Zzl7uOE7uk9JPzmTEaAOWjp7ThRFAc0kuxPBz3pS635mPpzW8VZpK4bzeVb6j1oy4
         /5vg==
X-Forwarded-Encrypted: i=1; AJvYcCWQymOfozpUbQBpNtoLQUua3COjSNoWaZcUQOdS9QFA7f5b7WhYfRoYs/r7QFX9urlXiaAyTrYlZazNm6pS@vger.kernel.org, AJvYcCXBcJOMIPlMsODcH8CRn+dplxCLEmscZbEpGlFBrRNypzDJm7xpfRGhEB7CF+v2SLVcvTH1YyyzHIxAj7BNmASAdbE=@vger.kernel.org, AJvYcCXy4bPBKp59Qq52ksA44eTfTLHF43GQIGcgWFstPZ++1Z8XLLsw+FNnROl66R8Z9iGqK2sIqYeJRPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypEn+328Kn3LgPFvltyewPd1bXE4rX4EJdDtrgluCWCAZaU9tf
	ge56WL/t+asr8844tFsz6t/8LNzstNCBy+mZ99snYwMsWMgwRFQmhxV9XJzi
X-Gm-Gg: ASbGncvl1VIa1aZUeOkKWIXC2UlcNs3LeudUtDBnbrwDxP6T9dOiQIUQ5/LrDREpYmn
	JMhESYAeY0uNsg3A4qfpPslzG72nWIv0o1O/WB8TiO2aCg/29YcxTD+gjf8POlF+0kNdaHKiT+Q
	Rxczp7qnORIfcfmART5LrCQrFHkTTFqFd+ny7wMoi2U1xEVH/4Vt4dlmVkd+S/6bzQk8HXyBVFz
	hFGaurxpX8iink0QGTHcSE8jLnzco0NlK6VigoX9h3o31WcaVB7V2TbjnmbtwgrNzypxtAMpn4c
	a5JQNd8vyIs0hAlFby4=
X-Google-Smtp-Source: AGHT+IHgw4THpdKzp7Th7lqxgqc8umOsMnmsnmxjc6kxxI/eMe/+G6N8B2RlPzmvN7SOMKTFXbiueQ==
X-Received: by 2002:a05:6122:3206:b0:517:4d53:4272 with SMTP id 71dfb90a1353d-51b75d37d18mr18687278e0c.7.1735309486296;
        Fri, 27 Dec 2024 06:24:46 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68be7c18sm1826818e0c.22.2024.12.27.06.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 06:24:45 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4b11a110e4eso2011245137.1;
        Fri, 27 Dec 2024 06:24:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1IeXDdYRoAwhuBt0dT5NQM8N5IsHS9UzyVyFzQDhitfqlAYmGvEQML9JJ55lFe8LTbogQ5AqCmAF5vQGn@vger.kernel.org, AJvYcCUw+r65rPwJQfjRfEesQ6tVyaKZuBH0sXnUfO+MmOKnNub3pZQHgR5kahOInrjKrzK6L0XIppQPrEeQOqHdn/1Kjdw=@vger.kernel.org, AJvYcCX2+Oba6c/1b/vpClFUCmkO8QVcv48f3Eios/bqu0LXOn2OImnewE6AgH16pQqHMhzkWMqRisou7sQ=@vger.kernel.org
X-Received: by 2002:a05:6102:548a:b0:4b1:1a9d:ecbc with SMTP id
 ada2fe7eead31-4b2cc45723emr23420855137.20.1735309485386; Fri, 27 Dec 2024
 06:24:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241223173708.384108-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241223173708.384108-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Dec 2024 15:24:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_gFP5UZ=C5SRqY0JBOi3vE1+pD+bx1taiiGoQKYRfJg@mail.gmail.com>
Message-ID: <CAMuHMdV_gFP5UZ=C5SRqY0JBOi3vE1+pD+bx1taiiGoQKYRfJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] clk: renesas: rzv2h: Fix use-after-free in MSTOP
 refcount handling
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 6:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Avoid triggering a `refcount_t: addition on 0; use-after-free.` warning
> when registering a module clock with the same MSTOP configuration. The
> issue arises when a module clock is registered but not enabled, resulting
> in a `ref_cnt` of 0. Subsequent calls to `refcount_inc()` on such clocks
> cause the kernel to warn about use-after-free.
>
> [ 0.113529] ------------[ cut here ]------------
> [ 0.113537] refcount_t: addition on 0; use-after-free.
> [ 0.113576] WARNING: CPU: 2 PID: 1 at lib/refcount.c:25 refcount_warn_sat=
urate+0x120/0x144
> [ 0.113602] Modules linked in:
> [ 0.113616] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc3+ =
#446
> [ 0.113629] Hardware name: Renesas RZ/V2H EVK Board based on r9a09g057h44=
 (DT)
> [ 0.113641] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
> [ 0.113652] pc : refcount_warn_saturate+0x120/0x144
> [ 0.113664] lr : refcount_warn_saturate+0x120/0x144
> [ 0.113675] sp : ffff8000818aba90
> [ 0.113682] x29: ffff8000818aba90 x28: ffff0000c0d96450 x27: ffff0000c0d9=
6440
> [ 0.113699] x26: 0000000000000014 x25: 0000000000051000 x24: ffff0000c0ad=
6480
> [ 0.113714] x23: ffff0000c0d96200 x22: ffff800080fae558 x21: 000000000000=
01e0
> [ 0.113730] x20: ffff0000c0b11c10 x19: ffff8000815ae6f0 x18: 000000000000=
0006
> [ 0.113745] x17: ffff800081765368 x16: 0000000000000000 x15: 076507650772=
0766
> [ 0.113760] x14: ffff8000816a3ea0 x13: 0765076507720766 x12: 072d07720765=
0774
> [ 0.113776] x11: ffff8000816a3ea0 x10: 00000000000000ce x9 : ffff8000816f=
bea0
> [ 0.113791] x8 : 0000000000017fe8 x7 : 00000000fffff000 x6 : ffff8000816f=
bea0
> [ 0.113806] x5 : 80000000fffff000 x4 : 0000000000000000 x3 : 000000000000=
0000
> [ 0.113821] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c015=
8000
> [ 0.113837] Call trace:
> [ 0.113845]  refcount_warn_saturate+0x120/0x144 (P)
> [ 0.113859]  rzv2h_cpg_probe+0x7f8/0xa38
> [ 0.113874]  platform_probe+0x68/0xdc
> [ 0.113890]  really_probe+0xbc/0x2c0
> [ 0.113901]  __driver_probe_device+0x78/0x120
> [ 0.113912]  driver_probe_device+0x3c/0x154
> [ 0.113923]  __driver_attach+0x90/0x1a0
> [ 0.113933]  bus_for_each_dev+0x7c/0xe0
> [ 0.113944]  driver_attach+0x24/0x30
> [ 0.113954]  bus_add_driver+0xe4/0x208
> [ 0.113965]  driver_register+0x68/0x124
> [ 0.113975]  __platform_driver_probe+0x54/0xd4
> [ 0.113987]  rzv2h_cpg_init+0x24/0x30
> [ 0.113998]  do_one_initcall+0x60/0x1d4
> [ 0.114013]  kernel_init_freeable+0x214/0x278
> [ 0.114028]  kernel_init+0x20/0x140
> [ 0.114041]  ret_from_fork+0x10/0x20
> [ 0.114052] ---[ end trace 0000000000000000 ]---
>
> Resolve this by checking the `ref_cnt` value before calling
> `refcount_inc()`. If `ref_cnt` is 0, reset it to 1 using `refcount_set()`=
.
>
> Fixes: 7bd4cb3d6b7c ("clk: renesas: rzv2h: Add MSTOP support")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Updated commit description
> - Updated fixes tag commit header

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

