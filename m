Return-Path: <linux-renesas-soc+bounces-7905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D069956F22
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF3AD1F2279A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 15:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23E3135A53;
	Mon, 19 Aug 2024 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlM8nVXt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1336512D766;
	Mon, 19 Aug 2024 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724082282; cv=none; b=MoIK/uzI7kEYze44TLD9DQTFMLpg24+cCVafidfCFgtV0Wg1oB37Gci5ms8ko0la4K0swhfdW/eer3OptlS+BKrLmY1uEVF4HDYFp0JhAG4Nqh8zddkdEg9S3vaJk8I6BJ05HM2ij4WP38ZuWO+g4BMEaR+GqaLmsbs+cqDCij0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724082282; c=relaxed/simple;
	bh=fX2xOww1wOO/BhKeiwAXl7plPD1MkdhoyFnzHPGdJ80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOuTx8pXE9FADRv4tEr/JxauefuVesa8BfbyyaFvadAfwgJvZ/ZofESsGj9hAZxyS2FTmEcL6kRpODpnXZ0OAu4qPbAJjR/HiiUD+v4ZCJLmHApRC7Q4k337mbJPDHldNNscgDy6KDxUqqGHA7HivWlddtLvGL0tWLUqmoIxTB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlM8nVXt; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-44fe9aa3bfaso25587031cf.0;
        Mon, 19 Aug 2024 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724082280; x=1724687080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FK1sS7aaEdnj+mCNMan9+e3nHC87NTFcERHwQaZ/1rk=;
        b=PlM8nVXtbOc9XEhdosRoc0qmTPTjhhFk2+Vb9kLiNi1IHcl06oPbAsghLdd44IEudm
         6d6q+/qrBiBJHzdBrMchZr5i7P72EbDGZvbefSpUG2dCMX3XGBJ2scjIzcJns2+a2XWl
         zyLDjDhJ5uB3Zl9pxMOYfyvbSDmwLG0yPnEFmHkAkp9DIBZZiT3zIGuURybtEfSz6IAI
         8fiWzk7+pALXP7dqWMiWGH51sU6KBdLGpFh7PV6oMVTGFiVcV7geIGHEJHbWIVcD+nrm
         ygYCwGmY2fYYzyLvNV9TWCPjSMrCS74hNz2lAXWH6cnYYBzPMuG2zX0ftOxjwCDOTyAo
         C1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724082280; x=1724687080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FK1sS7aaEdnj+mCNMan9+e3nHC87NTFcERHwQaZ/1rk=;
        b=WL/W5YA3UwXoOhWEOZ9p2RuOLGvcn07FWMkGvj74P2qBTEz8WdHQJNZ8n9aia/EKgM
         EDFb9bx38XdyUNguK3v+PuE5L6yYrw39s5xQpTPfR2zSTap28tW+t24n8/CHQ35zXcsw
         Vf5kb5fmiGyAQMOC8mb7GLJ5muuzGmjP1vLXMj5le7CoKlBjQgWSt4i/f9Oa4nD3zaZP
         HZ1Ak49en7qIjUSttm1Z9h8ZcvwY8nUZWqmf+2leEBjDtlB4Oz3B/dd9cCWayEtWRcgR
         oT7h7KVci51uED5R1Z/Jq5VBBE5ZgJSuK2Ps09xusqkpVndqoMHYJWVtF5ykWVMTBhsp
         F3GA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Bq2NhIZNpRj5HUiQI38gvDi4Qq5zBSpnEGa6RN5+iMqz2G7WB3ACdo0FO0rx8jHl2w0MZTStuw7Ep6+fy90DdJTEcBgKk4MLB8YFYgjT9pUBqutlSKhsR95tcIPHy/8+VlrZa4gZZZLINJPx/OEs0rEkX40hcy1Ytq7q8Ld6Wxh9A69/uVX8RL0=
X-Gm-Message-State: AOJu0YzU3aOoNNvq9j+Xqg3sM9Mj4Xc4SZiFXpx4PtVNld0D2rwlmvGE
	666gndYH8J8YVnVCbd40b4Zrm8Izcdj5jJ0Sw/nOnSMwMTZtbIsGaoBxA9kLuoBrk8O3MTX3OQT
	e1hTF2sjRb7bxcttKsRZ8Y6ac8w8=
X-Google-Smtp-Source: AGHT+IHIaNnjVltM6pfQQ4yDHMVH7k9BRW6MyZUr0D88z13vILXBInw9WqfoePBHyi91IS3/sbfP1honq2WmhkPp18Y=
X-Received: by 2002:a05:622a:2a0a:b0:453:6648:2cbc with SMTP id
 d75a77b69052e-454b67bc6c4mr71429051cf.2.1724082279861; Mon, 19 Aug 2024
 08:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805095842.277792-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX0JBtRfda5_X=2g3ehJQJqOf=JS-ZX57tZ0wzGjjsCOQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX0JBtRfda5_X=2g3ehJQJqOf=JS-ZX57tZ0wzGjjsCOQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 19 Aug 2024 16:43:44 +0100
Message-ID: <CA+V-a8tLzKtWpWAKfLi7zMyGCvKKq4+iggtKtNrWo0aMdKb7Fg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzv2h-cpg: Fix undefined reference to r9a09g057_cpg_info
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 4:11=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Aug 5, 2024 at 11:58=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Address randconfig build issue where the linker reports an undefined
> > reference to `r9a09g057_cpg_info`. The error occurs when
> > CONFIG_CLK_R9A09G057 is not defined, leading to the inclusion of the
> > device match entry without the corresponding data. By adding a
> > preprocessor condition to the device match table, the entry for
> > r9a09g057 is included only when CONFIG_CLK_R9A09G057 is defined, thus
> > resolving the linker error.
> >
> > Error message:
> >    /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX perm=
issions
> > >> /usr/bin/ld: drivers/clk/renesas/rzv2h-cpg.o:(.rodata+0xc0): undefin=
ed reference to `r9a09g057_cpg_info'
> >    clang-14: error: linker command failed with exit code 1 (use -v to s=
ee invocation)
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202408040932.SqrqyXGU-lkp=
@intel.com/
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Fixes: 42b54d52ecb7a819 ("clk: renesas: Add RZ/V2H(P) CPG driver")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> As the issue is only present in renesas-clk, I will fold the fix into the
> original commit.
>
Thanks Geert.

Cheers,
Prabhakar

