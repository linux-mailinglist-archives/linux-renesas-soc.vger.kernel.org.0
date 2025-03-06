Return-Path: <linux-renesas-soc+bounces-14052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B14A5478A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 11:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58CF47A2077
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 10:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD42F1DD543;
	Thu,  6 Mar 2025 10:17:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC7C184E;
	Thu,  6 Mar 2025 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741256245; cv=none; b=Bry/XYgprn7c/3GlyFU522sQ7JnTb8E2Pw1w1/XLBQszjtRIG4qkyKN6JhjJk/gzVaHmMemGll8XbTfMpDkYDtWvss55mY0J/vAsy4yDFTheIFbg/cCGPaN/RgMz33pYsJYi7i2/iMtpQXO2mOCMFcFLt1yGq6yerM2hXwXBe+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741256245; c=relaxed/simple;
	bh=M4NQD7fKonPOadpqponUO/eOxoe35epmgZqcnhpbox4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfXG+s66B+cFTaKEzzHicm0QrpU3wH7023kc4qNYC8qx5ZitXofDXw2Bcv2seEMxIhnrTuipKjk6MDUhVbSKPupLlhTfgjHAUO8hLf7d7R9ZKk55emat/wFiyGOIMrMo0Up+YV5k15vPS85A5Qb+ZKURx1v88iW5US6FsOdSwn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523cbce3fecso466400e0c.0;
        Thu, 06 Mar 2025 02:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256242; x=1741861042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcEz2LyBncALLQ4u6Y5IbzKtdzlkgMXNLDU3Z8nhKrM=;
        b=pbJwfJcisxev4Q83E3U6BrszIewEVzg68dj196Shf4YWrGxdaaUVDMl7SwXsSFCy/Z
         oos/bM+ePhSG2yK0DyWAUUb0FqZT6f5ixbU8/D4Od/2ILXdAB2OJcMSULYrUhpzZAjN8
         +MDYL8/7dz3yGtwoU5qneRn8hLKYUjdbXy8w6ARFwMAYzMp8yICWnrLJwSqdrkuAYFBU
         LHLZeubPsbsnnS7X5HIU05traTRgXp22G1PJzF4Db7s//ZjHuKOPB7rshQxeQnWeyJpD
         Q9kLGr2bZK5re2bSRLh2ke7HekpSUkMb4lMrkfA8SxBNepVhR1o2v8kMTiSfil1J8HrH
         T+cA==
X-Forwarded-Encrypted: i=1; AJvYcCUDSOnygtNbBWzzPDhbM+Lahj/N6lxsd5M9GyflTiC9zQWRxad7XQXiqTLXFopbgx43sfWDmEsKEqruUuQl@vger.kernel.org, AJvYcCUe3IYx4vpSJYiOLbAfeIhzKQgtrJvwpHp4A0cb9Y9SZyGMYhDAV6sMLBVAQOJM/V1eDbQNTKs9H6XjdAWS3Ttbld4=@vger.kernel.org, AJvYcCW8uXxCIf5iFDcCyOu8/AQj0cib4KZR57uPDL/6zrm5ZHm+gejSntU5zqdBX9RWf5gFaWTZO10muqVCQfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YypaDJs8VdXRKsOOWyX/UdWHT04HKZRJ0zoKJCytks3S2I01TR+
	uC/J5YPnhYQ9jgHMyHB2k7U0mbZyuvpVCzmeqERYbBXpojpq/Tm1JroXSfDw
X-Gm-Gg: ASbGncsblJENYGfo/bf8Kv2Ns7JQ+sqA5ao5QGLFZ/zam7jKnJQtQjVwgNE4rkWlPdE
	Pra5c3O5919PomSO/Sqw87iLbR4GCY2lQV4AlCCtL0HmsT9skq6eJ+RZKExjJxhvO8az9EEvMX4
	4tUuEVbyaNxgNbiFry0K2IEyv6xkZXgjLfhYLZrf7RoWc0lxn3LJ2AzQtn1SMx/Th5wu3rKXaKY
	93PN/AhF+zCzSKwk2lbsPGTjahqcGrCGUcdPLX/SqPt+NuS44/2SggDWpj2Ol00rUCTr0svhrN1
	IYjF0u+i4AXNI7c7DG75o15EvUbh8s7E3fO+JDdMd8Euau96Yutm+X3lJj1AaObmKpfir+Wv7Hu
	Qu6dVZ5Y=
X-Google-Smtp-Source: AGHT+IHAt1f4QoDAXQwnMH0ATPb1Lds2D7R5NpT5LiXUaQfisOeKv+Ice1sImuQOdj3xSULoPP/xaA==
X-Received: by 2002:a05:6122:3208:b0:520:9688:d1bb with SMTP id 71dfb90a1353d-523c611e546mr4434454e0c.2.1741256242216;
        Thu, 06 Mar 2025 02:17:22 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8afbd23sm134665e0c.25.2025.03.06.02.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 02:17:22 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-867129fdb0aso443895241.1;
        Thu, 06 Mar 2025 02:17:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7NQgLzrQEqLSCU6TGjokuNlTwkLbdJpKCO+0UiNyWTpmm8u0FpEvbtF3v5TvARuNG0hoRmCM2Buu/dgtF@vger.kernel.org, AJvYcCVyDEA9/OggdSfo82rl8brwmUUVVaIOIBbnZVdiU5OUXnfj4rQOVBtgiOBqD4/4bz5KEKQ79b2PRLRdaKx/xVIi9No=@vger.kernel.org, AJvYcCWAMNf4CwHTXWlhVInlpI3GaTaNOuYxED2jvYY3yEfLGiXA1fnhjFgJ/J8K7LmnwUt79zGYHJGxX/JWnN8=@vger.kernel.org
X-Received: by 2002:a05:6102:2914:b0:4c1:b2c2:61a with SMTP id
 ada2fe7eead31-4c2e29aee24mr3252939137.25.1741256241769; Thu, 06 Mar 2025
 02:17:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com> <20250226130935.3029927-10-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250226130935.3029927-10-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 11:17:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEQue1eqX7AE+WQ1OrdpMNVU7PXfprYaSGHQV0ofpB4A@mail.gmail.com>
X-Gm-Features: AQ5f1JoJvgWlKwwGYmoeowmZpOBO1Rl0odlx56brJYK22pPVHXovdCly3eNimAg
Message-ID: <CAMuHMdWEQue1eqX7AE+WQ1OrdpMNVU7PXfprYaSGHQV0ofpB4A@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] serial: sh-sci: Introduced sci_of_data
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Wed, 26 Feb 2025 at 14:10, Thierry Bultel
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
> Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3250,12 +3247,17 @@ static struct console early_serial_console = {
>  static int sci_probe_earlyprintk(struct platform_device *pdev)
>  {
>         const struct plat_sci_port *cfg = dev_get_platdata(&pdev->dev);
> +       struct sci_port *sp = pdev->id;

"sp = &sci_ports[pdev->id]" makes it going again on QEMU RTS7751R2D.

>
>         if (early_serial_console.data)
>                 return -EEXIST;
>
>         early_serial_console.index = pdev->id;
>
> +       sp->params = sci_probe_regmap(cfg, sp);
> +       if (!sp->params)
> +               return -ENODEV;
> +
>         sci_init_single(pdev, &sci_ports[pdev->id], pdev->id, cfg, true);

Here you can reuse sp.

>
>         if (!strstr(early_serial_buf, "keep"))

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

