Return-Path: <linux-renesas-soc+bounces-8129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE02495C9D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 11:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67914B23B90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54F714AD30;
	Fri, 23 Aug 2024 09:59:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9795FBBA;
	Fri, 23 Aug 2024 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724407180; cv=none; b=FwLfxmrwW1JWQe1CtIebdkgjOujdQtfLyuiB80Bd8Blt98O9CMfZmTT8VjqMFGf8/CRcLFQ3nWdzmRMYF/jNJiREJmAweKCGIMvaiMqO0g0FhLnGH9+jsUnnkAqG37GCQmgTDvxlPRE4tkIyyfIRrcMKX/hVFF9XE512PuwK04o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724407180; c=relaxed/simple;
	bh=qA1upCTq85JBC0nlj9KDOvzgdSK22jPoFfgjPqpKjLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DneaEaXk4SdAnYEz5dFPb684ZcKlROtos1+D2JQUK+IY5NFoPIM04oQe6l1zwegdQysExZNu8ujpqOkra2JxW5KyF3O99+tc33KUzJkcP9vyOqen/cMvkOfzKgIqN+U56GEed2ypCor2oyh7oXn2vQ5LJunJqr35vJQ8s/TsuOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso1835809276.1;
        Fri, 23 Aug 2024 02:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724407177; x=1725011977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xb7U4fwtsM7F6TUfU4gnlT77+ZOKIuBXdT9S91vCiZE=;
        b=hgSa4Iffv80VHQdFosR2slXrIHWJaQZYwAnqoOM5f8kdhYAH8WGqqPge3HyjocR0u5
         E2V6EB+UqDMmGsGBGKAzOi0Bmpa/1FIVfEuzJmXkxi97wZKeCetzBQqGwjywnw0fnBk+
         +YJddP3jdy4ute/TMBrB8eTXjBhEMAECiN+OSSj5CxrnSzOyE+G6bhSZq1zq8xnE4f4H
         ReLbJqBhyPPn+mSo1b9MsHqbZxmjJtzJO+3JpDXhXisSlnWJjLbjiHWgc00yEXO/vnZC
         Vr7H2ruIcOcL/6MTbPzyEFNpwhqvjPy/7FOn5gMuy3GJEC0bFIry3e6kH9svsh2DCG6e
         RBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/7YoQ51AKQuD7ZkkYwkQzb51Y0z0D/yyVCZ6v4cdQnmdYU+SSlSvXIWJ62K/eAatl8W8N64b4OeKJCurcN1rfKKU=@vger.kernel.org, AJvYcCVIdySpWHckkJBOPjJKpNCQKK+ednJkABuLakZJa0hri4NUGiz/LaT2IrCPM7RIu2/Qgqo9kDXoXUwo6JA=@vger.kernel.org, AJvYcCWPgOUnamLYqiqX+PJBZMkFI3XIz0oseOU2pyhwmR/uLLKcG50CAo9GBJBfD+oDv75ras9XoYDcguNI@vger.kernel.org
X-Gm-Message-State: AOJu0YwjycCNpOZJziReolHYxO5EaFxc2KE+/Q6AedZCJGO2TYsoalSe
	iCvbnQO7NZX5mH9russLPKaEL7XT/T12GzWtAP64ek3a3OMB4tR54lVb6/qy
X-Google-Smtp-Source: AGHT+IF1qdvIfN67ch+DkCnuSIcTkS/MSF8mMr80A7XQMReopT9elZGgpjRDcdWTgFXN3Wa4lxiyog==
X-Received: by 2002:a05:690c:f16:b0:6af:8f7a:28c5 with SMTP id 00721157ae682-6c624418a79mr18098537b3.7.1724407176888;
        Fri, 23 Aug 2024 02:59:36 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c399cb4f82sm5026557b3.1.2024.08.23.02.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 02:59:36 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e116b591e15so1825511276.3;
        Fri, 23 Aug 2024 02:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/ot8PwlNaZQiNL5iqll0J4K5YO/1BjFuqounyPaFgFQS/2npZ0MP6z1BmXyOamaUiBVHvQMo6F24K@vger.kernel.org, AJvYcCUWGwVTnxASDGhzTyR0c8F82/LxPfrhY1ydXMRdtxv4ZJQYe5qG7fReDxMXoWNhNQ1Pgl06V2YN2j2265B05wAK0cs=@vger.kernel.org, AJvYcCW87ZsPsUFdWma5vbBSxMbPpbSjUpF34bMgu4ghuQSamDhdTypzSx0MAM23yEeXElT6whwhb7/6CruhjwE=@vger.kernel.org
X-Received: by 2002:a05:690c:dc9:b0:665:54fa:5abf with SMTP id
 00721157ae682-6c624418f48mr19808117b3.2.1724407176568; Fri, 23 Aug 2024
 02:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725084559.13127-1-biju.das.jz@bp.renesas.com> <20240725084559.13127-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240725084559.13127-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 11:59:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUi+++pYU3jDP2pB3o0mH8+UgnczDyrckKQzL59O92E0w@mail.gmail.com>
Message-ID: <CAMuHMdUi+++pYU3jDP2pB3o0mH8+UgnczDyrckKQzL59O92E0w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Jul 25, 2024 at 10:46=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Enable HDMI audio on RZ/{G2L,V2L} SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
> @@ -143,6 +143,13 @@ ssi0_pins: ssi0 {
>                          <RZG2L_PORT_PINMUX(45, 3, 1)>; /* RXD */
>         };
>
> +       ssi1_pins: ssi1 {
> +               pinmux =3D <RZG2L_PORT_PINMUX(46, 0, 1)>, /* BCK */
> +                        <RZG2L_PORT_PINMUX(46, 1, 1)>, /* RCK */
> +                        <RZG2L_PORT_PINMUX(46, 2, 1)>, /* TXD */
> +                        <RZG2L_PORT_PINMUX(46, 3, 1)>; /* RXD */

RXD/I2S2_SDIN is not wired on the carrier board.
OK to drop it?

The rest LGTM (but I'm no audio bindings expert).

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

