Return-Path: <linux-renesas-soc+bounces-7091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D299927D0B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 20:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0F531C221C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 18:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7005713B5B2;
	Thu,  4 Jul 2024 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLHRDdFX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E12213B2A9;
	Thu,  4 Jul 2024 18:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720117708; cv=none; b=hlPcrp/xpy5yUN5oLTxKKsFcKgt8z+NQGOj/MbUtvT0L+h+LVkrks6r3G59Ft5ZHZ5QKWL0UCz8N2dvJ3ycO3CJT/uP4j/KnlpXwdMcRIbAn4k3xQKgRBgMEddlmw0vn48nufH2fPXjXgiwCo9gfsrCHzVYCwMztw7MgLV6s1Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720117708; c=relaxed/simple;
	bh=ql3NJLqLvGGjKh/ENYL+RT8GUzbEEpLQsYLo5p4RuLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3WlTL8sDKxFwvMcgcAy+XZKTZ4pEUOVDsBpKw7GFlGvoRNCOKa8JmnH1WX8mc6qhxi1fB6Bs70DPERZu8Hobu4RCIrR2NZmGiFoQq/BBVPgoU0MY4p4Whf2P2NW5IaQS4dyAgi61A5kt9qwC4LGySLXDZ6Mh3QFNR7gkQV1XRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLHRDdFX; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4f2e1093abeso334201e0c.1;
        Thu, 04 Jul 2024 11:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720117705; x=1720722505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41UyELOuWm3D84QeHs4TWRy8/vIfZ61Eerp9KOgoxnY=;
        b=CLHRDdFXYHz92HIWSW//hTL6q4fSk4aX7J8MhElom7QUvLcmHjCM/LcVViV51iAlbx
         0MkqEXi/9GDBKwsbFa7uONXMfvkhbEciqfPxW7QhAV8AzqaC2oKS8Try8cFy8zdONwyQ
         h+THMwqX7+mgDc0aKWHkvZxhiUou/dq6YZtiwHHzq5w7IVqPcMT373W5efYOdwsshTaM
         MeNN68Ga5payQ3pchScR2bPWklHyT1ptdWA2+6uj8kGd0cQs972/xfZJOLSkVW9CUkHH
         O5lE669wf0oK1Wx1Nwd+MIszmDQZi461J8eESWhImw6bwiIfsqIbPFyoUfv6zXfvMFJd
         qRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720117705; x=1720722505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41UyELOuWm3D84QeHs4TWRy8/vIfZ61Eerp9KOgoxnY=;
        b=cNrMrRhuUKRh6pp/6hXicxxj/S+AEqii9p3Gh00Tfli+gUud6HMk+KYQmHYKMs3z+5
         P2IJMp/Z0IygfvTTfhBnhBYZqBiF+je6eRB3/N4wjZLZIm+mYvPG9xAW6yzx9S6159eA
         Ube1IZ0kON6AU7dHJI3+pbr/68KCWhZqHJGsXLs4jitIQXoAIx0OzAhlQYu83MLkaqug
         j0I6qHNhNUTdS+Bg/lkpnUwQNSpgzQG1Nn5RL4lfrk8wErEEvY9QnF6UwlW4VFOK3n96
         z1SMpYydW+ZFecJPQtOGXejF42JjXJ8/s2nbAndmqyeaDjmSODYxNqKi4rsgLcOqIwy3
         pRfg==
X-Forwarded-Encrypted: i=1; AJvYcCUZg42eFGvB8WOEV5rF1/UXRhG55caBM6DpPsohSqqa2STZ8MA5PHNwB9t9CTf9p6XRziCExKxlaET/Gnz3ZTrOe3RxcNOaoT8dJXkdEGPpY7xdJklKEn4zpQ+75n9JEv7OH/QskdwUgZGftaXtYhuuKrdjjkBZ5eiBY/38gki6HLAwuhkov7lTwqxvOHa2Jjhhf8oDfuBi9BRP6Qe0uCL2PBBSeIsq
X-Gm-Message-State: AOJu0YwdT49YX6qJOEFyxVcPZPbVt8afHzUZEPbG/lk4GDpVIAmRIvTC
	VO2+K4T8BvCCkFRA9+lXYHSdvEgTG2UPkoJi6jYfPNTwigH7pQXp0lc+xQYGj+mFK8zTrPrT4yi
	ogXIartRt9V8kDywt9SOzbaE5tcE=
