Return-Path: <linux-renesas-soc+bounces-7601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA9893FDA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 20:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494902836D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 18:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20AA186E2D;
	Mon, 29 Jul 2024 18:44:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5521B16B38D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 18:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278688; cv=none; b=BhbQg9o3L79kWYEJqiSzdhNT4Eiv0v2MVfyQBv1xiDjLpMw1wDwHDP9v2sRj3Svg9RTMfToJN+2blrjX43Vkb5MQXtMXgSfbBNTJRkjlfPobFFOG0XEAkvRa1nh2S2c8AyFRU74SixxeTTP4+Xw4T+rfTKMMfAfXNIWW0qvksqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278688; c=relaxed/simple;
	bh=YcXPtdW7GQYMOBJsHJiIpl2gRnKsWKy63iLS/2O/Y+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8wv6g2/v8Y8VbxQb7Bg9JAvD6QhNhxOF7oRzdVp6tmgWgHJntl/WUZSQiz083SxLs9QNa6Poj/rsLlPjUzeM4SLzJ3F8uwzgkFNJnVtvPaHgcWuETL6YjYpZxo6otztKH/5A68NDf08cgnwzYH/kcj0qgdI1H/3l182CQQaeuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-66108213e88so23829547b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722278686; x=1722883486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwauv5cuPXab5O2pygHJnj/j7CRSVFFF+LNOk7kJaVQ=;
        b=VXEkJR+diIHQS9XD/nNtKL87d8TQZFXWPCQKFStb3nDOeNYokcb3f+PU2RuaIJd+oP
         Ws65CzJo5MmZmYrJ9Yx9xWjhhQF9BpDr9W4mX4/bF9xz/IjgHQzUdSyvDaHDCwRhwsy9
         cD9Zugv0clD9Cjsqd3JfBpYBAR+TR83sAN62P3VX4ci57bOEnei0c7M+kojBlT3ptGCk
         +5Eo7xfboD0XVnQ7SQMmJ+VajttK6aWl6km4y55TChCWd3ysiezUIYeoYnfpiG43/GXj
         HxS7lSgnBIIAQwBACRBBwx7hp8d31EUqlsaE0N3lsz3vUObSLnLaYyPkr0AXOCEUZ5tD
         ZWig==
X-Gm-Message-State: AOJu0YyUsILwgZl0gkNn/HOWr/ksxPMJZ7QWTBgQbnAalmp1kyjJDBK/
	tXsxgNE3s3EV0G0OZjvtIT5ZXAZQMERxYKIXOzfasqA8NPO7qo/0wXTWObM+
X-Google-Smtp-Source: AGHT+IFG/pwRJ/EjHT3ukCw5vTB3GT04JaWp14c6lneLOzjWU4e6svWxW8VoNovYRlFEcrytu4ke1g==
X-Received: by 2002:a81:9e0d:0:b0:650:a5cf:ef5b with SMTP id 00721157ae682-67a0a7fb78emr100030987b3.43.1722278685936;
        Mon, 29 Jul 2024 11:44:45 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-67566dd9059sm21615927b3.28.2024.07.29.11.44.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 11:44:45 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6678a45eaa3so23944207b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:44:45 -0700 (PDT)
X-Received: by 2002:a0d:cdc1:0:b0:664:c24f:c248 with SMTP id
 00721157ae682-67a09593b9bmr99252477b3.32.1722278685558; Mon, 29 Jul 2024
 11:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com> <20240725194906.14644-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240725194906.14644-12-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2024 20:44:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7Z0i4HnN5dsPB2rYiZBfCjZaLic8KHXZ_+eqDkTASDg@mail.gmail.com>
Message-ID: <CAMuHMdV7Z0i4HnN5dsPB2rYiZBfCjZaLic8KHXZ_+eqDkTASDg@mail.gmail.com>
Subject: Re: [PATCH RFT 4/6] arm64: dts: renesas: r8a779h0: Add TPU device node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 9:49=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add a device node for the 16-Bit Timer Pulse Unit (TPU) on the Renesas
> R-Car V4H (R8A779G0) SoC.

R8A779H0

>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779h0.dtsi
> index 000ea93d65e5..e12935eafff3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -1023,6 +1023,17 @@ vin00isp0: endpoint@0 {
>                         };
>                 };
>
> +               tpu: pwm@e6e80000 {

Move before spi@e6e90000...

> +                       compatible =3D "renesas,tpu-r8a779h0", "renesas,t=
pu";
> +                       reg =3D <0 0xe6e80000 0 0x148>;
> +                       interrupts =3D <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_MOD 718>;
> +                       power-domains =3D <&sysc R8A779H0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 718>;
> +                       #pwm-cells =3D <3>;
> +                       status =3D "disabled";
> +               };
> +
>                 vin01: video@e6ef1000 {
>                         compatible =3D "renesas,vin-r8a779h0";
>                         reg =3D <0 0xe6ef1000 0 0x1000>;

However, TPU does not seem to work...

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

