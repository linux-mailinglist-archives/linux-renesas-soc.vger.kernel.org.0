Return-Path: <linux-renesas-soc+bounces-24272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86336C3C940
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 17:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9BC91893A6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 16:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3881C33BBBC;
	Thu,  6 Nov 2025 16:51:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EBD32D0E3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 16:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447904; cv=none; b=nsE9nrfj6gnWAkDZg22AM1s3bkKX7AgUInqZFMureN2PmUv9kR6dbeunLD7HUSVC67ovjXXN+qGRZDOBFl95NfLiTVWTf9+FP+sRMJgeg3LJDB/uRzZi+GX3aPAnWnjOuBn9+s+zVBL04E9pWAkHPW4Y4k8p/OiWRNuWyGgA2B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447904; c=relaxed/simple;
	bh=D2ZR6G6YZxccCdiqKPZyO6q0gMcscv+IoBGces3watg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2igwzIi/YwOswWJbZ3H1gDdkNifbjY0Rx9avDUBPKMBxq8S59P2J1hC5jzKUyHbYMpYvI3GVkybIQ5x8D2ofcCTo69Ubt7RPicl6HTyVaB2dr0yprZNo3lqbowVEtBFofYgP/sAXPOXdJlS78tsWQbVAdIJS387scg8bLrgEWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso1924717a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 08:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762447894; x=1763052694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fIROfk4M31jFA5apdExc9xs5jzKKy4c00+TA02caho=;
        b=Nw3y5kVBYhMFTWuJb0OLOE43WQFaJZ8EAyCGmv4t8DhZgxtVbZEToS21KMgliBH3BO
         d6SPABnh9ARbN0B0wTG2+dnBwRF8O6yZojTyEot2bKIK9JWRhv2D4We9TCMhdnKe/ln+
         mJvqWhCkz7MjWm+TrF+BgIwzizW4TW1XsJ9Oxb5bqsKK6Y2GU2aYkgGfrwOXOAnVShIn
         31nl89bjuIhx+r0VXbgC6gtGJ5lznZAO3C1BLqQ9kZV43eD7gRpVJHB3CK5Rw9Z1nXT6
         MLp5EuMnz1gJMj1EmjoLVY/Z/v+V7JIkcKaQUHCQo60RQj5Hik384A69V549jTBYyHmC
         U9qA==
X-Forwarded-Encrypted: i=1; AJvYcCVp5fN7WnBqzPEQw6sZaNiLF844Wf2QFluUe8oxCqCUMM1dlqWdAgF2bbm4ITwLeoZsMAu1ITVUf/hP13wGHx4Llg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSFJ3ixsxm/gV2MgnsKJwFG+Exo1Jgbwg8ZJ9UC7+iPnEtkEdw
	oY/dgHDE/rlGKzo8YHHW0kuPSrN269E86kb7b+/2oskM0TvuROEo+1PbbG7sFwEwfM8=
X-Gm-Gg: ASbGnctO0aMcVbyYuhxKKDtPve4TA5desaoMFrPJMVMSW7VSP2dvOaLWUT7PuaN9Fj3
	JqHqQfqaaa3f1DkQsrAwcnv8i4zvU5tCkem/ZzOSyHpNPQ6DFfi+M3EJZRU7hlvU2IxWYkMPJfB
	Xxf3a8KDotOK1pzqyX4e7EowgJwSNF/5BrS9FdDa/9fOXcBMTj4Rms8MQY/lK9hXYlJGg4L+VBM
	nIDbJYtaQ0dDZ7pyeUlTjbRoRXaDLjFXgC61VpAv0JtA1dlXdhxeevaCLzEPWZdUnnEtxpHzsOz
	pcRqDKlA7ZhGIqCJEAx+peKibcGf6Fnp24GOJ7zkZAo/BSSEokoe88d5IgcnmS1S9+wHT3VYqCZ
	BjCfYEsWz+w8gAgvGS1SpZf0Z21g4A1E/oBSx4+xdKG06dCVzyWpdUUpx2ID1OsSIREnSfgrZAK
	+11nwhidZvK/E933ecL4Kqo79kiHI+LSfMRUQIqu+oNyDbR3hs
