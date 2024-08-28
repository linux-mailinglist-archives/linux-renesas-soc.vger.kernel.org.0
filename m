Return-Path: <linux-renesas-soc+bounces-8468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6E96305F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 20:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2452C1C2387B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 18:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34971AB531;
	Wed, 28 Aug 2024 18:44:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDD51AB513;
	Wed, 28 Aug 2024 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724870646; cv=none; b=F0F56SMgv6JBCL5LIkiDJSFy6w6lVZHQm9lXI1aCybWp9cXMpNjbTENRT80+a2TXQKJNLLpbSl8PAInaDa6Py8LX8bylQ/jGzCMC6a03AvLNTgnXlw32YO4f7weFlZxwv7OHoNHbZ+5HU2p6OIqExohiYrxgW+OHElhGQyj1HCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724870646; c=relaxed/simple;
	bh=hOoJA4wlH5BQlozAM/3N+kXtXFls9aSVHbyz/5TvkUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HiE7hqG/0JFeZ51cqdXBasHLouAXQ12pGnAvMH1ucA+Mjuv169XUqTtfws3Mn+xhFOm/zfoYYcTPvytkExDGc5dMqDCHWfohmV4m536LWYvTxnp8TdtwpK5id3ijjUHGO683ejAzEe/mTiCur1KRsej8JPUp3hXfJtfmekmSMb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-69483a97848so67869387b3.2;
        Wed, 28 Aug 2024 11:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724870642; x=1725475442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cOGJ/h9n/M5qlOvvYFIX1VCI1Nk6x0h4HYM+M/M8j4=;
        b=Uc4/3dMV0ea9bLil3ye+WulWnrJJ4FnjLq42iK6Tzdap/YnbAZqfFvC4u/pUUxoKnV
         0sBhWxovuRNPA9sUcBCWE1/fNgUkXrJdNIJrGOMYqpROchGXEeHFt9vFWQc6FJA6pOjW
         o9mrTTiJfK3UQPGv8wI4NK6T6RECXJRQkRvG2VqbdI/iugkybPIJnQqNFww6G1a52og2
         lX+Pg15ZUi50sKToqS4uGDW8gHptLW0REJ1NiIKWGXef2vpMYGo4HQ5XvLxbO6avtLYy
         6qcqDUPfazf0YaTE2hMB65bD/R9lVPewgwUbneoyUa6ub7V0RgI6A98Rq49VH7qZ5zyZ
         dY0A==
X-Forwarded-Encrypted: i=1; AJvYcCU3H8BiAGI9eV4jWa/bh1UXVARqSMtkCIHRWPJGFoO8/peVXbnwoxq1NDRlJTNsqR0ppmbWEXBpu/m1ZuRQ@vger.kernel.org, AJvYcCVYVi3iZQ3XRQOq9pjau2d5bZSkLZot2bHufVRfL06bkFo8U03X7V2L/U5MEbzoK/Ez5K1yXdYT4+lv@vger.kernel.org, AJvYcCXxG170BOL77bWC4m10sg2i3EuSt+U20ud6aombD9f5pdaRDs47BHY7V0uLNKqfAMFFDrN3nDfQfgAt1TNuJXAS8vU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjX43PFh036rE/M7/IPygZg9Tb478Se4TCXg16Nd72z29Cvuzs
	7emelculzJp9yoSEfEWYW2k9hJDk3FHhserFW7yIXfNV2ds7+6zNYbtZYwcA
X-Google-Smtp-Source: AGHT+IGzVJTUFPZ/6UZh9OLyV8DkFzI4ZBF5m6OKAqv6P3DaawxHIxOg/TzrebapycZt9/rryuhBpg==
X-Received: by 2002:a05:690c:6d11:b0:6c2:1c5a:d5c8 with SMTP id 00721157ae682-6d278147feemr2956637b3.45.1724870641736;
        Wed, 28 Aug 2024 11:44:01 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39dd475d6sm24456087b3.123.2024.08.28.11.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 11:44:01 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6cf6d1a2148so28330767b3.3;
        Wed, 28 Aug 2024 11:44:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4d1FP0j0FKjiaZHmh4datBvwaPBAaT0ql0YhIWsBzWtozPyrtlZnMUtJDsdclObZg38rR104Th5guA8ah@vger.kernel.org, AJvYcCUZHub1wQd7J6vRGUMPV9LGJa1khCyz5kEqwbvVZ5OzkPP9awXYbYN7/RENt11CM1NwX2u/RajakGDQ@vger.kernel.org, AJvYcCXXZU5ryiqUtSIWhWelMpJNd0Es3iO7t2CHm5wxTAnJeLpb4RrIf+y3uANXTKFXCWEf/xWe7DSILfg3824WMrhR0bE=@vger.kernel.org
X-Received: by 2002:a05:690c:2f0a:b0:6b0:d9bc:5a29 with SMTP id
 00721157ae682-6d277a7927emr2781537b3.32.1724870640567; Wed, 28 Aug 2024
 11:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1721999833.git.geert+renesas@glider.be>
In-Reply-To: <cover.1721999833.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 20:43:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUApN=Jk6rqLo7vdALLtVxah5sZuUbSpjhct3vYdu67Lg@mail.gmail.com>
Message-ID: <CAMuHMdUApN=Jk6rqLo7vdALLtVxah5sZuUbSpjhct3vYdu67Lg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Add Renesas R-Car Gen4 E-FUSE support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srinivas,

