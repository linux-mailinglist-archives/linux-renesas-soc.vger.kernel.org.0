Return-Path: <linux-renesas-soc+bounces-16639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8711AA713D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 14:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF65C1BC8518
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 12:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0612505D2;
	Fri,  2 May 2025 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsH5tofQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980C24BBFD;
	Fri,  2 May 2025 12:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187638; cv=none; b=Fa+uraGb8BzBVV2Lfy7DU8H3ihmn/srZGE9G4JcFzKn2mb8dEGNzzeXnm91T0gvBjNKmVw0J4fh+vWJ4JUGquxTps84EGHIgI6kvtyG41skgLdzXesGq50AqeNUH/Omi7WFMC/NXevZxHajVLHKxZWyyxM0PXC8/LjPRh78szik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187638; c=relaxed/simple;
	bh=M0e2nNsOyisoCgzoHNCzUyhHenfAvi3DA60KqQg27x4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gcun0vKpgKJ9Yids3CR24yww7/dXaJZi4vfwb5ztAnT1S53LIn9pyOCA8bIcIbvbvkWSXmricXqqhudfbLRpFiyCZBGSIZoM5QY6brNL4d49y9tOf46r8BRUcJEs/WaCSQZd2M4l2AJEM1ABUAvGW1tSvETjXCxFjh7v4kHuj08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsH5tofQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so21004235e9.1;
        Fri, 02 May 2025 05:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746187634; x=1746792434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rgNkZ9mACrHBZqehar2nVDjLj65HAeli8fMJrpgfgM=;
        b=NsH5tofQq0X58/dXNhHCg3aJ82tIaBJWWWoRttLq+9y86mFsvQezPC/dQID+yLwCbQ
         wIQHoSWnkN+F9XBNsCn+ZzogFBT/0fkb8ptELVZTVNKdusHlLZ++hB0l/tZKdW5paLl5
         4OpHMJfse72quMLMikQPsLHF3g/kV0CtA3cXTGAZehrbzO1ynXPUA9IDmp10luv1y9Lw
         UBtXqOk7B+VLmRTF5Nl1+b9SHyk1M8DCmTqM646xtRpY0o/m8mNO5m1P6p6vxHuqHw2z
         dIM5gVwRj5HzL1Arzy68E94d8Q28d+YcOEXBW7jS4g60fgM+J1eWISOLGmTUJp1ClnbJ
         RApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187634; x=1746792434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rgNkZ9mACrHBZqehar2nVDjLj65HAeli8fMJrpgfgM=;
        b=wJa7s4DSxvJsMTFlFUFW4I8clCJgQC0xNPhK45JRHr9wu8aAhB9J/9fHQN57ezKYsT
         xzQ62dxgfmHns3IdTxSiJcYx4Ok2tjYnk60k92yArO98z8pUKrO8mr6+NBD/R27cJ74i
         CwsRdViKueUYNVXAzZLyWy+twZfNjD57r9pSku/SOuf/ZWsRTAPk0QI6ZiBsB76KxA84
         KLlRAv6D6uc5jpm16NmoVDARAzrVP6WRB7w4pkibxXrkk8UVfaEFHtO+8nbbL5uiRdIg
         hmNfSnToEX8Qv3ITHnRifEkCed3XiF9YXrYSQAs0h6lybGVrYO6oQBqAK2x1Ch5P7+uf
         JsuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGppVGqnUCpCjdkKGXXpZvcOGfA5pwzds/AU2aNVMR3uTGiw725csk4Ra73KGaN2iOhkLEMqhpGmrE@vger.kernel.org, AJvYcCUdVSX1hNOmx6s0k1IuRTIihSGHPN1T+1/AJblx4Iw8lyvgy8O19MOcJvUhTFNuNUb22fyr5Go+tGhMUkye@vger.kernel.org, AJvYcCWjlY/lxa7IVi92RGpBzJftibNMm89486US0hi2TX1oVqWs2gcqpzmPW92tph/6leUIjzHG1BQNkSxiDAh9a9aa0lk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7XMg5BC2MKnq+jevInp6dwkKAH4eHcH61gRdNWkCDUcm+zFKA
	cUxuHUdo+A5JrlINDa8reGsgSjI8mv98/DLU8ABn5mrnjILdd5RzDis24lh4Qq6BDhxdxuSLBvm
	VlP7hs0m7qDnd0dVbDJroAEcDVv0=
X-Gm-Gg: ASbGnctNoUfgePJq08BUEySotOffPLa7xxWQSvBtKOhyiA+p1/arKY/6+LYPuVxTjMa
	rglOtgP3CdRF9iVstnQc5Vumk7rT7f+GxTtKGjA4YiNFB8G2YYgZL9iUzs/mQmVMCUMDwE9YX/Y
	PtQ+nzZgRCtQBG+fbh3Wvo2YM=
X-Google-Smtp-Source: AGHT+IG7KvwtY+fAyvBOxFwEDzVqGI1LaVcoOaUFi107MbB8iN6ojKgoX5BnPbLTFowGo/R5psaH03J7RqO1MUbSm+0=
X-Received: by 2002:a05:6000:2289:b0:39e:cbca:74cf with SMTP id
 ffacd0b85a97d-3a09815877bmr2287432f8f.6.1746187633746; Fri, 02 May 2025
 05:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
In-Reply-To: <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 13:06:47 +0100
X-Gm-Features: ATxdqUHUbZrCuHG6LsgfD0KsnguPDclXPpaPdX70W3hLnuLJ0SMY1WBzujOGSiM
Message-ID: <CA+V-a8unYCmhvcOhz19WbN_OH5BctPLhGH5ofZeMzSk_r9CsfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clocksource/drivers/renesas-ostm: Enable OSTM reprobe
 for RZ/V2N SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, May 2, 2025 at 1:02=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 1 May 2025 at 14:37, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add CONFIG_ARCH_R9A09G056 to the probe condition in renesas-ostm.c so t=
hat
> > the OSTM platform driver can reprobe for the RZ/V2N (R9A09G056) SoC. Li=
ke
> > RZ/G2L and RZ/V2H(P), the RZ/V2N contains the Generic Timer Module (OST=
M)
> > which requires its reset to be deasserted before any register access.
> > Enabling the platform_device probe path ensures the driver defers until
> > resets are available.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/drivers/clocksource/renesas-ostm.c
> > +++ b/drivers/clocksource/renesas-ostm.c
> > @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
> >
> >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> >
> > -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> > +#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057) || de=
fined(CONFIG_ARCH_R9A09G056)
>
> What about simplifying this to a check for CONFIG_ARM64?
> The only SoCs which don't want this are RZ/A1 and RZ/A2, because they
> are Cortex-A9 and thus do not have the architectured timer, which is
> mandatory on ARM64.
>
Agreed I will simplify this to CONFIG_ARM64.

Cheers,
Prabhakar

