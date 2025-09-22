Return-Path: <linux-renesas-soc+bounces-22130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2750AB8FF0A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 12:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF3561738D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 10:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B43283CBE;
	Mon, 22 Sep 2025 10:10:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949BF2ED16C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 10:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535843; cv=none; b=NUCcuk4KgEmKThICYLj5on64y5Bx50SDVQce5Y33rrxvahIYWNH1uFlD88yh2I/RMVuMx/XKVevpFpslaheapqm6sNnyM+ufgRutp0cn936WS9iwZpYAN/oKob0mJ8NVueq0/EFPOQYyLr5i7QgAGcQ9FmP+htmGabwGPX7tPns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535843; c=relaxed/simple;
	bh=FspzrHLrky+4lkt2kF+UuolK3snNnMgs7joBzDT6NC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+QjK8oRnzu46KXVZwwgToQKN0R7pDI9YsavxI96UCwUvmQbfemHobyAs7zWXy4ztmsWrbqneGo1TzrkcDyw3+kWAmGyklwPGOX0ayOUBOq0PsTNEkgbsvV9w1qQzrzbUZZ0ZNCMd+PqtzqQIvN+Y6f6npzr4BBgA18lDgF2EGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89019079fbeso806368241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 03:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535840; x=1759140640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN/2AFdJRlCaGBjH8pLDCVNNR5NE43uZY5yxD6ZVYpI=;
        b=ekVZxvOg/rpbJRwA4WmKjPV1wONufDAeyN2u3JEv4Wzo3+DOEGjynkZMssUFCIyRYW
         lWRxQSBNfqCq8Bj4ObrimEHdLg6Br2fd4E7tZsBj9wPhbFjZK7JJqq8z8TqBwR6BUiDm
         43MWIsDcWQb8f2mHT129nAiX7liMvgNec7DMO8OfJyXqiNBMgrOvYf6gp90BP69mAJP/
         DIKxqCQbdSh4sdfxx536SyqT+RKMJQNLNWaiJ21DzNUi2LYp0vbNAfr3NTZ0w3dQAJ+p
         zw+107xaf/6CdWLhLUflTtBy97JY6v3NYCP/n042ygHeTopIIYz4/q2xGeLt3yJZ+i92
         YzpA==
X-Forwarded-Encrypted: i=1; AJvYcCVTqx5rgkzag8sNDY9LijIB9mJzpi/j8FYvLN95g++kq8CaqkzgGy4QjrnlvBMTaCVeCWkQQNehAOy/69Jo4xlogw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaxr78bOPOeiW2jMcf/xaHnqlgsMKbmM3o/FT4L0fxfTW6jjJC
	5w68DUbVaW/70Co/WA40Tf5+dfWU/7x+Q3URuOvQwE2Z79XMBBA7md1UoeV+DuMU
X-Gm-Gg: ASbGncv09dhC8nXSZapCWbI8LkjH+pA47B9loTIRVz0GHgm9ICoYPvzSpMI5z9wGtdi
	8qTLB3I2Wetd++anP7X/hjyLfseelQp1p0YI8FGh7e49etzczoYFjQFy8V02zi9+3nISNiwV8qt
	eE2ijioX0hyBoe2KC9kmgY3GaHjyRh7t3Pz5tfyyPeHp2P93p9nCLVBSRZZ8gItcp1jRGyg0INZ
	SOMkAJSOYRjp1HIdcOCqUbmWm2KITcyqIl10glJOuMn4qTNyK5K9jGdDC5a5xjtP7cFJWIaakom
	I12gRcihGps3vy3tXfRRub6jMstQqeTG967sLoE3ax73E0rt9eBq7SHpEKMsYI5y59QTPvUdR6o
	IohsXHnALwcleryxdN9g4XnE4X7mSBGw/VjjE0U822pWbERLb1JVPWCmSjcj2
