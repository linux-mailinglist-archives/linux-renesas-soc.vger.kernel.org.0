Return-Path: <linux-renesas-soc+bounces-16631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA350AA70D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 13:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30D091BC6F62
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 11:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71168246785;
	Fri,  2 May 2025 11:47:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8133E22AE7B;
	Fri,  2 May 2025 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746186435; cv=none; b=rbHpXy2sk7QcLGM4VIqZvTjBKMgAaG4jcJbt2us3ylP3wMrzp3LuAnGAsOIcuh8gCaPy2ivy8AJZ6hR5btxEWGKSYz8gask/xHwwzJB1KZAPQoAqc4P7PdDqb1Yq/ItEPdTmmW2DlokzqEe8kLCjb3mo60ckfS67UYHOwuLWI5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746186435; c=relaxed/simple;
	bh=y8yzhRcHCZOJ0DsTxOPV+Az46nvvR7QuJZu/FpsJd5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oj7EpTMWIC/o1TKF4iBYA1S65OX2qiI6Zfg5wr9t+6rSU7pB9jq4vTzC+HzsbQnipe2IFk6O6QRnJNEwud5wiezMjRhVWFtcz28n5hLoNwI+6ky5BMwgJVkX1TjSOMYOYNeSfzfOJ10vuLN6CvNlQafQfYTNofJzdSYK1u/kgIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-527a2b89a11so619828e0c.2;
        Fri, 02 May 2025 04:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746186432; x=1746791232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEfh6r/eBjDOnPITdlJ1P4AlTNGu+73tXw3oUDUWfUQ=;
        b=QZ3IEmYZoqb8tIBYqQgQa4DMleoe0b+h8926R0WeP+WHi3y/L2bdULtrp9j1ssdRve
         s5PLGMlN7KwqJFB617ew3N8fjea2/drumCtdOz+Irf/Y3r4N81Lu58mH7Cut4nRbc59E
         GiJQe7VHsS42hs5+qQpBSx552uReRGdEx60XXFfy7WjhnqOxzLzOkKVmoYdtaXXEA/hG
         Nc9KrgDC0VN/MTCw3VAsNcZmJgko1f8vv1Qp6g+so1vJFIxw/XwNCZBBJ23WJ3y5T0RP
         8H5ovpn0fN0WPsHFVI3q5m6F3WGNsAL+7pN7enAS2zEP4r/qJgoCvTUpENTT5Pc8fOkP
         g0+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeI/MiYG81RPZJckcCfZyBi1Wheb9379iNaFcJMaq1ropaFGEvUN4q33IhfA6/JP+lktTyqQh8EtDmiGNbC+8yabg=@vger.kernel.org, AJvYcCWk6IvGgdQFup2IIKC5hlo3EfM+/nQaXdF90HCvpQiJYtJGlweMUFFb/uqXAGnXjZACuFGa3MnhasvF+tk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2hk96U5nRq72KkyCFoDSl7qgJUN5ANxztfUoZXQweEI+0fey
	tKNsgFjh+RxG3Bh3tkPfkfL+gnR/F3Ztx3uVCp2YPCkSxT+tPQnNuM10GI/0
X-Gm-Gg: ASbGncu2zPJVLv1UdWCKnluSebEwQLTD7gpAYntIbYMFDGU+VgG/mn65nvitRbafF3k
	eA/g865BQ119OfIXzHnXJlE8MkB1dokdGW7um9TNKeKXzgnV2kdzRVkQjSB0/f9AHVtf4lfHpHe
	zU59HDmmli9tU4BE+lqG4hasQje/mvNVOEmSGVDJToVDzO1K022aNQTWsMyEkRe1+p2sXxg/OCN
	sh3QaTbFQJqTAMwFoYSI+xF69diBzXBW4DdCXMIqzOMKvEv5CjmdBt7aE83adrjrvjbKhjyxHLm
	r52na4eyFI+TNpP+Odxs76/+nOzPxRvj4PFBKGMII4eRVsRsEPjnKRgTLFsiLFDl4zAkHoihI3S
	udZk=
