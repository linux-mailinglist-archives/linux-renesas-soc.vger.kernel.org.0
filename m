Return-Path: <linux-renesas-soc+bounces-23524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AD4C01CC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB4543A1173
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1933126BB;
	Thu, 23 Oct 2025 14:28:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA031DFDA1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229731; cv=none; b=MucmsXwEbsvYntIZuJ1NKN8qlEml49/M5RQKM5ZdeMkTWhiO0+nUd9hWTNk01kO4TUhEut2Kc48WFJNzh5BBBspA61YxBZGal8iIs3y4zxrysHFGk7m8sf66wXEf1PfulroBiA55LJckTC1fd//1hy3F56sWnZxuOumxt+CkgXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229731; c=relaxed/simple;
	bh=TR7zlOg9lSlA9ANoIApwm25S9VrQTmkZ7BlIZp3yWzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=soapkRGw9VMjbBZqavIVqhZt/Lp0PohunEjjmIwOHLVsIz5nlaWb28tnpnVFcnFSa4z9DWI8b3RddcY0z7tTV8QPg5+efcfAnZ5FTYvQh3sYO09lCpW4+QEFMS8UczeKTwL1LfxA4fdPvWPCKGHg2LBOcjkIgwecNf9VwiHT/7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3c94deb7c7cso473685fac.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 07:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761229728; x=1761834528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUiJSOGezbV9/gcxRXe7vCcpv1VybDaME+fAsfjpYbw=;
        b=ixu2wKbfuVLH6bsXX5ZlFzuVdA4lChzvTvtetm/+9j12yYHhk2gntodnWgls1py60W
         78mrKAjXF8Vo/fgUyjU9sBkEyzQEbnDcz+yToztCRPXG111f5G+90S6K4WkYUQVywM/+
         K8+uJWCpsIFAx+x4JDa20UWAdqTTgDEjIya4gtbhJatxfIn25UYuziW7QS6ASjphM/6j
         T+XZqSBwff9wMr8fhyV2TKsvV2iiBB4eLIbruqJrA0SvllvSiPhJv9Zw6YVSuH+IpbBS
         nGELhrA1GN79VjYkhcsqLtdDeZxgElsLP95DsKuvYj3yUxko9syGik8yLbR9BALBlAtv
         /l2A==
X-Forwarded-Encrypted: i=1; AJvYcCU/iVeAiVNwi1ruvg1sYAZ0a/76HIHA8an1XC94RT90FqwMS2iQwZq890CBLpyMvtmUCFSJMAU9LenYOw98BAXH3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyewKlHxAKAp+VodXPjyThQRZqPNc38tHAQgdUMmyzg5KSoI168
	fi4dia8yIC6ks7GjRKXYqvsf7tcC9qKm0oNISj4lscRVslnCZxYBEVEbVIjj6YU9
X-Gm-Gg: ASbGncsidc1XwVAo1yQo8p7agDEbgOwEK61b4guL+1ltyerE8DfhTto+hpMhIiMqKvZ
	TAth1k44pYlg/DcncXwYGM69lpINTwtn7skP/slGWO4U+B/AQOxGg10ciAhHhDMFR8Trmq1p1pl
	+QgswJswqKVAHXeULNlyvul8AtrmJXHjPmGY4dNZxJPkeiOFp1Mrup27t2KOC268cpeLdiwpOzg
	Mn2xFmEd92iJiitJYjlg5oVzviSjZm9bGKuXyb9UsnsxrZhpNfIDLe5Y/mLqXFz1XObFOL0odYN
	NwhttcomyjuioFoBVcpzDLeQK1WWibLKOcnAbA1eFUtBOrjVND62jGNHEtCixrotfDgW4wj78A7
	JcI8aZRtEgsexOCIAMDb54GW5gI2W17R9T44jmoHACZ1AZHuU/p6F8jhDvvLNqDt2HxBqqPNP/r
	kPZAiwrxwMf67rDufsBmM2MiHf9CYJnnk+Oy9RrA==
X-Google-Smtp-Source: AGHT+IGzbULl6jSBf3ubyMbEai0qEQdbpPUmAubHYz5KpNB+3CyuB60NKax1Re4DsfqFTvQ8FXAqZg==
X-Received: by 2002:a05:6870:248b:b0:387:3c81:ee9 with SMTP id 586e51a60fabf-3c98d1460aamr10364807fac.51.1761229727990;
        Thu, 23 Oct 2025 07:28:47 -0700 (PDT)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3cdc4e0c78fsm738207fac.12.2025.10.23.07.28.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 07:28:47 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-36f13d00674so624012fac.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 07:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3la6w+gi28gJT0O4x6ww5jodwkEoZcTfjaZ+R4ljRCHrKQtqn3mxxUPugzmD7p1f6kE2jXQklaWE2cxs6J7St6w==@vger.kernel.org
