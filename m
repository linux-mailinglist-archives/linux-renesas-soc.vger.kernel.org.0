Return-Path: <linux-renesas-soc+bounces-13010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79792A2F20A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 16:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48DA73A3216
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33671F8BBC;
	Mon, 10 Feb 2025 15:48:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E15624BCFB;
	Mon, 10 Feb 2025 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202514; cv=none; b=N/XPma9a/nfMfui1Z7TVIlzq7wXHpJqEKtCaNTvrDCHwof3Ws5kulqCEaQPFmEx7I4DEY2JEn98RsnXhumzB6PQj6RUDIexJ/n0dLMfNYZSbIY0aGIQXcYiGBntiz38RiZzUSt+2vVs4cNUUXWvPVwlyFRWgVDw/FlvCIEm7FCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202514; c=relaxed/simple;
	bh=XRbgmbcCpwhcGuhyGTfVaQu7cnuve9h9DUd6LS4b0Xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0pkFWySXIUjJm7qrLkS39l3RjC0vNt7zlCVj+byU5Ov2OOfCs/8aj6bx+e4pfANErFcD1/wkYMU3IfUdP/R+L2unGdL8jx29LXrGWEY6LTN0bRQnftlsfpQoipLIQShlg5776j6nyk0KBCY4wEvYFl0BIscV+6iDdZgWtTWuxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5205539e38cso84301e0c.0;
        Mon, 10 Feb 2025 07:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202511; x=1739807311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0eRsoRzBIkH6thuFISXXPJYJ/VgMzRxeCVSBedmQw0=;
        b=RnDCHJb3V7eO5kx6OX9XwEk9EEN4SSrpQoY/Cl7lX2Kv7ONDMdsq8V+rKPeRpv/+5L
         sOzuCL8Ik9Lg3rOlSvCMNwSZxRRd3DHpRvaV+9efkvA+UyZMjTyFnWw/5Xu9h3LoIDJy
         IOqz0kozGobKzw+9bdntea/ZSR5sRNeq2BcbhqpxDGGnWDiImZOTbTYpFNItKFpah9jT
         HCM4kelLOkkjl6nn0NKi5GRTJI+jTCkTQc1dQaiqe/eC5PFgi7k51e1FhxWawLZFmozD
         49XP0MdbWQlQZTjJ+8f3rO/THWURqCv8iqFvFTtaaXjCTzYliXr19Uuu/mRVzcauSUKw
         y5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVsgu4y9/9i37PrvdgX0TEjW3/lE5xLYNSBPHJjhtD9Sw1Q1gb4m4X3GrGUyylkeLuWTHraIZf4EGKhCR4=@vger.kernel.org, AJvYcCWMIY1QOB8/3sNpwPw0hrd9FHKeVrSsvHuhmmqwXgdf06eve8qM8REv7uwh7cgErDBIbARsq+522BtXkUW9@vger.kernel.org, AJvYcCXyPVPEQyhPWpUZTfFDJ5ObaKoZCppxjJ/jemSNxCfHYyQ/mfubdbMI/18u9pXcj3npfSPMX3XkJgKJpxAvr+KSRVo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2kpJSNFu+jUjIH2UKTXk4+zqkW02FNs05sYSSTUSttZN/l/qY
	nZDfOXncjYw6c13xPROJQWKug1+Ct+V9MGwZD85Eu3w5Zl+goQcrYRr1efiW
X-Gm-Gg: ASbGncupMB2WtJTCdrh8yaHLEfeGP63H0MZRC1hFAVaYNV1aUNtRxZj8SfOVxIGGv1x
	7Lprw5rDEAdGVpt4I2eaqVr38Ar574yZaCtaBBDcoeTr4POwYpn/4ef3vpeUtMhAt4doZvmL9pN
	HFbAU5yj8J/mjwvCTiTziqp83xs9zDZffsESLipRgQQre35RYmMb2HNG8LAal9lMnNbhH9D7Wjr
	u7jJpiisqnrgYyEg3qvbuu9labNvpeyXKE/BHoZqOzcw+AGFfYE8tOqK6z3XMSo45VuTh+F1i8Q
	b3/uX96tU3gRnCwYetQeRTjhARRFX4QDBdWAIxgF44iZxfai4Ex7EVhAkQ==
X-Google-Smtp-Source: AGHT+IFGvWAEPy1qpQbZnDor9xOczAajmISrLfNshtuaAebwTk3x8qqzlowf4OzHx50APsqaKuzJnw==
X-Received: by 2002:a05:6122:8c0e:b0:520:535e:89f2 with SMTP id 71dfb90a1353d-520571293e6mr331128e0c.3.1739202511534;
        Mon, 10 Feb 2025 07:48:31 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f9688cb9sm1541441241.15.2025.02.10.07.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:48:31 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5205539e38cso84289e0c.0;
        Mon, 10 Feb 2025 07:48:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWf+DUae0JYsKUg5I0peIXRV5pkOuz/E9j1OgFlMdSZv4UmkObD1nAXieWtjSnF+42dGZsq3aIX8C0rL0k=@vger.kernel.org, AJvYcCXX3ina1ZcCwBfoVsRzBRLW0/M+12/qLXDWk90rhh7ON3tzsBA9hFo0ON+6ujXZp2A5XRpkL2qBFWbGjKNO@vger.kernel.org, AJvYcCXcxxRS4ydGVX7uhQx304SbUzEdnhKuRDLzwosCk9Ib/Qnf/KyQ99/v1nwGiV0XDiUkVijT0XP0psKlw5vw/8N31F0=@vger.kernel.org
