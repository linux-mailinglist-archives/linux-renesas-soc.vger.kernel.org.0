Return-Path: <linux-renesas-soc+bounces-21928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE40B59862
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEDCB3A6170
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 13:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C7E2F746D;
	Tue, 16 Sep 2025 13:58:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DBBFC1D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758031093; cv=none; b=pFauD7Kg4Hmfe7LnyEJnvcEd0OsikjbaEsY3l4jQmh223OGQ4gwIMM2obhfvh2JBMp4s7unWAo89rgbbngm+N/Y2bffQ7n0OzI+u5mJUJ4EjaRn7pSwTVhDTkhQp5Sgf609L2T4mST3TToJbZVGCIUugaLx7WFGqqfFNWtdm6EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758031093; c=relaxed/simple;
	bh=TO0GbE2bVo/GWTnDGeqYGpPKC6A5SvXW4spJ1hjM68o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIbDEtd32Q6SM9IO0xD3c2Tx2nfK6Olj6L5F4Vn4ozEIGIGsY0nffkBZCtLhtJQRprBbNKlZJG0v0eun5uzBekc+Hfnw9fHaKBL+O5hX/39W5LYHrBM1z/C6ZSSS4Uy5uWLbttGEHFPVafQuEd4BEXlx8/kCvOcEoYOCKN8p8WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-54488e51c37so2019943e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 06:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758031090; x=1758635890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=032VqsLJWz3CTwfvFjs4mzlF8D/mUS+pHD6KNITdGeI=;
        b=g3rJs8+2Lk/16hk/JQ6w5Eh4LYC5MyO4A9HoOzDgSKoBMdM4DZCdDuyT0GoMykC7tl
         oHsfXUA3YLqwDOC0ZN/+CghSwc4T5zoFge2PL4tB+6UWZwE3VoxieciSilyrbwD0jUdV
         U0ng7gyQymI49YUjftVePNRRqncxvoJPA/txt1GcZ6PhkOKF8+BP5cc4/uffREh02kF+
         +k/tGhW8kxokxEuRz0Uee40MWsswnPzZ4uUJVNS9EpAovc36+GMvuMMz2qnqyYgsFp2p
         NCihjC0phW5z92Uj3ucsya41qZTNfmhQQ29wWs0Xz1iuo935/XuVA7p6pCt9QcU066MY
         0hZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN9ziVojg8LG3C4GlcHYzT16V+9pM7SNISR4pnrVtQqePcP3IUpmQpmof1W3d70npASztmijaaQhzvi+wDTOHUrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ7fv7O3X8CEfJhimHAH17gX7+tkED932LOVLreeNphOKgSZMw
	v8+SehjRcJlfAhZ8oAyQ1LY/WcfLXeM1JbS/ZYw1ZDgl7DoKogog2aP9LvE2S0LK
X-Gm-Gg: ASbGnctp+XP53ppcFsxemGW7mxTxKhxBAW1zAzQg5EyXZV74jvMQj/9uHqb8YvuWCLA
	JJOmM9gGBQQlri45XYyE0/VZkqumm7+2e/+QFXhwSA9ZEteIlpI2zQOObvKyEqrfbBZXoA5EigN
	OpwFz1cu6t/HUowbxooGjZ040tN2DUmnPe/VfNuGu5Z4oTmiKMHw29G4PYvvQKSDG9DXA2Dl5Wk
	82h5t3s5PHkzPfbuJDqOCV18baGDxP4d4X5d6WMKe7SD3XokAIFsQB2R5A8SpSma9aRrlnF0jOW
	0W5sKlEKlaBJWY3f7WGHp0NaJ3DkXbSjeZDOm3uDO8Be5GlMNn49P88qQYdoWRPwWj5hD8jMp4p
	gJmEo39vK4NQb/Z25VQSyWPELRI5C7rte7k4vUULh+L8L143r7B71JaT7J2MRfc/W
X-Google-Smtp-Source: AGHT+IG5dpzgy5AUX7a0tiVVjq+mwZ5irFic9sqMPhaF7UolmbpR7YDbOpHS5VsIsUzPWIvJDyuBpQ==
X-Received: by 2002:a05:6122:1acd:b0:549:f04a:6ea8 with SMTP id 71dfb90a1353d-54a16c8a782mr4468800e0c.9.1758031089968;
        Tue, 16 Sep 2025 06:58:09 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d1d91casm2785189e0c.8.2025.09.16.06.58.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 06:58:09 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-544c598b9a4so1575364e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 06:58:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUs/2GRNZEvvrbPYFwqVtTfnOnj8FJlYZIwxS1w0vOt4lK/bhBpZhaiz6AcTCRswPZMnstpXjm3qCO/dfy2w/eMMA==@vger.kernel.org
