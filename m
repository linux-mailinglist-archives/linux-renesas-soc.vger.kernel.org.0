Return-Path: <linux-renesas-soc+bounces-9531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB76C993586
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 19:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56D591F253F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 17:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398D81DDA33;
	Mon,  7 Oct 2024 17:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTCQ9N3V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D40F1DD555;
	Mon,  7 Oct 2024 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728323947; cv=none; b=d8ut4msotvjgE5ZFOw1dYQT2+sIQxK29Y5mTBBw2BnuW4cxu8c4PuIHDejBxtyOdf05RgfIDEKXQeZFnnGS3Lc+B6mVRMF98HPhe9lNwhNV0pSlTA9boAmVinxexZLlMQQLzOHLKcVvGPLHPoUTkD2KJ+mRrIhR3z+HEeFtzkhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728323947; c=relaxed/simple;
	bh=FXKrG49bVb06zM4nNsH7Q/Qpve+cpSTaRgk/aCMCp6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgNdUOi54LwsK3kvOgHlDXFa2qYsDeWV7Af30eN4tGYg2Y2H8Bn3V4WV/iNUtCt64yRE23kmuXRHcb8q25RDpVDXiwy1aupqqQQWdn+/eCkIMLBB+eo6RzqUwlRsSdjsKAa0Ydh8DlJai4CDr4mXZj6ycU/8qKHnqFA1p9zeQ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTCQ9N3V; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-50c9f4efd09so730896e0c.2;
        Mon, 07 Oct 2024 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728323944; x=1728928744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dz6kMFPDLpbpA1HA6wUl8Ll4T4b0UJJt9pVHu8+V+vk=;
        b=FTCQ9N3Veb8INkUOGQVwrw+mLU8jTNSvXCU/87SoPhmgujHVhFyTaOCuRLQxYFNtrM
         nNPyvMGHexxKx892b4WgKOQmEj20+8L23ymTa3dn2DQBD8icM7mvG4hNZY1pvLNGzIeV
         gNCJHmOlxkBM/PwB7rMdfWNIkc3IzG0iRpp0LWNjq2Ie0ZKL8F+i3BgsN/6wLl1fX+V3
         6omlhwl1Dq5q+jsx7JuXrZGhcT0iuoaPNslbfZM5ILSs4YY1vMYs6V+/7Ht0UbNs2j5v
         8mkcCUXyEaLbghdVCmbDRVTr1+zN34VnC50BvJYR8OzFanSAC3zJLllEQgr0pvwxVhmO
         mh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728323944; x=1728928744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dz6kMFPDLpbpA1HA6wUl8Ll4T4b0UJJt9pVHu8+V+vk=;
        b=BljjAWxwGPMFlVMG8YZXdQ0qtPNq5tq8SwU540w6rezYVkfT5kQfvXHwFvwJJD7Ysv
         kSZJC2TFgoNarqgjwhisbFncESWIM5D+5iACH1recofJiEV3clJe450UV/JhTuh3ANpg
         AziJVeMIk66ZDQ4FKxEL2rElrxppRzEKO8aqz7V3fr90xDOTDVeHZW9sbNm6a++4WcwH
         uBqsBjEplzC5UJrID8ysl5uWMCao4A966KxMrvz5gHP2Z7LNgUvZM6oX30vogfi2i/1n
         G43ift0iXgTEIhn28yUItTzCbO5TvlAbsnUln8X8LNtK47QZ/kl7ewfj8/W+H9i2ANZ5
         ZDYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxn66YDg3GHX5CTROunzWZaQX5oAoOtVxNwP9PGTYZ9Ln6D7ewObqBWQs79fp8XzgyRsD/gdj5wa8E@vger.kernel.org, AJvYcCXsjr1NKDqFpeZSV4J8IzECn4UW7uC9W22p+Z/FrwyjDGZ9TX6wcElcf8HKvFsh2uZmprG9OFjCVQNp8FfJlCYn/Jg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS14lq/Xo/bsplMJ9mjNq6niQYEX8horO3ga9ZZeTBlEpWO6go
	5GsZ2Kndb/xDU4WrMR/bGqVfSxkbMLZ9PWFpHEVmRm7ffX66xeXeC5USdNyHlzbD59dcKYGqnon
	rwNvCpbnK+jSfoVdwH/MQD/KawAI=
X-Google-Smtp-Source: AGHT+IFdUvIuqeJIn0ca072HDTdq2rPVz9lHXmQzTtWPU4g8Er9NPZhVh0VwfHhC++PtjTfOXfvUj9gbLQyaCHWosEM=
X-Received: by 2002:a05:6122:2003:b0:509:e7d:b7b2 with SMTP id
 71dfb90a1353d-50c8545f147mr7956455e0c.2.1728323944531; Mon, 07 Oct 2024
 10:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <a8610814e31d0562732672f11d2be1404322121a.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <a8610814e31d0562732672f11d2be1404322121a.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 18:58:38 +0100
Message-ID: <CA+V-a8uJfeBatDMBKwx4mj3SfcDUrnhYGDKOg0D5aa5kidt_0w@mail.gmail.com>
Subject: Re: [PATCH 06/20] ARM: dts: renesas: Use interrupts-extended for
 video decoders
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:27=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 3 +--
>  arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 3 +--
>  3 files changed, 3 insertions(+), 6 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/=
dts/renesas/r8a7790-lager.dts
> index 47ffa278a0dfd79e..752feea087afbc93 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> @@ -402,8 +402,7 @@ adv7511_out: endpoint {
>                 hdmi-in@4c {
>                         compatible =3D "adi,adv7612";
>                         reg =3D <0x4c>;
> -                       interrupt-parent =3D <&gpio1>;
> -                       interrupts =3D <20 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio1 20 IRQ_TYPE_LEVEL=
_LOW>;
>                         default-input =3D <0>;
>
>                         ports {
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boo=
t/dts/renesas/r8a7791-koelsch.dts
> index 1a0d2c6ed0e83ce7..e4e1d9c98c617883 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> @@ -434,8 +434,7 @@ adv7511_out: endpoint {
>                 hdmi-in@4c {
>                         compatible =3D "adi,adv7612";
>                         reg =3D <0x4c>;
> -                       interrupt-parent =3D <&gpio4>;
> -                       interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio4 2 IRQ_TYPE_LEVEL_=
LOW>;
>                         default-input =3D <0>;
>
>                         ports {
> diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/d=
ts/renesas/r8a7793-gose.dts
> index 5334af25c10111c8..2c05d7c2b3776525 100644
> --- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> @@ -418,8 +418,7 @@ adv7511_out: endpoint {
>                 hdmi-in@4c {
>                         compatible =3D "adi,adv7612";
>                         reg =3D <0x4c>;
> -                       interrupt-parent =3D <&gpio4>;
> -                       interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio4 2 IRQ_TYPE_LEVEL_=
LOW>;
>                         default-input =3D <0>;
>
>                         ports {
> --
> 2.34.1
>
>

