Return-Path: <linux-renesas-soc+bounces-24950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 749FFC7A53D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 99B534ED033
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 14:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D53627FD56;
	Fri, 21 Nov 2025 14:46:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF9A276050
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763736406; cv=none; b=rBdvWiol2eGabQcpSslEANWJ5t/N6tHp3FWEganLYTV4bd1R1GjkUFBa72+6t53iBKFQ1MWGhCwiiezLlgRnhdRo5eZWT05NXRoguUivBcsYPapZjaADa5OpvJ3bM+9R8O+4XRgfvmPU3i7XfWgSO2V0p+siikRohksqFhkdpAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763736406; c=relaxed/simple;
	bh=eUopMHDcrOOQ3SDLbKHxv+NyN+8j07BPv0wKk64BLns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDiomUd+krEYg9PWfgMYqDtzupbgugMl96GbTwQDQDFRKrPI3F7j7BnCf2Cp85+21m8mQGM6JurNM4Effr/2qIX0fdfMCgt8z4BT2uHEj5lKkiImTH2kKFUJn0xxxtDZPWclNoGCsK3v3V3zTcEWhyaVYw4OixA96hTDnM6ObCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55b155c9ab2so646075e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763736403; x=1764341203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENP0h/R0a3V4uxvE+8RQQ9YGEKzdgQGNp1M5prxm01k=;
        b=krSYoC3EZfp+qWaQK9XuppHrADqPN5KriJp7H8qdGnGt+WDajIgUGyp+zroQ4rmcV0
         1dvY1TTqSdas2qgE5WihI0mKQhZdzyEIctl2NMPE/urO2WULrvNm2vuF+bvxFCb7/H0o
         /Lc9elNTFDmN9OIlx4Ucb4WsiSNv00wQHRifWMs1qVGBs66ba0mdcqPg7SbaNwSBOU+V
         WLFNWpIslRd7rsCSap3sQl2jCOyJxZSWp/5wrPcHfLKhA20HIIuCziaT2auxcs8wAXsU
         9sP2yvVDhCzg7rjFLlEKfGF/bEwmhw69xg3BIVTW8z280cuuLs6v1kxdP3Vrjf8JOh/w
         bnTg==
X-Forwarded-Encrypted: i=1; AJvYcCV4Z8lCGD7JjZQzGD9ajjF2oz0TANpfclYdTXTNVSz2m+xZRq46b/AK7th/kEapHfDgFqGIDxoT2H/BlIdlPWw+Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6LuHdLyLLZKZdiZpgy+ICJUKoSkIR2pB3YeNI6pDvql+UEBRk
	k6Ti15ehulfltj0CngICAsJL931R/vHcKIQ7oTTWWl3H34pj8ZkgFaTJ3ZutBJiE
X-Gm-Gg: ASbGncsiU+bF97s7+JEMB0/4hi1i40pkRAMJivFph6yoXkZf/GtxkS4ULCBFYRzMRGw
	WIGiuMHTZaewQUhT4p40v31hsODHkSjRvsPFtViYGu/lA10243LIHV7Gfb6Rl1/UE1KkacQlG8A
	X6Kn4wGIhGKj0UCmyVQviVidcu5AdC+kguq2Vc0lTF6XzMIbTH7kL02qVzcHZw2Oec8czefIwT/
	FTqr4bUfKYHwAdYuBJQl7Y75xidwxKYi51jSUdhsksN/FAafL+Dww+BZcPQfM23UqpvWVCXSn2P
	aA8Y5xb/4deN8tALn4OKtUS3mE//O2QYY6n0I361AGvyWSftfGVM/NwuSUuK7+D4W84oJyDeNlY
	z07CIHqrmlSekAc+CvWm0SwuyZ3IS2XEMMpm6y4GgdW0P/HXGum5TwqKxUxceHgI5hpKT33n5uR
	uTkvq0OqlXsaQuVSPxv7ZC0CKqedT5wuoiinncDZQ0f4bbYiVS
