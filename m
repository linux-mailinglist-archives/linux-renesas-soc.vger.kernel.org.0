Return-Path: <linux-renesas-soc+bounces-21964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D742DB7E885
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CEE61BC864A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 08:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6825A304BA0;
	Wed, 17 Sep 2025 08:00:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8254329D272
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 08:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096047; cv=none; b=NrMTUmDoW4EAdw0Gr7PoHj2aLXBDwkkKDMCg1qXr7Ni/MyQr+UIYVrDNS08+v4rQfjehcUVu+GuJjTsEaes4EVyOZSTqfoFS3A0fajoxDHdXSHaP1oMUNX2pGlgoddmAEAYSTDoYnYY6M4GlEXGJ5lYli+o3SIdzXxfaMFUtwJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096047; c=relaxed/simple;
	bh=dNdNpY8vxZqBKUJnRMC8RJRgX0+3Qjhu6NrnHi+SVxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cw8dgM0iwSjKMbcgMxXorTfjytxxFiQdYuXUPXTDqKr9MQFg7A0QtLlhkYTuj6jd+H5Y8G1IzSiSNrUTpxQPUSQKpcvBe5vknecTJ+SIX+eOEGLDsSzNhmunTMZSH0Ti00FKezeeRu3W0DC1hpXq+TfY8dNs2G6JmShmf2dqpas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07c081660aso928476966b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 01:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096043; x=1758700843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFmJDbGVxEflnnf5D9PC38BFy/blsYbi7EpR0gy5+kE=;
        b=Fk1zDQ8EzEbnbazSkJ/dvzpUaJpGpTfLMl/Vpqfp5oz74bsNGiWP7A/lUoI22X3naz
         QvkChBmOFq9WxqBJOwsbswD3zLkGtzjwQexEd8Hk/PWF2SXSQYM72matxqsITzYRYp2x
         lb+EKXm20NG8NJW6NbSttwmXkDAOe5OQsOH/KABtopcQL3rw4QvUydrQ91VkPpJCc6Hr
         zgwpyS/dbyKRDPY3FqPb8KEOoidrGeTCk33+XDvD/ZtzXyS38Cm6D4EyyQYKIIC5XyvC
         ljk5kmmyi9CZMwuPY4EuYMW7fDN9j9KOuKhFjb8PKp9nBv8kfzDTf67ItyY64IK8DEY8
         RSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW78OYaJz3kJEfZJt8sSOr8AgwhG5TTlCBM1a+5ErIJkjvfZCGMUaUj8w3rWBArNKpbPzRgqM4lzt9Gvuuujx8DEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqXZZO8GdOuekz4up2xAEvM6AUtIVM/w8pVBsgI7GT3FkrnaNV
	S6hEycRyIqW3xLkVJKIGE79yJxI6XBeIrXuLS8h14EN797dOFDboIT3r+UZKmLtVV/8=
X-Gm-Gg: ASbGncvQwtEyRebx0RlJYWlBjEIDCU6143tHuEIc1AjNZcM2P+g3YDaNtRJshaQ4DrY
	QY9NEB5ti5mMfXtmZFvX/+DhQ45hsJLN/hBqxFYhDXTHnwQ1XxYbugL3k9aQKYfEvsv8l7UAdQs
	v5HcgtEyUPWERL7OGrWV4F6vsTvI4dSDkZerB7bQlmImdTRfNCtXFRmzBI1UFMMZ+EkKP6wuDMU
	qsT+U1W8gTExrpZG8XKZ0n8141f+REUzK0U0+n2Jsg1zDBk2UPQa6lswMg0OiM9k46GbMMkYK31
	gacFpb+iQbobBDrOwBzFI9LuPRj6uP4XNsjYkP4VSUBWRwQc74yHnzSWontQmXQRMD9aSble09+
	5LlUPpYVkW6hiXuBA7VasyVK1C2zqLZrNLsHBaEJzgcjTPFcMaLApDORxAEbASuRcNdSk2ks=
