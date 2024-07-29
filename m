Return-Path: <linux-renesas-soc+bounces-7603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0787993FDBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 20:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 393CD1C2231B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 18:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A59257CB5;
	Mon, 29 Jul 2024 18:52:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41FA186E57
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 18:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722279137; cv=none; b=fU6kPFXkrueLZeHvR2CoD5xUNe4R2onMMKboPe5oDBSENLfxdJgGkGlQ3VyBboja2U6s5ybndsYzoXf0gzlNooD0DQJRSbRBPew2vtXdQzj7NJ2eReYmE/2PehF43VSe0heMA2+BfPOMVuiY3J4ejJSAtCNyRjQHBp5J6eMKbik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722279137; c=relaxed/simple;
	bh=qRrtC8LV18pFrmlP2vrCvGYft1VqprBQdaTnYdE1ta0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZz9rbrPEcEl7LrV3sFrbH4gcGHrSnX/e+6XswOxbZlmjXqALqxTU1L/WzinBApKgB1r972Czv05t5xbU2UFcoUTEUE/Sk01XY7rL1D0iEjQsdTuCjTjErtsxMtI778GynIvdxVsnKqsSs7It/l3PCy0MWjFH/FVtHYsvaP6HdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-66526e430e0so24317637b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722279134; x=1722883934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWj02HWDqgkSgjjt7jvSc+6ap2JawyKdWSpwtkVBxfQ=;
        b=EoXBEbpUYLV7HzWctmG0LheTqsNL3gpcqpd566TAXhbkryl+xMOb+bq2DUAIXn5scH
         ST36G/RLBRDMxLDd1phEx5cykBSNTHNj9bt1wbn7Rrl8FYVTsMktgYPBK7WrwkHCSSNu
         lruWrsM3EbqlIXC5dObkraCd6y91QSVHqCFXohvjDqt4DKEGm5b17B3DoP+FO/oIsaKu
         w1bRwK+pWM5s+MZEwOW9y4NwXYNpaHFjyK1Z59GYV0fl/MVD1qUwc5fqMbjg6q/sB4ec
         GCPNHpiQ9ubICR/DFXNvIQKe+LB/8JbrTDnYRY2lc74DbhZeoLVSWk09ZYxFL5nUnDvo
         geJg==
X-Gm-Message-State: AOJu0YwrvOkzWrFs6Mdk0XoScn2wjSd6b0JfZh0ebbFmzDX7ZiKy7pVI
	S0pQQd0FS5p9zNj/JLUNHMUowMUCUdIKgtJpTMpAok83z9dhzFjPc2OtGE1/
X-Google-Smtp-Source: AGHT+IHTd/9jRPHVnRvYNzSRmM6WjatCzjJxZ7f+fMex+f5+23pFgGsYRdOxfuqphqs1TebSG6p3cQ==
X-Received: by 2002:a81:c30e:0:b0:669:8ef1:ff06 with SMTP id 00721157ae682-67a0929be7emr81349687b3.35.1722279134510;
        Mon, 29 Jul 2024 11:52:14 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-67566dda562sm22018687b3.5.2024.07.29.11.52.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 11:52:14 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-66acac24443so22821267b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:52:14 -0700 (PDT)
X-Received: by 2002:a81:69c6:0:b0:65f:645a:b3c4 with SMTP id
 00721157ae682-67a095958acmr93375977b3.32.1722279134133; Mon, 29 Jul 2024
 11:52:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com> <20240725194906.14644-14-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240725194906.14644-14-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2024 20:52:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMMU6FOXH8wCBy+biqAG4dqrQe52F5-TF9xw3Pogi64g@mail.gmail.com>
Message-ID: <CAMuHMdWMMU6FOXH8wCBy+biqAG4dqrQe52F5-TF9xw3Pogi64g@mail.gmail.com>
Subject: Re: [PATCH RFT 6/6] arm64: dts: r8a779h0-gray-hawk-single: Add TPU support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Jul 25, 2024 at 9:49=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This patch enables TPU channel 1 for the GrayHawk board. Only for
> testing, not for upstream.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -223,6 +223,11 @@ scif_clk2_pins: scif-clk2 {
>                 groups =3D "scif_clk2";
>                 function =3D "scif_clk2";
>         };
> +
> +       tpu_pin: tpu {
> +               groups =3D "tpu_to1";

sh-pfc e6050000.pinctrl: invalid group "tpu_to1" for function "tpu"

This group does not exist. I assume you meant "tpu_to1_a"?

> +               function =3D "tpu";
> +       };
>  };
>
>  &pwm1 {
> @@ -279,3 +284,10 @@ &scif_clk {
>  &scif_clk2 {
>         clock-frequency =3D <24000000>;
>  };
> +
> +&tpu {
> +       pinctrl-0 =3D <&tpu_pin>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +};

Both tpu_to1(_a) and tpu_to2(_a) are available on CN3004, but I didn't
see any PWM signals on pins 10 and 12.  To be investigated further..

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

