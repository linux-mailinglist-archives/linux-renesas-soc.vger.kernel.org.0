Return-Path: <linux-renesas-soc+bounces-22015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E66B83F2A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 12:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3C362A874D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 10:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72322F3C13;
	Thu, 18 Sep 2025 10:00:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAAD2F25FD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 10:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189623; cv=none; b=m45kXImzCQZJ7VvHUL+6CHyPSK1L0VeGK5T0MSL4GggD57nL6KBlpu+yQ8vYnYbb/D965UgXDgev6d/kw5Jyxdj++rOkAxuTEHjD5i9p15wGeyswN5wy4rGGnQVYHn89F22jEgm3RqeVzGpeVsaPi3HNd/zUiMMlTzcTYHmoKq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189623; c=relaxed/simple;
	bh=/OBhn+PWMDqXGRrapAeq9Q3SvZxxEYXxE4Nz5bqD3Xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AesiWaewmPYTChidpfhy98SlZde+0FYrX/iSSC2q0qIAwhnKBI8Ci9HD8/HWJjb+cxucN9AC6xec48ojW4fHWKbZbTiMfmOMeGEaD9K+0ohj6NtVNsGsXtQ4gJr1Biv0PEsQiScMfV9Je7aixtEvnpLFc2KI4jBibxktJpbxfM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8943501ba3dso415714241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 03:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189619; x=1758794419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heq3/GupfVYfNfyXxVtKecyYAD/tIXHJ4nXkThDhTOc=;
        b=izO+0vKr5Yb46PeJN6oySDHlO+Nt0i/mzRzKst3bzdzOLsIxf9alKVRyICIs29uDmL
         eN/ZAd1iR4SzDe0esk9NDWIY25eGwv/WbFCXS1gWAYqaJYFNLA9CGuuMgjP+53DgV/zV
         RB7niydQTF+5gN5dB2eOO1TnwNUCnL0wYnyru0kuS1QmdBOajoLcbMrjPNa5JiZEG/j9
         thH/KD7u2/vYrXXcG4XweJZ7gBDQZrtrW2WW/8wHCtd9cQBqzEkXti7mETbaHyQg4+NC
         GYe3VdyBt4w/iEP8sjgOzbZBxHooW6GTOzB8CZW2G7yZZHfKbZ+28vokspxGu+EIH1b0
         sD/A==
X-Forwarded-Encrypted: i=1; AJvYcCWhsbkFnOHqDvbXY6YV55fRUZsmnABFW54pg08fTP+cctRAbfat2mPEeIEgWWhvp/C4OpfiXH05xp9kEoSWiEm1gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPX7zjPzIB/RETdgI0Md7OP3oOYVr4N5hDUEh2EVwQ1KLsC9Fz
	xnMkjVfH8F2QdQ0IJ+iYMkEXLXIN/pKJSY/TMwb059v4r1lUuRjmKQ/U1Vpj0R6s
X-Gm-Gg: ASbGncuD8w2YnGq9jG96jR4oYwJyPYONnSA2S0F7+ubqI6kR2eQk6/W871ge74xUHRx
	N5eInlFLW85WIApijJEyI1eiQ2gdHa7uLBh7DU85hE8SCPXC8Z1D2GbmA6mWa5WchnckvC8AGyY
	W+6nXVlKEI1NLKijFpnz3AzokJgpenuopF8eJgOqZi+Z9pqqGowirgKV+MY1nv31NAjad704e95
	ZhNJPldsqJGSMSh1S57PPm481bkmJaOM+5UxKYiki6pWKO1SfOEBVZl9dIZk9VRr/GL7amx5V3l
	ctHFFfe2ZmmfTRbhbGzlxvSRH8rBMoTuSAyFoFgvM+EFV8jrLyTrnUS9Rk1PcMqQTEXhKbD08PK
	8qrvGTI3Sm0Q9dIjzcGe6D1XCN631dGJZnxCgWfmtlBSduOYGw3w2ZF9jcNNjc4IiIs+pLXGMZe
	yuHu4/QerjPVSz/Q==
