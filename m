Return-Path: <linux-renesas-soc+bounces-7555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B04C93D564
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 16:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBB49B23C0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 14:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2CD1CF9B;
	Fri, 26 Jul 2024 14:53:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B308F1CD06;
	Fri, 26 Jul 2024 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722005636; cv=none; b=RFHKJWZjrhRvua+C2lxrYOAlhUiYzKqqLcjgOO7Dsb9X3q8ZfSoFox5H1VF9PSWj4WJu8aGrhYo2zVqokYbzq/bCo56HW+yz8yia2iq58x9Y2DQdJDF7cX/07HHDEro+8ZF2sOdf0NuZ1r1/h7FtjNRcX3OYdp6CQDMZRDdziJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722005636; c=relaxed/simple;
	bh=iVW0ikqyEw/0nWTSPgYR305RZJhGR3f7/c805F0A8zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=At5AX3orcQdQbpaYgerTsEjhLzxALJdHWrV56t0nSKyfQeMNkEPhzVeW9KOYZ1RXArQQy8+t/TJTqxkJt4hY0li3LQw/MmTISuGBA8JOpaZHPU0g8Sr9IlCh4ZB0Xq1rhgb6efKpb/t95SdioJoc0mee7/vN6b+WfnJDWc1VXH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e0365588ab8so2055263276.1;
        Fri, 26 Jul 2024 07:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722005633; x=1722610433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYs31zBx6WMIkiJqqli8+VW+h8fHN0+SfH4ha976j9s=;
        b=EuNVkwY3irAxxENDBGiAkZfBGn2ePvC1ZWKKjj24yukHlZm3I/NOZQpHhaQs8D/mpW
         Kj9jILO0104KolLWUAR/BeWdjVSkHwSzKWzeY/iSkLCSnzBma94UdMq9WDADrG957Cex
         unhOpskTEzzbi94npNocG2jmPP/rsMSux8XzYi2bRjD8+iT6B1F5DRk5MqTOHfp8shEE
         iqL0pIsSrXOV+MDGz5nX1WWBmk2Duk14mvCGRuXVgUMendIugqyB0j8joufPRrICSSGf
         i+lnbIDDBGYSLbtUME+pa76OqGPjheqHRYbZ/0nGPpIFGzHOD2tAp9mgacEBol2ah07H
         tOMw==
X-Forwarded-Encrypted: i=1; AJvYcCVp03W55W1D6CiJVSPzyJKWGsjBdYryZ7955RKBlNgIdBjc/QfKX7GS2OESWwqTOQawzSwTWzOnljKtaJlIORxRhqgSTxlNcRyLC/FBuiO8G57MjeRQ0u8P8tzAePrfwp5UyI51DcjpQE+RCoQG4CUNftCoFg5WqRmQ62+KLbb+HMioylTZDP4EMtXOEUAR/Mb1xEkk7KGdCBVNFgg9ul53ro7nRVDv
X-Gm-Message-State: AOJu0YwRMMLn8hNkYewiPpccCcUHGAckDDGxm9JsQO1BEKklmThkf+Qi
	YqrfQtHo7lKqiDvM5c1UY2mcChxWQ8EtShPSTAtmhNfymYIxHeBQy/bj3TCcQVE=
X-Google-Smtp-Source: AGHT+IEWXKljourCVY2rb1xAdBAkOWyG8k36SwZB/0ONR7yarWYIUnUAw3Xjnxyb6JhFs6A1k8LtdA==
X-Received: by 2002:a05:6902:1141:b0:e0b:1519:e0da with SMTP id 3f1490d57ef6-e0b5464eb97mr4075276.52.1722005632929;
        Fri, 26 Jul 2024 07:53:52 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b2a972282sm760993276.63.2024.07.26.07.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 07:53:52 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-663dd13c0bbso22125907b3.1;
        Fri, 26 Jul 2024 07:53:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGDg/n0Y04zgHw4ygyRXwdRIk6LTE/u+pT48JqMQNpjr9wPFe1iPvkEjLp3yRNVI/51WR9xb2QCE30c//UgzVMTjKHIPmeC59NXQS3tQIFQpoDOcGCi/XEREYKJxU+wtQVdzsoZP1aubX8tLcJlJAOhJdnNGcNVDxPeqDr90zoSvClSalgr+IoR7IhzLBDDSVELzY5VK4IifuwTNsbK8xpoE/nWVTT
X-Received: by 2002:a05:690c:6a89:b0:630:f6b0:6c3d with SMTP id
 00721157ae682-67a070cdb93mr469397b3.23.1722005632311; Fri, 26 Jul 2024
 07:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240715125438.553688-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240715125438.553688-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 16:53:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvfAqJR6=4MG3hXC6cn1AnKz7+RAp4GG1jvdwOctgNzQ@mail.gmail.com>
Message-ID: <CAMuHMdUvfAqJR6=4MG3hXC6cn1AnKz7+RAp4GG1jvdwOctgNzQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Jul 15, 2024 at 2:56=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add family-specific clock driver for RZ/V2H(P) SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - Dropped masking of parent clks with 0xffff
> - Dropped storing mod clk id and now calculating it
>   based on index and bit.
> - Made parent to u16 in struct rzv2h_mod_clk
> - Made a copy of resets array in struct rzv2h_cpg_priv

Thanks for the update!

> --- /dev/null
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +/**
> + * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
> + *
> + * @info: Pointer to platform data

There is no longer an info member.

Hint: W=3D1 would have told you.

> + * @dev: CPG device
> + * @base: CPG register block base address
> + * @clks: Array containing all Core and Module Clocks
> + * @num_core_clks: Number of Core Clocks in clks[]
> + * @num_mod_clks: Number of Module Clocks in clks[]
> + * @resets: Array of resets
> + * @num_resets: Number of Module Resets in info->resets[]
> + * @last_dt_core_clk: ID of the last Core Clock exported to DT
> + * @rcdev: Reset controller entity
> + */
> +struct rzv2h_cpg_priv {
> +       struct device *dev;
> +       void __iomem *base;
> +
> +       struct clk **clks;
> +       unsigned int num_core_clks;
> +       unsigned int num_mod_clks;
> +       struct rzv2h_reset *resets;
> +       unsigned int num_resets;
> +       unsigned int last_dt_core_clk;
> +
> +       struct reset_controller_dev rcdev;
> +};

> index 000000000000..33631c101541
> --- /dev/null
> +++ b/drivers/clk/renesas/rzv2h-cpg.h

> +#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit)      \
> +       [_id] =3D { \

Indexing by _id means the reset array will be very sparse.  E.g. the
innocent-looking r9a09g057_resets[] with only a single entry takes
600 bytes:

    $ nm -S drivers/clk/renesas/r9a09g057-cpg.o | grep r9a09g057_resets
    0000000000000038 0000000000000258 r r9a09g057_resets

So please pack the array here, and either unpack it while making the
priv->resets copy, or implement translation ("look-up") from ID to
packed index in rzv2h_cpg_reset_xlate().

> +               .reset_index =3D (_resindex), \
> +               .reset_bit =3D (_resbit), \
> +               .mon_index =3D (_monindex), \
> +               .mon_bit =3D (_monbit), \
> +       }

The rest LGTM.

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