X-Google-Smtp-Source: AGHT+IHxQtTI7/UcOgYywxwx2MrjQVPzD4umtXV0+8vg8Swi24mmxLZjebkdpeds4hYD4la9Us8n9Q==
X-Received: by 2002:a05:6102:26cf:b0:518:9c6a:2c01 with SMTP id ada2fe7eead31-588ed4243efmr2739147137.28.1758535839871;
        Mon, 22 Sep 2025 03:10:39 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-59c0c715bdbsm1437973137.8.2025.09.22.03.10.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 03:10:38 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89019079fbeso806355241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 03:10:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVB9lP1D3eldB8JrPwWYbugTfGr7feUcO8iqcOnMTsFzKC8fm2kve1Daa5Wvs429xOKrauHT8D38uycBcPRFIclFg==@vger.kernel.org
X-Received: by 2002:a05:6102:ccf:b0:5a3:acb7:55c7 with SMTP id
 ada2fe7eead31-5a3acb762dcmr223298137.18.1758535838265; Mon, 22 Sep 2025
 03:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915235910.47768-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXAK6EhxPoNoqwqWSjGtwM24gL4qjSf6_n+NMCcpDf1HA@mail.gmail.com>
 <6fdc7d1e-8eaa-4244-a6b4-4a07e719dd73@mailbox.org> <CAMuHMdVrw1Mr_hKvgve03DQwvpqSPNaN5XUnYRJPXMeX1wvv0A@mail.gmail.com>
 <de4e4003-214f-4260-854c-d15efc81bb74@mailbox.org> <CAMuHMdVgFNb-3TgL7a+AJMYE6tqOiMpGYFDhXnQoz9R5gLz=-A@mail.gmail.com>
 <12b54030-5505-416b-9e4e-2338263c5c7a@mailbox.org>
