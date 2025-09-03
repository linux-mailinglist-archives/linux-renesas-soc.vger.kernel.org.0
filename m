Return-Path: <linux-renesas-soc+bounces-21283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8767AB42308
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 16:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F75B1BA36BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 14:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2D0312837;
	Wed,  3 Sep 2025 14:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GarjbhYP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2140C3112D5;
	Wed,  3 Sep 2025 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908322; cv=none; b=b5q9RnOlL6AyTDJNQzTJHBV0GYPpk19gjjWHLfhJnfIzsZYekE81Nqdar0+WALXaJpPFVf98aFAVIqiAdPFDxR6XYqHz6xMAR8C8SXHnsTb9D+ez+Sbnb6DJqJvX1uFl/GyhFF9kZfSGQYtpr/u/uev6sY3zchin7zxPeaodxYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908322; c=relaxed/simple;
	bh=eKNu0P169Q3NEmF9/2kn88R7etBh4b2ftcRq7KbNGzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIMAziFXwlgLB/yIlVUD6X/NitI2mvqQZrUb/y7GzFOYgrIU8YB7qc5D/BbEASEEOqpIOMkbq7L4XTRi/FVRe3LxPjI76lIOBiRr1JM5yqH4R3oGmwnQQFAW+1szBlClczN0m9xdg9iDApIJDwr8wjbgiqZMNI3JpDnoMfYFn2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GarjbhYP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4051C4AF0B;
	Wed,  3 Sep 2025 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756908321;
	bh=eKNu0P169Q3NEmF9/2kn88R7etBh4b2ftcRq7KbNGzg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GarjbhYPuBwzN4LKvw70mu25trun6v2gsNZoMS79qq5b6fFdnkIvAU84g+t/ZNTuA
	 qItjKLs65j8DmS5uRuHG/tkDx9bXVhY6n/sDUArtE3jYBFiDdbCBST3QfRGBlrIjZZ
	 0EOijnVmbkyGgntMKf9LztVwMTAF3BXSFTiQIhxDLLh5BAaXagqUwEBIB/EXoG4eUl
	 281whCCc5omD9u36zHFpRpeOaOwok4ld/LprRIQlPor080oofNvmT9lX50gaNYeXn4
	 27f6a9fUVkD0fJtu6rpxsExGEGI8IjbPgMEwoK885Yu8kqSJZ31Y78BR6mvEm74tEa
	 BkIhFCAL3LF5Q==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61cf8280f02so7799382a12.0;
        Wed, 03 Sep 2025 07:05:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUweAgXSAStG54oksHYuhWvDYGsA9PgqasTLbzRjcKwFMZz4VKpoAhuc+lAvYCWGQqUOssUBJyRwWFgnB7HhJyXmJc=@vger.kernel.org, AJvYcCWtROtbVXvr8XHs8AHHyNmoEkUHcGSVuaDCRaF6u51yRYdxQ1nUMiQaPCGka7KbjEed1omzQxBRPcJpUm7A@vger.kernel.org, AJvYcCXAmjIthkplsWQN6B8HGyC60NiicM5lZNA6yCujfv/3OWQi6gyHDrgPQhM8BlqCRuPX2zesC6hK/2pF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9kXdrXrllp5y3tT3fGR9e68RSC/6qE95bCcvf+BcMYHu+4oS7
	ZCkhpMv5y3aIYlWG538ouJMKIzRJvqYkkxalFyHOPxuMnKqWjwSB3gnHe+hcDBOzirdNGZIy9RP
	LYjjEpz8O1MhV62gKsX9dqkC8YHyWoA==
X-Google-Smtp-Source: AGHT+IHhgqqdWQtLgJ3n4i+fkorAw1PLf/dG7GMkfPu1VyhaFYexbX0Opd6FI4UepF1zq8MJg0/D/0FlKAcuRTaWSho=
X-Received: by 2002:a05:6402:1ed6:b0:61e:9ebf:d340 with SMTP id
 4fb4d7f45d1cf-61e9ebfd58cmr10082183a12.32.1756908320220; Wed, 03 Sep 2025
 07:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815230841.3487764-1-robh@kernel.org> <307fa87eb552ac4a1f6dd6139450786195e3892a.camel@codeconstruct.com.au>
 <360776d4dd765dc2c98f0c1b718fe63d4a8a70d4.camel@codeconstruct.com.au>
In-Reply-To: <360776d4dd765dc2c98f0c1b718fe63d4a8a70d4.camel@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Sep 2025 09:05:06 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+TcACG=vGp__tT8RE6kOjchoUSq59i=H_+qSRn-ucMkw@mail.gmail.com>
X-Gm-Features: Ac12FXwkg-WgIKnHEs8UoaeM3TBl6YtocnO-RvpeXFYLKucgpiCnVNz9w-PqANM
Message-ID: <CAL_Jsq+TcACG=vGp__tT8RE6kOjchoUSq59i=H_+qSRn-ucMkw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Fix/add I2C device vendor prefixes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 1:52=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Wed, 2025-09-03 at 15:01 +0930, Andrew Jeffery wrote:
> > Hi Rob,
> >
> > On Fri, 2025-08-15 at 18:08 -0500, Rob Herring (Arm) wrote:
> > > The ASpeed DTS files have various I2C devices with missing or incorre=
ct
> > > vendor prefixes in their compatible strings. This hasn't really matte=
red
> > > and doesn't impact ABI compatibility as I2C devices get matched with =
their
> > > vendor prefix stripped.
> > >
> > > With this, the "maxim,max31790" nodes now validate and have some
> > > warnings. Remove the spurious "#address-cells" and "#size-cells"
> > > properties to fix the warnings.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../aspeed-bmc-arm-stardragon4800-rep2.dts    |  2 +-
> > >  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  |  8 ++-----
> > >  .../aspeed/aspeed-bmc-facebook-minerva.dts    | 24 +++++------------=
--
> > >  .../aspeed/aspeed-bmc-facebook-tiogapass.dts  |  2 +-
> > >  .../dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts |  2 +-
> > >  .../dts/aspeed/aspeed-bmc-opp-palmetto.dts    |  2 +-
> > >  .../boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts |  4 ++--
> > >  7 files changed, 14 insertions(+), 30 deletions(-)
> > >
> >
> > I see you've applied this to your tree. Sorry for being slow on the up-
> > take, I've been focusing on other things recently. Happy to take it
> > though, if you're happy to drop it?
>
> Actually, do you mind dropping it from your tree? It conflicts with
> Krzysztof's patch that I'd already applied:
>
> https://lore.kernel.org/all/20250819131743.86905-2-krzysztof.kozlowski@li=
naro.org/
>
> I've applied your patch here with a note in the trailer:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git/commit/?h=
=3Daspeed/dt&id=3D61a913644a8c5b6c8bd9da09f78f88e50edfaeb

I've dropped it. That was inadvertent.

Rob

