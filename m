Return-Path: <linux-renesas-soc+bounces-26004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE89CD653D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA5643042FCE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2DD29E0E9;
	Mon, 22 Dec 2025 14:05:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9506120B7E1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766412343; cv=none; b=UeUGUz/6USSsVPss+y5T9QMGlQRsWWALdn4k9xXsWeACW5cmEI5LR3ZdrIzVLlJFw1wJ3M0mwB7SieuMBKpKG8kGnBuiJ/rg0zyfpz0ddiANPCP2wNm0d49tIrEunygaaMxbVroVmgiJLkLZC5L0et2edIeLDy7xA3XhKv1pwec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766412343; c=relaxed/simple;
	bh=bTIKHcqn0C6gaQNho2yhzTYPlbw5mXBtl6Xpga087bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRT8BZFqDWuQSFuasagBuaX5gupla/kXLH3rGl7tACT+HX9FHeXObbvtysLiytS80lrVLIn/UhdNE/UiILGRbqrtEoa0emgBWw+ObAgp2Ynluy1nsUcpgLhxW2v8xlqtBcq54u8dcGCQUs1YbfJ6H1p8fVcE4OiAnB8Xab9lioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f66.google.com with SMTP id ada2fe7eead31-5dde4444e0cso1296257137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766412340; x=1767017140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICwOHcWbMK0sAN8WZ7Ku00mtmBrZPHA5/DlsAdljbVM=;
        b=NfP6n05Y/uyJrKaxaBhAGviPGpDgmwL0u3gTNN5HwjRm5E1PecC1K6pZ9DXusIxMSr
         SKIjPBhegU2pUzY2rde78wSWivlvcHv9CpkfVND6560k3n5e38WoqbZdbdhcWAzFGdeq
         y8V60CZrv3TfdaBbOCc1b2cSW1pTDfgeVdbu3+00rIeM4cxoe7V9Y3PTzFQemMulxCm4
         WxC2PQBRtGqc3udLhOqn75HhYAtgIB5E7qw7d21gG81awzQAho6hv9xFfYgCKm6HY54d
         pvU3WcwZRbyMc6wBkR8L+4+JpqXMD+TpN/6EKF0Qi6c+7j2qbx+VlCbqTZ/3LFX7BQ8d
         oUXA==
X-Forwarded-Encrypted: i=1; AJvYcCW7iUwVSVfvqM0BvVznkVdKZbcvkDuB+YIQHG5ae37oDRll41whsaH7LipvuMfbARVPIrlCmJ0VX8RMJM2IooZKNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyadn+0pWf9AxOJzRkf7fYA84rsDGIR0qHPQGi33FYUvwn4CNC
	hqxwQjWSkwFoDGvKRaH9dsQX1965frHQZfLnmYie2NtTT+AEC/ICLMmRS49c4oEi
X-Gm-Gg: AY/fxX6PAgbyPOBjyLFlu17//WKV0CI1hOU40qRhpVeahym3DhMb6Gu5KwvMcPg0aso
	rjQu+azur9/uBoZA8C4++uAWIfcBaCs2wK0T3Y5sJ6e0kMypQZvi9+TkA4IiiWu5sQU5pN1aI/K
	xX+/sOsyVi6231USP1lzgPkEtKsQcQK3OGAR/64EghPtRrsjQ05Dn4O/zQDPQf7C/uUJa90XOCB
	CUiDIL+RI7Y2ad1FMXZDapiouchQJ5ww1slU+P5Cp+glu4i/m7Cqjjf1cWUpPFtMZLUEUbzm204
	2Urbpjmp2vhB3PojrUbi7W3TnwN+x1wX2QO/NgNxFVUgn+Jhe9IgpiI2EUXGFzselCBqIvZ3ZV6
	N3F7mHCdSkJTEuhq1hhD2dOO2scHLOCGONmGSVjdziFwCXO3gWESCQsIP8hSCuL4NO1F7QUMMqU
	fg8TlPXjz+dLmf5CA7K6UbU7gT66+jHDl0qTxhSz0HOMrW2UmcRGSjH/K5jkA0/CM=
X-Google-Smtp-Source: AGHT+IHUJLCwwA2HlZcrd1/pzToP9/HycX9kwHf5xvP6nbHhWC3MNGOR/7Arjpyrs+RLG73grVX3Gw==
X-Received: by 2002:a05:6102:5114:b0:5dd:f9c2:5533 with SMTP id ada2fe7eead31-5eb1a802900mr3176464137.30.1766412339875;
        Mon, 22 Dec 2025 06:05:39 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1ac8adb6sm3336174137.12.2025.12.22.06.05.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 06:05:39 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-559966a86caso939638e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:05:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkG8PZQjXKfylf0M+kZe/6wwr+B4W0wtOuX89SfFAqHtsoVi61bElfuXHANLoT00XEvorSuIG/XP4oFRXmByveXA==@vger.kernel.org
X-Received: by 2002:a05:6122:2a52:b0:55f:c41f:e841 with SMTP id
 71dfb90a1353d-5615bed1815mr3290676e0c.19.1766412338007; Mon, 22 Dec 2025
 06:05:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com> <20251129164325.209213-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251129164325.209213-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 15:05:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpsjQ=cL1z5vMX39TwnfWsfEhMOktBPL-zF0-QJug-Xw@mail.gmail.com>
X-Gm-Features: AQt7F2oETRYAhevlCJEPv5BI6M299_NGlsvNoOTDm0Qmrwm2Eeqa8eGBJP7zVJo
Message-ID: <CAMuHMdWpsjQ=cL1z5vMX39TwnfWsfEhMOktBPL-zF0-QJug-Xw@mail.gmail.com>
Subject: Re: [PATCH v5 03/17] serial: rsci: Add set_rtrg() callback
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

On Sat, 29 Nov 2025 at 17:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The rtrg variable is populated in sci_init_single() for RZ/T2H. Add
> set_rtrg() callback for setting the rtrg value.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5:
>  * New patch.

Thanks for your patch, which is now commit b346e5d7dbf66961 ("serial:
rsci: Add set_rtrg() callback") in tty/tty-next.

> --- a/drivers/tty/serial/rsci.c
> +++ b/drivers/tty/serial/rsci.c
> @@ -151,6 +151,22 @@ static void rsci_start_rx(struct uart_port *port)
>         rsci_serial_out(port, CCR0, ctrl);
>  }
>
> +static int rsci_scif_set_rtrg(struct uart_port *port, int rx_trig)
> +{
> +       u32 fcr = rsci_serial_in(port, FCR);
> +
> +       if (rx_trig >= port->fifosize)
> +               rx_trig = port->fifosize - 1;
> +       else if (rx_trig < 1)
> +               rx_trig = 0;
> +
> +       fcr &= ~FCR_RTRG4_0;
> +       fcr |= field_prep(FCR_RTRG4_0, rx_trig);

FIELD_PREP(), as FCR_RTRG4_0 is a constant.
However, this can be combined with the previous line, using
FIELD_MODIFY().

I have sent a follow-up patch: "[PATCH] serial: rsci: Convert to
FIELD_MODIFY()".
https://lore.kernel.org/ada3faf4698155a618ae6371b35eab121eb8b19c.1766411924.git.geert+renesas@glider.be


> +       rsci_serial_out(port, FCR, fcr);
> +
> +       return rx_trig;
> +}
> +
>  static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
>                              const struct ktermios *old)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