X-Google-Smtp-Source: AGHT+IHZirsUR/GcwKxOEriFEh95UJVnRI31dzN8YM/eSKr/9GUXlPCNbb57UJTOSa+UoPHcLY7RnA==
X-Received: by 2002:a17:907:9712:b0:afe:8761:e77a with SMTP id a640c23a62f3a-b1bb73a699fmr134063066b.19.1758096042646;
        Wed, 17 Sep 2025 01:00:42 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f0abed88dsm8655812a12.26.2025.09.17.01.00.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 01:00:37 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b07c28f390eso868346866b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 01:00:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQurECeojC29Lfo3Tu9ULijS0pBaX1o9NITAK94qVmsD0u/vy2yzttRjBXqt+Ts6gbVSCocZAz9q+ofye7oENIDQ==@vger.kernel.org
X-Received: by 2002:a17:907:da4:b0:b07:dad7:e4cd with SMTP id
 a640c23a62f3a-b1bbebb7bb3mr131885566b.53.1758096036562; Wed, 17 Sep 2025
 01:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916181558.GA1810654@bhelgaas> <643c9b19-dda4-43c5-bb6d-aa0705053d43@mailbox.org>
In-Reply-To: <643c9b19-dda4-43c5-bb6d-aa0705053d43@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Sep 2025 10:00:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXh0rxpLXW+3yCP7hZNwacVcuc3Wp5t8CiDJ2HE=P+OiQ@mail.gmail.com>
X-Gm-Features: AS18NWCjLH4VUp9iqUWGutNCZKfyTLEzHKClaNviOMXmU6lZNI3kUP8XXzhjwtE
Message-ID: <CAMuHMdXh0rxpLXW+3yCP7hZNwacVcuc3Wp5t8CiDJ2HE=P+OiQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Fix inverted break condition in PHY initialization
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 17 Sept 2025 at 00:09, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/16/25 8:15 PM, Bjorn Helgaas wrote:
> > On Tue, Sep 16, 2025 at 07:39:07PM +0200, Marek Vasut wrote:
> >> On 9/16/25 7:13 PM, Bjorn Helgaas wrote:
> >>> On Tue, Sep 16, 2025 at 06:31:31PM +0200, Marek Vasut wrote:
> >>>> On 9/16/25 3:57 PM, Geert Uytterhoeven wrote:
> >>>>> On Tue, 16 Sept 2025 at 15:39, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >>>>>> On 9/16/25 11:59 AM, Geert Uytterhoeven wrote:
> >>>
> >>>>>>> This change looks correct, and fixes the timeout seen on White Hawk
> >>>>>>> with CONFIG_DEBUG_LOCK_ALLOC=y.
> >>>>>>> However, it causes a crash when CONFIG_DEBUG_LOCK_ALLOC=n:
> >>>>>>>
> >>>>>>>         SError Interrupt on CPU0, code 0x00000000be000011 -- SError
> >>>>>>
> >>>>>> ...
> >>>>>>
> >>>>>>>          el1h_64_error_handler+0x2c/0x40
> >>>>>>>          el1h_64_error+0x70/0x74
> >>>>>>>          dw_pcie_read+0x20/0x74 (P)
> >>>>>>>          rcar_gen4_pcie_additional_common_init+0x1c/0x6c
> >>>>>>
> >>>>>> SError in rcar_gen4_pcie_additional_common_init , this is unrelated to
> >>>>>> this fix.
> >>>>>>
> >>>>>> Does the following patch make this SError go away ?
> >>>>>
> >>>>>> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >>>>>> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >>>>>> @@ -204,6 +204,8 @@ static int rcar_gen4_pcie_common_init(struct
> >>>>>> rcar_gen4_pcie *rcar)
> >>>>>>             if (ret)
> >>>>>>                     goto err_unprepare;
> >>>>>>
> >>>>>> +mdelay(1);
> >>>>>> +
> >>>>>>             if (rcar->drvdata->additional_common_init)
> >>>>>>                     rcar->drvdata->additional_common_init(rcar);
> >>>>>>
> >>>>>
> >>>>> Yes it does, thanks!
> >>>>
> >>>> So with this one extra mdelay(1), the PCIe is fully good on your side, or is
> >>>> there still anything weird/flaky/malfunctioning ?
> >>>
> >>> Do we have a theory about why this delay is needed?  I assume it's
> >>> something specific to the rcar hardware (not something required by the
> >>> PCIe base spec)?

