Return-Path: <linux-renesas-soc+bounces-11016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F729E6F10
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 14:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A8F116D2A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 13:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C158B202C3F;
	Fri,  6 Dec 2024 13:10:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6530946426;
	Fri,  6 Dec 2024 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733490606; cv=none; b=YJJyE+0z0f16A0FXahCb+qwAhc2ruXFaLRvU1GbN45xpY5LeZrI8msGYww20aolzJxC87lpLPVN094PPa1lyLrTUaXJwaSb0cpWDlFmyyRjK+IjMMDou4PLacxzxyigaMtwEw51OP3o1oajCHZPgUrXNO+9RFuiP5p7O5nSjC7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733490606; c=relaxed/simple;
	bh=vLb6TFJMRVrWuUEMKVZ8X3STvYVWdH2JopjooWhn/7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ra21yBn2GAKra8i0HhuyfTl99NzxkWxKUDC9kOhJlgUENKc8tGi15ElJjHdx0pM0Mhcp7Wcyo72WpuJj/n1JIGnx4lzuUpKlzxL/xK4Z3Xp5VUaIWoca4Q9NkDO1QO6Z4fMh0Ch469d1PTdnQ1h5Zm0EICnnZ4+4Xn/q/PdP9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4668d7d40f2so16744311cf.1;
        Fri, 06 Dec 2024 05:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733490602; x=1734095402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pql6sQFky/8z/PHhGi6bUNlibDNQZClt0A7VMJ+07bY=;
        b=kzStCU09U3KW/hMTozBrHNpCFgZIy4se/kSALwyY4g56DWUJ08yTMDjxW98UTsIMSB
         MvLXVYMOXx4B1G6cBmKiWZbGzIhgMUWWMXz+m0rcbhCwhovZZ0plSDH68EpfbX35F+Jv
         6eZs81uztnHIITHlKU0xu4gzy0BObAGQF5gh7zi82Ov5U9iPtJqCklYQsoJ7C0NiSUvM
         zQ96v04YN35eZCCXMDsiHa1ViJ4QVdA+PnaeJJUnu1AzXqnwsUOGG2S3ZsWrD0to/8tl
         j9vsMDP0LqZ/MfthRJ/mgWrBczzoCLv788j490xVTy8KaLN1uv2X9LaMw5dGtJpyukxj
         iSdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3VkD32mgXMbFa2Si1M4L36D7Ha0OxUXsgprDix/lMdKp/9ixren1TF3VoNIu5aWaClEKXzbbifgjyCVFkrt4vDg=@vger.kernel.org, AJvYcCV0qDrp5F+41FPbvT39V3E/KIqwARmcNhgfLgm8rXYuoLQoyr+7sPWyBq2J/WpH8mMD5xJ+FL6m8pXDqLsY@vger.kernel.org, AJvYcCXG1ckz5FgFWx6Zirn5hPo7pNrhE1gyrPdyxPNl/3uphVKV01qTUCm1NTtRENA3Uf982jJa9JyqKsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPMofbJTuEOp06nKbBACSwrH5jFGKxW/ITsqMACENJVhSzqu1K
	HI5TzmoX95/RY2ufJyRUlKFK0sYrC02r+Tvvp5V2aub5eROx9syP048DuiJh
X-Gm-Gg: ASbGncuNnukZs7Y0EsYK5PPGi5P0kZuydx9JjisUOkl3cO1JUH3JJVIUQ0FIiP0ZLYG
	XrNmXpzfHmBQU9UQSr5QYiie/igbAcLXehEY2QZOVSPQbIwKdI6Zh/fEkKH59OPJj1kNlaGoTj/
	nKnP57wOEh5wixROlMStoxpBheQ6uk6Vipzr1yXl9XYBAJqy9XnB0XCAyW26d0NDTg5mGl/TZzG
	OwF7RPIjDk0crGKk/agSM9B3WzdT76tCtYlU52ewkL+fYIGyW6Z7THf09Hs18mCfRjbK/A23/il
	zbqx5jgdzVUTMJZy
X-Google-Smtp-Source: AGHT+IFRVwImThhZxsJ6zLb+cZGmBQfGKze6z2uNg2Vg0cwDsQ4jPXF8KaWBiQ4iwh4JFvfUr62MCQ==
X-Received: by 2002:a05:622a:292:b0:461:1895:d9a with SMTP id d75a77b69052e-46734cc3b42mr50133461cf.14.1733490602032;
        Fri, 06 Dec 2024 05:10:02 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a5df45sm171506085a.51.2024.12.06.05.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 05:10:01 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b67441cf32so129282185a.0;
        Fri, 06 Dec 2024 05:10:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8FVi3+atWyW9ivYggHxjm+gvQwhsAwCN9FdumUP/Ywf7twYP7AdQlV9rJ7aTJfNfE4ro9ZQW6/Rc=@vger.kernel.org, AJvYcCWUUGa8Kb/ZiPCemQVCTdGJ6UJyMUlmfSFC8/rD1buJebs9LuRce8035OFxf9Ndv2Zk7CP3cqYXeIuUFhZv@vger.kernel.org, AJvYcCX4EQViFZAtSPfuHR/qCX5mLmRVMTZVYsVLA16/EI+mwkSt5twZA8zq1FmzasZaqJ2TqUgWPLs3zIFS8+ljFv1fpJk=@vger.kernel.org
X-Received: by 2002:a05:620a:2441:b0:7b6:7ac5:5de1 with SMTP id
 af79cd13be357-7b6bcac6876mr426592485a.7.1733490601354; Fri, 06 Dec 2024
 05:10:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202203916.48668-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241202203916.48668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241202203916.48668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 14:09:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUbu8aR50NhChJ1Ur-GXW4eiELU=XyFAmBNPRzzA1dvKw@mail.gmail.com>
Message-ID: <CAMuHMdUbu8aR50NhChJ1Ur-GXW4eiELU=XyFAmBNPRzzA1dvKw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: renesas: rzv2h: Add selective Runtime PM
 support for clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 9:39=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Update `rzv2h_cpg_attach_dev` to prevent external and core clocks not tie=
d
> to the power domain from being managed by Runtime PM. This ensures that
> only clocks originating from the domain are controlled, thereby avoiding
> unintended handling of external and core clocks.
>
> Additionally, introduce a `no_pm` flag in `mod_clock` and `rzv2h_mod_clk`
> structures to exclude specific clocks from Runtime PM when needed. Some
> clocks, such as those in the CRU block, require unique enable/disable
> sequences that are incompatible with standard Runtime PM. For example,
> the CSI-2 D-PHY clock initialization requires toggling individual clocks,
> making Runtime PM unsuitable.
>
> The helper function `rzv2h_cpg_is_pm_clk()` checks whether a clock should
> be managed by Runtime PM based on this `no_pm` flag. New macros, such as
> `DEF_MOD_NO_PM`, allow straightforward declaration of clocks that bypass
> PM.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> -> Replaced `rzv2h-cpg` to `rzv2h` in commit header
> -> Switched to use for loop while looping
> -> Considering core clocks to be non pm clocks

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.14.

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

