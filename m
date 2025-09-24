Return-Path: <linux-renesas-soc+bounces-22330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81243B9A0B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5324189F808
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314F2301494;
	Wed, 24 Sep 2025 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tK4g8xF3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE632D7804
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758720868; cv=none; b=D5CdIbD/tBEGXUeuovfs0b9oWwsyWJSjm9VGbgwR9gApH6fuvaZWyisIDWsVgLwk3JDNlx/2In87I7/jqZakmyzo8qHLcSSwAAHBtcspEBAFxKt2WhfvwTpFtblWoUryedIAkr/RDOIELk8wovWH+b1TkQeXVlYYLMyOBY5FKDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758720868; c=relaxed/simple;
	bh=3Z6XTJa/2I09pYSflW4MDbMqly8jjfPgHvxuTYEtOvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K35mp8SqtbtXxwwRhXeajwocRSWy62U1vRtublEpziw1zU3MSKB7BQ1jOkmmHhDm0F0CvdGzsgaoaGo4eZVKAr/9CJ3wiiCdQizpFlveKXDG++8JKnpCF8cmWAz5qukZwmdxKtTLEUpNw9qdvwpBOe3YnxroPlJV8GA9wNoV980=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tK4g8xF3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B409CC116D0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720867;
	bh=3Z6XTJa/2I09pYSflW4MDbMqly8jjfPgHvxuTYEtOvk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tK4g8xF3KJeMYnB9VZ4gO8VRMtQvT117WCk3DHhVlEegaKquqejM1Ot5xjEhSSEOK
	 43WmDcGlPeFBVd6oCpGsmL+8tu5/12oZs4cT3CBOvCTcpV/9ieFFCe0OnqgT5j3e+E
	 kamp4muCI1+ku/3UZUUk43jADlPfZFB/OGQbWFEL1yIieBn5z+BjOVZvX1yaSW2VRG
	 8hor0XFKZBCNhDYppKwVU3Vmmj4G7OBcqnycvEma7dxeTlVQ9NQ7zdf/KO//cZhphQ
	 zs6/ZVsvHe5w9Ygt933ZX8EDJqUdOzRtNRnuAu0X9OGJH948CqCf7TfTwDLEtb4W2w
	 atUla77I4Zl5A==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62fa99bcfcdso10390836a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 06:34:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxjZwvNlI9UoGto9O/aiZIVX/Q4e03x0KVZwSkXIGQ379J6kwXKUmfoEUw8gymlhefBcsbCzGqW4g0S4IYYP5OtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNeOIQ6cafnLOOnS5B22Cgxf4aDMVMrhT0oZwtDJvNqD4XXXTB
	YPVEARVhSBpsBtxgD/naaQNozW+lZB8ADxdPYz7wTRTUu2fNUCYVoiWHg0CiTpCyDED09bxG0Pi
	Ka/Bv5MCBEQJgGsTGy7Xe3uhJOvl+Jg==
X-Google-Smtp-Source: AGHT+IE6gNa61RcE9DKf2iXVRg4jwELeBK0rbWB2RUsPPFiJAgwlJN43oTxNrNqM4YRqC7tDc6X2gwE56i96k2A7jt0=
X-Received: by 2002:a05:6402:a00e:b0:62f:b6bd:eff7 with SMTP id
 4fb4d7f45d1cf-63467813addmr5004269a12.38.1758720866242; Wed, 24 Sep 2025
 06:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
 <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch> <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
 <7e6f568da28d7a63738b6ed22b33db3df4c478c9.camel@codeconstruct.com.au> <CABh9gBcoWbXurPo0f9U9+gz8k6gttUvj=NMMDVfgjo5dgaTLSA@mail.gmail.com>
In-Reply-To: <CABh9gBcoWbXurPo0f9U9+gz8k6gttUvj=NMMDVfgjo5dgaTLSA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Sep 2025 08:34:15 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+zBK1CBJX0XcaqaYeOPUhoRE-nMeYvkTNwQovJ+dakGg@mail.gmail.com>
X-Gm-Features: AS18NWBRbwk465MJYJkBc3f6vXfBHLpagMAmj_NyZMMJpbB87hfWSByQAiUtoWU
Message-ID: <CAL_Jsq+zBK1CBJX0XcaqaYeOPUhoRE-nMeYvkTNwQovJ+dakGg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 8:05=E2=80=AFAM Kevin Tung <kevin.tung.openbmc@gmai=
l.com> wrote:
>
> On Mon, Sep 22, 2025 at 10:47=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >
> > On Thu, 2025-09-18 at 10:21 +0800, Kevin Tung wrote:
> > > On Wed, Sep 17, 2025 at 11:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch>=
 wrote:
> > > >
> > > > On Wed, Sep 17, 2025 at 03:48:08PM +0800, Kevin Tung wrote:
> > > > > Summary:
> > > > > Add device tree for the Meta (Facebook) Yosemite5 compute node,
> > > > > based on the AST2600 BMC.
> > > > >
> > > > > The Yosemite5 platform provides monitoring of voltages, power,
> > > > > temperatures, and other critical parameters across the motherboar=
d,
> > > > > CXL board, E1.S expansion board, and NIC components. The BMC also
> > > > > logs relevant events and performs appropriate system actions in
> > > > > response to abnormal conditions.
> > > > >
> > > > > Kevin Tung (2):
> > > > >   dt-bindings: arm: aspeed: add Meta Yosemite5 board
> > > > >   ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
> > > >
> > > > The threading between your patches are broken? How did you send the=
m?
> > > > git send-email? b4 send?
> > >
> > > Yes, the threading is broken. I initially used git send-email, but fo=
r
> > > some reason, only the cover letter was sent. I then sent the remainin=
g
> > > dt-bindings and DTS patches separately as a follow-up.
> >
> > I recommend using b4, it helps blunt some of the sharp edges of git-
> > send-email.
> >
> > https://b4.docs.kernel.org/en/latest/
> >
> > Can you please send v2 of the series so that it's properly threaded,
> > after applying tags you've collected for the involved patches, and
> > checking your work with `make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook=
-
> > yosemite5.dtb`?
> >
> > Andrew
>
> Sure! I have sent v2 of the series using b4, and the patches are now
> properly threaded.
> I also checked the work with `make CHECK_DTBS=3Dy
> aspeed/aspeed-bmc-facebook- yosemite5.dtb`,
> and the warnings that appear are not related to these patches.

Um, they are related because they are warnings for *your* platform.
You don't care that there are warnings for your platform?

Rob