X-Google-Smtp-Source: AGHT+IFvWiFkEVcdCf5A5yyPaL5G5CelmTVUhi8T1Y0l4TauoNgrGMGNvZLuya3fNh7SFMfgLr9MEg==
X-Received: by 2002:a05:6122:3293:b0:54c:da0:f711 with SMTP id 71dfb90a1353d-55b8d6c5a50mr769477e0c.7.1763736403146;
        Fri, 21 Nov 2025 06:46:43 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f60308csm2470526e0c.2.2025.11.21.06.46.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:46:41 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dd6fbe50c0so880379137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:46:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSczLUC86Da8rBfvQnc2a2gxhNifMjN98+EJfXSdDsCRkJgLU7jBYwt5kREXKwRbm2qZ8yZZflZcsc88de8J32kQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5129:b0:5dd:b2a1:a5a4 with SMTP id
 ada2fe7eead31-5e1de0f50fbmr689223137.5.1763736400807; Fri, 21 Nov 2025
 06:46:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-13-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-13-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 15:46:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXshthP8nrV-qP=fSv6HGCDj47x9_jQYobZTEivy15tvw@mail.gmail.com>
X-Gm-Features: AWmQ_bmAeU3gltmbELTNuNCMFNbRqLYdBo-mhJUddza9Ysxl7Zd2lut4kibciNM
Message-ID: <CAMuHMdXshthP8nrV-qP=fSv6HGCDj47x9_jQYobZTEivy15tvw@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] serial: sh-sci: Add support for RZ/G3E RSCI SCIF
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 14 Nov 2025 at 11:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for RZ/G3E RSCI SCIF(a.k.a FIFO mode). RSCI IP found on the
> RZ/G3E SoC is similar to RZ/T2H, but it has a 32-stage FIFO. it has 6
> clocks(5 module clocks + 1 external clock) instead of 3 clocks(2 module
> clocks + 1 external clock) on T2H and has multiple resets. Add support
> for the hardware flow control.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped cpu_relax() from rsci_finish_console_write() and added a
>    comment.
>  * Added sci_is_rsci_fifo_type() helper for reuse in probe() and remove().

Thanks for the update!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3563,6 +3563,11 @@ static struct uart_driver sci_uart_driver = {
>         .cons           = SCI_CONSOLE,
>  };
>
> +static bool sci_is_rsci_fifo_type(u8 type)
> +{
> +       return (type == SCI_PORT_RSCI || type == RSCI_PORT_SCIF);
> +}
> +
>  static void sci_remove(struct platform_device *dev)
>  {
>         struct sci_port *s = platform_get_drvdata(dev);
> @@ -3574,7 +3579,7 @@ static void sci_remove(struct platform_device *dev)
>         if (s->port.fifosize > 1)
>                 device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
>         if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF ||
> -           type == SCI_PORT_RSCI)
> +           sci_is_rsci_fifo_type(type))

I think Jiri intended[1] having a helper that covers all cases, not
just the two RSCI variants. E.g. sci_has_fifo(u8 type).

>                 device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
>  }
>
> @@ -3669,6 +3674,10 @@ static const struct of_device_id of_sci_match[] __maybe_unused = {
>                 .data = &of_sci_scif_rzv2h,
>         },
>  #ifdef CONFIG_SERIAL_RSCI
> +       {
> +               .compatible = "renesas,r9a09g047-rscif",
> +               .data = &of_rsci_scif_data,
> +       },
>         {
>                 .compatible = "renesas,r9a09g077-rsci",
>                 .data = &of_sci_rsci_data,
> @@ -3936,7 +3945,7 @@ static int sci_probe(struct platform_device *dev)
>                         return ret;
>         }
>         if (sp->type == PORT_SCIFA || sp->type == PORT_SCIFB ||
> -           sp->type == PORT_HSCIF || sp->type == SCI_PORT_RSCI) {
> +           sp->type == PORT_HSCIF || sci_is_rsci_fifo_type(sp->type)) {
>                 ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_timeout);
>                 if (ret) {
>                         if (sp->port.fifosize > 1) {

[1] https://lore.kernel.org/all/19a08b75-13ca-45f9-884d-f96602336dfd@kernel.org

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

