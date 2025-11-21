Return-Path: <linux-renesas-soc+bounces-24951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982AC7A576
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 32EEB35AFE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 14:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89442C028A;
	Fri, 21 Nov 2025 14:52:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4618B2BD5BB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763736773; cv=none; b=Mc9+WbuO4dHc8kLk2W66XNZmcsfNWjaDzyUwC072if2w/ItR6QIRl4nc/qTFrqH5YY9m5GHngteGgYkk8BLOdhYDLggVH81x6QJked1RIMbGYEevgXmfF269N8b5X9Nw2kNImxpXJHoU8G6KJNiW3MibHBLWFJ+mRfUlFdpBw4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763736773; c=relaxed/simple;
	bh=skql/n5RcA7jyeBbQIxGJIucWjPzv4AFxG9+SxoeQo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiE+WzoCL3jnv8fDIhwaZ2sVhqz6m1Fg4/n8HZpgu7c+XJ4nLi6mo+pd1VP9TiMlrjbK+6y7/GVXW2t19U+N+qWdFd9ei57J6lHs/IbfiLLmE6Lop4WYEmq850MHT/RTX6ct9RqLN7XaW2XIu16xBM+JTSqLcL1BbTza5r7PwRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-93720298f86so1235303241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763736770; x=1764341570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lC5TXmbx1EgLF/GuqliUSxYBVJgyAz3ZPwC7d7k9sA=;
        b=qTpU/GIuqqz62goRq4gsgoO6X3pUpjToNCSw6v9xoO/PiQ7e+WZ3EzomEmjV5H1DSX
         GOqLTaBUtS4Q3U+4l5E/tBDgL1Hss+tqjxQ8FEYCvJ47jd3bdyYFZbdUkJgnqANrxwdx
         qvdizP346myvPKoEIAKSOCdrdfT9ofW/HKk198dLEP4s4ISWunhN6d5fGivQgzaFbcRs
         z4/G/P2s7jATdr+HwsSzDtvbLi/8i2k1LDlfp55iiEAwjN/grc4lR0oAdtTpyenvCVs1
         2Ak03sVAJ5ryQxvYO1Ws+EjD7EPMkwQnStsqm8vISslWknGePBR1311pKrLb4oqy/vn0
         qXrA==
X-Forwarded-Encrypted: i=1; AJvYcCVkZQzgFXzyVNt1amylAigNn20d81iTUKE6vvBfR7Rd2DChlQQJBr2lB2VEbI9jWtFW1unBzZXz10YPgkWq/IFl9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy5ia8AqMzsN1h+OdTwNGvzu9viU5dlSEzwNCpyZ/MxJ4U4wUh
	ATI3kfQOC/IlBTpG7M+6cj6gk5FQ0HpBb1ebKjP0emg6xfaST/GHUDRFphRxLAaf
X-Gm-Gg: ASbGncte5oYwxOUt3Q7itf4SICJd1LMBmwUWDyzTWZTOHVxOheMPgczsbejmJSA/FNV
	yrkcrwUMQLoeh1MMe60RlIU4Cp/QNqkU6aWzHZ+nsxb4hr47H+SOI8Kp2vQ3nE/AawHLLJaeDlR
	UBw9GNulDj4dca/WtXzQExNu+S9Es5LLZ5TioGVG43W1HIFhUjhmkgSAgdEQZErWfk/+LbQIQRT
	60H9t5IFJh76Jrgk8CK7uMoLM5GDZYdkbs9dcwh6eCyRK2HFDSr/FpuZs0uMfTV2qURmz4grGkR
	r4Ko18BT/FmRFxCsQOa40y5w/4Vi68NjB6JBgtJxqhUl93+ElQY5/Xt9xN687UqRaJKxMFJ0hs/
	+hU3Ry/CkCjcse7rVOOUcdGKg1EipJO/qIzJbMLfXGXwgSpD71znUBfTtNO8kRjGHoBScytdlGG
	Y/grCsym6FpW1l40GN+2ldLeNKi5l7DvnhFmMvKkRTy96/4GnMfYCq
X-Google-Smtp-Source: AGHT+IEP/nOmKoIrgoYC4a4UR1K2iike1o/jm+SSdZQpsMrjpsGVWMVBAz5C1LZpqi4x01X87gVO7Q==
X-Received: by 2002:a05:6102:3751:b0:5d6:218a:66bf with SMTP id ada2fe7eead31-5e1de163f96mr753469137.6.1763736769789;
        Fri, 21 Nov 2025 06:52:49 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93c5621a066sm2363025241.4.2025.11.21.06.52.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:52:49 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9372149216bso1296622241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:52:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUshc/O1fFFsqzHew2clbx7VZsIvdktZlcmM2AioQCS1bdmUHWXvqMTRcf1aHmCZA6bsR4mxarXIu8ScQAwBuz4+w==@vger.kernel.org
X-Received: by 2002:a05:6102:1609:b0:5d6:254f:4e24 with SMTP id
 ada2fe7eead31-5e1de402656mr820827137.32.1763736768085; Fri, 21 Nov 2025
 06:52:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 15:52:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_zCYLTM9gwJJE9nErumC32=2qkfPQDhpDVwKHCsVpYw@mail.gmail.com>
X-Gm-Features: AWmQ_bmzBcQpoZhI5Cv11aAtmYB1BIc8afiHapCc3vy2neqnnDocHJX2ZHzmfR0
Message-ID: <CAMuHMdV_zCYLTM9gwJJE9nErumC32=2qkfPQDhpDVwKHCsVpYw@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] serial: rsci: Drop rsci_clear_CFC()
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
> Drop rsci_clear_CFC() by reusing rsci_clear_SCxSR() as the contents of
> both functions are the same.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/rsci.c
> +++ b/drivers/tty/serial/rsci.c
> @@ -199,11 +199,6 @@ static unsigned int rsci_get_mctrl(struct uart_port *port)
>         return 0;
>  }
>
> -static void rsci_clear_CFC(struct uart_port *port, unsigned int mask)
> -{
> -       rsci_serial_out(port, CFCLR, mask);
> -}
> -

This function is indeed identical to rsci_clear_SCxSR(), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, while the sci_port_ops method is indeed called .clear_SCxSR(),
I think it makes more sense to drop rsci_clear_SCxSR() instead, as this
function touches the CFC register...

>  static void rsci_start_tx(struct uart_port *port)
>  {
>         struct sci_port *sp = to_sci_port(port);
> @@ -275,7 +270,7 @@ static void rsci_transmit_chars(struct uart_port *port)
>                         break;
>                 }
>
> -               rsci_clear_CFC(port, CFCLR_TDREC);
> +               rsci_clear_SCxSR(port, CFCLR_TDREC);

... and it is called directly.

>                 rsci_serial_out(port, TDR, c);
>
>                 port->icount.tx++;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

