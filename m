Return-Path: <linux-renesas-soc+bounces-21162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE80B3FC60
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 12:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BAA6205735
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 10:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E22283CA7;
	Tue,  2 Sep 2025 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRxuQLGb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A47283CAA;
	Tue,  2 Sep 2025 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756808816; cv=none; b=AbqXcS3uXDccBsKlSzQ4vleTFJY9bJ7x+oELln3Mq61KdzeZDEoiqWk9dl65x/+unf+OG8A8EB8m9pHT8yUe5lSTHa2BUhQPCJHnbu0Vi1ZRsnWbwfI++BwBh6EuhVpEbK5TNlJCfQF2+eG/eNwMw/IdBzePYJEHlZzS47Od4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756808816; c=relaxed/simple;
	bh=WIG36ojakbZR0f34sUPRJRpG8M9NeFHs5wGAsA2m4Ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mV3BXXA8bT84NzHwAdl5j05r5cQieWthc8c0/iVTKw9qWGIt5DF5Nzm98vJjbgI/oJ9qwz/jmUqsZkCE618D+LpLGnYYIn6v7gy2fAgN69Z3gMJi4Ie9qEN4LGbJkvrLci1J1NwvZpSYH4SZzSqcQLnGYG27yQCFEnDpm6vU/qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRxuQLGb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3d1bf79d7acso1749461f8f.0;
        Tue, 02 Sep 2025 03:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756808812; x=1757413612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIG36ojakbZR0f34sUPRJRpG8M9NeFHs5wGAsA2m4Ow=;
        b=mRxuQLGbqQ2awRIqKl2lLYZy6/Lb5HNZ3FXFg9HlaK8dJbnS1nSf0oFZMj3mlo8EMv
         GoVQpHpfP6RlhZT7iyxlKCi5Yf65If0hxRJaMJY8GaDP98gjOJ8U39sGWZvLfS5KtTA6
         GWv9PUT5ay3hKR+rjlgj3gU7UwdXgHs43TP0GKCI8jwJwMiNdjiliNHWISvvJeVLkCUl
         8vaEtSkM54UFSD7723v0rWpqrkzdOZln+GH005Q6/QoEkx6rVm9ZGcg6YZ13wLOO3B3H
         1iZJQtLEgveYg2U7pnuAWovUAZxmVIWGBspavHNxy6O8pc7JqaNuPOdTn03wMqKnADcu
         b47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756808812; x=1757413612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIG36ojakbZR0f34sUPRJRpG8M9NeFHs5wGAsA2m4Ow=;
        b=pY0RpVHv+SeB5mFvCtj1XlFKKwiBaNlNEEEDX8NCZSMVfS4JuaVUYhFeeAVB4dX7/X
         PLmSQXY2Ntt+y2X29FC/89qRG9c+LObA+oWazcsQV08r1cOeMkaDNAoLeUJhMPwvFpNE
         +Rx8ld2JJsnVsvhzZ2iHfQpO1yUSnkpFk9ATixFUjJvEAjve2bvgLrCa5OiXEU+hGudy
         p5Jrrqk1vRLVpz5J1G/atGkmRMeh31uN2nXIVv32gglr5v6LWv8LVbFByI/KAmoTWn1G
         w91rEUfrQFgU0IV6p4KgqPUBiPTHiEzt6Z6lSr27XHk0dWs9C5te46HZ7b/dL7HaJjjf
         /acg==
X-Forwarded-Encrypted: i=1; AJvYcCVh42+Xm4HWUwQQJPaca7/ogUrVKPEcVwlcQ96jCqRcXO75sNyqwEXAd8yOZ7UvAUdHFGyvPjo8@vger.kernel.org, AJvYcCWOCMTubgYi4jvpb6W/Xfd0Wt99FkdbVa5MxQRldBdu/Tx1rLBa2HorFZt7RLEyHyvYkLQ6vq5JhkmxgDKP@vger.kernel.org, AJvYcCXdGecBgNvdOitGnYmy7Sv6sKlVr9Ac7WSLiETGNTCtALezEt28E3e/rxORAA4HgXuvgym0ut7MpPdE@vger.kernel.org, AJvYcCXwXIzMKEmNG0LARPx3ey1I8XBwpO5/GgzwPz6ZANaxRKsGRhmHl2XlO12suMTIWgnBg93CxkWn2iOsDGGFvenDZcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJuc3BjpG+1ArjbnvWrtVFHjSUcUPlDepiMGPoXJKM1O2usxv
	HP7Viw7NV6v7QpsjEwyIEfYNn9CvCauo/8KP4e3ce7alh5+/4R/21jOAL2joTDZCb2Zvtp86YVF
	epUHjGX+KvhlF0BUQpKN8IWchlED0yW4=
X-Gm-Gg: ASbGncv3OaJCQor1HEhKActDR/g7iRgR2zRr2ouiNKVTja8l8ercforTTk+rrq21FNb
	5JiNqR4CRFPdqSUPh4Ts3m1g1ueSZZ+UVn9CHVE7qFVx6s+GtcTcrkaYJvP5EFiwxSFjQhGGFzt
	U963hCQ4cOdkDYtn3ybqypNeMPKhgSIRxF35Vyrs4kkQ9quGXyQd7D5syGG4ZFGf9sPyLF/sp52
	I8fpWsCzRxnZVHpb4DXs/x0GuihCfXVH0PQVB/s
X-Google-Smtp-Source: AGHT+IFxhn+/xz90fXaIgO0np82rcnaVjNZibsx1cSAdBhTTY/NoNyJlaD7235ymxV7QX9ujQupk4dM1I5QudfWWTsQ=
X-Received: by 2002:a5d:5887:0:b0:3d9:70cc:6dd0 with SMTP id
 ffacd0b85a97d-3d970cc701emr1764550f8f.33.1756808811583; Tue, 02 Sep 2025
 03:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250901224327.3429099-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <aLa6IeZsGeESpMKQ@shell.armlinux.org.uk>
In-Reply-To: <aLa6IeZsGeESpMKQ@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 11:26:25 +0100
X-Gm-Features: Ac12FXypw6Y_C9Hl8fhtrMS82dtxXYWsVLfOscBiU78OSTy4UH9_O9UiXM-7IC8
Message-ID: <CA+V-a8vPJ45ZB8RvLaw7Vhm35f28VrHj3zZkCdN-MZzhcd5CiQ@mail.gmail.com>
Subject: Re: [PATCH net-next 10/10] net: pcs: rzn1-miic: Add PCS validate
 callback for RZ/T2H MIIC
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Tue, Sep 2, 2025 at 10:34=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Sep 01, 2025 at 11:43:23PM +0100, Prabhakar wrote:
> > Add a SoC-specific `pcs_ops` pointer in `miic_of_data` to allow
> > custom phylink PCS callbacks. For RZ/T2H MIIC, implement
> > `rzt2h_miic_validate` to restrict valid interfaces to RGMII, RMII,
> > and MII. Assign `rzt2h_miic_phylink_ops` with the new validate
> > callback to the RZ/T2H MIIC SoC data structure, keeping existing
> > PCS support intact for other SoCs.
>
> This seems completely pointless. Please review commit 508df2de7b3e
> ("net: pcs: rzn1-miic: fill in PCS supported_interfaces") to find
> out why.
>
Thank you for pointing this out. I'll drop this patch while sending a v2.

Cheers,
Prabhakar