X-Google-Smtp-Source: AGHT+IFIqFT8pGAmkMMdquRdymxjropB5EJuKq5os71b1r6ffXxxt7/XzypHgKQXs6nncGNyk8t+7A==
X-Received: by 2002:a05:6122:1e02:b0:52a:7787:53d7 with SMTP id 71dfb90a1353d-52aed77e47fmr1246305e0c.6.1746186431960;
        Fri, 02 May 2025 04:47:11 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae401ee53sm475454e0c.16.2025.05.02.04.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 04:47:11 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4dae6e1c408so471048137.2;
        Fri, 02 May 2025 04:47:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2ffiV9E/20LbDVEiGsZ690f3F0yWyo6dX+CWaX/PLUGhVFgXjqI5s+hN0Ig4d4NNM8FjnYLxCn6z3O2J8eXm39wk=@vger.kernel.org, AJvYcCXOt3PQAiNdJTnCOGsxsocYOwdEVhiVQHnNTryO6vK6cKBx3ZYPFgjA4mIbdAYjyxPjwzrVGAk2pW90+Lg=@vger.kernel.org
X-Received: by 2002:a05:6102:5e83:b0:4cb:5e02:754a with SMTP id
 ada2fe7eead31-4dafb536c21mr1446009137.11.1746186431477; Fri, 02 May 2025
 04:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415085438.83856-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250415085438.83856-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 13:46:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGK9-gs98e=j87Fm0C518x2JBpSP7d0EYXheN+NGZCDw@mail.gmail.com>
X-Gm-Features: ATxdqUG8ppva8hsX2Os9-iKo4Jf9hR5znCNAnjSkIzLtX93iy7vcruGLVsRUH2I
Message-ID: <CAMuHMdUGK9-gs98e=j87Fm0C518x2JBpSP7d0EYXheN+NGZCDw@mail.gmail.com>
Subject: Re: [PATCH v3] soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 15 Apr 2025 at 10:54, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SoC identification for the RZ/V2N SoC using the System Controller
> (SYS) block.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi All,
> This patch is from series [0]. Since most of the patches have already
> been queued, I'm sending this one separately.
>
> [0] https://lore.kernel.org/all/20250407191628.323613-5-prabhakar.mahadev-lad.rj@bp.renesas.com/
> Cheers, Prabhakar
>
> v2->v3:
> - Updated dev_info message to include the SoC revision and feature flags.
> - Dropped `<linux/string.h>` include.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16...

> --- /dev/null
> +++ b/drivers/soc/renesas/r9a09g056-sys.c

> +static void rzv2n_sys_print_id(struct device *dev,
> +                              void __iomem *sysc_base,
> +                              struct soc_device_attribute *soc_dev_attr)
> +{
> +       unsigned int part_number;
> +       u32 prr_val, mode_val;
> +       u8 feature_flags;
> +
> +       prr_val = readl(sysc_base + SYS_LSI_PRR);
> +       mode_val = readl(sysc_base + SYS_LSI_MODE);
> +
> +       /* Check GPU, ISP and Cryptographic configuration */
> +       feature_flags = !(prr_val & SYS_LSI_PRR_GPU_DIS) ? SYS_RZV2N_FEATURE_G31 : 0;
> +       feature_flags |= !(prr_val & SYS_LSI_PRR_ISP_DIS) ? SYS_RZV2N_FEATURE_C55 : 0;
> +       feature_flags |= (mode_val & SYS_LSI_MODE_SEC_EN) ? SYS_RZV2N_FEATURE_SEC : 0;
> +
> +       part_number = 41 + feature_flags;
> +
> +       dev_info(dev, "Detected Renesas %s %sn%d Rev %s%s%s%s%s\n", soc_dev_attr->family,
> +                soc_dev_attr->soc_id, part_number, soc_dev_attr->revision, feature_flags ?
> +                " with" : "", feature_flags & SYS_RZV2N_FEATURE_G31 ? " GE3D (Mali-G31)" : "",
> +                feature_flags & SYS_RZV2N_FEATURE_SEC ? " Cryptographic engine" : "",
> +                feature_flags & SYS_RZV2N_FEATURE_C55 ? " ISP (Mali-C55)" : "");

... with the above reflowed to avoid splitting ternary expressions,
and with part_number expanded to fill the free space.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

