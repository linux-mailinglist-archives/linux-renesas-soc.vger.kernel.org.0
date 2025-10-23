Return-Path: <linux-renesas-soc+bounces-23486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD09C00A0F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6EF43345E22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 11:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9871303A17;
	Thu, 23 Oct 2025 11:08:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1427930BF78
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217704; cv=none; b=Gy/8/RWASGrHc2IOhS+wFQ1LEcX9mh8V13sOvBmItxbJO+mwv5/DUY6CD91cCCVJ5UP+QQF4GMDABxr0+w7EVvto7Luq53YCJczekx7OHQP1QszsU4SNMz5fXAScEWdxdwF8YyObv81ENdBVhzfIF0uM/xCsFQCy6ArOjlWcSvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217704; c=relaxed/simple;
	bh=tg+8iAuL9v348WQn+/MKpxNJ48PFBRZL9CF/o4UEAoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpWI+9apg8S4WpfH12r7c0JTOTr942IDWINOi+E7ixdg67EdKcc6susaVgqp2bnDuVftovF7yId/nj9u1Mv37IrPkFuZi093QBh+lDqHazw6F+/OCMkPrxihL4in47NRPTgLrIovStt0IAMOtPHd6sqpoFWSCYfHAqJGUO9zoPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4439fc3abfeso269660b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 04:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217700; x=1761822500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjWvH/pQF78pnjKmIZIOC/klk9iC3EtNoJr9L6Gp1mo=;
        b=I4roM9fgLqKJh+PZaDqS6EX6f4nY6XfZ0NArCA5ARf9dL93A8XmJLJ+5Ga9QA0mHTc
         QuYa59FW93cxEmw/P1yOCobe3fnOtU3qovAnVg3J3vLxbhZZOVgl8F8LaKyeV5tUYe+x
         gNSQj0CcAMmea/xQ1NzL8ab95XNi6BAwdtpZ2M5DFWDAepdP5O7fAfy3/gV6ftKU70WA
         o+VE70FugGfNvplzwWDDqem5uzhimH75uBsxVeQwptK2H6iBPOYEQYwPLBuWy/L6oG7W
         BC1o+49hPaDXullebtDz+wfALAmxy817Pi1ubxYgY+NOkMLOwACjFaVn+dnwlF4h0vah
         8n0g==
X-Forwarded-Encrypted: i=1; AJvYcCVkve/vgk5J5b7i1lE/4oBeYq1I6oVU3phEULt8ZrKPrVlmi7XoQ5nGmUyS31SnPbj/xTiDCaKgOvZcKR7jLSf1cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPTlXwYDP1MYWQVVlrr0cw/7FJmEqiTsgc0F6++8tk31/9Iy97
	cyT4BQ5+0j3SfsRWFsI+Oaqe3qU2wPQVfdtKMV8ZYoco95T7BCuiIwXqVB2q+gAu
X-Gm-Gg: ASbGncsibFEFUf5rLg9vMidvIWFxuARZ1zmlu1xR/Q6OAuuQcu3YZmWh6GXdcnniqEw
	8P8rsoSZUL84MQk0Xp+gTIDeg6RGLgaiJVZH8oSmHLi+Q4FRlJk2cGg93jVoYa58BEhQQJTabNK
	N+VHbdqQ/puSTV8sFsQZ5XbnBu5KhKuyr9vi8D2wuCS0gIb9QgXb1DJXi/s06slJB3Y/zJFdSY/
	0p0DrVx4EAoiB37iPKCo7d22ZZkdSlPL9U69FkeSOaSyNsKxz3H5sI95EdwbY1c5S1oT1nqlUQ/
	6Bieya0CcGapilkSW3eIfVz+Hg5DmMgEhxjh0gTYIEtZr490mSGDG50cYyH1ISI7BPh6tM8g6mU
	d7tOhJo6U5Ngqqe7qoOSwEucL0J59w2PcXfkm+mkUrbUvVFN1ThQtFicps7pPX0wMrDaJYP9FEZ
	jz0maB4enBE4Mf3ponb3Oc5/1EhseJYdS4RpOAQ00cqVDSg8TkjCFZ
