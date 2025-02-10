Return-Path: <linux-renesas-soc+bounces-13008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9120A2F1BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 16:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FB281881A01
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A768C238D3D;
	Mon, 10 Feb 2025 15:30:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC53230D07;
	Mon, 10 Feb 2025 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201445; cv=none; b=e4sBi/BCM/wiv4R5VBDdf3H5rjm4xFPXeXM3map/DfYie5bJ3EKsed0OKyJfuKu4opbQ1nNasFV/4fsEzHHzF2pwZf6itr2SsfscO38xfsNRPjQWwNn1uQOKp7IlIw2Sbv+jFKGBUlThqkeqm5/tAQeI3pmRWdjwggFPi/NNSx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201445; c=relaxed/simple;
	bh=qNm4CHzPjwDB5eWSB53GtIOEq3by+g5myRHe3AOL4cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvzi6aREGIIawPPWT9d/EvlaKqPrM+badv1i/+3XCJ7QcdScA+NckXhB6nJKtUNP3YX63bXGiOpM4EnMMhkw0jSBW2Vj8Xfedc69FdOqax3x+Gk6cj6tLOj+M1qGjPS+ybn57Hj9p+MvG9DG0jvZJZxSmreqFr31nWc8XtJa4DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4ba88eaff7cso627040137.2;
        Mon, 10 Feb 2025 07:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739201440; x=1739806240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xuumStvJ4XzJICP2XWv3Fwsgtfc9wkYm0UoJ1gEMC8=;
        b=Du6kz9Mzx8hAEMdyDLxSMbPbtIZTgNGXh0VtU/3lxRaydLrLV/w+c48L7bKLev0dA7
         DB36UsiHWpGiwra4ZE00N6jwBERmCmsitrmWnOYKAvR83V23btgNRl6pgli9V7MeKOrS
         YlgZ8MYB5dHOP+psYL3D/YqvjEEhPbMVrV7q4gopq2+FIbMGCkR8uj7vLKolz9UX/hfI
         20DqPh8u57OdrAjwP7d37WzbMW1WU2d+3iV4F/J5rY9gKuo9aPKkLthMJKBvbzBj+hs/
         WCB5YPzVtMttXbsTSi4wsQatQlmKyfQQmAOqxmH3QpfZ83qB8rynQ3QRINIgS1eFzNde
         aA2g==
X-Forwarded-Encrypted: i=1; AJvYcCUs28ew3PDzvsQ2kUJl7P6vxJZUv3G0LaNa0ymTwdHARfnVneW4gXNeQEQmyMau2bRcvG7TzD8rKhyDBWk=@vger.kernel.org, AJvYcCVYJN7rYA+uYXvJfWbztL6l+wPB3CGD7RXIIRT/pkuftlz/Ap24w+xPPTuCs+YylA3BYq6f9s+WmnCrt2ez@vger.kernel.org, AJvYcCXN3tkDKFUBvYUOH0Wf9f7p1XJbLU1X43A6gewKWUbc6A8FHJX2FXd8KJGXhZ0iapNXW4fVp4fqj8dUDb7FWB3nWoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnQk7cCrjdjz4PQCAftPuukTnDn6VrTOMg4/HZQ5SXIeO7yt5I
	QWVCDmxkog9hYoV4Vtq88vRRqmd5MTfjmwaWbOZ2hum7Nu4D6VY8AZavMqmx
X-Gm-Gg: ASbGncud00zAvHmYY+a58k1Q0r27zEQNt3zM9Q/w2LYHeLoENL6idwJ0LWMSEEyuqLC
	AYI04Yb1pHJUpb4XD1+f3u0eamPNQAlue/5ckGA0MWXtQpORo4PaFY/1IxWFzNCNItNKyTREtSJ
	HC6V8sKu99xiLlFzKTF5EodmS6dIYlwpd4r0Ib/EfWZq2K9DNDoOtcGZjpEP2lBKH3Tw/32MNnf
	G88sX83raYV0s9lD2LQt1sC2dnoHzWeol5AQoK2zSDiW24Kzpi/68I1o0C8mw9y6VJaXTVeyPhM
	AZ1D8yiKjzSrDZKKg8b1XTfgy+KSNsxIDzwe6Np/8vWJsVH3cQqMoA==
