Return-Path: <linux-renesas-soc+bounces-17428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B997BAC2082
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 12:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD9CB4E1CFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 10:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1745B227E9E;
	Fri, 23 May 2025 10:01:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C0AEC5;
	Fri, 23 May 2025 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994513; cv=none; b=bvQ+H2CE2m4T57RE/A6kVMzYdzjykH5tlC6NVEz6nIPz+Eer8Auf/qc9m9vz2YeYp9I3phW9i5zusLtitLut/5DJOpu/Jt/EGnUtmkuLkBDkh6UrPAPKAjkPctcLPdvyo9NASqnY52uQbUaVy6BGM4/AEIhBZA40aIfNS8EUvd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994513; c=relaxed/simple;
	bh=q3T8UELofPcASBzsTVBayjFOP0EajpIvJbSoxArvKMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iB1nf6D+CfxL0+orJ5dL5FuDCbq5JXwYLedMRRxjzAXEBVGafqBh38HLeUzwelE1F09dIquhCkEi4dDj4CAW7uMEk8EoQJaX6rpJslOR9lq2i9u3DBCN9EEP5nCT8OYNJqgLYhbzle41O6yPvvCgoF6tlZzb2swP7MR2SWKNAS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52b2290e28eso2089335e0c.3;
        Fri, 23 May 2025 03:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747994510; x=1748599310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EiiolHRMG8Ta2huRzCSSCJZUlZQ8b1R0+NV9XSqyCzI=;
        b=XLW0tnCNiXjmp0xEexfDrTOszoT6ReZ2PeWdLenPFqyp0Kr6FOstBD2KRfgLgq0bWI
         oW3rcUo0z2u+IjlIbxUjwnsQ6khcVlMVNIZO8M0o6zBeYjg9HPJj52BS48rT58SFb08j
         b7Rse6ej4s3Fxe7baYGYJi3D29Ddvs2bsbbWy4z8T/m6ajME86LVotCEZ7Okp5SCCcCR
         8q90rICAIhj9LDNwTfwUIl1gyBJUc3gRvt+SqNEWR4f1xPmzUNrqPu81/O4A6GjpFbrA
         lin9rzSAQCLB05XZ+PyYidKK7UsALfgd4dTBZqk7+vOR82X/uEGI9PC+uVsbAHI4TqHo
         mMgg==
X-Forwarded-Encrypted: i=1; AJvYcCV5WoFmH2r+OcM3tOsicuijUGRs2zykqToEDFYKHYDaMfdKsVqrpjFZmoxanYUsEBQ7sT4MB0nmbpFl9i0GlRFe6tw=@vger.kernel.org, AJvYcCW4RBC6gGi+nG1PJ69Qpcv4XxG1sQiS+icbnFjlalWuYjT7ksLysv11GEQfyOIaoefI192rY854QpU=@vger.kernel.org, AJvYcCWtGkC61J/QZFvYaDI9lCIV62xOieSy8ce6Db32j+QfbCxh6x1dV/k9aQiys5SpdAdjApKmoJxYWGW83uLU@vger.kernel.org
X-Gm-Message-State: AOJu0YyATawoF073heBD+ZzfUyN0rf3V6JHO1OFwE+oGdj1GyhxtrO2P
	EWSCB3i8TBrD7IhpA7lrv0ubW9u+GwIYHDnaeC8oql8vg/JC+BhZo0rr/k4xSn2y
X-Gm-Gg: ASbGnctnGGby5CmaQC6sEu32wqThgJ8ohQDF239mmv8JhcGq6sShlZcjFde/AzwqOAd
	/dfgH9u84P1qGafRw1oZFkOp9GX8NhcLHCucizkgrW6l3VB051e98b+bkq49SKmbJzFgXg57SoX
	2Xdn+c8rCfcL00mD3gNkpE+nAGsJXpBjfLLfDQ4p3s/fImYBNYFLF1P1SaP0LUsscluo2qCP059
	ftS7oa4r4amcJUkpVM1RoGmak3bGNuBDldh1DVyPxNLwIt+t645dAdLVmyTp88sictwXCOW2XTB
	Sh9FNCs3Q9zv/2HGkHzzeSylTVukYVYSuFySiie2Y1AKTqu7erQ3U//kJlFv9stfxdPk9I2zKu6
	v5HHVdTyBx3QcSQ==
