Return-Path: <linux-renesas-soc+bounces-3841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA06787E5AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 10:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BC34B2051A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 09:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10912C197;
	Mon, 18 Mar 2024 09:25:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034CC2C182;
	Mon, 18 Mar 2024 09:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710753925; cv=none; b=T3WS+H7nIfN1xKIHwKKk8Z0sOVEEboi1IAXzcBJfUfpypMYhckOIzG3NIvmqTPs7XDm5lTnTrRMk7Cfq0wDoLs9lX2+MORfToJY4Nf1VhlKdauGaelLKKvz7UuwudNJuP7aB9K7ZFVCgtlxPNm8TTqBbSmFsjt1YQC2mjlWLjoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710753925; c=relaxed/simple;
	bh=ToADIH9C8965kX1aw9z4kGb7cqCc0mtF1PEEcdmfkOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6zAwaJeeGnxUztxXB0/wZGrq45uom8CEjEOjp6IuTPaFrLtwWC0TGJSguCSTFoGqxLR73omb1Q61ucaJjTUsxLb7I0UzzK/VFVgfLgdZZdEOryqvuXFFU21GRRIYQWBiqVm5phHLQxjaqc9LRJI5XEvf4fimiWoa3Z4fNwXtiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60a104601dcso43055027b3.2;
        Mon, 18 Mar 2024 02:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710753922; x=1711358722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDDsZuVGry3J7S3ojcHN13IIRDfLH1PKLHN0S4b1Sgk=;
        b=IRUUtKK/3g7y45XEdcVLoGjc+dmnSZKktBpGHh4oXrY5+qdLJbfEBHCBgO5SDmWimZ
         O+pzMS5WTpQGmtiPkC6sQPbP/SxErqTaUjPOhg4GC6PVqU3EC7gwCtF5lSa5JpCGp5YT
         yH6+1d/bhWAhBzZvHBxw5i5pm/EPNwzvozOxU7PjUnh0QuCnl9sX7dmiAp7SkbFamhvA
         UtJxz3KwNia9BJOXb0bxPR0PgbfJy3ssywb9opx81sngKNJps6RAy7muv+xkK9eWpQyf
         6g2C84m0PAtWy5gYoC8iZ9tIv5j6eEeWBw7XVh1JTELy32rfNwX2V8WteLdkF4ULDCOO
         m6yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZZcVKy/O3xJL54pGvM7ZGyLh0MHzRpmDW1qknPXqnRLaitgajMLgli++ZroF1HGqJxo5ueKAMjicmCz6HxTKrCjAmmVSFXeIl+Y6l0rjHeup6quJXg44JmrMmdq0iF+LwHdbPTHbJmYdRHvA=
X-Gm-Message-State: AOJu0YyIaAvJCdQQRDru4h/OnGy4N7biccKMcTEvo0aDLnu2f/YREex7
	W7tCiWzdrH6jjz+GvruiZvZDJJUdAW+32OXxGg+85MGiUTOcwfQ/9RQyxzWQKVI=
X-Google-Smtp-Source: AGHT+IEttlT1+QgozAaKZns1snGf1DfCeDQfl7T8gPr6E7htTz29AsrT6VEhUoSYZOe0QhwjI84XkA==
X-Received: by 2002:a0d:e607:0:b0:60c:c340:4d87 with SMTP id p7-20020a0de607000000b0060cc3404d87mr11110455ywe.15.1710753922485;
        Mon, 18 Mar 2024 02:25:22 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id q13-20020a81e30d000000b0060cccc8a7b9sm1711404ywl.69.2024.03.18.02.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 02:25:22 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-609eb3e5a56so44241827b3.1;
        Mon, 18 Mar 2024 02:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSuc+7/Y5UfE5VIqozBvaiv0c9AKR45JUqYD65IdGiyi5TqEblgA2MkhXUOTRmqz55PZAfMtBgFh4DcZilpCcRWy8VGO8HY4mZLqJ71bIO0QmFmqsoZ0qHu87ftA2a+j6kTtEO0n8T5QzCuXM=
X-Received: by 2002:a0d:d946:0:b0:60a:4f:35ed with SMTP id b67-20020a0dd946000000b0060a004f35edmr10629128ywe.24.1710753922079;
 Mon, 18 Mar 2024 02:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315183921.375751-1-biju.das.jz@bp.renesas.com> <20240315183921.375751-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240315183921.375751-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Mar 2024 10:25:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5ZWOXuWc+thDTJ6+h7mcH7o+N6tVLhhkH=TKG2BZC6A@mail.gmail.com>
Message-ID: <CAMuHMdW5ZWOXuWc+thDTJ6+h7mcH7o+N6tVLhhkH=TKG2BZC6A@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Huy Nguyen <huy.nguyen.wh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Mar 15, 2024 at 7:39=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> The RZ/G2L family SoCs has 10 PIPE buffers compared to 16 pipe buffers on
> RZ/A2M. Update the pipe configuration for RZ/G2L family SoCs and use
> family SoC specific compatible to handle this difference.
>
> Added SoC specific compatible to OF table to avoid ABI breakage with old
> DTB. To optimize memory usage the SoC specific compatible will be removed
> later.
>
> The pipe configuration of RZ/G2L is same as the default one, so reuse the
> common table by renaming usbhs_default_pipe[]->usbhs_rcar_default_pipe[]
> and changing static qualifier to global to fill the pipe configuration
> data.
>
> Signed-off-by: Huy Nguyen <huy.nguyen.wh@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated commit description
>  * Dropped usbhsc_rzg2l_pipe[] and reusing the default_pipe[].

Thanks for the update!

> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -363,8 +363,8 @@ static void usbhsc_clk_disable_unprepare(struct usbhs=
_priv *priv)
>   *             platform default param
>   */
>
> -/* commonly used on old SH-Mobile SoCs */
> -static struct renesas_usbhs_driver_pipe_config usbhsc_default_pipe[] =3D=
 {
> +/* commonly used on old SH-Mobile and RZ/G2L family SoCs */
> +struct renesas_usbhs_driver_pipe_config usbhsc_rcar_default_pipe[] =3D {

So why rename this to have "rcar" in the name?

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