X-Google-Smtp-Source: AGHT+IHGoz7pACpArraGdBcDAU/HeSRLEMiDlzNc+rS/oGQSSVEPZvyHEHEVGjcRNZdv8z+GvTwOTg==
X-Received: by 2002:a05:6102:4b13:b0:4af:c519:4e86 with SMTP id ada2fe7eead31-4ba85da77a8mr9392194137.1.1739201439678;
        Mon, 10 Feb 2025 07:30:39 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbb7547263sm807332137.4.2025.02.10.07.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:30:39 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-866de72bb82so1300243241.1;
        Mon, 10 Feb 2025 07:30:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGksSd50TxLX9l+wEVngJ18Lk3uDgKl52v8RXx0eNHec1ylO72B9J6H4VN9SJcv2kKk0xTY1NR82dCcb8=@vger.kernel.org, AJvYcCWAJOeBhtcGuMYmnzimdCnwJZpemGfyPbZhGKDgMQRxUhkGV4+sk7ht2DI9+bLmmbdZo7nv180mD/FW/XI4@vger.kernel.org, AJvYcCXe+aoKIKiPWn8TjlO7Vp4acHSGn/7/7V+8+pazsUNaCEwVpBMaYeNRZlXpxL0NLTi9UJ40hV9oXR+8TIWpFn9mKhM=@vger.kernel.org
X-Received: by 2002:a05:6102:1481:b0:4b9:ba60:ec85 with SMTP id
 ada2fe7eead31-4ba85eb6452mr10266211137.15.1739201439257; Mon, 10 Feb 2025
 07:30:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-12-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-12-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 16:30:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrocuwBBQpq4XxZXVAF1=cpYQggwBviivQ53TJ2uz-ag@mail.gmail.com>
X-Gm-Features: AWEUYZn9XCeqkAASv1mhRHy1-YU5QCzjiDp1zusBjLxkk_Uez7Lc1630Z8Y3aJg
Message-ID: <CAMuHMdXrocuwBBQpq4XxZXVAF1=cpYQggwBviivQ53TJ2uz-ag@mail.gmail.com>
Subject: Re: [PATCH 11/14] serial: sh-sci: Add support for RZ/T2H SCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Wed, 29 Jan 2025 at 17:52, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Define a new RZSCI port type, and the RSCI 32 bits registers set.
> The RZ/T2H SCI has a a fifo, and a quite different set of registers
> from the orginal SH SCI ones.
> DMA is not supported yet.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/tty/serial/rzsci.c
> @@ -0,0 +1,484 @@

> +/* RDR (Receive Data Register) */
> +#define RDR_FER                        BIT(28) /* Framing Error */
> +#define RDR_PER                        BIT(27) /* Parity Error */
> +#define RDR_ORER               BIT(24) /* Overrun Error */
> +#define RDR_FFER               BIT(12) /* FIFO Framing Error */
> +#define RDR_FPER               BIT(11) /* FIFO Parity Error */
> +#define RDR_DR                 BIT(10) /* Incoming Data Ready */
> +#define RDR_MPB                        BIT(9)  /* Multiprocessor Bit */

None of the above are used...

> +#define        RDR_RDAT_MSK            GENMASK(8, 0)

...

> +static void rzsci_receive_chars(struct uart_port *port)
> +{
> +       struct tty_port *tport = &port->state->port;
> +       int i, count, copied = 0;
> +       u32 status, frsr_status = 0;
> +       unsigned char flag;
> +
> +       status = rzsci_serial_in(port, CSR);
> +       frsr_status = rzsci_serial_in(port, FRSR);
> +
> +       if (!(status & CSR_RDRF) && !(frsr_status & FRSR_DR))
> +               return;
> +
> +       while (1) {
> +               /* Don't copy more bytes than there is room for in the buffer */
> +               count = tty_buffer_request_room(tport, rzsci_rxfill(port));
> +
> +               /* If for any reason we can't copy more data, we're done! */
> +               if (count == 0)
> +                       break;
> +
> +               for (i = 0; i < count; i++) {
> +                       char c;
> +
> +                       status = rzsci_serial_in(port, CSR);

Isn't the point of the RDR_* status bits in the top part of the RDR
register that you don't need to read the CSR register anymore?

> +                       c = rzsci_serial_in(port, RDR) & RDR_RDAT_MSK;

Note that this drops bit 8.

> +
> +                       if (uart_handle_sysrq_char(port, c)) {
> +                               count--;
> +                               i--;
> +                               continue;
> +                       }
> +
> +                       /* Store data and status */
> +                       if (status & CSR_FER) {
> +                               flag = TTY_FRAME;
> +                               port->icount.frame++;
> +                       } else if (status & CSR_PER) {
> +                               flag = TTY_PARITY;
> +                               port->icount.parity++;
> +                       } else
> +                               flag = TTY_NORMAL;
> +
> +                       tty_insert_flip_char(tport, c, flag);
> +               }
> +
> +               rzsci_serial_in(port, CSR); /* dummy read */
> +               rzsci_clear_DRxC(port);
> +
> +               copied += count;
> +               port->icount.rx += count;
> +       }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

