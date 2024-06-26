Return-Path: <linux-renesas-soc+bounces-6790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 999B1917D7C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 12:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAC671C22ECA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 10:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D75176FA5;
	Wed, 26 Jun 2024 10:14:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C58177999;
	Wed, 26 Jun 2024 10:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396869; cv=none; b=prVnnBK0NwbhO9aIvAnNUviJUflWVr+d5psaiCVNSLzRKgUQv1nA9EgLCWlSYntGADDGZQAj+njwzDujf/+Wpgp+veUQ6iFvzHR5YYfwtdDYDCV4Pxpgy7mMM29DsB50BngDbRUYXLOYSmYhC4B+Mv3DbfIQERP6cNHy+gX0pC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396869; c=relaxed/simple;
	bh=EFghCQtGsVstgFyVTq7nBnhnV4HXH+r8uYETXbGkEIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bX3XM2cytAxvFMZZEcXbL+9wdJsHPatK5+b9d0I9ZyxMDzHzW9fMfeS8ip/RIZ83w69iS/uFA5jLXX0GqXYrNls+x8dld4kIqmt4P2nX8GK6zmqr6MleOJFElM743UdQt6c6QRIsHzH6aYOhuOIEFxyanSuoH6/hYNxk2QQtwms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-648b9d03552so1407987b3.2;
        Wed, 26 Jun 2024 03:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396866; x=1720001666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sncjNyIrIrmggFhsEKZPA3iqH4wFfpQzTy5GCSI2ZxI=;
        b=rkaH3+MHrPM9VPle0Qk7tFEKh+AuTk4KVXFt5FiDIYi16OHAkcyRMw2B5cfj7awi/M
         Yjehrc9E+LVUwPMX+1wTrUgMQ1eW/ib4Jy7iKLzODiDm9zHBSNVta08ZRktqq4kwTew9
         m50pol2Q4Zh6OWCuXNsjVWIMogbIEfjzdPUedjKk6XFKTVFf1hwRtJfrOq2frVSeZ1H7
         75z6jMUuRsc6BF15BAhdsGdlqWHRAS9eN+nh7yD4XNUemP2H+eWF3U60bQHG1WXIM8EV
         IiH1/jO0C3PN7anptdDiDwLy0VbGKXywlsp5+TZkFfqzE6Z4E5MkGmpR2lvyssTEHGpm
         S6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVzNbCjZ66UBb/vK/fNVE60Bg+AfCmFkfQ6DLaWBb11Ek0BB9VF5che2eclnXZMO+nCPk+xs3AdFomTidzLVbrY056IV8nO9kosBLL9v2mCcF8iN50aTo/z2vdazD6b23cOKIPAROTdLYsxnwYQIgxqXeH+msDJ/HlVsi88CGAWLf47Qot8F0ZgR1JRpc4ZDvJEymE1/9Vtn+uJ593AP/pa6XwYc3t2
X-Gm-Message-State: AOJu0Yw6KS7KT18gO6zc/iKGCqAKiw7fcrsnXcBVogiW0RjeVca1evMW
	9zFwX1xJDoEyujHKIFJpovxc3qwPAOQjcMK2ZaM3WkNSlsaWnss6OwFF3Mv6
X-Google-Smtp-Source: AGHT+IHzc8MVWoNoyOiUPyavdWjN3pj+SILTBNjziQ4ffhEHkhdcAQvdwLIcYpy6emBuTTv4RGw+zA==
X-Received: by 2002:a05:690c:6f10:b0:646:ebea:1da2 with SMTP id 00721157ae682-646ebea1e5dmr50052457b3.38.1719396865622;
        Wed, 26 Jun 2024 03:14:25 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f125a3e0dsm38290027b3.59.2024.06.26.03.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 03:14:25 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-643f1ee4b3cso33715567b3.3;
        Wed, 26 Jun 2024 03:14:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVuivCycz3e/07Gvy12uE2KJd5vftMYRuRzGuyG5V+Nb0hNWg/R9q50BjTm3BZ39iukNZj8EAf4ONFMkwjwQBIkYDJg3C1j8ERB+EY60Mq/WF/vOo+M92o3HicTWcMgOSc6ahrXxqS0C7+XTSnchswHzMWaBQj1iC8IYAvVsySFjsOK7aVt9YU0j3B9Lhn/AKIlW5lI6yfjyekyrqAnYhTxF6blAmL
X-Received: by 2002:a81:6057:0:b0:61a:bc2d:5186 with SMTP id
 00721157ae682-643aba46495mr103660557b3.32.1719396864518; Wed, 26 Jun 2024
 03:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240610233221.242749-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240610233221.242749-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 12:14:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUErrk1nq78vyvYoj4TkBiDhjMtbHExF3c2u9q5kWPH9A@mail.gmail.com>
Message-ID: <CAMuHMdUErrk1nq78vyvYoj4TkBiDhjMtbHExF3c2u9q5kWPH9A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/4] clk: renesas: Add RZ/V2H(P) CPG driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 1:32=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RZ/V2H(P) CPG driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Updated commit description
> - Dropped pll_clk1/clk2_offset
> - Made r9a09g057_mod_clks/r9a09g057_resets as static const
> - Now using register indexes

Thanks for the update!

> --- /dev/null
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> +static const struct rzv2h_mod_clk r9a09g057_mod_clks[] =3D {
> +       DEF_MOD("scif_0_clk_pck", CLK_PLLCM33_DIV16, 8, 15, 4, 15),

So this relates to module clock 8 * 16 + 15 =3D 143 in DTS...

> +};
> +
> +static const struct rzv2h_reset r9a09g057_resets[] =3D {
> +       DEF_RST(9, 5, 4, 6),            /* SCIF_0_RST_SYSTEM_N */
> +};
> +
> +static const unsigned int r9a09g057_crit_mod_clks[] __initconst =3D {
> +       MOD_CLK_BASE + 5,               /* ICU_0_PCLK_I */
> +       MOD_CLK_BASE + 19,              /* GIC_0_GICCLK */

So these relate to module clocks 5 and 19 in DTS.

Actually none of these clocks are created in the driver yet, so I think
these critical clocks belong to the patch that will introduce them.

I am wondering if critical clocks should just use a flag in DEF_MOD()
instead...

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

