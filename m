Return-Path: <linux-renesas-soc+bounces-22409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F1BA335C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 11:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C3F17A4DB5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 09:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E073D29B233;
	Fri, 26 Sep 2025 09:45:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46823276022
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758879941; cv=none; b=jHyjCvKqdFcbnCvq0hIDuAZrTDpTwHv/Jr7QCEnv3ztvPxmWZHE7k2VIJO7BDFP6vpD8kAkHkSALBo/OEO7bslB1AZ2N+foDvj+C92Bx1QwqP+CLFmOtbUeEIAzf4AS1MPkcKqkQYuvTHKgGSA6MJbSsLhJA9YFu7xQyYPsxKP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758879941; c=relaxed/simple;
	bh=yNpF3gakBewbf4gWfzySUblL/HPEFTHdWDap5s8c2rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/epJtwTq0VhvBtENmzCEwjVWRG0SVO48rosMLmnWMfqDDyt3yrDJX5xQZQaZcmB90o2d97IfM1hwipDUdmxfCfSaIqwyVIT4tn6QQ6sXsI2sGZs8jzB/ByYHeQjC3D+al6N5oyg+9SRKTJ5ZvdQaMjS3QBeC2KMLnrb+8cpytE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8e3d93c0626so1407484241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 02:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879939; x=1759484739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wz1Y2OO7aX1FKDkec9bCJzTd14gDBikA8iaq+l9tIyk=;
        b=WFVOUfS9K8GELL2w+ukhRARvIiU5yXwxNjubtTCfjvbC44E2k/oQdk7xQKpzoCL4S1
         x7d8HaH8B1EO61U/oX3DGv1gEfYlH1ky0ktDAwKogkUqJ6X8DBqbC+qUAcDP6tXvZme3
         8MEH5Zz5kHSFq5SuBrsROxRxoeYUQUGFP1pHADtA8LS+mNqVxJUwpPREiKgCzLy8sYWD
         U924WTxjLY6ZSnoNif9HdafAAAsNkHv1rlBT4kTlxMeWGrR/uVwYawgXfWWNMomLUKaX
         b3nKfsCvTYuwfn5n5S4tCGwmCHjKBi5UljTiZemRK2w55eaca1EdoSW80RXvB8ShO7De
         suRA==
X-Forwarded-Encrypted: i=1; AJvYcCXy0hTXrK6Wr9HkVn3PfxA7sEfn/pMNXjzDwV43Md55895ZWaB1OD6zpo/LcDHGjeY2DRuPhqABt3jY8GYLskc55A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8arHU/hcDQ18aAlgfSB3U1pjUatjrHmf4aW1wwkSCNbYBFDDh
	iKKrxZMjVUEPnVQlGZZmL+ru0BSb7oc0OzIMqgPaTwNVrTe0JaNxHbzsKeGNlkEv
X-Gm-Gg: ASbGncv0ZVWEbPzFwqG1ldBMBuXlieifUa8U37Cfm6FkVF8+yQEyHP3eLAt1J5BZ61c
	WlgsUS2itU8KMjRKlgtY5BIxlrOEzYHTYnEbpdYSnwD3xTb+TpR5+zf0musXPA1tm1V356IRZuB
	xZQV//kkpDy91RqBgrmPOTrRbzoTmBhb6kc69MiB3qqVYKiS3BZnfw68xeuZcHBXZzX/IlSHFT/
	u8pFORLL2wrefyyMru2Vvlec+3kn7iXMoa+8mv+1XKT2TTRQK5eUIhkKZj4VJvyeGwiFnGg0XV0
	E5nvcW7KXKXm8xrjcMiEbWeJmCsGISNrKBlH9jGVJBj/ryp6xa9jyoMhMmsF63HGMOaDGM7B9JG
	VFJx+z+p539g8fE7obEuzWWMsgGI+XKljRp2EUjpaI3VXg/QUdWXkh0no1NWbqhLpCRU1xEA=
X-Google-Smtp-Source: AGHT+IH2hBDRH8fwClHre3XjtP8PWNSt/hCCy27jJuIvQv9vIAiUEFUQUJDFx7No6qosvUvemradrw==
X-Received: by 2002:a05:6102:3a08:b0:52a:1104:3029 with SMTP id ada2fe7eead31-5ae1e69598fmr2748115137.17.1758879938954;
        Fri, 26 Sep 2025 02:45:38 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae31827c81sm1187276137.5.2025.09.26.02.45.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:45:37 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-528a601a3cbso1692911137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 02:45:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFV2U9IUlxgMkRog70LOb33Cbyjlnl8a5bl8gvNi/SxqcE424xBxb5YvfEtk6ulUvqAxJohgUs+129CVgsLY/X3Q==@vger.kernel.org
X-Received: by 2002:a05:6102:1452:20b0:58f:1e8b:a1c1 with SMTP id
 ada2fe7eead31-5ae14991836mr1929645137.2.1758879937242; Fri, 26 Sep 2025
 02:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com> <20250912122444.3870284-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250912122444.3870284-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 11:45:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmjj_bKhGqhWcRvWap1U5izT347Ffo5wqs6OP9BvO8PA@mail.gmail.com>
X-Gm-Features: AS18NWDiRHr7QXCMqaoImEEYFri-rFsQBU5GFbqAD2ZmUrWNkjrXvGfEFMFxCMM
Message-ID: <CAMuHMdWmjj_bKhGqhWcRvWap1U5izT347Ffo5wqs6OP9BvO8PA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: renesas: r9a08g045: Add PCIe node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Clausiu,

On Fri, 12 Sept 2025 at 14:24, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ/G3S SoC has a variant (R9A08G045S33) which supports PCIe. Add the
> PCIe node.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - moved the node to r9a08g045.dtsi
> - dropped the "s33" from the compatible string
> - added port node
> - re-ordered properties to have them grouped together

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -717,6 +717,72 @@ eth1: ethernet@11c40000 {
>                         status = "disabled";
>                 };
>
> +               pcie: pcie@11e40000 {
> +                       compatible = "renesas,r9a08g045-pcie";
> +                       reg = <0 0x11e40000 0 0x10000>;
> +                       ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>;
> +                       /* Map all possible DRAM ranges (4 GB). */
> +                       dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0x1 0x0>;

I would write the last part as "1 0x00000000", for consistency with
other 36-bit addresses and lengths.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

