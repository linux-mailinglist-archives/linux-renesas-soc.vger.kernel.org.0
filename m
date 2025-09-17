Return-Path: <linux-renesas-soc+bounces-21960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215E5B7CFC4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CC20482570
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 07:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5764F3016E1;
	Wed, 17 Sep 2025 07:24:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058051FCF41
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093852; cv=none; b=SrNd9UzzTBEgJ77Zu5uWxBAWbJZ9tZ4Ff3Q/M7KXDHNAJ37Tz3Mg3432ZY3ym0pCpElQKrtprbKtpHC+LIZVjZX32VMwdOS14eUgNTSgTx0AVFSlFq347CkKuU6p/CsVCFQjOEnDRh8iUHEp9x1zH3BuNmbPdlobNod1ApvAdBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093852; c=relaxed/simple;
	bh=gSIr//vFBbCP7VsNtBQYUWDrfts5hdPYP/mwsqA+BDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LulHvGCPHx9tUQyktDM/w5MxBduLULxO93CaLzQFBd3wMWIvJ/WUF2QHLjtoUXw1vOWNY5KF9n6kY2SYbivsmX71VGH9KtmUaeVLu3bVH0vrLVzIh0FsoVhex6vn6jWO30CNq+gvUHq3GxGTZktGKoVZ/AOlj1lUU5k5ub8EwUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8e11df47db5so368043241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 00:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758093848; x=1758698648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5bJfNEjZHn7Hd4XqFmM1lvKYI85588R6BvhThnobZg=;
        b=QTMac/VET0aXXwboj0dXJW1DjabCd+UORTrXAcpO6J0BzDkRbP4REkLoq0KtZiDS2C
         rfeIR3JDf8LtSK9+r1h7V1J6ZANMPjojW78pKYmevVgpzsGOPSqTyDyekUdaixZuTpBz
         KWS5Cce2d8kAft7x8lzdEzKgICcAP7O+DV7u1fruQHujvvSW9lWCxNXhOMct8u5K2ts3
         3OhXDwEcsr2itKt/muZrEMi9xzr6ThrgBxoiaw4EJjsx/z2d2LFYPya+F8f5L7G16jGz
         /DrTJAGrLPcb+6QMjkZmTY/Z1iAKt8OUyB7dxfSEX+haTPZuxOR0ZbrFiJkGC0G0THqr
         5D/A==
X-Forwarded-Encrypted: i=1; AJvYcCX9fZi/LZNpT+1gIho++/ppOAzWB+IqxGSOrXvvtvRoCwnefAd+UrMlaEhdMXcR07Y58yjycs2DL2gz8bU+OyNPQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqYocQW/1riXohqc/mWxTGLBY60ef75d/34xSXFIzzTeBXnyDT
	GClCjhp8Lfn84ne2Q1GFeHiHDfNd2lEn7VjOZaZgw0wSH3TPCWm5ATp7lbQmH2i8
X-Gm-Gg: ASbGncvKBUoybUNCahVd4g/DY5D1AkEvGQiP6mk+q2wg4ekbrAVRLI8coY8iqrVatVc
	h9xygH8ayE3rnuNSqFq9md0OigvzsvsOKnIldXOV/sBRSz+h1WGPEI/N1Wab+Ck/6g0skNJCX7U
	XAlevqkpk1VHAdhA33obSKftUXe6tO0yjFDVeNApsTTNQxMW87Wjh9WSh4Mt8liIyhcq7sMfz8Y
	63FdVStff1YHV+0A4dHo61j1GjLGfr325Wij+6eAvjXfKhMVYCNcMn3yoti7A0ojsKIZYP+WC2S
	N5n97EqskigII3Wh9NUrS2Cge6THGvoKbR9DDOEydytGt6Zd0UmVHk+xAAhJNpzeDIrSVbemnVG
	egt2MdUa+kf/cPry8xDpDFFdTKpHdq5wRmRSbb/69YQAY/pu/Vmet9derFUCG
X-Google-Smtp-Source: AGHT+IFm0UqnRor6ZUBjG1Mdl/3HkVLMJ3ExzJRq2ya4fPN2Fp/XCZLE/DOVBySlBe+uNoRc7jBzzQ==
X-Received: by 2002:a05:6102:5e85:b0:519:534a:6c20 with SMTP id ada2fe7eead31-56d6c15bd6bmr228384137.30.1758093848458;
        Wed, 17 Sep 2025 00:24:08 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-56f3652073fsm142833137.7.2025.09.17.00.24.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 00:24:08 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-51d14932f27so2691863137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 00:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEX0DTLhqMWnk2DWFM97PU4//HeuhcWtTf+xjAopvUGwHdgRfZhODdem41T2er6aA4tqc7zBSL+2tm6oVhBz1RbQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3e29:b0:520:dcb6:9414 with SMTP id
 ada2fe7eead31-56d51e8acd7mr260062137.12.1758093847387; Wed, 17 Sep 2025
 00:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915235910.47768-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXAK6EhxPoNoqwqWSjGtwM24gL4qjSf6_n+NMCcpDf1HA@mail.gmail.com>
 <6fdc7d1e-8eaa-4244-a6b4-4a07e719dd73@mailbox.org> <CAMuHMdVrw1Mr_hKvgve03DQwvpqSPNaN5XUnYRJPXMeX1wvv0A@mail.gmail.com>
 <de4e4003-214f-4260-854c-d15efc81bb74@mailbox.org>
