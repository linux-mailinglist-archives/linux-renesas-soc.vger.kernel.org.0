Return-Path: <linux-renesas-soc+bounces-10899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D899E38CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 12:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E87416519C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 11:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D84F1AE00E;
	Wed,  4 Dec 2024 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPTOt9fP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AC51AC884;
	Wed,  4 Dec 2024 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733311753; cv=none; b=EFH+9tnq+/TC4it/IvxQXASr37SUfiCpz59a7yZpFt0WyLvGYKsEw3WqNfc6nlZvWXaWT3o84L5dF7z7ObVXllRiE/ouGBtKvPDxqly5Xw/O3qymZTRv2pD7meWDvRhJ6unIOq2Lhr6Gu8KI9cJ5JmR4hDj9tBgmEGdvVMhTTAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733311753; c=relaxed/simple;
	bh=PRPtD/jr5FDFTXKUKEQDeDZuaw4j04cDJnkroXR06Ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JeR2QHkppgI/wnUo7TmO4dsWZAlGLpUJkBJRISqXisGq8W4vvQtU//bavs7VSbHhzq2uPg/PhhNd4ku16h0c6Xy1MzN09I0rxeUgmz/rqs1E66uB1XZFgonV1HMF6jgCwMyJoewVrRhsovA7L3r6zVwrz9QgQs1VH7//z3NWIHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPTOt9fP; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-51530758f9eso1735896e0c.1;
        Wed, 04 Dec 2024 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733311751; x=1733916551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfpBFjF/TwkhQK2gM5/A5l3l5wHKSXh+Nldfgg5r75A=;
        b=WPTOt9fPNBAN3qzujSdZKz6xU0fAHUj74jlCkIhRhQnPlXRmOnfnF5FpBa9PSyipS9
         p2/pSse4lhVc8M1xOtLplLbhqXtgLukOyzj7/ITk58qEM6eDP8x5I/KhHoGGwKY0zVwi
         FiKMbM/Bq+f8pVO18B0mYh09+UuNGRMwT0YEJ/k0ZXUGo9n6F/tHP6Zp0n+Jnr++Do4x
         ICNbuZd8ARcLJExKf2UTvm9IM9WoxHzHeXRoobR2RMFf3TKNgdobqbMhrIsOSwrZkqtP
         E7t6YmHVdtg0bUyWH+WQPdnQuaU6BA3DpsQ/TjolG1b3pcsX+pjcwHTujI3+RZvP9vLy
         Uc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733311751; x=1733916551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfpBFjF/TwkhQK2gM5/A5l3l5wHKSXh+Nldfgg5r75A=;
        b=ipmcc+0y4I/2TXzlBTxWEahpgCGs33KJ7VeZv9G0SV1oiS3FnOsrb13jT+mOEibhOZ
         QHfi73w0JV1uSJl6VYMzXBQwbiDfQcrVcoDoijpnel0BLYGsS50pZi2SSgxt1IEDINPv
         LP0/R1CapQyCPv6/M0Ce/ucUMef73OJAf4roOyOAVUwaNtEPUsTGgsYu8VGNvnLSZoNf
         bWNR72g1rSotlvouTu6NhjqDahSKkdW8HwmvIuKCqwFE8RK0ym6R1aWD6F8JnZb3OYMf
         Ouo4/8cberDPNiI4pO8DBkg9La7lAGyrf9P0ZYO6ycQOk8hEAF+60weGmzAEQvgwuT4D
         ORGw==
X-Forwarded-Encrypted: i=1; AJvYcCUV1n4XCe6XB2OtDupPfnjf90dYQVqQsPkcRoVja+1p3gWUw0U5yBTRDP0XaEw6Yw32zTaCwYVEwrga3aSe@vger.kernel.org, AJvYcCVG7ckAQH29lWtf2hLdsQXQaLUGHoBL5g/uiN+bJTMdTKgK4q1XlNcDrzdv69+9GqcUpvXk/bfCG3Fe22LFNwnBxQ==@vger.kernel.org, AJvYcCWoay/JoeqRNw2mJUqYNK5oD6+4pnmPgDYAMKRtsYZiKfhDi/tj79UrZDl4I/EboGK6rvFNl7pvikA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjvwsWi0SUy8p8hgMkh6qzZ7pKZIUS+zAvwhW/cgDWHIsb5J43
	DKfCggNr6T9YpqEMdKd+9ItUGl9hZfUIhjr3BUd02JHIlHDJtSdFZtJE82nIAMUpbg2/E4WoCAi
	k3JDLB9yTsfFJtue/E97xVIqvgGn0rSbT
X-Gm-Gg: ASbGncvSpPPRe+z+arG/sMmE/0IZ2SyIS2MNeibjwfbG3eQuA0rHEaUe0UW8A6yFLyT
	GSVXimXWy+rO4DixRs5tu0/29SjeuyDVQ
X-Google-Smtp-Source: AGHT+IHHaW5QaBAVEehM24UabIxuHEshiAhyE0iLkgfBFJ/yaB943uJTFiV5ga+bj9flpDgJXv64mGLM+ulQU3nQgZw=
X-Received: by 2002:a05:6122:925:b0:50d:5a12:9436 with SMTP id
 71dfb90a1353d-515bf39dbc2mr8442373e0c.3.1733311751353; Wed, 04 Dec 2024
 03:29:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e097e5c11afe5bd4c01135779c9a40e707ef6374.1733243287.git.geert+renesas@glider.be>
In-Reply-To: <e097e5c11afe5bd4c01135779c9a40e707ef6374.1733243287.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 4 Dec 2024 11:28:45 +0000
Message-ID: <CA+V-a8vWbQ2RQ2WJ8E8JMoK-2ZhMimS7cYzdT-7LmAFWWNr4Xg@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Use plain struct copy in early_console_setup()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 4:30=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Using memcpy() prevents the compiler from doing any checking on the
> types of the passed pointer parameters.  Copy the structure using struct
> assignment instead, to increase type-safety.
>
> No change in generated code on all relevant architectures
> (arm/arm64/riscv/sh).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/sh-sci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index df523c7444230836..1ed13ce2c2952547 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3542,7 +3542,7 @@ static int __init early_console_setup(struct earlyc=
on_device *device,
>                 return -ENODEV;
>
>         device->port.type =3D type;
> -       memcpy(&sci_ports[0].port, &device->port, sizeof(struct uart_port=
));
> +       sci_ports[0].port =3D device->port;
>         port_cfg.type =3D type;
>         sci_ports[0].cfg =3D &port_cfg;
>         sci_ports[0].params =3D sci_probe_regmap(&port_cfg);
> --
> 2.34.1
>
>

