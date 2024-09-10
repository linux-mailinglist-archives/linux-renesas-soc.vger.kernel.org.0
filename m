Return-Path: <linux-renesas-soc+bounces-8928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D736797418E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 20:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5940A1F26502
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 18:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074E819E802;
	Tue, 10 Sep 2024 18:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iqalw5by"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432B1156F2B;
	Tue, 10 Sep 2024 18:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725991380; cv=none; b=DZ3o+jsWCqjDC4IMjmRO+VrbXxXlFjGBNj5KuGFxCJT060HbeTLw7w+GEghlhcZmjwEek5GRNOFNYiJyHEurD7jgAOC0k61bnrNU9UDIW/babpWZDb5Dk9oMe1IprPRxhkon42fCbDRNF8fSXysKbU3+DUM7jCvuoZF652KOJWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725991380; c=relaxed/simple;
	bh=HcExZc/u8kTThLYzJyuI/nSmqxCXSWFCrpvVUcgE+HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rzt3C12q3YSdBPJZkqQTPfqzSLSLDRHGBo1yHi/EDpPQ0tUENNZ0djDE3n2DKNd+29JBvWcCFRPRwPfD8GhvOzatD3dP1a3Vso5/ZXzO1K4Zh6GeFE9AsV/IuWBY671C5b/kWca6XkUmAacDU90+6CfUWOYQMrWLIhgBBJzubHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iqalw5by; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53658f30749so5230148e87.3;
        Tue, 10 Sep 2024 11:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725991377; x=1726596177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFYYXXyb7v4b4XsvttXhTSz4fUQuT41beFn6/SpT1Ks=;
        b=Iqalw5byskFqFe7Dw9A24gMICNDbvgKnYs8iDQoSz19QrmjOSObRf4wXN6DsiQgov1
         3nevlmfJKgjDIHKEQjPI+EDLLyRRhQhZUy64iFV4r7ThlsMDNQq8TdUM6scn02O4/txa
         IfxNU7WfJfm9cA380DuUJG1xK9qsKq8L4dqSqbxEwQn3HqJmuX1rGw37Fk+xLPWOZQ5I
         YdeL5Jj35X8Iq3PD+MFhWflwQ0GWEGMa7zqY4lRdlNmB4K1NO0kuGvrYWaDpLIsiD54A
         axH5WjG1b5+KZcdvwE8+J6BeNv3s6ECTeeitZQytmaBwehqBFb9mA+qAgwQp8up7Imbq
         vNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725991377; x=1726596177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFYYXXyb7v4b4XsvttXhTSz4fUQuT41beFn6/SpT1Ks=;
        b=troSqpQAgjKqOwGjV49Q2i+8UKo8U6v1kO3Z49opG0WuuogWOmHcpWQqUocCtoNQgU
         Qwd48dTf1Km3Id5rUiHSr+DBi8pyDlO/PMBZ4XEJ2tkVUIb7erdK6yGWerLV2z1ayUPN
         19ZuIdfR+g373Z2EP46VUs/vqiIrUlPbKwvhstl2c0tJsfl8z1atWZD4/zMU8dwJw321
         h3w2Nd+JSsJ5RZNW70j2BH2pXv62sxFV331tKanNstKF6ON16ScvePVysJMDI6TOTl9v
         5oeaboUKBIRRXIAbwlFn/atEXgHGM6urUKAUAMBBS5puACOuDQ6aE98pvNxESOWwiBoL
         /VUA==
X-Forwarded-Encrypted: i=1; AJvYcCWVGxir8e2cpCZfQRJnnrWRipFGdIIh/Nzxd9HuSnjbqnTXKLsa5Eeak5n1Pok01wgR9542L+ga@vger.kernel.org, AJvYcCXl5ADnyBa9DxJ5e0Fb3seGWJx9QfyfxHZGdxaH66JGN4SgiSeTRclxqwkzV1s8abOdKMMrIZWG7SdCUX5qorPlSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqe7YRhN4yvOMxB2G8TuXpYyuPIegeyHfQMlyUOqgYGTMM1BqH
	VhXQ9A4++o1Edb4xrbXbh1P5YKONBplyzGfC6Lhwr/kJ1Q3E/Yk0oTn2ACdR7s25i8XU3nQLhne
	/OT8lqABD6duWw5C4K+CFiZDjJE8=
