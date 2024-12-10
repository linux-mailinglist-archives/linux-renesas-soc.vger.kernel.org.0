Return-Path: <linux-renesas-soc+bounces-11164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C99EB52F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F0171681A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77C81B982E;
	Tue, 10 Dec 2024 15:38:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9071B0433;
	Tue, 10 Dec 2024 15:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733845120; cv=none; b=ALpMJ66OeVKTmMbFcRkAiuBLuhKaJr8MuUEuERqcBGaXB1pUkeUqJixlp/VBRnps/o0CQVoeJN3PDfHbEFhUOW6VB518KciXyMOduxCxdwkhvWoN+T7IVCO4BuQuvoc8rHM+Z+Uv6SFFospoY8LP7i0vx3jayNwgvA1qVITnBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733845120; c=relaxed/simple;
	bh=8T9VRtZpqHckqiQuNkMRCi3+S76QW0uORtqAz2NkCwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueYsW7j5eV+oX+LtmX+nPcDfoumdEFKyhplLd+VuOtm/1j1cMepwvdbsMEhiPmE8qzIlLEd7Tf+Ch9AcMwK1hQ/w/gpU6M5Y5Rh3w9EYFx+dfK3RLSXpM5o0T/H3mofHTmHWNfxYdmCxEtmcz8k82NlgZs0kDIs4JNaffn6pcSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-85bc5d0509bso1150477241.1;
        Tue, 10 Dec 2024 07:38:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845117; x=1734449917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GImrkH7NuRSGRl0vXAqD2NdnlmWdF/l9MF9PYKs5Ok=;
        b=k6N4lhzOvTIxqJPG4w8mLR798ICXDsPdhQOSuV3xd9GTRMYhHLMBqfbGzEfCIFy39U
         d9+oCXfrGlOcrrGK+uJopVxbHJ0MvNmob3mBlWcM18T0g+VcHSIkViMW/G5jWOPB4og1
         oqBKrEDF6JCAqfSZs8SjMgdbhlYpwrjpGkg+RE1pTL1TnmIVptDnEIwy/9tebOWh8jOL
         EHoX3ExbEajv6A3lCfwrIL6KfJRo4Bg7KsS7gYoFNfeSroByART7NNysbCj6KAGWAjPo
         OxysmLlPBk4ZEFRBFIJyyJxwC8Cp7mcoQmRVLwIhTgSV/b2gTkmIL/XVlUG7wKKMUsDu
         TvSw==
X-Forwarded-Encrypted: i=1; AJvYcCUofQ0PicwNRe2p04/9lE8tgWnZimzi2qhHhz3CJe4ACb8i+396bN73dC1IC37C5sqhVg7LKr5NqK27@vger.kernel.org, AJvYcCVZibGx3HCFwR/1ThVg0VVaYuoDI6eSzH6jrSFdbNW0sb1M6nmV4RiN73mgcqiKDsD6PduW33syjc0F@vger.kernel.org, AJvYcCXFYf0NmKQ/yE+a7OGmSbE58HWBNRbYZ+Pci+Alklo7iYzsXZqNksOsUXpfeElRRVc2WLwqZeFW90E/hcxMd24k+j0=@vger.kernel.org, AJvYcCXxjN3t/lP8negmShAW4KSsjy73Lv4CSMcJTmGRYIgbB2+OE+iboCTnJhbufNaGN8uGUJq8xkcE1Zi/w23Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwXqH/td0KCPSRX8yhvJYWSa0UWdmJ08fYQvPpc4lT6MdLRi9kv
	04V5yPb4yO0wa2ygxhzBQnShNpSF3ZbF3LkTGeqe7aj1IIGdMKDgVKqbf8bv
X-Gm-Gg: ASbGnctAL3p7LRDJKSO9KzQ03J+ye9jP3tk5gqmTzdA6vWvbgjRzKlRirrh67FZrmHB
	nL1hsuDQJwIAgH9VVOrcwSOtN+ltrSJOoOKI9SM518a6L50NOeu/TRfrcHsWexO3mgRiK6HzjoP
	hyW6zqrQY6X/BA33Mfjt2AwXuvTztcQDEUt7pNGqsuwLikZFBj+cnkVrsqSQ/5r2dAZjhxqXX2j
	8qwdZdOxU5BpbGAGW//Bn8R3fnPwrL73I1xBzwYUbjGzIyPdOd5qs8KNi/AZ3XcB1eYZ4HnZS7X
	8NUPqOx4IZb7N0IEb64+
