Return-Path: <linux-renesas-soc+bounces-15192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACB4A76A95
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 17:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 659A27A1E48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0C21E377F;
	Mon, 31 Mar 2025 15:16:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FE0157A5A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434182; cv=none; b=NP4ts5dthG5/a2Kbu/LmnMVFMRTL0fKQy1XRR9LeEMd8IF8CoqZOddOiga6Nj4hCg/ijytd8xdw6AD4scPrwAnDXsFLmqdWxtuXF6UEsSpcECj5vN+XzBxiA/BMsrESSqU+rSWXq4E9lW0MFNC/lzk6o317HliWNeTTF+OBE2Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434182; c=relaxed/simple;
	bh=t3bV1FbZB+8H67WaroradPlX3u04VCVyMRwmpjJ2pME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6+bbRU6pz0wu2fKgj05C3MdeiIsQYyw3LBJX65450dtxicE4CB6U/NR4FaMxlAccxUaMwSq9nHuo8BDyovRJkpFzz5+LeBpx4atNh61/+y5s2nLIAihTllzd+eR5ioCPQ7e15hxUxc1youBu8N0xwCfXHTCOpw2HqQZ1sFy7aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso13162876d6.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434177; x=1744038977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+xS+FWYAygAaFlrY7AxKO3D88MWBQAHERlyfOUShWU=;
        b=i+J3In6u7tOjbbOZKjKDvulVhAZJGEvo3yqHFYxRhO0dUCHs+NiIcx02eYlQpjh3pm
         BqH+hj6mHSaNgEurAFdTPWuoF88CrjV7QmdJMaer1UUmdazC0ZEhk/kj3nd6yw3l5LYx
         kFnEUEMU1O/XU6DHVD776vZZ+mKY4z62HvQx8N8+ll6JkAancDZVLdrTmkERpZgid+WN
         4iZ0vJ5wIio/xWnyj3jcHeOm1UIVA/eQjGm6ZhIRv049zAGcpLjgK1NBgTc+rMb2cQWA
         FgCU5vp2+4/wUF9K42x4uHLPgEVw9NLa9uK04GMlO7W06U5M5Y/4I4qrRL8AeyKRoG73
         8nWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6nqN7qloyGDgZI5z7m0zFxS4PD7n0SsysWXbtNDVeMzj1MGoVlCOHir7SKlVBEcenpMoYtw7O+EGfuf8PYYJcXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZvP+SDlsD/PxxGmn1c+vF9sN0oOJJzO4DbpKDDEcqqug/SzEl
	dCbGydHEUadLDlcAaHPcQ666hv9MOJMt4pQ1pstsp/ZjJCJitKegOdRJybsH
X-Gm-Gg: ASbGnct+wwKWH05iv4QdW1cT+LKtAIh5eMpvP9LqwnNGIrxfjSUyFQop/fP5eMUVC5Y
	Dw0Z4dOkHJZMpkyqvpHihwTR0NOyP0MxLZ10BmUApOgR1VBs1YRBx5ZDTO6TF9NW4IRfYWEbhmL
	bxSFkyxI2Ug1isBpA5vwiMoO+503xk2p6kTX+bhH5m5UjVshsow9GJIrvfHTVKRvTtrckuUP1Lh
	gOpJMFlXXnl1B4uc/hW4JSepQ0fJjagQ6tRmUsOxBCOYDW05z47NDkMWKiLtZkJpQujjdb4UyAt
	aeg9UUUe8gPrERV/Uo19JJhET0qeVF8PD9yyxB8rJ91zdfL81uHZSOlbNg8iO5F2VBy8ki5A7ON
	Q5QMY6jLqDqQ=
X-Google-Smtp-Source: AGHT+IFAZWx3CUuxbl3LFlGDCQvlhhRCSCZWdde3uUCMdOxamsNUNOVtY/uAQgL1w9O1wXVP00cCvA==
X-Received: by 2002:a05:6214:1309:b0:6ea:d090:6365 with SMTP id 6a1803df08f44-6eed61e505cmr167652146d6.32.1743434177642;
        Mon, 31 Mar 2025 08:16:17 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9644b08sm48503726d6.27.2025.03.31.08.16.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:16:17 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c08fc20194so900899785a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:16:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX06XpwjKHwDUDh4STEH0pqfDxKXLvbYKXH76QPsa94KyrYtYkipMXhYZvBxCN5ueX7V1mgQWHqvgO/e0ni7HI0hw==@vger.kernel.org
X-Received: by 2002:a05:620a:1729:b0:7c5:4eee:5406 with SMTP id
 af79cd13be357-7c690897120mr1391345585a.49.1743434177083; Mon, 31 Mar 2025
 08:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 17:16:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVC0HzvB9EPKTev8Y6ioB6GfE-axEgzK52+SVj5hGnMUQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jr31cLtL_VhbRnWikLPOjYVMLZkmq-lgnqF-zYvtsmgd8tXZEKwhT2nvYc
Message-ID: <CAMuHMdVC0HzvB9EPKTev8Y6ioB6GfE-axEgzK52+SVj5hGnMUQ@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 27 Mar 2025 at 20:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable various Renesas SoCs by default when ARCH_RENESAS is selected.
> Adding default y if ARCH_RENESAS to the relevant configurations removes
> the need to manually enable individual SoCs in defconfig files.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -65,17 +65,20 @@ if ARM && ARCH_RENESAS

Note that this whole block already depends on ARCH_RENESAS...
I forgot about the reason, but commit 8070ba6348608aa1 ("ARM: shmobile:
fix build regressions") reminded me.  This is also the reason why we
cannot open the block for COMPILE_TEST in general.

>
>  config ARCH_EMEV2
>         bool "ARM32 Platform support for Emma Mobile EV2"
> +       default y if ARCH_RENESAS

... so the "if ..." part is not really needed for arm32 SoCs.

> @@ -197,6 +216,7 @@ if ARM64

Note that unlike on arm32, the arm64 (and riscv) block does not depend
on ARCH_RENESAS, so the "if ARCH_RENESAS" part is needed.
In case anyone is wondering, on riscv we definitely don't want to
enable ARCH_R9A07G043 by default, as it depends on NONPORTABLE.

The general idea LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

