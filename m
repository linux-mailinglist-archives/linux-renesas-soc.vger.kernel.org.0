Return-Path: <linux-renesas-soc+bounces-25216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F00C8B53F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 18:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C31AC4F039A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 17:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE53527B50C;
	Wed, 26 Nov 2025 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcAroEv7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E49326D6E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178954; cv=none; b=t7fwWMk0mYxgmvrCWViP5p/n9NkkLJCvbAIVcaCBOTTgiOqE6c7PmGoyj0TITziEzDAFQwMP7efD5p2Oaq8s8dhEKwZLhYIxy4sWiGpXsgqJvnYarJNP4NzU/fzDCDVNf4gt6NIC12Otn+KTDbbMEYuryWD+pfmt3rEU5XNKpT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178954; c=relaxed/simple;
	bh=H45sT8ifW0O8vWCYPKJuUgHks2mEXGWB8Jd0Vqn88PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIwMwy8lRg4y28vnoY5zLwoMr761iwXBLrBt6qwdWbZlovJn4BX6Fdh8qaM57ULHq3wwLK1/OdzLHgCoL++WRhBxNEr9emaoJksY93nV24v6aUynsAwLgRRUB9BxOcEZ60UcA85VsbCQOpe2QOVwwXED/kq+JK4UNbFaV/o3Ljk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcAroEv7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so49487285e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 09:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764178951; x=1764783751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H45sT8ifW0O8vWCYPKJuUgHks2mEXGWB8Jd0Vqn88PE=;
        b=NcAroEv7WHRM6fVZKueA6AsJXXFNUx4vKjsgGnow64+ziC3ZuhBOfkzR3H88UjZS/k
         SGAS9JaptHKCBPLYfGfCxZaiJLxDBpSvUlxfySydVen66Akew6OZMZfqQjgTVplDQ//c
         u7iFhb4nRh/xGhsSVXRoyGtMipZ3AUSLq/P6knWtkxaRphJhdP3Rj9REzJ/u2FwWQtP5
         VXvq3WqFasmz0xnFkzNv26FDjfsQ/cp3QklWxmELPjCSTxybrQ8ENgfs66zZ3SUMhZe5
         r7x+k7te4VRA6znZaKmSRTi+idImQfwB1SZnwmA4wasfQdkEKQ8nkzuNNtGW2M/7YkbZ
         yD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178951; x=1764783751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H45sT8ifW0O8vWCYPKJuUgHks2mEXGWB8Jd0Vqn88PE=;
        b=sNahziZQC+/lRgIdDOzXzbUjuh/1NaP1jlawxddnr6etaTiIxYICkEzApRsw/7Icsb
         0CIR5z85/X9oL9OcMHhRZW6nijvhy18nMuOdsdXjmxsEsT4J3DCycYcKyGNOi7PcXUZ+
         l3YwxEUaPAYfDhC2P1aXJ7i4iAjMtnW2stNDzBb7tzvjErE3YmqGeueoMG3ifvrvPcuk
         CT7FLmlWBpL0ROJD9wiGvslTDL6dysy7trQYNLTbVUd+jBnuoUoSNL0p1AxYWqq2idhS
         66cbb53ZEXWUV91okTvO1Kimd+ogQ7uHwmXNIgWa0erKaLHYhRukXUWlTK2jYllZ95Wy
         bagQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8kaHX9hXMvF4VYvTaG5ZlcOuDXBoV1IBqUIiFrR57fa9V/vDXzo/6R/ykqjZ1b54tNk5mBLJa1J54T/cxv2XXmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXCm3IHDvIb/FNBBBU/AzB1nSWf8GmGfp+etaIV1XxQg0KAe+
	2O2WW+RYHW5TrFCX+aN13nHlc4qm76TIZDcA4nzQlxlFty+KoSldeI3Xl0ZfuoJOS1wP5gl+CyG
	k6/YgE3lywNyZe7914ZnUJgiUPxeQa94=
X-Gm-Gg: ASbGncuez04DnXlGmx7YpazQAz70uf0lNDky3EJie6pgpWhSjc+aZbMxfqoLB/zPxN2
	zZ9dt23wjFRg9lrcGDyhjhYDjb7pcp3U053xtSAAWbpAEqAAVVaBlaE0vfH+gHYgKCChBj36t1I
	NVHgwoOlQw9W4quFciod1N6aY1v2YKAkhifAs++Haydbse92fAHI3lHQOMWtOojUr7my2rfBWWU
	LIC1f1lbrgAR+rgmXDJVjMcEbxQjHQ1NbxOPQLCe0AEGTBqpcV0dlLy7pa2Z6sfowWzgskrS0YE
	dS/oKbsCiMK67bZdY4xBeyWNdyqc
X-Google-Smtp-Source: AGHT+IEZ28WwikpNMp28f9cZ8FrUOzBbOzH12B9xnya/BVPaxQoXRRptgOSDjsEI4HuhukMbEvl6ukgR6fFwxUmEXSo=
X-Received: by 2002:a05:600c:3152:b0:458:a7fa:211d with SMTP id
 5b1f17b1804b1-47904b24282mr78083805e9.29.1764178951003; Wed, 26 Nov 2025
 09:42:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251121193942.gsogugfoa6nafwzf@skbuf>
In-Reply-To: <20251121193942.gsogugfoa6nafwzf@skbuf>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Nov 2025 17:42:05 +0000
X-Gm-Features: AWmQ_bkZJBm6Wozp4bZ86ADSwgEM8iq01qAWIsEYygFDAD9xEd_cYCJ2C4ftoDY
Message-ID: <CA+V-a8vAXg9GXn1ee0-02N7-ucHuivioTMLKFEiw1fO0nPQAzA@mail.gmail.com>
Subject: Re: [PATCH net-next 06/11] net: dsa: rzn1-a5psw: Add support for
 optional timestamp clock
To: Vladimir Oltean <olteanv@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

Thank you for the review.

On Fri, Nov 21, 2025 at 7:39=E2=80=AFPM Vladimir Oltean <olteanv@gmail.com>=
 wrote:
>
> On Fri, Nov 21, 2025 at 11:35:32AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
> > driver. Some SoC variants provide a dedicated clock source for
> > timestamping or time synchronization features within the Ethernet
> > switch IP.
> >
> > Request and enable this clock during probe if defined in the device tre=
e.
> > If the clock is not present, the driver continues to operate normally.
> >
> > This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, whe=
re
> > the Ethernet switch includes a timestamp clock input.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
>
> What is the impact to the current driver if you get the clock and
> disable it? I'm trying to understand if it's possible to only enable it
> when using a feature that requires it.
I actually cannot test this by disabling the clock. As the clock for
TS is coming from the core clock which is always ON and we dont have
control for the ON/OFF for it.

Cheers,
Prabhakar