> > Yeah, if it's some rcar-specific thing, I don't see a better
> > alternative.
> I have one more hypothesis.
>
> I noticed in V4H RM rev.1.30 page 798 that CPG (reset) and PCIe are on
> different busses. From CA76, the CPG reset is reachable via "CCI->Slave
> Access BUS->CPG" and PCIe is reachable via "CCI->Slave Access BUS->HSC".
>
> I wonder if a sequence like this:
> - writel(CPG un-reset register)
> - readl(PCI DBI register)
> can, due to bus behavior, lead to readl(PCI DBI register) taking effect
> on the PCIe IP _before_ the writel(CPG un-reset register) takes effect
> on the CPG IP, which trigger the SError (coming from PCIe IP).
>
> Or is it guaranteed that writel(some IP) followed by readl(another IP)
> are strictly ordered in this manner even on the IP end at which they
> arrive, even if the two IPs are on different busses ? Please pardon my
> ignorance.
>
> Does the attached diff also help Geert with the SError ?
>
> Same diff is also inline below:

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -688,12 +688,14 @@ static int cpg_mssr_reset(struct
> reset_controller_dev *rcdev,
>
>         /* Reset module */
>         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
>
>         /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
>         udelay(35);
>
>         /* Release module from reset state */
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_clear_regs[reg]);
>
>         return 0;
>   }
> @@ -708,6 +710,7 @@ static int cpg_mssr_assert(struct
> reset_controller_dev *rcdev, unsigned long id)
>         dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
>
>         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
>         return 0;
>   }
>
> @@ -722,6 +725,7 @@ static int cpg_mssr_deassert(struct
> reset_controller_dev *rcdev,
>         dev_dbg(priv->dev, "deassert %u%02u\n", reg, bit);
>
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_clear_regs[reg]);
>         return 0;
>   }
>

Yes, reading the reset registers after writing works, too.

I just noticed the module reset operation in the R-Car V4H Hardware
User's Manual has changed from R-Car Gen2/Gen3, and is now more complex,
with three different reset types, depending on the module to be reset
(see Section 9.3 "Operation" subsection (2) "Software Reset").
The most striking difference is that there is no more mention of
a single delay of 1 RCLK cycle (cfr. the udelay(35) above), but of
much longer delays of 1 ms.

As drivers/pci/controller/dwc/pcie-rcar-gen4.c does not call the
combined reset_control_reset() , but uses separate
reset_control_assert() and reset_control_deassert() calls, the PCIe
driver itself is responsible for enforcing this 1 ms delay.
Which is exactly what your introduction of mdelay(1) (just after the
out-of-context call to reset_control_deassert()) does, so I believe
we're all set?

For enhance reliability, I would also add such a delay after the
(conditional) call to reset_control_assert(), like (whitespace-damaged):

--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -184,8 +184,10 @@ static int rcar_gen4_pcie_common_init(struct
rcar_gen4_pcie *rcar)
                return ret;
        }

-       if (!reset_control_status(dw->core_rsts[DW_PCIE_PWR_RST].rstc))
+       if (!reset_control_status(dw->core_rsts[DW_PCIE_PWR_RST].rstc)) {
                reset_control_assert(dw->core_rsts[DW_PCIE_PWR_RST].rstc);
+               mdelay(1);
+       }

        val = readl(rcar->base + PCIEMSR0);
        if (rcar->drvdata->mode == DW_PCIE_RC_TYPE) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