X-Google-Smtp-Source: AGHT+IGHCsmRte6KVDKNJur2+3AVPLn8c/jfknG1Y5A+vwTj64aZLTaFtfyia5arJXQL7aA/Oh+DetF6OU7OJMYVGAo=
X-Received: by 2002:a05:6122:4205:b0:4f2:f331:b34d with SMTP id
 71dfb90a1353d-4f2f3f2c267mr2938863e0c.7.1720117705232; Thu, 04 Jul 2024
 11:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626132341.342963-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <ZoUb_olfaVapoYBi@shikoro>
In-Reply-To: <ZoUb_olfaVapoYBi@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 4 Jul 2024 19:27:13 +0100
Message-ID: <CA+V-a8uJ-jv65fK7=XYtMvCCiEbFKcRHW3xNj8SQd2TJ++43QQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Jul 3, 2024 at 10:38=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Jun 26, 2024 at 02:23:39PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
> > of the R-Car Gen3, but it has some differences:
> > - HS400 is not supported.
> > - It supports the SD_IOVS bit to control the IO voltage level.
> > - It supports fixed address mode.
> >
> > To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g05=
7'
> > compatible string is added.
> >
> > A 'vqmmc-regulator' object is introduced to handle the power enable (PW=
EN)
> > and voltage level switching for the SD/MMC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Can we have an example here? I can read DTS snippets better than YAML
> code :/ Also wondering about the "regulator-compatible" property but
> maybe the example makes the problem clear?
>
You mean in the commit message or comment section? (I had added below
in the cover letter)

SoC DTSI node:
sdhi1: mmc@15c10000 {
        compatible =3D "renesas,sdhi-r9a09g057";
        reg =3D <0x0 0x15c10000 0 0x10000>;
        interrupts =3D <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
                        <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
        clocks =3D <&cpg CPG_MOD 167>,
                        <&cpg CPG_MOD 169>,
                        <&cpg CPG_MOD 168>,
                        <&cpg CPG_MOD 170>;
        clock-names =3D "core", "clkh", "cd", "aclk";
        resets =3D <&cpg 168>;
        power-domains =3D <&cpg>;
        status =3D "disabled";

        vqmmc_sdhi1: vqmmc-regulator {
                regulator-compatible =3D "vqmmc-r9a09g057-regulator";
                regulator-name =3D "sdhi1-vqmmc-regulator";
                regulator-min-microvolt =3D <1800000>;
                regulator-max-microvolt =3D <3300000>;
                status =3D "disabled";
        };
};

Board DTS:
&sdhi1 {
        pinctrl-0 =3D <&sdhi1_pins>;
        pinctrl-1 =3D <&sdhi1_pins>;
        pinctrl-names =3D "default", "state_uhs";
        vmmc-supply =3D <&reg_3p3v>;
        vqmmc-supply =3D <&vqmmc_sdhi1>;
        bus-width =3D <4>;
        sd-uhs-sdr50;
        sd-uhs-sdr104;
        status =3D "okay";
};

&vqmmc_sdhi1 {
     status =3D "okay";
};

Based on feedback from Conor, we cannot use the regulator-compatible
property. This would require us to implement separate drivers (one for
VMMC and another for VQMMC), which I believe would necessitate the use
of regmap. Currently, this seems unnecessary for controlling the two
bits as a regulator. As Geert previously pointed out, the PWEN and
IOVS pins can always be multiplexed as GPIOs on the RZ/V2H SoC (as is
done on R-Car devices). Therefore, I am inclined to drop the internal
regulator support for now.

Let me know your thoughts.

Cheers,
Prabhakar

