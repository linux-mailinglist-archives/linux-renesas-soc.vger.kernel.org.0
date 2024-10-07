Return-Path: <linux-renesas-soc+bounces-9515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39467992B1D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 14:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3A591F237CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 12:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E821D223C;
	Mon,  7 Oct 2024 12:08:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91DF1D2229;
	Mon,  7 Oct 2024 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728302916; cv=none; b=TfcHdKqBpJycTT7aFtpTbpvjGnB6/bo0xtl2PT1fmzTihQNkPDArXmnlC7V6ALCgxocMjG9Cxkh0v9AsHbJHQrKtlk7aYjolf2vdP05D78SOmPucnK5zApEmU4NDIo8PwKl/6YZ6r6l9CnLuv+NUMrsO3zo4xShAUFKu97z+ETU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728302916; c=relaxed/simple;
	bh=nunW9qTTQiomk4qyy1dl49+vZgbBw+yFxYrGwYz117U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAyaPc5EoIYaC+xgR0Ffmu4pLRVqGg67s05tCFAtVwB0Si2t/9J21CmR5vzaiGpbDXGBxNoqjFXoJi0b/3R7lFq34ZW9dqELa6qkGwOa1UOkfxocB/5hXbVzCgi1OyjWhOAB9JAaViIso733bPLbcP8LJ5XPOOkInixfiEhK3yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e2e508bd28so10392797b3.2;
        Mon, 07 Oct 2024 05:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728302912; x=1728907712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqpq6w5AiRkmX0QZf6bNjypoAiUmOdHHXQcKnyVX8ig=;
        b=Q9YEnne3MZ+miiPqXELLpPGLF15m/79Wm8yoFhrkfcu99vCfksYjLjUswNdaTAbPqs
         RBVEgXfu2xYXZ9DWplTsuPX9YAYjIyIZwXm+pjwqLdR+Dci6GVlsryT8XF6ljs23Gu6p
         eHj5H0BqA7fFQxMaewmHASpJW0rtSj7gDd68UxEHvLHs7TdjaHbDfE5Nr+pRX0BW18oF
         /olfCPcg3N5OSZofk7XCptMgMHgH6d6PzL3QwGrF7KhItO0RtK4M+0EVTh1tK6kdk1AU
         utS3s2a6rTr0PrS06tbt6MHiwvY4KOX4RPPqa524ejDgp2GNVD3xyrO6HxxPrh5H1C+Y
         s8Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWdKPZGz7RL2u8JoERVkb0DIvqt/MMxRNAXOPUS7uEtARA7wcNfF+BP6jQLYQ/85plYDLPTN22BpB7j@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/rIcNjAwC6o0qjbpFQ2eWFlxb+MQHDYrFxZwmjSs4Ks8itXl8
	vRjMnvKJQ6gKZrwE6pr4aBiYjJ+g334WUfeW8o3qg6s2WqBQC1OwBpZkYTu2
X-Google-Smtp-Source: AGHT+IFvE9idSAQmGy6ulDUsYNUkzLLRqMSa/YCdc2+xdM5vECcnB7yBFRkdpAPWQtLpdej4NLltXw==
X-Received: by 2002:a05:690c:4b8b:b0:6db:c7a8:b0c8 with SMTP id 00721157ae682-6e2c6ff7694mr85812637b3.15.1728302911772;
        Mon, 07 Oct 2024 05:08:31 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d93e2ce5sm9966037b3.108.2024.10.07.05.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:08:31 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e2e424ab49so11355837b3.3;
        Mon, 07 Oct 2024 05:08:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUP97Bc4W7PEQio+jsixaSzpiKA8eoqWfp8FfBnFrwzjUnfaxlhxa7IKPBOynp76VeL2netM4YrPNej@vger.kernel.org
X-Received: by 2002:a05:690c:f03:b0:6de:c0e:20ef with SMTP id
 00721157ae682-6e2c6fc7e47mr95196157b3.7.1728302911226; Mon, 07 Oct 2024
 05:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240928092953.2982-5-wsa+renesas@sang-engineering.com>
 <20240928092953.2982-8-wsa+renesas@sang-engineering.com> <CAMuHMdXV9Sbk-rjR3FfwWOsWyaHv3XCh3+XooYZB0Z5tbXY0_A@mail.gmail.com>
 <ZwBHvaWKKfzgYoMc@shikoro>
In-Reply-To: <ZwBHvaWKKfzgYoMc@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 14:08:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkuZM0h9g4DOL9Eaw-ofKug6gpdBGw4rFx0pkgumtuXg@mail.gmail.com>
Message-ID: <CAMuHMdWkuZM0h9g4DOL9Eaw-ofKug6gpdBGw4rFx0pkgumtuXg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: renesas: genmai: enable MMCIF
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, Oct 4, 2024 at 9:53=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +               regulator-name =3D "CVcc2";
> >
> > Odd case. "Cvcc2"?
>
> Fine with me.

OK, will fix while applying.

> > > +               regulator-min-microvolt =3D <3300000>;
> > > +               regulator-max-microvolt =3D <3300000>;
> > > +               regulator-boot-on;
> > > +               regulator-always-on;
> >
> > The regulator is not always-on, but controlled through the MMC
> > CD signal.
>
> Hmm, okay, but how do I model this in the DT? Can I say that a GPIO is
> input-only? I can't find this in the bindings doc.

Right, there is no such thing as "regulator-auto-on" ;-)
From the software's point of view it is always enabled, so
"regulator-always-on" makes sense.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

