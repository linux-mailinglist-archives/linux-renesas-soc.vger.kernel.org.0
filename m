Return-Path: <linux-renesas-soc+bounces-22166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E87B91F59
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 17:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61EFD2A3C60
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 15:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB422E8B87;
	Mon, 22 Sep 2025 15:34:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346C12E8B7D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555250; cv=none; b=UO++dR0GlbU+PlqLR05a25GAfosZmzFOwN9CwI5KbJn191KOo3skX4tn0lpQr+sEFEHF1V4W96L420BHn3OJgRcrUnh2kYq0mtoq3n/vyMsp4vne1I5L8ZJgPeqVkBHRCsc8NvMAy54LmeakMgYSMzXfkcC9FP90jWEHi3BD/1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555250; c=relaxed/simple;
	bh=4xEURQps1Y7XIzxTl3Xzpx+/DCz5G1g5ZSIW1rLuGto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5zbPNJh8RwgzjZCCa1BF9tvD2Z647OmFpmuVxlUzDE6lidk8Vq292Xiz/0qrpo2c3N0ADxOF7YExLdrjzrjgRnSoipjDJxfzHpFjkOk/PEO+GJomUXrSsSVzsYQj/DzRwAKIVkRA3C3aKEk3KeLdFjc0WUUbEEF7pbWxT2R7g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54bbc2a8586so399472e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 08:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758555248; x=1759160048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2KkywKnUb4xechwib0lQYxoI7BDR2zdUZe/SrHNSOo=;
        b=J+pL3jGVtOuawlO0aHxLu25uo6Qn5zLeVg0gEYZZeOCSS1yuyj1R8V22robF9VVOky
         ixZi+2Z9Fw9sol9YtVdQTrfM2X+zxPLsnaS9CYC5HU/12gxPb2fV8WQYAZzdgJFdIoVZ
         FSynO+ovkYclp35tn8rX2RDNyiCZYZfCtjAC2GG4UmZ98PN/VfZq5fCAI2Y5Kis4Nd1W
         uBtiYH3wfhQrIxaO3K6t2xphzzHUkhED6t3ITYm7M62ATVL5JovJIGeyKS+Sc4Y/8VN5
         ynuwlKTvCCwsixg6ySkyNm9LCeLMnv8iSlPSqWNnvuNjEqFXCCq7e8LWfGumMuUHFfK5
         FSOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7HptwoRG3Cd0jxnvIRbs9bT+NnowMCOJHt45LMJL98Ze9vZfI5NEPJmsMUB1kV7rQu3DAbiUjUbuXbkMTXt3gtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqC3aoWtBwcyegiufNiTVSu9fPUiUqq4Q4S2X1B/1GopT+nE1l
	Ab5kjJHQg9R3eyg6UztY5ey5qr/L8IYx/07rNzM9PpD1pQPGzmvxnAmw4hZgHq+T
X-Gm-Gg: ASbGncvy60pKy8TNXmt3twfBJw5krEb4lti8oEoWwAYZQ5ILHL7F2gVDcp/9jh4pJEk
	L5CtzGbR+m8qBPMtXwyYBDgB6HXdyet37xo5vbrDNeOfuh6J68CXfldaMP0UlRYKIdwwxyYva1h
	7gTMr6YvwQbjchczhUQt/xMS3cgCjeo5cEk2Xsb252Y6b0DZe6KGwykiBA8Eg6XQ+dAIdeg3Ylh
	SA6D5ebkICe8CN26DR49paonchsysehxxNJU1kpgyaVxf6MkAWvI8sEVYGNCwIh1E1zBd0Sp+HF
	k5FQIMHh0aFHJfcz8Mci8yhf8HkrM7mw3BOUIKtkcUuVNk+kFB1+Yyu/I9/6IG0j/kZn4pSRGtS
	bCSIQzHd7rfn5XIueqe0dr/HDdCnubIYucFRuFHBl0Eg5C45nMsX/uJALN5dr/7iwn9TR61M=
X-Google-Smtp-Source: AGHT+IHP90fdU5k1WSEbiRrEvKyvJHyEj6IgZLmljSQvJEKhqnjxVEkc9KJY/lmkVv1C88bYfPd3oA==
X-Received: by 2002:a05:6122:6210:b0:54a:92f1:f9e4 with SMTP id 71dfb90a1353d-54a92f1fc7amr2225007e0c.9.1758555247826;
        Mon, 22 Sep 2025 08:34:07 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a8685e515sm2063212e0c.21.2025.09.22.08.34.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 08:34:06 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5a46c3b3a5bso235482137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 08:34:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvcKPcGTxnL8XvtS1FxZImIleIKZ5ITXZ9O6reQI9d44GFdn5EzMt8r9t31ap2bnl2OlY8UZlc5fIeES0byhGBwA==@vger.kernel.org
X-Received: by 2002:a05:6102:cd4:b0:519:534a:6c24 with SMTP id
 ada2fe7eead31-588f87db47cmr3961231137.34.1758555245870; Mon, 22 Sep 2025
 08:34:05 -0700 (PDT)
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
 <12b54030-5505-416b-9e4e-2338263c5c7a@mailbox.org> <CAMuHMdUnKqHQpaTkiuYUmR1kQ2GwVvj0SeML-9x3Rc+srtXW+w@mail.gmail.com>
 <3e6544a4-a202-4a1b-8cef-a864936db5f2@mailbox.org>
In-Reply-To: <3e6544a4-a202-4a1b-8cef-a864936db5f2@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 17:33:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZ0U4OZOgOMXVKque55JwuSjA7kxBg7htmFjzca6+DyQ@mail.gmail.com>
X-Gm-Features: AS18NWCywMmnCuPMuZKSIK-4P7APJ2tBR-slISpv3lZfcGDeCmHyGievPd41NyE
Message-ID: <CAMuHMdUZ0U4OZOgOMXVKque55JwuSjA7kxBg7htmFjzca6+DyQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Fix inverted break condition in PHY initialization
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 22 Sept 2025 at 17:17, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/22/25 12:10 PM, Geert Uytterhoeven wrote:
> >> I have instead posted what I think are proper fixes for that SError:
> >>
> >> PCI: rcar-gen4: Add missing 1ms delay after PWR reset assertion
> >> https://patchwork.kernel.org/project/linux-pci/patch/20250918030058.330960-1-marek.vasut+renesas@mailbox.org/
> >
> > I used v3 instead.
> > While that patch seems to fix the SError after a hard reset (hardware
> > reset), it is not sufficient after a soft reset (typing "reboot").
> >
> >> clk: renesas: cpg-mssr: Add missing 1ms delay into reset toggle callback
> >> https://patchwork.kernel.org/project/linux-clk/patch/20250918030552.331389-1-marek.vasut+renesas@mailbox.org/
> >
> > This does not fix the SError, as expected (pcie-rcar-gen4.c does not
> > call reset_control_reset(), but reset_control_{,de}assert()).
> >
> >> clk: renesas: cpg-mssr: Read back reset registers to assure values latched
> >> https://patchwork.kernel.org/project/linux-clk/patch/20250918030723.331634-1-marek.vasut+renesas@mailbox.org/
> >
> > I used v2 instead, which seems to fix the SError.
>
> Those three patches have to be used together, and this inverted break
> condition fix should be applied too.
>
> The first two are corrections which align the code behavior with
> reference manual. This inverted break fix is another correction. The
> last patch in the list above actually fixes the asynchronized reset
> behavior and turns it into synchronized reset behavior, therefore fixing
> the SError in the process.

FTR, I always had the inverted break condition fix applied.
All 3 fixes on top should be fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

