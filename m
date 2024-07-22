Return-Path: <linux-renesas-soc+bounces-7408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 496E1938E1B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E76EB1F21BD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B0016C6B1;
	Mon, 22 Jul 2024 11:36:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FA217597
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721648175; cv=none; b=V0e/YnFUA8uCQi7guMncQ/KOjl3TNDQiOWbZfOpCf+BpH5W/TNxG0Z+ar2J9kMR6du5orL/vWAJtCEtH6USLXeowkmZ45CPlz8jfN+LkWaL93Ksl4R/c423D0/xi5d1/lgwFmmsd7ALbgYWZXN7lBmIJfEwcYyppoV/GOinmlS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721648175; c=relaxed/simple;
	bh=KNrCQlH/uLWxaJRmaUau+JTh0iwHCPF55QlGmTEWVCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btCuhigdCRYRQYOi0kacQDZ/INQBsNRntGBcOu2++N8RflVmu8w9spdA0Wt2VusQ+mKYjfxXK4/bjNG6aqxk6hNwm0QqJodXwDIlhchvy94Zj16xD3wBnIRB1BuQIqO6hTBUFCsQ/DDyckd9G8gS4pvs6MwLbB8UPV03DF0+vGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6694b50a937so31705317b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 04:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721648172; x=1722252972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trBxW1zbNAD4GJYbmM/X6M6pR5uxsPplVtqgvGSEuIQ=;
        b=Z3WwC5vKiVayyRBcXAckJbIut14hg72iTqCgeZBDxFpE0nrScmGVhAoSD43xlkGPuM
         kwC4STh9HHQQVifTru7QByGRvvwRqESJUWpv+P9dbhijiuplVvs58DROzeEGAZkijLNP
         vn2igB9obaWIWOEMZcEOJYHTrgqXarjU6+h2KGkLj6WbAnOKTkEphxoYWYE/lCOCSgIe
         R4s0V6e/58xZMj46HwRuJgovgR3uL3KbbHLsQyVzWufapCETr+adEps2urGqBrMFZ9fQ
         +cqj29NzqfAjCaDJgsNIlOT30tCurlboUUlxsk3VOpiL2EaM8dsQPxIeygUjrPC2CUy+
         lQNw==
X-Gm-Message-State: AOJu0Yx3Ho+mYwKVjUAEpmyExZXJLJ8Jqz3M3uxjWf9N8hib5bDqLoAJ
	mdXhBAq4k1CwPUe+oSBW85SmSe6DBwWy9XAJIKN3dfsEVKHTZ/tOlBDM6b1O
X-Google-Smtp-Source: AGHT+IGLNoaRKAT3ADCi6HrrNUesJvPCLqSLUGD/fsKSHmmaMl41VP/TBB7YHFW2+2Ptd/kqlVW5TQ==
X-Received: by 2002:a05:690c:6604:b0:646:5f0b:e54 with SMTP id 00721157ae682-66a682cbfa1mr112495957b3.8.1721648171878;
        Mon, 22 Jul 2024 04:36:11 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-66951f727f3sm15880157b3.22.2024.07.22.04.36.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 04:36:11 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-65faa0614dbso42578047b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 04:36:11 -0700 (PDT)
X-Received: by 2002:a05:690c:2f13:b0:615:10f8:124a with SMTP id
 00721157ae682-66a6a417054mr79066537b3.29.1721648171469; Mon, 22 Jul 2024
 04:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ed8bbae7.wl-kuninori.morimoto.gx@renesas.com> <87cynvbadm.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cynvbadm.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jul 2024 13:35:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUsFkVO8oB19j=LitzRRCdbW5i0b2T1tx4Y1X6coXk=g@mail.gmail.com>
Message-ID: <CAMuHMdWUsFkVO8oB19j=LitzRRCdbW5i0b2T1tx4Y1X6coXk=g@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: gray-hawk-single: Add Sound support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Wed, Jul 3, 2024 at 2:13=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Because V4M supports only 1 SSI, it can't use Playback/Capture
> in the same time. It select Playback as default.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch^W^Wthe update!

> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -59,6 +78,24 @@ reg_3p3v: regulator-3p3v {
>                         regulator-boot-on;
>                         regulator-always-on;
>         };
> +
> +       sound_mux: mux {

"sound-mux", to avoid potential conflicts.

> +               compatible =3D "simple-audio-mux";
> +               mux-gpios =3D <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +               state-labels =3D "Playback", "Capture";
> +       };

> @@ -139,6 +185,29 @@ eeprom@53 {
>         };
>  };
>
> +&i2c3 {
> +       pinctrl-0 =3D <&i2c3_pins>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +       clock-frequency =3D <400000>;
> +
> +       ak4619@10 {

codec@10

> +               compatible =3D "asahi-kasei,ak4619";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12, with the above fixed.

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