X-Google-Smtp-Source: AGHT+IGKwPx3jRCYMTdti+/vE3+hV3DcoXvWmI9/xyPObqYhWkt8hmE6goWy160fCMaQpsoYFeQJlA==
X-Received: by 2002:a05:6122:1d48:b0:529:1a6a:cd48 with SMTP id 71dfb90a1353d-52dba964347mr27064871e0c.6.1747994505754;
        Fri, 23 May 2025 03:01:45 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba967788sm13188453e0c.22.2025.05.23.03.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:01:45 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e290e4716fso2002655137.2;
        Fri, 23 May 2025 03:01:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCzEAlFiPWW6g0jmXLDoFaxTe5SXzW6wXApIOdEYBcr8l4fROhHi75O2r0wcUP9vrETt10gaQlj3sNlBlO/Lio+50=@vger.kernel.org, AJvYcCVRaju+frVUIOg7h6uHwQQKIG+cSZtBZ7kr2fD78BCQwzGi0qKkZvpk3sdfvNY94qNa9X4n8NMmggB7uxy3@vger.kernel.org, AJvYcCXwpcuTFjSP3p2ModevRxd/MHBSuZ/gtYhJKtRBpF7qqJynHqstrYszg7wkhgbMTP6uXxmVDPIZGn4=@vger.kernel.org
X-Received: by 2002:a05:6102:570d:b0:4c1:9695:c7c with SMTP id
 ada2fe7eead31-4dfa6c56bffmr27868276137.24.1747994505001; Fri, 23 May 2025
 03:01:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com> <20250515141828.43444-6-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250515141828.43444-6-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 12:01:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUe3Bz__5S0c-bgdY0CsCzQ_ySeBydzv63fMC3egPnAGQ@mail.gmail.com>
X-Gm-Features: AX0GCFumhp15wxRPV5n96yu1tU9Qxfi63KcgiTtuf-ryhestJHNqOhq_Qf6Ln3Q
Message-ID: <CAMuHMdUe3Bz__5S0c-bgdY0CsCzQ_ySeBydzv63fMC3egPnAGQ@mail.gmail.com>
Subject: Re: [PATCH v9 05/10] clk: renesas: Add support for R9A09G077 SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 16:18, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> RZ/T2H has 2 register blocks at different addresses.
>
> The clock tree has configurable dividers and mux selectors.
> Add these new clock types, new register layout type, and
> registration code for mux and div in registration callback.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v8->v9:
>  - Renamed r9a09g077-cpg-mssr.c to r9a09g077-cpg.c
>  - Makefile: keep alphabetical order
>  - Fixed DIVSCI0ASYNC
>  - Removed unused CLK_MAIN
>  - Simplified the clock tree, removing CLK_SEL_PLL0, CLK_SEL_PLL1 & CLK_SEL_PLL4
>  - Renamed loco to .loco
>  - Fixed the register bits in dtable_24_25_30_32, re-ordered the table
>  - DEF_DIV & DEF_MUX: set flag to zero always (might change in a future commit)
>  - Do not set CLK_DIVIDER_HIWORD_MASK
>  - Uses '8' as value of removed R9A09G077_PCLK_SCI0 definition
>  - Fixed addr calculation with RZT2H_REG_OFFSET in r9a09g077_cpg_clk_register
>  - struct cpg_core_clk: moved union in specific section
>  - Renamed cpg_read_rzt2h_mstp to cpg_rzt2h_mstp_read
>  - Renamed cpg_write_rzt2h_mstp to cpg_rzt2h_mstp_write

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