X-Received: by 2002:a67:e8d9:0:b0:55b:dee9:da2d with SMTP id
 ada2fe7eead31-55bdee9e269mr2974985137.11.1758031088450; Tue, 16 Sep 2025
 06:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915235910.47768-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXAK6EhxPoNoqwqWSjGtwM24gL4qjSf6_n+NMCcpDf1HA@mail.gmail.com> <6fdc7d1e-8eaa-4244-a6b4-4a07e719dd73@mailbox.org>
In-Reply-To: <6fdc7d1e-8eaa-4244-a6b4-4a07e719dd73@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 15:57:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrw1Mr_hKvgve03DQwvpqSPNaN5XUnYRJPXMeX1wvv0A@mail.gmail.com>
X-Gm-Features: AS18NWB5CxLNgKbSLJ4uVdU9riSMIZHCgBvx_MB94zGl_MU2qT5j_1S-E1X9r3Y
Message-ID: <CAMuHMdVrw1Mr_hKvgve03DQwvpqSPNaN5XUnYRJPXMeX1wvv0A@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Fix inverted break condition in PHY initialization
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 16 Sept 2025 at 15:39, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/16/25 11:59 AM, Geert Uytterhoeven wrote:
> > On Tue, 16 Sept 2025 at 01:59, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 4581
> >> Figure 104.3b Initial Setting of PCIEC(example), third quarter of the figure
> >> indicates that register 0xf8 should be polled until bit 18 becomes set to 1.
> >>
> >> Register 0xf8 bit 18 is 0 immediately after write to PCIERSTCTRL1 and is set
> >> to 1 in less than 1 ms afterward. The current readl_poll_timeout() break
> >> condition is inverted and returns when register 0xf8 bit 18 is set to 0,
> >> which in most cases means immediately. In case CONFIG_DEBUG_LOCK_ALLOC=y ,
> >> the timing changes just enough for the first readl_poll_timeout() poll to
> >> already read register 0xf8 bit 18 as 1 and afterward never read register
> >> 0xf8 bit 18 as 0, which leads to timeout and failure to start the PCIe
> >> controller.
> >>
> >> Fix this by inverting the poll condition to match the reference manual
> >> initialization sequence.
> >>
> >> Fixes: faf5a975ee3b ("PCI: rcar-gen4: Add support for R-Car V4H")
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >> @@ -711,7 +711,7 @@ static int rcar_gen4_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable
> >>          val &= ~APP_HOLD_PHY_RST;
> >>          writel(val, rcar->base + PCIERSTCTRL1);
> >>
> >> -       ret = readl_poll_timeout(rcar->phy_base + 0x0f8, val, !(val & BIT(18)), 100, 10000);
> >> +       ret = readl_poll_timeout(rcar->phy_base + 0x0f8, val, val & BIT(18), 100, 10000);
> >>          if (ret < 0)
> >>                  return ret;
> >>
> >
> > This change looks correct, and fixes the timeout seen on White Hawk
> > with CONFIG_DEBUG_LOCK_ALLOC=y.
> > However, it causes a crash when CONFIG_DEBUG_LOCK_ALLOC=n:
> >
> >      SError Interrupt on CPU0, code 0x00000000be000011 -- SError
>
> ...
>
> >       el1h_64_error_handler+0x2c/0x40
> >       el1h_64_error+0x70/0x74
> >       dw_pcie_read+0x20/0x74 (P)
> >       rcar_gen4_pcie_additional_common_init+0x1c/0x6c
>
> SError in rcar_gen4_pcie_additional_common_init , this is unrelated to
> this fix.
>
> Does the following patch make this SError go away ?

> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -204,6 +204,8 @@ static int rcar_gen4_pcie_common_init(struct
> rcar_gen4_pcie *rcar)
>          if (ret)
>                  goto err_unprepare;
>
> +mdelay(1);
> +
>          if (rcar->drvdata->additional_common_init)
>                  rcar->drvdata->additional_common_init(rcar);
>

Yes it does, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