X-Received: by 2002:a05:6102:5106:b0:5a8:4256:1f14 with SMTP id
 ada2fe7eead31-5d7dd5eb057mr7937173137.35.1761229283909; Thu, 23 Oct 2025
 07:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com>
 <20251007133657.390523-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXF14x68Wk5YdOBS2D2N6LtnQjfGzrsMdSJegX-gc3faQ@mail.gmail.com>
 <6c69d2a2-5dfe-450f-8a39-2ef6e7a6dbea@tuxon.dev> <CAMuHMdXLiN0kUVJtdEYVnsmnCEbN4hSs5KEhMXJhf7p29xv=0Q@mail.gmail.com>
 <f09bf940-3d45-49b1-8d7f-9c1a96acb187@tuxon.dev>
In-Reply-To: <f09bf940-3d45-49b1-8d7f-9c1a96acb187@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 16:21:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXx=5YQSmSsw1+3otw9S_Hf+Tv+N1Y1iHiU0OOTyz4bjw@mail.gmail.com>
X-Gm-Features: AWmQ_bntosPEVOR4ph6dmWLKdA_CbWSKXTDRFcmNnJAAp9ekneiOOs4jYqpQulM
Message-ID: <CAMuHMdXx=5YQSmSsw1+3otw9S_Hf+Tv+N1Y1iHiU0OOTyz4bjw@mail.gmail.com>
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

On Thu, 23 Oct 2025 at 16:13, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 10/23/25 14:02, Geert Uytterhoeven wrote:
> > On Thu, 23 Oct 2025 at 12:54, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> >> On 10/23/25 11:00, Geert Uytterhoeven wrote:
> >>> On Tue, 7 Oct 2025 at 15:37, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>
> >>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> >>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> >>>> only as a root complex, with a single-lane (x1) configuration. The
> >>>> controller includes Type 1 configuration registers, as well as IP
> >>>> specific registers (called AXI registers) required for various adjustments.
> >>>>
> >>>> Hardware manual can be downloaded from the address in the "Link" section.
> >>>> The following steps should be followed to access the manual:
> >>>> 1/ Click the "User Manual" button
> >>>> 2/ Click "Confirm"; this will start downloading an archive
> >>>> 3/ Open the downloaded archive
> >>>> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
> >>>> 5/ Open the file r01uh1014ej*-rzg3s.pdf
> >>>>
> >>>> Link: https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12
> >>>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- /dev/null
> >>>> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> >>>
> >>>> +static void rzg3s_pcie_irq_compose_msi_msg(struct irq_data *data,
> >>>> +                                          struct msi_msg *msg)
> >>>> +{
> >>>> +       struct rzg3s_pcie_msi *msi = irq_data_get_irq_chip_data(data);
> >>>> +       struct rzg3s_pcie_host *host = rzg3s_msi_to_host(msi);
> >>>> +       u32 drop_mask = RZG3S_PCI_MSIRCVWADRL_ENA |
> >>>> +                       RZG3S_PCI_MSIRCVWADRL_MSG_DATA_ENA;
> >>>
> >>> This should include bit 2 (which is hardwired to zero (for now)),
> >>> so I think you better add
> >>>
> >>>     #define RZG3S_PCI_MSIRCVWADRL_ADDR  GENMASK(31, 3)
> >>>
> >>>> +       u32 lo, hi;
> >>>> +
> >>>> +       /*
> >>>> +        * Enable and msg data enable bits are part of the address lo. Drop
> >>>> +        * them.
> >>>> +        */
> >>>> +       lo = readl_relaxed(host->axi + RZG3S_PCI_MSIRCVWADRL) & ~drop_mask;
> >>>
> >>> ... and use FIELD_GET() with the new definition here.
> >>
> >> Bits 31..3 of RZG3S_PCI_MSIRCVWADRL contains only bits 31..3 of the MSI
> >> receive window address low, AFAIU. Using FIELD_GET() for bits 31..3 on the
> >> value read from RZG3S_PCI_MSIRCVWADRL and passing this value to
> >> msg->address_lo will lead to an NVMe device not working.
> >
> > Oops, yes you are right, I went a bit too far with the FIELD_GET()
> > suggestion. But replacing drop_mask by RZG3S_PCI_MSIRCVWADRL_ADDR
> > would still be worthwhile, IMHO.
>
> OK, you mean updating it like:
>
> +#define RZG3S_PCI_MSIRCVWADRL_ADDR  GENMASK(31, 3)
>
> // ...
>
>
> -    lo = readl_relaxed(host->axi + RZG3S_PCI_MSIRCVWADRL) & ~drop_mask;
> +    lo = readl_relaxed(host->axi + RZG3S_PCI_MSIRCVWADRL) &
>           RZG3S_PCI_MSIRCVWADRL_ADDR;

Exactly.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

