Return-Path: <linux-renesas-soc+bounces-15204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1EA76AFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 17:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C0F616EBA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55B11DE4E3;
	Mon, 31 Mar 2025 15:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFlfOs7K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C933BBC9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 15:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435459; cv=none; b=OZS7xjOiEchF8Ytj4iO5jyOqS19dxVjr0K5YEZm+kRWNiAYliL1fCMawfwxmNbv0n1Hr/Dg1kg1uP8Jp50KihafpOjlArYiIu7G9JWh8/JDEvcfou65ohhaJWOtTPOXYX2ndONXuKS3a4coUecruiDOcFqRQ4q8FLbG60TW2CwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435459; c=relaxed/simple;
	bh=NkAGkcT5EGjzZ3gWFX4m4x7J4ACvSVUo92hVctQd02s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YX5Pef3EeenBFfcU66wKt/lzOg8kvVgDcqyvT3sJ8U5p9xnt735cxpIGIa4DQFufdBImId5ZdUPA/8IOQNFjS81+77JlfHikmfPy3XTrKcrqDsq4zVoprhWER0weXOwL7XyeThJtWPi6RdNIMiq7PzzLpK7oe4FB7Rb4W7XUch0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFlfOs7K; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5240764f7c1so1808824e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435457; x=1744040257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/Ac/EpowwJD8MG3+DB+uJIzrp3uuzp0Pa2SzPeeelw=;
        b=BFlfOs7KBHWzeSG/rjI8URpL3cwV8L1vQhcSzxvFd70wEo5BeenagkgjqSj0beOivw
         cZh2E2G6kTELMxalIpkktIWC27/7QI4muNeEsieLB/imjaaTwZRPnFNKFUqCUQ25eOsC
         AMoE1v/pZOkj9E/GR+Nt/CBztZA7OEO+YUXOJxxquebJnHkGOAiiKIZw7EBeKdT4w1yT
         hSW6FgO4a+TVRGtqOhd8IRwo1QkahANigpKy+qwq/rW7cUaX1ZLJ7Zl9AGta8UUayug9
         NMIOdIO87TejQ4uAkmE4KHMf0nuWKLzH64Gk0DSPugOhsPl9LUjdkkQyGrG4d0rXRCsj
         JZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435457; x=1744040257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/Ac/EpowwJD8MG3+DB+uJIzrp3uuzp0Pa2SzPeeelw=;
        b=bc0Ulns3WGlTnCZ45U+foqxxxsIAk6bkx0Mo8c77WqauTPuAsoji12BQ6IKKFSoK6h
         J366eaxpjtPll3lxri0UkgfvQX+2FJ+Ss7NSHfurjhkhUsh62UYXvnNrpKx8EG2CV7F5
         8cQKEcFxhSbioB5n01b4dR630XzyFYjF9az8jWOexX8osQECAFS/RKS0LaOWEDoVTkuE
         Pl8DCekmcarsYUuoI2Tgy+ozA1c00sVAdJsRQJ2JmX3Kr0hi+Qi3JJjfT2bbPOWZFWXH
         5/jQoQ0mXeuJNzlDNMHczMgMNHCLjUAtyLwRU8Ebsb7Z0xV3MocaQak7qQrQjKml6x89
         spbg==
X-Forwarded-Encrypted: i=1; AJvYcCVN8mvQ4w2moepLD2rn7CMHFKOl7dtz8I89qGUCGpXX+V41EehqxNk6Uj2zCJfVDI0XhR+eTaFykK3TvMbjUVFSsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLe/y+07i9t9Hqzp6DvIXI9954OXStWcUx0pyD35HtizLNap+h
	vMuxRqwp3Kpi3mBj+6UFkqMjREg3W9egknPOZHIxuslfekqubZQqVgFA8Za50xmLhlF1MJ2ic3I
	XhJA7TsZ+ul7Fveqp2xOhHMRzTRk=
X-Gm-Gg: ASbGncvampYLLuz1TyRU5qVX667KoQexGf3SlpIBZM/qXiyZBfPi1xYeSGBfAcX/VUi
	RlAROheTHvQsJ31mA98qaD+igiJOe6cr9qRFIweVP32bPg4UfXlaWTpK2jGpr7KPgOzk3b96lDf
	J7YfsoMeWunDE/eyG80fIfsV+2vQ93uIuctNXnDrKiE+CvY1QXICP3u9V2sUk=
X-Google-Smtp-Source: AGHT+IFUnloCR3R8B66qsjEbDzRnHmnu5XvMMuIjXFHEAh61ZMK+Tn4RR+Q/ZdXzMCYipNG9n6TcDOjouJaM4IgGJFo=
X-Received: by 2002:a05:6122:3c8b:b0:520:3e1c:500f with SMTP id
 71dfb90a1353d-5261d49ee68mr5319826e0c.8.1743435456835; Mon, 31 Mar 2025
 08:37:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVC0HzvB9EPKTev8Y6ioB6GfE-axEgzK52+SVj5hGnMUQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVC0HzvB9EPKTev8Y6ioB6GfE-axEgzK52+SVj5hGnMUQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 31 Mar 2025 16:37:11 +0100
X-Gm-Features: AQ5f1JrTjvsr70lEIOPHD0peu07Go30V-bet0UA6lttqiI7tpCMC3_4pm6xlmoA
Message-ID: <CA+V-a8uvetHu1nvigA6s5DNYPKMq5iC6=UEnMLy=z+83nQ8acQ@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Mar 31, 2025 at 4:16=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 27 Mar 2025 at 20:33, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable various Renesas SoCs by default when ARCH_RENESAS is selected.
> > Adding default y if ARCH_RENESAS to the relevant configurations removes
> > the need to manually enable individual SoCs in defconfig files.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -65,17 +65,20 @@ if ARM && ARCH_RENESAS
>
> Note that this whole block already depends on ARCH_RENESAS...
> I forgot about the reason, but commit 8070ba6348608aa1 ("ARM: shmobile:
> fix build regressions") reminded me.  This is also the reason why we
> cannot open the block for COMPILE_TEST in general.
>
> >
> >  config ARCH_EMEV2
> >         bool "ARM32 Platform support for Emma Mobile EV2"
> > +       default y if ARCH_RENESAS
>
> ... so the "if ..." part is not really needed for arm32 SoCs.
>
Ok, got you.

> > @@ -197,6 +216,7 @@ if ARM64
>
> Note that unlike on arm32, the arm64 (and riscv) block does not depend
> on ARCH_RENESAS, so the "if ARCH_RENESAS" part is needed.
To keep it consistent would you prefer `if ARM64 && ARCH_RENESAS` to
be added and then all of the SoCs can just have `default y
ARCH_RENESAS`.

> In case anyone is wondering, on riscv we definitely don't want to
> enable ARCH_R9A07G043 by default, as it depends on NONPORTABLE.
>
Yep.

Cheers,
Prabhakar

