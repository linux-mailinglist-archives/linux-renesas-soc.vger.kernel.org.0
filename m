Return-Path: <linux-renesas-soc+bounces-2767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EED0F854A73
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80CE128B16D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB31C7499;
	Wed, 14 Feb 2024 13:24:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC6352F81
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 13:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707917085; cv=none; b=KTeWiYQHQ0gwG/mZX63ABAIfdIkQPauQjo+prdylAnt0amnykft+z1oGxi6COmdauL5nTYIB2x+NW4zkjUixO4Lj/BFUYxewTGco/K8xTLB2GaCIyr5GLPu+LVgQbE43RkWe1syymqWQabVcF+GiHh2i/TmTl8r2dX01g5bBNnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707917085; c=relaxed/simple;
	bh=58g7UR+DLMIKRMIAo12q2cZnDdR4APRgBAo6whD9cAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj/0606eCfTbjL6ji+9TXqz2+wCnCX5aKN04JA6UWJwHKCNrPiODffxzfpbi5Ea+/BpcThvuqvV6dDrLOQ+kp33rR13cVaEOlTny3aHXpmaseG+doBu4s98lcUGbNMHw/LWbOp9rp2wjDtlGN8fd9sAYWkLb5NaGugyhX8POV6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so4020515276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 05:24:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707917082; x=1708521882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3K7eR2BWTSlLbhhDD5NOXHC2b+dxfTrIWJmvEASMDKE=;
        b=oIyKY/rBX5xGey7sMyjKHe/Hhth9yFpgG1x1zLCYNUsFs9C6406cQFR3yE1YK5uTCX
         l+sbMq9lMjg0wFXOAtdq6n5HRNbzeQ8wbE7IkRnUsLemcXmXNxDjWpLhnnvV7UStyTSv
         5ZxWz8SEnXTMbYPU9dPwfCQ9kVZ5nTg/5vVeC3rQnmRoauTVdQB32u+M/HhRvqsWMeE/
         S17+3T11T8mflL808oAcNpmxfIxn/p3R33OmHWnPRo2bLVd9lAb/buDKlbUmiA1M9WYn
         DCttkolduPHHDToEPijxlxwhfbq1YRdKZVpZ4gsiYfXyRcFdeo57/PeqiPhXGfOSrU+Q
         erbg==
X-Gm-Message-State: AOJu0Yyc1fEpMFjUXHobvMnklsIeLCsOUWvj4sLW4olUWwbfGjnS26D5
	i3Pfkl4A0yEhzPaIi6Qi/xaC6pyEb3C/+9tq/imBeh97gxHzDJ1aUD7shvFW5Vo=
X-Google-Smtp-Source: AGHT+IFP5AO2xGSxe9zAqyeYIeKdHIRn053h2FWGm8EEegL4T6y6en8bdpYYZxah6ViuA0z1IXwraQ==
X-Received: by 2002:a05:6902:2082:b0:dcd:30f9:eb6d with SMTP id di2-20020a056902208200b00dcd30f9eb6dmr2451846ybb.57.1707917082087;
        Wed, 14 Feb 2024 05:24:42 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id w8-20020a056902100800b00dbf52d2844bsm2050378ybt.11.2024.02.14.05.24.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 05:24:41 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc742543119so4770346276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 05:24:40 -0800 (PST)
X-Received: by 2002:a25:2b46:0:b0:dcc:7ae6:12d9 with SMTP id
 r67-20020a252b46000000b00dcc7ae612d9mr2091579ybr.13.1707917080579; Wed, 14
 Feb 2024 05:24:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1707661382.git.geert+renesas@glider.be> <b83b21b6477a0e31f99eaedbd36c03014b72ec8a.1707661382.git.geert+renesas@glider.be>
In-Reply-To: <b83b21b6477a0e31f99eaedbd36c03014b72ec8a.1707661382.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 14:24:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=cr9JHuoHR8iO-ZJ6DL+KMAL2bMDZJ-8qN1+6=QD=cg@mail.gmail.com>
Message-ID: <CAMuHMdV=cr9JHuoHR8iO-ZJ6DL+KMAL2bMDZJ-8qN1+6=QD=cg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Add Ethernet support
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 
	Thanh Quan <thanh.quan.xn@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 11, 2024 at 3:31=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
>
> Describe the wiring of the first Ethernet AVB instance to the Micrel
> KSZ9031RNXVB PHY.
>
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes compared to the BSP:
>   - Split in separate commits for SoC and board support,
>   - Apply to r8a779h0-gray-hawk-single.dts.

> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts

This lacks the addition of #include <dt-bindings/gpio/gpio.h>,
which is needed for the use of GPIO_* flags below.

> @@ -34,6 +35,24 @@ memory@480000000 {
>         };
>  };
>
> +&avb0 {
> +       pinctrl-0 =3D <&avb0_pins>;
> +       pinctrl-names =3D "default";
> +       phy-handle =3D <&phy0>;
> +       tx-internal-delay-ps =3D <2000>;
> +       status =3D "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-id0022.1622",
> +                            "ethernet-phy-ieee802.3-c22";
> +               rxc-skew-ps =3D <1500>;
> +               reg =3D <0>;
> +               interrupt-parent =3D <&gpio7>;
> +               interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
> +               reset-gpios =3D <&gpio7 10 GPIO_ACTIVE_LOW>;
> +       };
> +};
> +

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