In-Reply-To: <12b54030-5505-416b-9e4e-2338263c5c7a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 12:10:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUnKqHQpaTkiuYUmR1kQ2GwVvj0SeML-9x3Rc+srtXW+w@mail.gmail.com>
X-Gm-Features: AS18NWBaRS0smuwIc1ctMzRWIC0440X1MQ0sF3CnTNk-8MKFaF6GpgdLzrsfJnQ
Message-ID: <CAMuHMdUnKqHQpaTkiuYUmR1kQ2GwVvj0SeML-9x3Rc+srtXW+w@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Fix inverted break condition in PHY initialization
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 18 Sept 2025 at 05:16, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/17/25 9:23 AM, Geert Uytterhoeven wrote:
> > On Tue, 16 Sept 2025 at 18:31, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 9/16/25 3:57 PM, Geert Uytterhoeven wrote:
> >>> On Tue, 16 Sept 2025 at 15:39, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >>>> On 9/16/25 11:59 AM, Geert Uytterhoeven wrote:
> >>>>> On Tue, 16 Sept 2025 at 01:59, Marek Vasut
> >>>>> <marek.vasut+renesas@mailbox.org> wrote:
> >>>>>> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 4581
> >>>>>> Figure 104.3b Initial Setting of PCIEC(example), third quarter of the figure
> >>>>>> indicates that register 0xf8 should be polled until bit 18 becomes set to 1.
> >>>>>>
> >>>>>> Register 0xf8 bit 18 is 0 immediately after write to PCIERSTCTRL1 and is set
> >>>>>> to 1 in less than 1 ms afterward. The current readl_poll_timeout() break
> >>>>>> condition is inverted and returns when register 0xf8 bit 18 is set to 0,
> >>>>>> which in most cases means immediately. In case CONFIG_DEBUG_LOCK_ALLOC=y ,
> >>>>>> the timing changes just enough for the first readl_poll_timeout() poll to
> >>>>>> already read register 0xf8 bit 18 as 1 and afterward never read register
> >>>>>> 0xf8 bit 18 as 0, which leads to timeout and failure to start the PCIe
> >>>>>> controller.
> >>>>>>
> >>>>>> Fix this by inverting the poll condition to match the reference manual
> >>>>>> initialization sequence.
> >>>>>>
> >>>>>> Fixes: faf5a975ee3b ("PCI: rcar-gen4: Add support for R-Car V4H")
> >>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>>>>
> >>>>> Thanks for your patch!
> >>>>>
> >>>>>> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >>>>>> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >>>>>> @@ -711,7 +711,7 @@ static int rcar_gen4_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable
> >>>>>>            val &= ~APP_HOLD_PHY_RST;
> >>>>>>            writel(val, rcar->base + PCIERSTCTRL1);
> >>>>>>
> >>>>>> -       ret = readl_poll_timeout(rcar->phy_base + 0x0f8, val, !(val & BIT(18)), 100, 10000);
> >>>>>> +       ret = readl_poll_timeout(rcar->phy_base + 0x0f8, val, val & BIT(18), 100, 10000);
> >>>>>>            if (ret < 0)
> >>>>>>                    return ret;
> >>>>>>
> >>>>>
> >>>>> This change looks correct, and fixes the timeout seen on White Hawk
> >>>>> with CONFIG_DEBUG_LOCK_ALLOC=y.
> >>>>> However, it causes a crash when CONFIG_DEBUG_LOCK_ALLOC=n:
> >>>>>
> >>>>>        SError Interrupt on CPU0, code 0x00000000be000011 -- SError
> >>>>
> >>>> ...
> >>>>
> >>>>>         el1h_64_error_handler+0x2c/0x40
> >>>>>         el1h_64_error+0x70/0x74
> >>>>>         dw_pcie_read+0x20/0x74 (P)
> >>>>>         rcar_gen4_pcie_additional_common_init+0x1c/0x6c
> >>>>
> >>>> SError in rcar_gen4_pcie_additional_common_init , this is unrelated to
> >>>> this fix.
> >>>>
> >>>> Does the following patch make this SError go away ?
> >>>
> >>>> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >>>> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >>>> @@ -204,6 +204,8 @@ static int rcar_gen4_pcie_common_init(struct
> >>>> rcar_gen4_pcie *rcar)
> >>>>            if (ret)
> >>>>                    goto err_unprepare;
> >>>>
> >>>> +mdelay(1);
> >>>> +
> >>>>            if (rcar->drvdata->additional_common_init)
> >>>>                    rcar->drvdata->additional_common_init(rcar);
> >>>>
> >>>
> >>> Yes it does, thanks!
> >> So with this one extra mdelay(1), the PCIe is fully good on your side,
> >> or is there still anything weird/flaky/malfunctioning ?
> >>
> >> If you could give me a RB/TB on this fix, it would be nice.
> >
> > You can have my
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > but only for the combination of both (A) "[PATCH] PCI: rcar-gen4: Fix
> > inverted break condition in PHY initialization" and (B) the addition
> > of the mdelay.
> >
> >    - (A) without (B) causes an SError if CONFIG_DEBUG_LOCK_ALLOC=n,
> >
> >    - (B) without (A) causes a timeout if CONFIG_DEBUG_LOCK_ALLOC=n
> >      (i.e. same behavior as with CONFIG_DEBUG_LOCK_ALLOC=y).
> I have instead posted what I think are proper fixes for that SError:
>
> PCI: rcar-gen4: Add missing 1ms delay after PWR reset assertion
> https://patchwork.kernel.org/project/linux-pci/patch/20250918030058.330960-1-marek.vasut+renesas@mailbox.org/

I used v3 instead.
While that patch seems to fix the SError after a hard reset (hardware
reset), it is not sufficient after a soft reset (typing "reboot").

> clk: renesas: cpg-mssr: Add missing 1ms delay into reset toggle callback
> https://patchwork.kernel.org/project/linux-clk/patch/20250918030552.331389-1-marek.vasut+renesas@mailbox.org/

This does not fix the SError, as expected (pcie-rcar-gen4.c does not
call reset_control_reset(), but reset_control_{,de}assert()).

> clk: renesas: cpg-mssr: Read back reset registers to assure values latched
> https://patchwork.kernel.org/project/linux-clk/patch/20250918030723.331634-1-marek.vasut+renesas@mailbox.org/

I used v2 instead, which seems to fix the SError.

> I hope those help. Can you please let me know if they do help ?

See above.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

