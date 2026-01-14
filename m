Return-Path: <linux-renesas-soc+bounces-26787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9257D218AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 23:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F19B301C3DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 22:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBA13AEF4F;
	Wed, 14 Jan 2026 22:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u39bcDcN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BF9318BBC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 22:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768429303; cv=none; b=KN1gO3EVZpX4hE1vVUkPkjKiBK5ParArhnwRKbKnHvBYpftfco3rQ8nEKzb4HIauXEYbbsPdmDA8Wwob5p4VWwbL+NLENdNe70z2ssBTJR6oACM7GZFdrnnj6S6HXHtV2lFmmtQoxWyPLlnLHNgQPXjIpUKrDulCOtLh7rOUIXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768429303; c=relaxed/simple;
	bh=1uICaEb6OaakZbfgQJZ6sepanwumAw5+/pv8oqexxKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ui/7vAv6OscBPqPcLy3wtdD1Qx5gBjgB8JldX88y1MATU/h7JLGcoAKTY4NB43YgZjhM/6KSzD5qHgiwztVoMeMo+YF1d+9/A1daiHVY0tKcg24G+921LXLCfImFdqDqiYfgS8oa82uoi0qQSoUIrMUy8dzrl8nVj26lOSfD4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u39bcDcN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FC3C2BCB2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 22:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768429303;
	bh=1uICaEb6OaakZbfgQJZ6sepanwumAw5+/pv8oqexxKE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u39bcDcNryY2cAqcZwB7gcX9gPYjiBLfx4WuXBsBmq1F7+EXejeneDZrPPiKvbU+d
	 GGVykbCXinQ5girJCsxamTnn7JRGCYxqAVqOmd06WJEYgUm3s/MAr6l9RjTnJy4wt6
	 Wr3m5fCWQkCLx3RQjHMnpb50rUlPTJQ/ScLrEm0e17ehUgcJCgI/3s3U56gtMnG37I
	 1B0wHU5VKxme1g0G82KW2p27+Q0zcf8R+Ot34cLQ11u+IzN40oMhmVso+3sPO6bIKk
	 IKTIWnWQFrLbpsohPNjfIXr1CA3MDZpnCGwVbOe4+PRcBR2dHxEowWgmUF21+SrFmH
	 vbwwsc9iZhzQg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so407601a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 14:21:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7MkRgbLnOO+a9cVNC+hXLeoBuhzFGXCRFsFsl2cCiU5LpXVd3fkyXLEcUgCXMZbEUWm0sRspkAMmu+j9MkZKsaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBAQGkjyS4UxI+kyxYPqxIIK8lIF1zr8q7rxQIvLGfNDvQ//2r
	dIxs3WVc8GfWmJz7hgDcZ14iBnmA/yk9ByiS9IYd6IX+cn9f0TxXkM/rkXqMzy9DRH0EOJZrZIg
	057rSs8kS3YddMVmQ+RPBX9ghjAPRtQ==
X-Received: by 2002:a17:906:f586:b0:b73:210a:44e with SMTP id
 a640c23a62f3a-b87677a8468mr300295266b.30.1768429301486; Wed, 14 Jan 2026
 14:21:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
 <aWdp_jMVUBN04is3@ninjato> <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>
In-Reply-To: <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 Jan 2026 16:21:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJwGLXPCtSabkeD26Ct3MrzFBdU-3-gJbGEpRQcmL1LWw@mail.gmail.com>
X-Gm-Features: AZwV_Qgepzl3NXcY14N0bKPFohUKoPG5P0kElijySGepW3maAOssqN5G33HuGxg
Message-ID: <CAL_JsqJwGLXPCtSabkeD26Ct3MrzFBdU-3-gJbGEpRQcmL1LWw@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 4:47=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Wed, 14 Jan 2026 at 11:03, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > > Rob, Thomas, this series is blocked waiting for your feedback and you=
r
> > > acks if you are okay.
> >
> > This was a little hidden between the other text, so let me emphasize
> > that these acks are needed. The other option is to send the irq stuff
> > and the SoC stuff seperately.

Reviewed-by > Acked-by

And if it has either, I stop paying attention. So I was assuming this
all was going in via not-my-tree...

> The irq and SoC stuff depend on the of stuff, so doing so would
> delay the former by one cycle.
>
> On IRC, Rob sort of agreed to option A from my proposal (see v7 cover
> letter):
>
>   A. Rob takes the first two patches, and provides an immutable branch.
>      Then Thomas takes the irqchip patches, and I take the rest.

Until this...

> Unfortunately that part hasn't happened yet...

And then a new version came in... Why a new version only to add a
Tested-by tag? That sends you to the back of the queue in my normal
workflow (which this is turning into anything but).

Thomas has now provided a Reviewed-by. I think it is easiest if you
just take the whole series via Renesas tree.

Rob