X-Google-Smtp-Source: AGHT+IE/y+2U1MuZGmIj63f1wnrlSmLiTXFIgRjLK75EaHh5NzTQwanrO++BLAz8AhiiHSYCKi4seQ==
X-Received: by 2002:a17:907:3c83:b0:b6d:3f38:2969 with SMTP id a640c23a62f3a-b726529f09dmr1022676466b.18.1762447894414;
        Thu, 06 Nov 2025 08:51:34 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97e606sm1645666b.38.2025.11.06.08.51.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 08:51:32 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso1813734a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 08:51:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWt2FYwNjaYJLQvb4rT2YLT1el4exjz01vIcqLtodc3pCBbgpLwGK9N7wG7JyK9YYK6p9Nj1Oa2AS6Hz5wsgLkfDg==@vger.kernel.org
X-Received: by 2002:a05:6402:35c9:b0:640:fb1f:e934 with SMTP id
 4fb4d7f45d1cf-6413f0834a2mr20615a12.32.1762447891499; Thu, 06 Nov 2025
 08:51:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029082101.92156-1-biju.das.jz@bp.renesas.com> <20251029082101.92156-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251029082101.92156-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 17:51:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUXimjkB_Cz=ac43RhOGF2Lf1ypLK1sLwk=ONXf7kdhQQ@mail.gmail.com>
X-Gm-Features: AWmQ_bk5DY6m4c8xO-kYacWAOBZuK7yTJexfPP1B_4jehepe727_WwaTWXgMpQg
Message-ID: <CAMuHMdUXimjkB_Cz=ac43RhOGF2Lf1ypLK1sLwk=ONXf7kdhQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] serial: sh-sci: Fix deadlock during RSCI FIFO
 overrun error
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Nam Cao <namcao@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 29 Oct 2025 at 09:21, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> On RSCI IP, a deadlock occurs during a FIFO overrun error, as it uses a
> different register to clear the FIFO overrun error status.
>
> Cc: stable@kernel.org
> Fixes: 0666e3fe95ab ("serial: sh-sci: Add support for RZ/T2H SCI")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/rsci.c
> +++ b/drivers/tty/serial/rsci.c
> @@ -414,6 +414,7 @@ static const struct sci_port_params_bits rsci_port_param_bits = {
>         .rxtx_enable = CCR0_RE | CCR0_TE,
>         .te_clear = CCR0_TE | CCR0_TEIE,
>         .poll_sent_bits = CSR_TDRE | CSR_TEND,
> +       .overrun_clr = CFCLR_ORERC,
>  };
>
>  static const struct sci_port_params rsci_port_params = {
> diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
> index e3c028df14f1..bcdb41ddc15d 100644
> --- a/drivers/tty/serial/sh-sci-common.h
> +++ b/drivers/tty/serial/sh-sci-common.h
> @@ -51,6 +51,7 @@ struct sci_port_params_bits {
>         unsigned int rxtx_enable;
>         unsigned int te_clear;
>         unsigned int poll_sent_bits;
> +       unsigned int overrun_clr;

I don't really see a need to add this field, as there are two alternatives...

>  };
>
>  struct sci_common_regs {
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 62bb62b82cbe..b33894d0273b 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1024,8 +1024,12 @@ static int sci_handle_fifo_overrun(struct uart_port *port)
>
>         status = s->ops->read_reg(port, s->params->overrun_reg);
>         if (status & s->params->overrun_mask) {
> -               status &= ~s->params->overrun_mask;
> -               s->ops->write_reg(port, s->params->overrun_reg, status);
> +               if (s->type == SCI_PORT_RSCI) {
> +                       s->ops->clear_SCxSR(port, s->params->param_bits->overrun_clr);

1. You can just use CFCLR_ORERC directly here,
2. All of the CFCLR_*C clearing bits match the corresponding CSR_*
   status bits, so you could do without the former, and thus use
   params->overrun_mask here, too.

> +               } else {
> +                       status &= ~s->params->overrun_mask;
> +                       s->ops->write_reg(port, s->params->overrun_reg, status);
> +               }
>
>                 port->icount.overrun++;
>

BTW, how is this related to "[PATCH] tty: serial: sh-sci: fix RSCI
FIFO overrun handling" [1], which is already applied (and which I
still don't fully understand the big picture behind. I'll reply there)?

[1] https://lore.kernel.org/20250923154707.1089900-1-cosmin-gabriel.tanislav.xa@renesas.com
    commit ef8fef45c74b5a00 ("tty: serial: sh-sci: fix RSCI FIFO
    overrun handling") in v6.18-rc3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

