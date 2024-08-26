Return-Path: <linux-renesas-soc+bounces-8263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0995F0E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 14:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06284B23366
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E481862B4;
	Mon, 26 Aug 2024 12:07:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A50F17CA19;
	Mon, 26 Aug 2024 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674055; cv=none; b=qww5gwzkhFDn8gar38lETpN7ihyMnb9Y2u/pjMWYGlwqxHYGWzaayj58yhPQv7PM10w3Q798N/y1joikTwjLFBFxbmUdB7Tdd616XrlOHiQy2rH0vTj8YvffY3z2V+h9DlUW4rq1Y3/sTYoWP7vwVFPW9uLH56GMalOy0f1U4Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674055; c=relaxed/simple;
	bh=ZN1huKQyj1+aN3ELMw7liUgHgUzyqPFv5MYHmetXdBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sx36r1TC25s9v3r+3kjHdsmYFn5fICLjhiNP6qVGCPHRVoGDxYUOLOmhZ33OuTColGos46xkEywoCxIOySGcdLBGVJ7lKSByS1qdXJ6oKzHrUtAispj2PEAAsx9OVIg7kpFpcuAa98+XA4ll96ZIU9TtT91wSyNxrtVF/fSnHD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6b6b9867faaso37685197b3.2;
        Mon, 26 Aug 2024 05:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724674051; x=1725278851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hn7VEHx9vrgs4Hq6EtDmUtqMaC4WqTV0pNRfHa1NRtk=;
        b=UN4oUR7BrA0ENifruhi79EVhbcOEW9LEEq4G4rpB1On/xXr6fdScm2AmfIpTBPKOGy
         q3sJwSR74M22XKwN7lzsZfJubHjurC8zxS9olZsJfaKiG9PNTCVf5THUsLCokrxkhFiN
         BYigo8uKkFHXkqwqSD2xalQjWKpC0G0wt4ikIdxgXu6ksZSkbLecWoAD4a9/z50oVAg5
         eujLBImkwJ+r6DMdw1oGhRb9SQ2INLkr9yD37dzioZZ41Ud3JmDCSpXaWNm305WJY0Xw
         50UHr2G5+hOcdbAATwhID17/EM9TusyjywFNxtR0inwLSZ2mEsK4xorjtx86smnXSfV8
         9VsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTM9f25g9aDYZcHhrerxr8xLP5IDLsXxLP0fgC8aQnp+VjrgRoqfwkW/ew/FrN+RvjdMRm2M/45BDTVayMvd/Uam0=@vger.kernel.org, AJvYcCWIj1XeiuvNRTeTi7KehXE/+ztap/ikFpmS+GuonEC5SDbxcrMCrX4YD2cBZDDGEKKJ3je6nJ4zmz+H@vger.kernel.org, AJvYcCXpzWi5Fwksem1TUVZv7/pASYCRuFTr9vUNdIqE2ScJwtW3zeeBWwi5gfdkhp4SFjZxNr7kqjbKvMVq8yOz@vger.kernel.org
X-Gm-Message-State: AOJu0YxjyEROLw6sWszvoHfRStUh+1KT0yqM36jqwz/J110dCDlvlA/i
	6GV+McvZQi2M1TsG40ojSmUlgvuARVEeFE2jEdlxXo4LKFkfMmsVjOoqnpc0
X-Google-Smtp-Source: AGHT+IFb6qSBVAKEHrvNbgVGNVywtmQYzIqxKLofCnoXXnwMUq9QwEAm8dhH+mjmfHm8Ue31FqBqRw==
X-Received: by 2002:a05:690c:4585:b0:65f:dfd9:b672 with SMTP id 00721157ae682-6c624fb6c9emr89223627b3.11.1724674050987;
        Mon, 26 Aug 2024 05:07:30 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39b007afcsm15038367b3.72.2024.08.26.05.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 05:07:30 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6b4432b541aso37261357b3.1;
        Mon, 26 Aug 2024 05:07:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU43cI0x7B/MAyajAbN85yM6p8A1Y/t3zrjhBckRquGTNSaMmFzhuM0GaejY1ppVRqJuDwRBH8P2NdVUhgiSG3mtOg=@vger.kernel.org, AJvYcCUc+xBvkrIEUXB33tq1AB+Gno7t3mJYZ3p8y++qyyZhxyZpJTQ90oHtNWpBM/hHbrHTGSIoC2aHZfMhM/nP@vger.kernel.org, AJvYcCWMoJOd9hYd8OeW3JXedL1pDzoiCMaQXfuxDSpife8K6Vh1WcCAkT+KKAZHu3+7k/wJa7uIhIA/yPfK@vger.kernel.org
X-Received: by 2002:a05:690c:6605:b0:6c1:2ea1:c24d with SMTP id
 00721157ae682-6c6262f5a8fmr130313177b3.26.1724674049961; Mon, 26 Aug 2024
 05:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240821085644.240009-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240821085644.240009-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 14:07:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2=u8enge6N+A617V+5oNYnNmhw_VFW9qbcX=TEbJKig@mail.gmail.com>
Message-ID: <CAMuHMdW2=u8enge6N+A617V+5oNYnNmhw_VFW9qbcX=TEbJKig@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] arm64: dts: renesas: Add initial DTS for RZ/V2H
 GP-EVK board
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add initial DTS for RZ/V2H GP-EVK board, adding the below support:
> - Memory
> - Clock inputs
> - PINCTRL
> - SCIF
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/V2H GP-EVK board
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +
> +#include "r9a09g057.dtsi"
> +
> +/ {
> +       model =3D "Renesas GP-EVK Board based on r9a09g057h44";
> +       compatible =3D "renesas,gp-evk", "renesas,r9a09g057h44", "renesas=
,r9a09g057";

Board name/compatible (and thus file name) are still under discussion...

The rest LGTM.

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