In-Reply-To: <de4e4003-214f-4260-854c-d15efc81bb74@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Sep 2025 09:23:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgFNb-3TgL7a+AJMYE6tqOiMpGYFDhXnQoz9R5gLz=-A@mail.gmail.com>
X-Gm-Features: AS18NWD9FWwXNuZ8e2TTne-uyMKYU7DejOyulzyRRLHKeRSmgZ8fyS10I6VKByk
Message-ID: <CAMuHMdVgFNb-3TgL7a+AJMYE6tqOiMpGYFDhXnQoz9R5gLz=-A@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Fix inverted break condition in PHY initialization
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 16 Sept 2025 at 18:31, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/16/25 3:57 PM, Geert Uytterhoeven wrote:
> > On Tue, 16 Sept 2025 at 15:39, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 9/16/25 11:59 AM, Geert Uytterhoeven wrote:
> >>> On Tue, 16 Sept 2025 at 01:59, Marek Vasut
> >>> <marek.vasut+renesas@mailbox.org> wrote:
> >>>> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 4581
> >>>> Figure 104.3b Initial Setting of PCIEC(example), third quarter of the figure
> >>>> indicates that register 0xf8 should be polled until bit 18 becomes set to 1.
> >>>>
> >>>> Register 0xf8 bit 18 is 0 immediately after write to PCIERSTCTRL1 and is set
> >>>> to 1 in less than 1 ms afterward. The current readl_poll_timeout() break
> >>>> condition is inverted and returns when register 0xf8 bit 18 is set to 0,
> >>>> which in most cases means immediately. In case CONFIG_DEBUG_LOCK_ALLOC=y ,
> >>>> the timing changes just enough for the first readl_poll_timeout() poll to
> >>>> already read register 0xf8 bit 18 as 1 and afterward never read register
> >>>> 0xf8 bit 18 as 0, which leads to timeout and failure to start the PCIe
> >>>> controller.
> >>>>
> >>>> Fix this by inverting the poll condition to match the reference manual
> >>>> initialization sequence.
> >>>>
> >>>> Fixes: faf5a975ee3b ("PCI: rcar-gen4: Add support for R-Car V4H")
> >>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >>>> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >>>> @@ -711,7 +711,7 @@ static int rcar_gen4_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable
> >>>>           val &= ~APP_HOLD_PHY_RST;
> >>>>           writel(val, rcar->base + PCIERSTCTRL1);
> >>>>
> >>>> -       ret = readl_poll_timeout(rcar->phy_base + 0x0f8, val, !(val & BIT(18)), 100, 10000);
> >>>> +       ret = readl_poll_timeout(rcar->phy_base + 0x0f8, val, val & BIT(18), 100, 10000);
> >>>>           if (ret < 0)
> >>>>                   return ret;
> >>>>
> >>>
> >>> This change looks correct, and fixes the timeout seen on White Hawk
> >>> with CONFIG_DEBUG_LOCK_ALLOC=y.
> >>> However, it causes a crash when CONFIG_DEBUG_LOCK_ALLOC=n:
> >>>
> >>>       SError Interrupt on CPU0, code 0x00000000be000011 -- SError
> >>
> >> ...
> >>
> >>>        el1h_64_error_handler+0x2c/0x40
> >>>        el1h_64_error+0x70/0x74
> >>>        dw_pcie_read+0x20/0x74 (P)
> >>>        rcar_gen4_pcie_additional_common_init+0x1c/0x6c
> >>
> >> SError in rcar_gen4_pcie_additional_common_init , this is unrelated to
> >> this fix.
> >>
> >> Does the following patch make this SError go away ?
> >
> >> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >> @@ -204,6 +204,8 @@ static int rcar_gen4_pcie_common_init(struct
> >> rcar_gen4_pcie *rcar)
> >>           if (ret)
> >>                   goto err_unprepare;
> >>
> >> +mdelay(1);
> >> +
> >>           if (rcar->drvdata->additional_common_init)
> >>                   rcar->drvdata->additional_common_init(rcar);
> >>
> >
> > Yes it does, thanks!
> So with this one extra mdelay(1), the PCIe is fully good on your side,
> or is there still anything weird/flaky/malfunctioning ?
>
> If you could give me a RB/TB on this fix, it would be nice.

You can have my
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
but only for the combination of both (A) "[PATCH] PCI: rcar-gen4: Fix
inverted break condition in PHY initialization" and (B) the addition
of the mdelay.

  - (A) without (B) causes an SError if CONFIG_DEBUG_LOCK_ALLOC=n,

  - (B) without (A) causes a timeout if CONFIG_DEBUG_LOCK_ALLOC=n
    (i.e. same behavior as with CONFIG_DEBUG_LOCK_ALLOC=y).

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

