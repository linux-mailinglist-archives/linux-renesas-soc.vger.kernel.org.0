Return-Path: <linux-renesas-soc+bounces-7903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C43956E51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C35BB20AE6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 15:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B24173355;
	Mon, 19 Aug 2024 15:11:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F19A1EB3D;
	Mon, 19 Aug 2024 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724080275; cv=none; b=puv7eELxTmg/NEN1UovKwdc7J4AvsR7zChls1q47EvSI3352ai5Zjf7h+snxUXOjVUvZ9xMh72Z5MkSNYbUQo1iNY1tPVSeyQjOnQ4IR6Pf1ipDqHPIYfSjx6QH+ueE17NyXF5mdGcgmnJtvR+aK/q7fibDJDhO4O0K9RAKlBf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724080275; c=relaxed/simple;
	bh=PR1Sq6lpGhrEFUCUfB0JKPxjLZt7MDY9PZak/XC/M7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sE+gcCfP3JSspZmxGaEcspakhuHK/QBUCaLLJLjlQLqRMteATwDWI6iA7UCUhxAxfNObHiQhe16yC9iMNVE6zf0aUHyCdDzG+oFp99gR7M1NwFSfN2R5QFywOVMOhnCkav23ov+jEartyZjocna+5BICXJBDz45DxozU9dMXqd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-69483a97848so43327677b3.2;
        Mon, 19 Aug 2024 08:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724080272; x=1724685072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vir4naB8iBTCySv1Pgnj+DAjepo3kMZB0UojIPP9S80=;
        b=LVKkpPrIijLIA8xViC22cSyU/9aB3PFojHMXHpa1mlvKRYytvqVgOXuNPupBK23zov
         5MjovoCzWlh9ow6bJEZ8rMZAKGGr/tViojc2cpd2SA0x6+8BnnBJyJ6hXBSmswVxvMGQ
         uGeTX74d3UI7l3DIedW0gJsKMIp6aabBm9wMHPt9DM9sZpjxs0IDtz0oO5CHv/Fia5Rg
         d2/EOLhV11zgfcHsKzBV0z3i30j+FCheO+yVmQIkB0sHyuKa+pSKziBVKN64FiZF+R7o
         zuY2wuzfjNYM3eg3m3BeJS3Ae/HCK5tdNKEgetfscAlZyxAjgintbEdwxKlpA0brzU+b
         aGqg==
X-Forwarded-Encrypted: i=1; AJvYcCVLc9js4MRIUYY4QfkbUix4M0udU7TnaaSp5N9coe392qyR+Ds7XY17/pLK8exYlFDIAe3ek82Rr4aX8I59WG2MllMepSout9Y+DF9LE4o9D1H5qGWIY4TwmsFXPDPk1mpO+CE3DV0xbMac+KbiuRtb4mPKxDisBDFmNAIXeGrbahE2YnRUtIehwrE=
X-Gm-Message-State: AOJu0YyyCKfViDEnkddHIHnyoeYd3U64RMNjoYlFUoaXp+yBtWF9Jqg2
	lTFL7PkoN/6pPkF9xwhKuQtGRdHE31ueKsCsaVBucoZ0BUsHR3eBfckkpPey
X-Google-Smtp-Source: AGHT+IFukWfq1M2LYcMHEhlxW5xMTES2T4TBONW/1mSnhQmlUxtn5R/SCrd5HQPXu3IkqB/vvP1oUg==
X-Received: by 2002:a05:690c:108:b0:6ae:ff16:795a with SMTP id 00721157ae682-6b1b8ddfad9mr149542697b3.20.1724080271747;
        Mon, 19 Aug 2024 08:11:11 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6b33af8c650sm10800397b3.35.2024.08.19.08.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 08:11:10 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-69483a97848so43327137b3.2;
        Mon, 19 Aug 2024 08:11:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSdCUX1uIJRZLaY8CgFTVHsJ985x8SA/yurQQ6/IOLorqHQy9IduGHeQmeDsiMphOZFqFSHIO0pSM3K8380aTg4b2VbOUZl+biZ6saf6BcvsKOolQTOow3nguY+zrNUgOs+dlmowsQ/zWRVdC+nrv1p18mdh94XfQJaVXftayORzDOfmCwhVVluto=
X-Received: by 2002:a05:690c:6784:b0:64b:3246:cc24 with SMTP id
 00721157ae682-6b1bb75e6d8mr131136757b3.29.1724080270079; Mon, 19 Aug 2024
 08:11:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805095842.277792-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240805095842.277792-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2024 17:10:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0JBtRfda5_X=2g3ehJQJqOf=JS-ZX57tZ0wzGjjsCOQ@mail.gmail.com>
Message-ID: <CAMuHMdX0JBtRfda5_X=2g3ehJQJqOf=JS-ZX57tZ0wzGjjsCOQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzv2h-cpg: Fix undefined reference to r9a09g057_cpg_info
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Aug 5, 2024 at 11:58=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Address randconfig build issue where the linker reports an undefined
> reference to `r9a09g057_cpg_info`. The error occurs when
> CONFIG_CLK_R9A09G057 is not defined, leading to the inclusion of the
> device match entry without the corresponding data. By adding a
> preprocessor condition to the device match table, the entry for
> r9a09g057 is included only when CONFIG_CLK_R9A09G057 is defined, thus
> resolving the linker error.
>
> Error message:
>    /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permis=
sions
> >> /usr/bin/ld: drivers/clk/renesas/rzv2h-cpg.o:(.rodata+0xc0): undefined=
 reference to `r9a09g057_cpg_info'
>    clang-14: error: linker command failed with exit code 1 (use -v to see=
 invocation)
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408040932.SqrqyXGU-lkp@i=
ntel.com/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fixes: 42b54d52ecb7a819 ("clk: renesas: Add RZ/V2H(P) CPG driver")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As the issue is only present in renesas-clk, I will fold the fix into the
original commit.

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

