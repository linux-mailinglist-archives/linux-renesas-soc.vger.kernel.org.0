Return-Path: <linux-renesas-soc+bounces-22011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE07CB83B1E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 11:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F7C71C0727E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 09:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829292FF179;
	Thu, 18 Sep 2025 09:09:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5AE2F83DE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758186569; cv=none; b=Vww07dSu2NEV6ucpeVSv+2NXx62n9oDNK5MnLHZuLgd4dRmzv3z9XmuHPM4DFxoOTgIpgQCsNuA5F9r6AaGKdCZIqMU96cSmGIy5VBz3JR1DcTeJzzNtpL1vNpFNQD12h02d0NBxoWS/za2v99nKbwsucU/C9XbC41J1HDS3v3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758186569; c=relaxed/simple;
	bh=oA78+Hc2QsigW6eOAwWharYmhHBJia9T9YFq3+h/+4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfHJBqpoDpbd6dYyD6nPHdueJhD5og5YcOHgvXdsOnIZ7qWwL5+8R3KJFu4buMIZzeBypABrumxeUHQtfDWY7P8WhLSZC9FwKksWh5bez9pbtXnr2LEwc8zwEiPxdAegmntzZg7lVvcwxaZ4HcN0+PH3r05+LdPyKbHK1b2cNVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54a786ed57cso386724e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 02:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758186566; x=1758791366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUI3LMEUjKeaMro6VS1cwSeOA9TFMizFtGUUlwJmP8Y=;
        b=Q4KPmYcW1j9AhFei1HsrbH02yYDjEKT1yV0WxteL5FrjcVgUkJod/waX0xdMdU5ahe
         0QBwAqHRzKvqUpFvMCmy++z6Z8piUAsLjsiJrxMUoQQhSpQxiiDxCIn999EAYPdctRTN
         Rn1fGLBNJsXfpMOLedFyE1Hnk886CdRwtIgqoyGJpUWqzNdemgS8WejqH3G5EY7o0Xxy
         Ryh3Zc6CULYjwSKFiZwYANGfOH5P95oQOPlJo1IvrLgT7yBG31y7OGZl/kGomRDtwu72
         K1DhxshntLx0a0tA/vwa6SKU0H9OqyFuoMAt336dNI52K38hNCuqvdLz0WRBMmhY1vn9
         BXyg==
X-Forwarded-Encrypted: i=1; AJvYcCWTYBmp2EQNsKn1jDVJJYIxjRLHGt0o8XeDwk4XGwha8GzIKCPJfBvmLw7Ug4vVM/h5T0IKxiowAQO5EXBtGo1b6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIDxgHZjdB4aD3doO9Whva+E6hqe5NcthujIodaEB6ozpT+hLw
	rMlGQfbwG5oYnlEzBXvJu3nPSjwtluCMmHgWrZhymDp+YIbOqlqVbI2wVbb779S1
X-Gm-Gg: ASbGncukawbwEZ2T9NWbH4q8pw+9NyXF9UUkpHvAzTOW0ulCGvMH0y0muyw22WBaiJ+
	RWNWV0Cp0X0fA5iV/c+/x0Iq0tmQKpmEXafTptb/VB0eRg3RODrfVgUunDEwWsrrEqKepWQS4y5
	VH9CkG+lFTe2TrdJqSkCiFpChveVbq2F3GPhu7LSz+2SUFHKYjpvA2M70GAhylWvQq5e0EMKClc
	x1yLQLdnR4786QD6BKJy4UNsoJ9gPctgzfk4oZDwUTMPsDh59VhDtYQWL/APbQ+6CqQQZNFXTs4
	l/6uozbZEfvHveoMUPBtgP0wZSSQx+DeolQ4ZIZSl3Rs8xYRqZOtxix1ZWJP9SyKk3tN/eDPMH/
	v4ErERV3Y1wBmbA4tnSJnYwnl58x2kpbFkir1f1d4CKzTohW1iZBZ7bvt1AxsrpqyuiVmLX3VKd
	VNcds=
X-Google-Smtp-Source: AGHT+IFwazBjnZbetQ3x7Iyx9s5keV9O7q3bCF+mLVySdsSqkad37iAhp/Gdfd2pWf9D4OIlBwyV3A==
X-Received: by 2002:a05:6122:2219:b0:530:5308:42ec with SMTP id 71dfb90a1353d-54a609f943cmr1845849e0c.8.1758186565947;
        Thu, 18 Sep 2025 02:09:25 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a7272c1e2sm443830e0c.3.2025.09.18.02.09.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 02:09:25 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-50f8bf5c518so567490137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 02:09:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTxBNycm1KtjZXUiF0X753NSSdhGEwGTEXqK8O982+JOIRkD1J2LogS3LKAx+cbPTe/b12uRsFuWxZhgEPy4CZ8A==@vger.kernel.org
X-Received: by 2002:a05:6102:6c7:b0:4fb:fc47:e8c2 with SMTP id
 ada2fe7eead31-56d5088a6e8mr1645890137.9.1758186565181; Thu, 18 Sep 2025
 02:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com> <20250912122444.3870284-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250912122444.3870284-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Sep 2025 11:09:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWP638eB_p9xMAqZmOnuc6n7=n31h6AqV+287uvqQEdww@mail.gmail.com>
X-Gm-Features: AS18NWCGAnZ0XCOYl-nrDkcvcpM1hNQPPeX1PmUWoRk02X3Ow_sZmQjL_oQhdiM
Message-ID: <CAMuHMdWP638eB_p9xMAqZmOnuc6n7=n31h6AqV+287uvqQEdww@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 12 Sept 2025 at 14:24, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The first 128MB of memory is reserved on this board for secure area.
> Secure area is a RAM region used by firmware. The rzg3s-smarc-som.dtsi
> memory node (memory@48000000) excludes the secure area.
> Update the PCIe dma-ranges property to reflect this.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -214,6 +214,16 @@ &sdhi2 {
>  };
>  #endif
>
> +&pcie {
> +       /* First 128MB is reserved for secure area. */

Do you really have to take that into account here?  I believe that
128 MiB region will never be used anyway, as it is excluded from the
memory map (see memory@48000000).

> +       dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;

Hence shouldn't you add

    dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;

to the pcie node in arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
instead, like is done for all other Renesas SoCs that have PCIe?

> +};
> +
> +&pcie_port0 {
> +       clocks = <&versa3 5>;
> +       clock-names = "ref";
> +};

This is not related.

> +
>  &pinctrl {
>  #if SW_CONFIG3 == SW_ON
>         eth0-phy-irq-hog {

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