X-Google-Smtp-Source: AGHT+IH6eY7XBEdnkED3TwF1dmbKexYCne57VBeeoMRhL8IB6fSCsBauF0drczsadLPHEENGLnUi8ksLc2A4NptE0EE=
X-Received: by 2002:a05:6512:398f:b0:533:44e7:1b2a with SMTP id
 2adb3069b0e04-536587f5ea3mr10499710e87.40.1725991376845; Tue, 10 Sep 2024
 11:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
 <c334205e-6289-48da-b0c7-7ba82c6d2709@lunn.ch> <20240906213923.GZ3708622@fsdn.se>
 <f18ef2e8-f3ac-43df-95d4-96cea73e72d4@lunn.ch>
In-Reply-To: <f18ef2e8-f3ac-43df-95d4-96cea73e72d4@lunn.ch>
From: Stefan Eichenberger <eichest@gmail.com>
Date: Tue, 10 Sep 2024 19:02:44 +0100
Message-ID: <CAD4aGmRrofQzh56BSJKhmQnVM6qC8yLYuBsukirttZak26vRHQ@mail.gmail.com>
Subject: Re: [net-next 3/3] net: phy: marvell-88q2xxx: Enable auto negotiation
 for mv88q2110
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew and Niklas,

On Tue, 10 Sept 2024 at 17:32, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Sep 06, 2024 at 11:39:23PM +0200, Niklas S=C3=B6derlund wrote:
> > On 2024-09-06 22:36:49 +0200, Andrew Lunn wrote:
> > > On Fri, Sep 06, 2024 at 03:39:51PM +0200, Niklas S=C3=B6derlund wrote=
:
> > > > The initial marvell-88q2xxx driver only supported the Marvell 88Q21=
10
> > > > PHY without auto negotiation support. The reason documented states =
that
> > > > the provided initialization sequence did not to work. Now a method =
to
> > > > enable auto negotiation have been found by comparing the initializa=
tion
> > > > of other supported devices and an out-of-tree PHY driver.
> > > >
> > > > Perform the minimal needed initialization of the PHY to get auto
> > > > negotiation working and remove the limitation that disables the aut=
o
> > > > negotiation feature for the mv88q2110 device.
> > > >
> > > > With this change a 1000Mbps full duplex link is able to be negotiat=
ed
> > > > between two mv88q2110 and the link works perfectly. The other side =
also
> > > > reflects the manually configure settings of the master device.
> > > >
> > > >     # ethtool eth0
> > > >     Settings for eth0:
> > > >             Supported ports: [  ]
> > > >             Supported link modes:   100baseT1/Full
> > > >                                     1000baseT1/Full
> > > >             Supported pause frame use: Symmetric Receive-only
> > > >             Supports auto-negotiation: Yes
> > >
> > > My understanding is that most automotive applications using T1 don't
> > > actually want auto-neg, because it is slow. Given the static use case=
,
> > > everything can be statically configured.
> > >
> > > Is there a danger this change is going to cause regressions? There ar=
e
> > > users who are happy for it to use 100BaseT1 without negotiation, and
> > > the link partner is not offering any sort of negotiation. But with
> > > this change, autoneg is now the default, and the link fails to come
> > > up?
> >
> > I'm not sure how the generic use-case looks like. All I can say all
> > other devices supported by this driver support autoneg by default and
> > the initial commit adds some of the autoneg features but disables it
> > with a comment that they could not get it to work.
>
> I'm just worried about reports of regressions. It could be you are
> currently the only user of this driver, and you obviously don't care
> about the change in behaviour, and can change the configuration of the
> other end so that it also does autoneg.
>
> But then again, Stefan Eichenberger <eichest@gmail.com> added this
> driver. Does autoneg by default, not forced, cause problems for his
> systems?

Sorry I didn't reply before, I'm currently travelling. That's also why I
couldn't test the changes yet.

For our use case the proposed change shouldn't be an issue.
We anyway need to configure the speed from userspace. So I think
the proposed change is fine from a user's perspective. It will require
user space to configure the interface correctly before it starts the
interface or it will fallback to autoneg.

Regards,
Stefan