X-Google-Smtp-Source: AGHT+IEh7h0Q523+ZQMMtjA4n2kOhrIr+rWZDyxm/ia+zY1VYVIJPHcCB3iTNIJx1tOqn/m/uADZcQ==
X-Received: by 2002:a05:6808:19a7:b0:43f:5fc5:e04b with SMTP id 5614622812f47-443a2f123a5mr11047624b6e.15.1761217699691;
        Thu, 23 Oct 2025 04:08:19 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-44bd43242ddsm406704b6e.8.2025.10.23.04.08.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 04:08:19 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-443ac891210so321272b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 04:08:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUp/alu4wjst2wpg9Epm9gBsv90S3TnlnvtEccyRIW7FQ3RFDX84oP5lJ0FvWn2X5Mr/7sg/0pAp5nS5nvE93XPuw==@vger.kernel.org
X-Received: by 2002:a05:6102:2acc:b0:520:a44f:3ddf with SMTP id
 ada2fe7eead31-5d7dd5a3793mr5929967137.10.1761217385274; Thu, 23 Oct 2025
 04:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com>
 <20251007133657.390523-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXF14x68Wk5YdOBS2D2N6LtnQjfGzrsMdSJegX-gc3faQ@mail.gmail.com> <6c69d2a2-5dfe-450f-8a39-2ef6e7a6dbea@tuxon.dev>
In-Reply-To: <6c69d2a2-5dfe-450f-8a39-2ef6e7a6dbea@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 13:02:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLiN0kUVJtdEYVnsmnCEbN4hSs5KEhMXJhf7p29xv=0Q@mail.gmail.com>
X-Gm-Features: AWmQ_bm3rJeUf0KSNhlRfvLpl1M_xWwhhcqbJogOZCts4Aa1eBeKq-NYF1bmLWY
Message-ID: <CAMuHMdXLiN0kUVJtdEYVnsmnCEbN4hSs5KEhMXJhf7p29xv=0Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 23 Oct 2025 at 12:54, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 10/23/25 11:00, Geert Uytterhoeven wrote:
> > On Tue, 7 Oct 2025 at 15:37, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> >> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> >> only as a root complex, with a single-lane (x1) configuration. The
> >> controller includes Type 1 configuration registers, as well as IP
> >> specific registers (called AXI registers) required for various adjustments.
> >>
> >> Hardware manual can be downloaded from the address in the "Link" section.
> >> The following steps should be followed to access the manual:
> >> 1/ Click the "User Manual" button
> >> 2/ Click "Confirm"; this will start downloading an archive
> >> 3/ Open the downloaded archive
> >> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
> >> 5/ Open the file r01uh1014ej*-rzg3s.pdf
> >>
> >> Link: https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12
> >> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> >
> >> +static void rzg3s_pcie_irq_compose_msi_msg(struct irq_data *data,
> >> +                                          struct msi_msg *msg)
> >> +{
> >> +       struct rzg3s_pcie_msi *msi = irq_data_get_irq_chip_data(data);
> >> +       struct rzg3s_pcie_host *host = rzg3s_msi_to_host(msi);
> >> +       u32 drop_mask = RZG3S_PCI_MSIRCVWADRL_ENA |
> >> +                       RZG3S_PCI_MSIRCVWADRL_MSG_DATA_ENA;
> >
> > This should include bit 2 (which is hardwired to zero (for now)),
> > so I think you better add
> >
> >     #define RZG3S_PCI_MSIRCVWADRL_ADDR  GENMASK(31, 3)
> >
> >> +       u32 lo, hi;
> >> +
> >> +       /*
> >> +        * Enable and msg data enable bits are part of the address lo. Drop
> >> +        * them.
> >> +        */
> >> +       lo = readl_relaxed(host->axi + RZG3S_PCI_MSIRCVWADRL) & ~drop_mask;
> >
> > ... and use FIELD_GET() with the new definition here.
>
> Bits 31..3 of RZG3S_PCI_MSIRCVWADRL contains only bits 31..3 of the MSI
> receive window address low, AFAIU. Using FIELD_GET() for bits 31..3 on the
> value read from RZG3S_PCI_MSIRCVWADRL and passing this value to
> msg->address_lo will lead to an NVMe device not working.

Oops, yes you are right, I went a bit too far with the FIELD_GET()
suggestion. But replacing drop_mask by RZG3S_PCI_MSIRCVWADRL_ADDR
would still be worthwhile, IMHO.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