X-Google-Smtp-Source: AGHT+IGhK/N7N14RRJjvtqx5t0mRI+MIGzthgP3aMBZdzqaQYbMVohsYn3JcpDt06E1wL4sqlhjexg==
X-Received: by 2002:a05:6102:6c7:b0:4fb:fc47:e8c2 with SMTP id ada2fe7eead31-56d5088a6e8mr1676061137.9.1758189619553;
        Thu, 18 Sep 2025 03:00:19 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-57a1b3d226csm494922137.16.2025.09.18.03.00.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 03:00:17 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-50f8bf5c518so594283137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 03:00:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6GUsayVVKTkAwtZD8uReoLkKyaLsl1SFflrOd4OSSydHvVSTcj3dX4i1CKAFz5OdPfDGlg3eLWeF4wCr/QphLJw==@vger.kernel.org
X-Received: by 2002:a05:6102:5e89:b0:520:ec03:32e9 with SMTP id
 ada2fe7eead31-56d4ca46b90mr1938216137.3.1758189615787; Thu, 18 Sep 2025
 03:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com>
 <20250912122444.3870284-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWP638eB_p9xMAqZmOnuc6n7=n31h6AqV+287uvqQEdww@mail.gmail.com> <c2fc5f6b-0e7c-464e-89a6-35dc76177d18@tuxon.dev>
In-Reply-To: <c2fc5f6b-0e7c-464e-89a6-35dc76177d18@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Sep 2025 12:00:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeHoUe-=7TDetnDQbLQsKGf4pDGpSdz3xEVLs_Rst9qQ@mail.gmail.com>
X-Gm-Features: AS18NWA7yJuM6P3qfqTjc7fj_WIPx-OpKuRx0s7hlxrQZNP3abmLA3cANYn1ePk
Message-ID: <CAMuHMdWeHoUe-=7TDetnDQbLQsKGf4pDGpSdz3xEVLs_Rst9qQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 18 Sept 2025 at 11:47, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 9/18/25 12:09, Geert Uytterhoeven wrote:
> > On Fri, 12 Sept 2025 at 14:24, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The first 128MB of memory is reserved on this board for secure area.
> >> Secure area is a RAM region used by firmware. The rzg3s-smarc-som.dtsi
> >> memory node (memory@48000000) excludes the secure area.
> >> Update the PCIe dma-ranges property to reflect this.
> >>
> >> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> >> @@ -214,6 +214,16 @@ &sdhi2 {
> >>  };
> >>  #endif
> >>
> >> +&pcie {
> >> +       /* First 128MB is reserved for secure area. */
> >
> > Do you really have to take that into account here?  I believe that
> > 128 MiB region will never be used anyway, as it is excluded from the
> > memory map (see memory@48000000).
> >
> >> +       dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
> >
> > Hence shouldn't you add
> >
> >     dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;

Oops, I really meant (forgot to edit after copying it):

    dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0x0 0x40000000>;

> >
> > to the pcie node in arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
> > instead, like is done for all other Renesas SoCs that have PCIe?
>
> I chose to add it here as the rzg3s-smarc-som.dtsi is the one that defines
> the available memory for board, as the available memory is something board
> dependent.

But IMHO it is independent from the amount of memory on the board.
On other SoCs, it has a comment:

     /* Map all possible DDR as inbound ranges */

>
> If you consider it is better to have it in the SoC file, please let me know.

Hence yes please.

However, I missed you already have:

    /* Map all possible DRAM ranges (4 GB). */
    dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0x1 0x0>;

in r9a08g045.dtsi, so life's good.

+
> >> +};
> >> +
> >> +&pcie_port0 {
> >> +       clocks = <&versa3 5>;
> >> +       clock-names = "ref";
> >> +};
> >
> > This is not related.
>
> Ah, right! Could you please let me know if you prefer to have another patch
> or to update the patch description?

Given the dma-ranges changes is IMHO not needed, this can just be
a separate patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