Gentle ping, any comments from the nvmem side?

Thank you!

On Fri, Jul 26, 2024 at 3:38=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> R-Car Gen3/Gen4 SoCs contain fuses indicating hardware support or
> hardware parameters.  Unfortunately the various SoCs require different
> mechanisms to read the state of the fuses:
>   - On R-Car Gen3, the fuse monitor registers are in the middle of the
>     Pin Function Controller (PFC) register block,
>   - On R-Car V3U and S4-8, the E-FUSE non-volatile memory is accessible
>     through a separate register block in the PFC,
>   - On R-Car V4H and V4M, the E-FUSE non-volatile memory is accessible
>     through the second register block of OTP_MEM.
>
> As the first variant is quite different from the other two, and there is
> currently no use case requiring support for it, this patch series adds
> support for the last 2 variants only.
>
> Note that the first two revisions of this series implemented only basic
> nvmem support, and a custom in-kernel API, mimicked after the
> fuse-tregra driver.  Then, Arnd told me on IRC that the R-Car E-FUSE
> driver should use the nvmem framework fully.
>
> The fuses' states can be read using the nvmem subsystem:
>   - In kernelspace, through the nvmem_cell_*() API.
>     A first known use case is reading tuning parameters for the
>     Universal Flash Storage controller on R-Car S4-8 ES1.2.
>   - In userspace, through sysfs. E.g. on R-Car S4-8 ES1.2:
>     / # hd /sys/bus/nvmem/devices/rcar-fuse/nvmem
>     00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |........=
........|
>     *
>     000000e0  00 00 00 00 fe 00 00 00  00 00 00 00 00 00 00 00  |....=EF=
=BF=BD...........|
>     000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |........=
........|
>     *
>     00000140  00 00 00 00 23 51 23 51  52 98 52 98 00 00 00 00  |....#Q#Q=
R=EF=BF=BDR=EF=BF=BD....|
>     00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |........=
........|
>     *
>     00000200
>
> Changes compared to v2[1]:
>   - Dropped accepted dt-bindings,
>   - Drop "pinctrl: renesas: Add R-Car Gen3 fuse support",
>   - New patch "dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to
>     nvmem",
>   - Drop superfluous semicolon,
>   - Drop the custom rcar_fuse_read() kernel API, in favor of the
>     standard nvmem_cell_*() API,
>   - Drop support for explicitly-instantiated platform devices with
>     accompanying platform data, which would be needed to support fuses
>     tightly integrated with the Pin Function Controller on R-Car Gen3
>     SoCs.  It can be added when a use case shows up.
>   - Move from drivers/soc/renesas/ to drivers/nvmem/,
>   - Register the full register block that contains the E-FUSE data
>     registers with the nvmem subsystem, but use keepouts to ignore all
>     registers before the first or after the last documented data
>     register.  Undocumented registers in between are still accessible.
>   - Replace offset/nregs in rcar_fuse_data by start/end,
>   - Use __ioread32_copy() helper,
>   - Initialize most fields of struct nvmem_config in its declaration,
>   - Rename nvmem device from "fuse" to "rcar-fuse",
>   - Use NVMEM_DEVID_NONE,
>   - Add an entry to the MAINTAINERS file,
>   - Fix reg size,
>   - New patch "arm64: dts: renesas: r8a779f4: Add UFS tuning parameters
>     in E-FUSE".
>
> Changes compared to v1[2]:
>   - Drop RFC state and broaden audience,
>   - Fix typo in one-line summary,
>   - Add Reviewed-by.
>
> This has been tested on R-Car V3U, S4-8 ES1.0 and ES1.2, V4H, and V4M.
>
> Thanks for your comments!
>
> [1] https://lore.kernel.org/cover.1716974502.git.geert+renesas@glider.be
> [2] https://lore.kernel.org/cover.1714642390.git.geert+renesas@glider.be
>
> Geert Uytterhoeven (7):
>   dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to nvmem
>   nvmem: Add R-Car E-FUSE driver
>   arm64: dts: renesas: r8a779a0: Add E-FUSE node
>   arm64: dts: renesas: r8a779f0: Add E-FUSE node
>   arm64: dts: renesas: r8a779f4: Add UFS tuning parameters in E-FUSE
>   arm64: dts: renesas: r8a779g0: Add OTP_MEM node
>   arm64: dts: renesas: r8a779h0: Add OTP_MEM node
>
>  .../{fuse =3D> nvmem}/renesas,rcar-efuse.yaml   |  35 +++--
>  .../{fuse =3D> nvmem}/renesas,rcar-otp.yaml     |  17 ++-
>  MAINTAINERS                                   |   2 +
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |   8 +
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi     |   8 +
>  arch/arm64/boot/dts/renesas/r8a779f4.dtsi     |  12 ++
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |   5 +
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi     |   5 +
>  drivers/nvmem/Kconfig                         |  11 ++
>  drivers/nvmem/Makefile                        |   2 +
>  drivers/nvmem/rcar-efuse.c                    | 142 ++++++++++++++++++
>  11 files changed, 230 insertions(+), 17 deletions(-)
>  rename Documentation/devicetree/bindings/{fuse =3D> nvmem}/renesas,rcar-=
efuse.yaml (54%)
>  rename Documentation/devicetree/bindings/{fuse =3D> nvmem}/renesas,rcar-=
otp.yaml (60%)
>  create mode 100644 drivers/nvmem/rcar-efuse.c
>
> --
> 2.34.1

