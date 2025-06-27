Return-Path: <linux-renesas-soc+bounces-18841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FFFAEB839
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 14:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A3DA5623A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 12:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98422D979B;
	Fri, 27 Jun 2025 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5m/FJ6J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51583264FBB;
	Fri, 27 Jun 2025 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028865; cv=none; b=iI1YRwlxj8zFisYYsOv3eWZ2j6UgiyYdBgQc/cNcmrs7lbDI1P76MtVgjLA2VdER9OGWOazo4oP1xBI8Sd+JXHYlgRT1sDBRLzrQ9Z43GAnYjDGqYlgIbXr1aQHbx3tTwoAytB9+m+2yMusBqgb8CEWztY34cTK9YmpV3pscXk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028865; c=relaxed/simple;
	bh=CsVnaF/Eh3p9OwhSPjGCnz0lOWWPvKUupyYNi601i1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUY0ZEYbSCPZME438DK6T8qOWJCcHMTqdp6fedG0AktgW2dr8WuwXEak20xu0+yPMSoAO0CdOAUfvyN+JfOISeTKy6tm5mSCqq6B/vRYogNrN3gNAv7OPH5Rrb3Je3vw1hxZgTDV1o6zb5SCs2rMXHlIWjgAIkyyeefcjD/JpWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5m/FJ6J; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453647147c6so23391855e9.2;
        Fri, 27 Jun 2025 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751028862; x=1751633662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaJ3Cx6DcSgbse+UDo1cFmYk+teUuZEfclXtMnc3Iec=;
        b=b5m/FJ6JrVE+ScAfNS2yDYoxtC0KYKDBENlNEmCfgfHDQ2K6qLZnrHfq53hIek0ijW
         Va+xnSZgEsKJ65DftZUujNWiDVghSj2zkB/YtLTluUJM1DXSlOQAVzCxzdNvGbYnmw5I
         Tsozq5WNk8PH1auqTVJ9qk/C1QYUatJTwdUpQkoXn7FAptMHd+RwyqfhZw+Qt3R8czEI
         QEieALltu8Rl3nN4sb4827H8utF+GMm+FMdL/odQeQ8mTCczlg6Q84zeLvEobw89EESY
         I9/s5XL7N7+bnwxrMZscg0SE9+SRsfwG8j1DKy92l9kW7mueADzu1R0jDZ9BgGOP+m03
         8JAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028862; x=1751633662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaJ3Cx6DcSgbse+UDo1cFmYk+teUuZEfclXtMnc3Iec=;
        b=ti0XmyAJyCA5aHMehOXyREKgNoESjVI+VpfwgvqiPU+BAV0Pti5zUitNQFKOdipGqW
         6Ni6hbbBKJoKYyOOLyYyzVWsjM5ExiEQ30v6V3lxzR2ITaKqx1dZkEUsuJWfOaenE2BS
         wLSscMWhZxlCrkb0FICXcWT0ETTwnuS1qybnfkxV1M+WKwglcurRtls/QPxXeOzCIsBD
         NZ2y/FmiEMxgxhwLkQd1IqttZKX40rElwSKtfoIG76ftjGI0yx0EyOY/nPqO+b5jBufN
         3wvUC2laGeGKNwpUeEzxeUikEyJrCB8E6nArCPf3Ce+H7r/v/y8Qze34YF8LMElxphia
         0bWw==
X-Forwarded-Encrypted: i=1; AJvYcCVGfXs7strlNQ94DPvHuSMrTw28ZoMezWdLq7h/dmIwGDTLwXcLvF7qSSktlcx6igp6AM8mhTfRD9TojyzbPI8jC4Y=@vger.kernel.org, AJvYcCWHL/pRy2nlREbkRPF0W7+X/WLa3pvEma3RY2hhIiMsJ1cyHLtvSkmz6qH2sWHike9OOi0RlhyKAA4DU2wk@vger.kernel.org, AJvYcCXit5iz76v6hzTphYed1Vq8pB1B+MBGFIfdr6Gk1Lyz2N40ljKOhd3VxXFOeSpwW4OvPrMILq7FOT9T@vger.kernel.org
X-Gm-Message-State: AOJu0YyXzQxoTcIIbOJasp11/dPKhefmRQ0TGVhSxFSfV6EMbBBR8rly
	ymtxvi/riaabH2NVvnE2koJV4PfF9dSAbeWPdwNiEHnJn4ufhffg80XKvuj4goRCleJMVlMYg1z
	u0JuQx4ZCgMxQth3HGvXPeE4P/kMiSGk=
X-Gm-Gg: ASbGncssNKJMNIka7qxyZ2LzFxhIH0MEcm7/wvYDKoJvfSdum4GDoDH2FSeX4gjLL2r
	yrR/H8qUwDxi2ByKqRc27/Qnk+Bm1XchjabIG61hwcuDqi4DbNT3VZbSVaiAFkeGP351SZJE/Kx
	3EU5jRNuEJVx/AaGelD5nUELQe/ZolbFkFOdjGA1iUpFx+OunzYVOUxFBRv/EHXBkWeIPwaw92P
	B0=
X-Google-Smtp-Source: AGHT+IGfXhJYyRHcjfBzH3E/Np7+WxNYEs/xRPKs+t1hrWzSZI6HjdEh4sxpFfRuFAr4vLNu0c2ndW3IV75njl2FMgM=
X-Received: by 2002:adf:9d81:0:b0:3a5:39a8:199c with SMTP id
 ffacd0b85a97d-3a9186566d4mr2664298f8f.53.1751028862280; Fri, 27 Jun 2025
 05:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWFvRJoa9uhmUKYaMTB=eAYURfSJ6ebekDornY5O5aLXw@mail.gmail.com>
In-Reply-To: <CAMuHMdWFvRJoa9uhmUKYaMTB=eAYURfSJ6ebekDornY5O5aLXw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Jun 2025 13:53:56 +0100
X-Gm-Features: Ac12FXyaV0N2Ji6yym-tyLlWm1nqp4jELVVzRhl43VsKlnpvxJBV2_ZYETXP8tc
Message-ID: <CA+V-a8v36ygwPhLjkcgDUrRgU-f6BLSeL0J90QOmrvMi8iwFoQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: dts: renesas: Add I2C and SDHI nodes for
 RZ/T2H and RZ/N2H SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Jun 26, 2025 at 3:26=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 25 Jun 2025 at 17:30, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > This patch series adds I2C and SDHI nodes for the Renesas RZ/T2H
> > (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The I2C/SDHI nodes are added
> > to the respective SoC DTSI files. Additionally, user LEDs are added
> > to the RZ/T2H EVK and RZ/N2H EVK boards.
>
> Thanks for your series!
>
> > Note, these patches apply on top of the series:
> > https://lore.kernel.org/all/20250617171957.162145-1-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/
> > https://lore.kernel.org/all/20250617162810.154332-1-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/
>
> FTR, the LED patches also depend on:
>   - Adding the pinctrl nodes,
>   - Including dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>,
>   - Adding RZN2H_*() macros.
>
Oops, thanks for pointing this out. I missed to mention this dependency,

Cheers,
Prabhakar