X-Received: by 2002:a05:6122:3c89:b0:520:5185:1c77 with SMTP id
 71dfb90a1353d-520571df82bmr327489e0c.7.1739202510671; Mon, 10 Feb 2025
 07:48:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-11-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-11-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 16:48:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCY=PyfcJKMu=WGAzHWfGZVctL3-e=UdAd-tCOQTP-Mw@mail.gmail.com>
X-Gm-Features: AWEUYZliuKwQC_t8rVe7nhn5Dl6HdfHxuxvGHE_HUJo--DyPL2dBFWMp-GfIoSs
Message-ID: <CAMuHMdUCY=PyfcJKMu=WGAzHWfGZVctL3-e=UdAd-tCOQTP-Mw@mail.gmail.com>
Subject: Re: [PATCH 10/14] serial: sh-sci: Introduced sci_of_data
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Wed, 29 Jan 2025 at 17:56, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> The aim here is to provide an easier support to more different SCI
> controllers, like the RZ/T2H one.
>
> The existing .data field of_sci_match is changed to a structure containing
> all what that can be statically initialized, and avoid a call to
> 'sci_probe_regmap', in both 'sci_init_single', and 'early_console_setup'.
>
> 'sci_probe_regmap' is now assumed to be called in the only case where the
> device description is from a board file instead of a dts.
>
> In this way, there is no need to patch 'sci_probe_regmap' for adding new
> SCI type, and also, the specific sci_port_params for a new SCI type can be
> provided by an external file.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2968,9 +2968,7 @@ static int sci_init_single(struct platform_device *dev,
>         int ret;
>
>         sci_port->cfg   = p;
> -       sci_port->ops   = &sci_port_ops;
>
> -       port->ops       = &sci_uart_ops;

This relies on sci_parse_dt() having filled in both ops, which is not
done in the non-DT case (i.e. legacy SuperH).

>         port->iotype    = UPIO_MEM;
>         port->line      = index;
>         port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_SH_SCI_CONSOLE);
> @@ -3010,7 +3008,16 @@ static int sci_init_single(struct platform_device *dev,
>                 for (i = 1; i < ARRAY_SIZE(sci_port->irqs); i++)
>                         sci_port->irqs[i] = sci_port->irqs[0];
>
> -       sci_port->params = sci_probe_regmap(p);
> +       /*
> +        * sci_port->params params can be NULL when using a board file instead
> +        * of a dts.
> +        */
> +       if (sci_port->params == NULL) {
> +               sci_port->params = sci_probe_regmap(p);

... hence sci_probe_regmap() should fill in the ops.

> +               if (unlikely(sci_port->params == NULL))
> +                       return -EINVAL;

This case is already handled below.

> +       }
> +
>         if (unlikely(sci_port->params == NULL))
>                 return -EINVAL;
>

> @@ -3336,7 +3348,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
>         struct reset_control *rstc;
>         struct plat_sci_port *p;
>         struct sci_port *sp;
> -       const void *data;
> +       const struct sci_of_data *data;
>         int id, ret;
>
>         if (!IS_ENABLED(CONFIG_OF) || !np)
> @@ -3382,8 +3394,12 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
>         sp = &sci_ports[id];
>         *dev_id = id;
>
> -       p->type = SCI_OF_TYPE(data);
> -       p->regtype = SCI_OF_REGTYPE(data);
> +       p->type = data->type;
> +       p->regtype = data->regtype;
> +
> +       sp->ops = data->ops;
> +       sp->port.ops = data->uart_ops;
> +       sp->params = data->params;
>
>         sp->has_rtscts = of_property_read_bool(np, "uart-has-rtscts");
>

> --- a/drivers/tty/serial/sh-sci_common.h
> +++ b/drivers/tty/serial/sh-sci_common.h

"struct sci_of_data" should be introduced here, instead of in the
previous patch.

> @@ -172,7 +172,8 @@ extern void sci_flush_buffer(struct uart_port *port);
>  #define max_sr(_port)          fls((_port)->sampling_rate_mask)
>
>  #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
> -extern int __init early_console_setup(struct earlycon_device *device, int);
> +extern int __init early_console_setup(struct earlycon_device *device,
> +                                     const struct sci_of_data *data);
>  #endif
>
>  #endif /* __SH_SCI_COMMON_H__ */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

