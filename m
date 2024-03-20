Return-Path: <linux-renesas-soc+bounces-3956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE371881342
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 15:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C71F1C226E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 14:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0EB481A7;
	Wed, 20 Mar 2024 14:23:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7BB481A2;
	Wed, 20 Mar 2024 14:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710944618; cv=none; b=bsC2qpRj9Na6tRLFRKp43/dHK2IFOBLP5LYBE0rRV/zxybb/vt9amLubPXGy77JHkDf59z6DA5GCtQvXlotiV2t3eL5EhVO0zgjXD+T0akTIoX2N784NUK48nob4+HLi5tVvN/LIHzIAmYAJgQB3TRRfvtB7VBMtpH/kfL9rhKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710944618; c=relaxed/simple;
	bh=u/FEtNBnV4qJYDHn5Zcye76U0Q+azHE9cHup70WDcVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iync/iQDoL6lqEiqFXRTmUsOoQnRqawYk/M2ixoFabQjh7VlHAkHBw0Im7tUkyar8GNuo5vfY+ZCJqiAy0k17aLfq8+T8QJFu28tjjIqxH8JyLzBTmzO51kK0ngdndLOmSCOJHaFWiPiiOX64M4yGK5wh9wVdRd+82kWvj88+CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60a046c5262so65485567b3.2;
        Wed, 20 Mar 2024 07:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710944615; x=1711549415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcHU7XXwKbcnS7V1Mvtk/zIVFT9mMkbdkLy1nzkDgP8=;
        b=h33Wcgr8tQCE8PV9LDNU5uJvQpO2Lf4u2V5R3G1GJQzQXBBb451iCNuB/oF923ToJo
         SE6Fqf5Lhis8t4LlSlfnDHLPIQ9ghcIkH8SZ/PXOBsVddpq8oJo3ARyKZzIs7gdcLmHD
         ctMYm7iH+xv2RjaV9wAxz5UCWIZiiwxT0ebrCt2oP2Xn1KAvURbJO7gilw7mMNoSkAQc
         PClK/8+kzT2LF+AKXRlg9r8GZPlI2S+TBnlF5EhLH3gQyb0bmKYh8peBmVStmvjbAHrU
         KOHxHDxortP3h0qdbNq4BGoteCykDC1L+OL3BfNsCvJ0n+r12l+OzT0fBNNdJrV6wfWB
         DJjg==
X-Forwarded-Encrypted: i=1; AJvYcCWHagsMmE0EYFtvOd0f9zcDkxkK6mXUCGCpu2mN7krHuuwHl/cYGvQgGWzTLjwUVut1NTDa1NCnDcoEYOUYwHgFcDv7/7Iim2g6KNoqIgSNtxk2+mwxbdG02Zx76DhYYqD8wNyKbWSIeVDbyKCl
X-Gm-Message-State: AOJu0Yw3UUFw435UyrVuvAmVEF9nUiNXsYfmgPJqwBSpZmXKX4W3lfyM
	j4K3Zf222sb+7Li4p/kgDSCIULx3pkZJIRpkBM53bs69MED3OIkFECc/4ROYPdM=
X-Google-Smtp-Source: AGHT+IEcjwsLJYkFrVHiE8XVx6YUmDg4la88dWGsv9Inqye13N4mLsD+94mGWmkpIrjRRqvvKXzIsA==
X-Received: by 2002:a05:690c:2e0e:b0:610:e34e:1184 with SMTP id et14-20020a05690c2e0e00b00610e34e1184mr4840824ywb.7.1710944614748;
        Wed, 20 Mar 2024 07:23:34 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id n24-20020a81af18000000b0060a1f3267e2sm2855010ywh.42.2024.03.20.07.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 07:23:34 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso6403493276.2;
        Wed, 20 Mar 2024 07:23:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWs7o2dHZqEg98GvLkXD/9Lk2qcKqga+f5UOhuDI7GgH+ZTPn5scT/Vvc0fIx8xII5faVbSPVWnxcouBCsPKZFnyLR0N6xNP8rDZ/R3p8W9CusTPNHxlXZDG8kcMZDbjZyIoXLcAIjLGv4Mnoxm
X-Received: by 2002:a05:6902:cb:b0:dcc:53c6:113a with SMTP id
 i11-20020a05690200cb00b00dcc53c6113amr4748405ybs.59.1710944614236; Wed, 20
 Mar 2024 07:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309155608.1312784-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240309155608.1312784-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Mar 2024 15:23:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTps9L8AY0AgA5YCdxC83_A-FuLXP9X4gy2fNfgiRx8w@mail.gmail.com>
Message-ID: <CAMuHMdVTps9L8AY0AgA5YCdxC83_A-FuLXP9X4gy2fNfgiRx8w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: white-hawk: ethernet: Describe
 avb1 and avb2
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thanks for your patch!

On Sat, Mar 9, 2024 at 4:56=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the two Marvel 88Q2110/QFN40 PHYs available on the R-Car V4H

Marvell (apparently the schematics author spent too much time with
Spiderman and friends ;-)

> White Hawk RAVB/Ethernet(1000Base-T1) sub-board. The two PHYs are wired
> up on the board by default, there is no need to move any resistors which
> are needed to access other PHYs available on this sub-board.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

> --- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi

That is arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi, as of
commit 1b940d036d5a2235 ("arm64: dts: renesas: white-hawk: Drop SoC
parts from sub boards").

> @@ -6,6 +6,50 @@
>   * Copyright (C) 2022 Glider bv
>   */
>
> +&avb1 {
> +       pinctrl-0 =3D <&avb1_pins>;
> +       pinctrl-names =3D "default";
> +       phy-handle =3D <&phy1>;
> +       status =3D "okay";
> +
> +       mdio {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               reset-gpios =3D <&gpio6 1 GPIO_ACTIVE_LOW>;
> +               reset-post-delay-us =3D <4000>;
> +
> +               phy1: ethernet-phy@0 {

Given the large number of PHYs on the White-Hawk board stack, I think
a more specific name would be more suitable, e.g. "avb1-phy"?
Same for AVB2 below.

> +                       compatible =3D "ethernet-phy-ieee802.3-c45";
> +                       reg =3D <0>;
> +                       interrupt-parent =3D <&gpio6>;
> +                       interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
> +               };
> +       };
> +};

Probably we also want "ethernet1" and "ethernet2" aliases, so U-Boot
can fill in the corresponding MAC addresses?

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

