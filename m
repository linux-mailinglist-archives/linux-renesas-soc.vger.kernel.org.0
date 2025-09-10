Return-Path: <linux-renesas-soc+bounces-21735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722B8B520A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 21:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27E63448129
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 19:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9272D3ED5;
	Wed, 10 Sep 2025 19:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVO2azKO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1A258EC3;
	Wed, 10 Sep 2025 19:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757531237; cv=none; b=aZ6sZDRJTcVWob47w4/nFT5T34+kMbwouDxBQaK1T4XNrT24KxPp0elQJ7lZwn5982EmAV3kFKwu2tVqgFfEonPwNyaiabLzIRUqUnO5UfS6YcdZzgMZzxB3QkQpVUHe6pd0SuqsREqCkLgMwydUEWaABGfHKSDurgKbu6o/hjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757531237; c=relaxed/simple;
	bh=CPWOMnZDQgzmraKMC8a59alN8nwGVB3G/2DoWeDmyVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfULkGsnvTgPUQHOp6bMImH1/wpk3rKI8aOd1/ecSjJ7sCKTJh8bXi1QUafgc++BgldRodIULWc6t8Bpr5b9j1vQvNePlaKsWTdxMO9/bQ9cZzOcOqKXgZ3nfbPoo39CPlvqW2fQrwNEQWC1QZ1lfmxXx4/a1ybSdxm6c3F4jW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVO2azKO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e249a4d605so5856141f8f.3;
        Wed, 10 Sep 2025 12:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757531234; x=1758136034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlBN/u6i6z16NWqsuM0a8uoznm1drEJCSAp6aqVJGf0=;
        b=LVO2azKOwpIgdBX+OZnYLHO4p4feoykII8mmXxrbXoxIhRd19ecHCAL24vfODzxU5F
         D7EQ2Q0VLGP6b8so3LcPS4P1mCZgTmzuRqlcKjvt0e0Iq9KVARH0TeunkdnaVHt6dsdp
         +VWwX0EAl9cD6ine0v/BCbU5WXZjT1V6AhTRO6aQ/Y9PIQBtFgM3ExJWYHpP1r/pdyeE
         ERBnjPie1fMWflCzppLnjrs6/WgojP5sYwuJU0uyXlDNPbRluYoo249Zo11ThTL3uUFD
         PYIZhgoQhFtGE+Kdi/HDzIaXPhqYZSqXD7tbAM01A1tIvZBmGVD2bjvpcBT2w0J5Ygjz
         rR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757531234; x=1758136034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlBN/u6i6z16NWqsuM0a8uoznm1drEJCSAp6aqVJGf0=;
        b=bkXgJT2wYf67INXW/XXpHtKyZ3z+jL9Z2I/EvhVRLuoo/9nkW3lc/bKNFD9QkFi2BS
         SlZ01yg6pc/8lQ/gJhBwLpk109q+Ncb1rmQbSRT2TBpIllmOZd3bT+SsKoW92Ouk8Imj
         0oPT3OnDZt2mCBciLMbPsWUGEF1Yt3IWd6Lkeok+3t4S+KxHLBzXB9q6wXfQTmaHUuA/
         119eEYzvehF+C3xy9jQS/lYQYgl6+8N6TDft9rq105HQ+jYMquH9BrEA3eR3yV7rZPmH
         2ikCUG5puLwUdp5jVxIi3rNdblhC6WZwT5Fh0J8QHaBHCHNA6FzHgSE6hImOQGAxzioq
         PEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU9us9Jmw1evjd44Dwev4sYIwy5iUlqWOev/OqqFEgY2JG6FNoy5RFaR3H7PW9H9Y/CXu69y4AH1iN@vger.kernel.org, AJvYcCVeYKVNYD5BRZjiwPErrhJxyhOqjFTwfttRvnGjZyyFEGAofbDfxoXO8GvG5nNtJGlk9pDo/KBU@vger.kernel.org, AJvYcCX+d7kUf5E7xmQuXqyTJrC3/6I1cUK4jB2K2d+ZC7JjX0fTJOiffyxj+J+/FB04iS3HUQvG9MAx+hHRzgxb@vger.kernel.org, AJvYcCX/2eMO5JEfufZb2bHn3BILyth7cmVDtGL7YQNbOtfS1dS24l2A+FWie0pGdBwNeptEMeiuaKbhDI2WJaLfmJ/fodM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxvL85EzJe3E3i1y+svoza1eNF2YpPLzohubbuYn/qb4QymIUt
	++QSMrghN7zIITe3AHaYkulvgKzOFUcAxgibj3Q7i21f221yFeHpceJFI2sKK0iQmqSgbSTMcK3
	y823V8ZWW9mpkPqWHXY9gl2+RetbBYj0=
