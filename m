Return-Path: <linux-renesas-soc+bounces-9978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 049229ABFE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 09:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79C46B23ADF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 07:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D02214C5BF;
	Wed, 23 Oct 2024 07:13:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF62814C5BD;
	Wed, 23 Oct 2024 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729667608; cv=none; b=RY1vtnx0nY7wXwPgGea2Ko6/+tyIo+6ekGCpK+Ie7uucBRnZTyE5FMLHCgIWxbQH0/xYDGK0G9yRdK/B1zvlFyW/Slp9G8ljsFsTipIMX4eFaOg59oLwhF+rfiuh4gacKfsM8+P61qrFOoJICh1PV3gL716HfmeUUXrmLut5S2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729667608; c=relaxed/simple;
	bh=g3fRDGBRXtuoJU+m52RH4KA7qu6/emCxqoWPgTrgyD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+Ysh+ICrTQi0c1RtqcoNcVq1ip9LcsUQz3CJlJ5GnP/iRZKccda75sMEgPzpAzUI5Fc8qvKyVjx/pZ/xOQgvqNTgSBJTUw9WL/n8eYP011j9x1TKkV7p2bg9LuO/m1DQMJp41vHu4NmWkXlwX0Qk9MYhnzVnPFWgdaaAqBNDYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so50243427b3.1;
        Wed, 23 Oct 2024 00:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729667604; x=1730272404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buZmOWPffpNhw64jjqBJYO5lR7bm4nckM7nvoDMsE34=;
        b=axl4j0Qpajl3zEpIc6ZSlnbvthjw0N2C6TTk4LuoVjH2HxNqeNHOY5wBaKLdtObM0+
         y7YMuKr6CGvhVTS8SrjJQ2FdpcHa+nGd8gp2HMGJdHkBexTjZxffVvBWgMfw1pyVfHx4
         HLVvBJqLCnTaz4Sts+lriydK+96GQJ05EI8ekNjUf+t8uHykGQYdyAuqNL2kyP3lhaCU
         yJzRxhWEg+3dnZww31lMKW1yPCt3ahKhhz+yrEC9oaFWHQTZaKVg68V0GMoQetrQzAnF
         Dp9rpZHRkG+THgvO/LrcpM1dUHNivMfgEE0Dn5nGoqIIFFOUuXpBGztYXpbH5qPO6mt5
         M0nA==
X-Forwarded-Encrypted: i=1; AJvYcCUVaMD2TNkoyMz7WphzNaGFA7SAVLxnxBXjhCvj16aNrY5fJIrt0a4QDb0NGS24EvV2m7udTvGqut8c@vger.kernel.org, AJvYcCXA9KakZBd2IjLJMOZrQk2l2Gfsc/6uHjKTZOQf4ETVlwbc37VLPGyPMS5YAU5WGu6s9fTeZAjoSrEpEoadHKxE+Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4FOLLXQTr65tnvZnO+p3s8cVo1/PH/0jefPB+fN9CoiRTgRfV
	cR/pTFlar/VoLXs4uMrH4SsYiPdZu46TattCvC+0mX1jr0H91/W4yCrH0tX6
X-Google-Smtp-Source: AGHT+IGJUqEzlBUhXPO5VUFya8bBkDyavJlzT5PzYG+5CcoWFMJSgomiOcSyUtcjTNw3ex0djSh+kA==
X-Received: by 2002:a05:690c:350f:b0:6e3:32e2:ecbf with SMTP id 00721157ae682-6e7f0e66042mr17250187b3.24.1729667604376;
        Wed, 23 Oct 2024 00:13:24 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ccb428sm14323037b3.78.2024.10.23.00.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 00:13:23 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e38ebcc0abso71967747b3.2;
        Wed, 23 Oct 2024 00:13:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwnOsIfKZ37S28GzxwhK7usA3UWOo4PXcN/3KSXTn7lTMKo481j++spJQh2OFAITxxS+81sRajyz9UIfJ5j1oEAMs=@vger.kernel.org, AJvYcCWvqcGvR6F5MOmH75AM+rc81MDXeP9++Rvuab0uInUVbRJo+oTybt0l2vqGhYCyY2oQ7WzlmiNvS8yq@vger.kernel.org
X-Received: by 2002:a05:690c:4087:b0:6e2:1467:17c0 with SMTP id
 00721157ae682-6e7f0db9866mr13547347b3.8.1729667603177; Wed, 23 Oct 2024
 00:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022184727.3206180-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20241022184727.3206180-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Oct 2024 09:13:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+4PdxnRCzr7fnHnGYiuypem1hYMbXLac+x2db7yfpkA@mail.gmail.com>
Message-ID: <CAMuHMdV+4PdxnRCzr7fnHnGYiuypem1hYMbXLac+x2db7yfpkA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: falcon: Wire-up Ethernet
 breakout board
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thanks for your series!

On Tue, Oct 22, 2024 at 8:48=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This small series wires up the Marvell 88Q2110 PHYs found on the Falcon
> Ethernet breakout board. With this applied all five PHYs are probed
> correctly.
>
>     mv88q2110 e6810000.ethernet-ffffffff:07: attached PHY driver (mii_bus=
:phy_addr=3De6810000.ethernet-ffffffff:07, irq=3DPOLL)
>     mv88q2110 e6820000.ethernet-ffffffff:07: attached PHY driver (mii_bus=
:phy_addr=3De6820000.ethernet-ffffffff:07, irq=3DPOLL)
>     mv88q2110 e6830000.ethernet-ffffffff:07: attached PHY driver (mii_bus=
:phy_addr=3De6830000.ethernet-ffffffff:07, irq=3DPOLL)
>     mv88q2110 e6840000.ethernet-ffffffff:07: attached PHY driver (mii_bus=
:phy_addr=3De6840000.ethernet-ffffffff:07, irq=3DPOLL)
>     mv88q2110 e6850000.ethernet-ffffffff:07: attached PHY driver (mii_bus=
:phy_addr=3De6850000.ethernet-ffffffff:07, irq=3DPOLL)
>
> They can be auto detected with just the compatible
> "ethernet-phy-ieee802.3-c45", but to keep the style currently used I
> have added the specific compatible for the 88Q2110 as done for other
> SoCs.

If the specific compatible values are not needed, I prefer not to add
them, as DT should describe only what cannot be auto-detected[1].
Have you tried kexec and/or unbinding/rebinding the AVB driver
(the latter is probably easiest)?

> The primary issue we had with this in the past was due to an incorrect
> PHY address. After studying the schematics (v100) I found the PHYs
> address pins are wired differently on Falcon compared to other Gen4
> boards. On Falcon they are pulled-down, while on other Gen4 boards they
> are left unconnected and subjected to the PHYs internal pull-ups. This
> gives the PHY an address where the lower 3 bits of the address is
> inverted for Falcon.

This was changed in v102 of the schematics (REV0043c vs. REV0043b of
the schematics for the Ethernet sub board): See "Changed Strap pin
settings =3D=3D> PHYAD=3D[0,0,0], pull-down removed" on page 1, and the
various PHY configuration notes...
Moreover, this might be different in other board revisions, as the
BSP uses PHY address 1 for RAVB1, address 2 for RAVB2, and so on...

As I only had remote access to Falcon, I never knew the actual board
revision I was using.

How to handle this (yet another DTS file)?
Are non-v100 variants widespread?

[1] In theory, we could drop all SoC- and family-specific compatible
    values, and just look at the Product Register. I do not suggest
    going that way ;-)

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