X-Google-Smtp-Source: AGHT+IGBibDAw4G4+OR6OeW+UhqEhgg957ewFhtYM9zEXzE9IyH4YX5exEv6aroehDjLV5a4XNo8QQ==
X-Received: by 2002:a05:6122:91c:b0:4f5:199b:2a61 with SMTP id 71dfb90a1353d-5188855d9ebmr5253653e0c.9.1733845117092;
        Tue, 10 Dec 2024 07:38:37 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5161697f966sm625834e0c.22.2024.12.10.07.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:38:36 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5188c6f260cso354819e0c.1;
        Tue, 10 Dec 2024 07:38:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQoY1o0iMayyHAMgobUu+sF/ze+C1/kHXnbGCJ4ZzUtjf99d3B64ajUWKjDMmmXujLxEW1hPmGx45yLmeNIlWDnr4=@vger.kernel.org, AJvYcCV7E/tCvjhXV0zKH0cIuYbG48WuMv8GZ1DFLPOxI4humYtwhjoDLAXmLOZlaMF0e+C4nRGkUCTSDA3QWdyO@vger.kernel.org, AJvYcCVvbL5z5AYqohdpbC0KtU6ry4EnFTr+LO2EF7eu+OwVbgqEeEC25BtYPkeHywdW88JzYy1QYXteURGQ@vger.kernel.org, AJvYcCWfyc1i2f7dz+7xUSImjviLvT+2bPEhJlgxno6tJmHBpH0voiXlZlPJOeuKfLTDTw1jAJMnrcvuIEVl@vger.kernel.org
X-Received: by 2002:a05:6122:322c:b0:516:1bda:b364 with SMTP id
 71dfb90a1353d-51888329b57mr5198364e0c.3.1733845116411; Tue, 10 Dec 2024
 07:38:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-15-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-15-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:38:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxo1YShE1MNTPDvmZKSYv_YvUvO3yaFM4ypdmSfF00uw@mail.gmail.com>
Message-ID: <CAMuHMdXxo1YShE1MNTPDvmZKSYv_YvUvO3yaFM4ypdmSfF00uw@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] arm64: dts: renesas: r9a08g045: Add USB support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
	magnus.damm@gmail.com, gregkh@linuxfoundation.org, 
	yoshihiro.shimoda.uh@renesas.com, christophe.jaillet@wanadoo.fr, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-usb@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add USB nodes for the Renesas RZ/G3S SoC. This consists of PHY reset,
> host and device support.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - this was patch 14/16 in v1
> - added renesas,sysc-signal properties to USB PHYs
> - collected tags
> - Geert: I kept your tag; please let me know if you consider otherwise

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -417,6 +417,125 @@ eth1: ethernet@11c40000 {
>                         status =3D "disabled";
>                 };
>
> +               phyrst: usbphy-ctrl@11e00000 {
[...]
> +               ohci0: usb@11e10000 {
[...]
> +               ehci0: usb@11e10100 {
[...]
> +               usb2_phy0: usb-phy@11e10200 {
[...]
> +               hsusb: usb@11e20000 {
[...]
> +               ohci1: usb@11e30000 {
[...]
> +               ehci1: usb@11e30100 {
[...]
> +               usb2_phy1: usb-phy@11e30200 {

Please keep similar nodes together, i.e.

    phyrst: usbphy-ctrl@11e00000 {
    ohci0: usb@11e10000 {
    ohci1: usb@11e30000 {
    ehci0: usb@11e10100 {
    ehci1: usb@11e30100 {
    usb2_phy0: usb-phy@11e10200 {
    usb2_phy1: usb-phy@11e30200 {
    hsusb: usb@11e20000 {

After that, you can easily compare with similar SoCs:

    soc-dts-diff arch/arm64/boot/dts/renesas/r9a0{7g044,8g045}.dtsi

https://github.com/geertu/linux-scripts/blob/master/soc-dts-diff

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