X-Gm-Gg: ASbGncsWUJU8j4cpG4GohJHEoMQegd3l/FMi0rRjd5FJckntM3LHNoAd6HbJgjTa8Dp
	saZa9Cg/nircZR1uOPe7VTKx8fSsRudSU13opNa/i7QeWVw1Q0ztoqShbti34X/MEEZc9tYdJ25
	tChM9IHK97FCBwLtx4HEWcI/huENRGIX38K3fl2CRYjSSRTYN8t3xTXKYSi0gO5wGlYwZIxswEF
	WWtwwwfEmmrKF5o/DDkV7Hsvbfh4iVS/QuHWIl9OUDv3sVK5JYmWGxcY3Gv/w==
X-Google-Smtp-Source: AGHT+IEA1cGL65KvFQJDH1pWqQQCX82anVI8DJb5C0rkCyoTHgJ3NHJEOxUmxhN9CG+XybEqEHAGaHcAxUGw9+J4fIg=
X-Received: by 2002:a5d:5847:0:b0:3c8:2fd:60c1 with SMTP id
 ffacd0b85a97d-3e6429ce666mr12843330f8f.18.1757531233579; Wed, 10 Sep 2025
 12:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLwm2fbi3acKlIgH@ninjato> <aMFQaQhn2So3T_oi@ninjato>
In-Reply-To: <aMFQaQhn2So3T_oi@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 10 Sep 2025 20:06:47 +0100
X-Gm-Features: AS18NWCx_qGN8PiytCuNikE2PoZmxsfSY9ZLwolmrQEVX0jTLM0wsdu3sOtxByI
Message-ID: <CA+V-a8vo714BRZfpq+at+rU1zLizMN5GsAR+_rANTUsod8oDTw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/9] Add PCS support for Renesas RZ/{T2H,N2H} SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Sep 10, 2025 at 11:18=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Sat, Sep 06, 2025 at 02:19:37PM +0200, Wolfram Sang wrote:
> >
> > > This series aims to add PCS support for the Renesas RZ/T2H and RZ/N2H=
 SoCs
> > > These SoCs include a MII converter (MIIC) that converts MII to RMII/R=
GMII
> > > or can be set in pass-through mode for MII similar to the RZ/N1 SoC. =
The
> > > MIIC is used in conjunction with the Ethernet switch (ETHSW) availabl=
e on
> > > these SoCs.
> > >
> > > v1->v2:
> > > - Dropped regx in title and description in patch 1/9.
> > > - As done for other IPs used T2H compatible as a fallback for N2H.
> > > - Renamed pcs-rzt2h-miic.h -> renesas,r9a09g077-pcs-miic.h
> > > - Added matrix table in the new header file.
> > > - Corrected the resets check for RZ/N1.
> > > - Updated the commit message in patch 1/9.
> > > - Dropped regx in config description in patch 9/9.
> > > - Dropped patch "net: pcs: rzn1-miic: Add PCS validate callback
> > >   for RZ/T2H MIIC" is this already taken care in commit 508df2de7b3e
> > >   as pointed by Russell King.
> >
> > I plan to test this series on RZ/N1D next week, hopefully on Monday.
>
> No regressions found when using the 5 ethernet ports on the RZ/N1D
> board. For this series:
>
Thank you for testing this on RZ/N1, I'll send a v3 with some minor
comments fixed.

> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>

Cheers,
Prabhakar

