Return-Path: <linux-renesas-soc+bounces-10651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 120FC9D4A95
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2024 11:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D5B9B21548
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2024 10:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECE01C9DD8;
	Thu, 21 Nov 2024 10:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kkZ8CDWe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A53F2309B6;
	Thu, 21 Nov 2024 10:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732184294; cv=none; b=H+ZNAZxchYWBFOyVKmVx/tg8IMd208GZKH+hK8RKEgybJaExqBwvaS+Xnx3sJmG0955p9BTfzFA5v3UyjZ3PRuxpthNF9AyGBzCPsq3wIxBDiV7vgiklY+5D40hNRBgMGD1lqgFptLH/vpOhsDmjsFYTO+2k1jW6cI7v9oDZpqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732184294; c=relaxed/simple;
	bh=t0c2i8+GlYTfqDD9xH1LK6zNin2RsOoo+ALw02hJUzo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LYHhamUpmkEplD4Rr4YJkTzjcTqC5nSFJbXq8P1PmdaH2JX8CDQQmylCL8N3Kqs37+yKl51MfJOMlbc3jJg8QmyjfeiLYn4CspLtpycFNc1aTYUU+4LEXKFaPvo/7M3lkya6wMFvmD8p8aqpFCFm3pT367vVmUjWhhoVHP7PseU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kkZ8CDWe; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB3AC20002;
	Thu, 21 Nov 2024 10:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732184288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSpipFllfpXYYHDQWPsv/JoqwKuQO0NyaVwH5k8jcGY=;
	b=kkZ8CDWeHL9oj3zg2E3STPYPZD7riH0WgjIXJzDp1aFWevI2EPp6QntDBcqIXbiY1evq/J
	l7GXMAN0QM+saJUBNgiJJnP13bt5gOAZEG9bI+PCqXtqxZT3bUKZwBupho21e0FffKAC/7
	g0NWW1+UPe76/Ef9UMo3RwzM/VgdE2lC+FjNT4Sb6lZ8KY/Dz6jfmfE2i1+V8FaEKs2hIj
	UlqPvLjO5ehQ5JL7NmsGhTwin6cT9YXswiarpD5pQLj+g6tkTwSLXVMK+dioneoPF1L8x2
	QdkqxEhEgTal33CY0NZV3Qp2ikTlysNwIdI+gGOVnR1CA+06XDHc+dPLpM7tYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,  Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Herve Codina
 <herve.codina@bootlin.com>,  Milan Stevanovic <milan.stevanovic@se.com>,
  Jimmy Lalande <jimmy.lalande@se.com>,  Pascal Eberhard
 <pascal.eberhard@se.com>,  linux-renesas-soc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,  Gareth
 Williams <gareth.williams.jx@renesas.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb
 board device-tree
In-Reply-To: <CAMuHMdX4nMA6HSu=UkNEWJWKK432VB5YVQCWn_rDZ6mNSv+41g@mail.gmail.com>
	(Geert Uytterhoeven's message of "Tue, 12 Nov 2024 11:50:29 +0100")
References: <20230209133507.150571-1-clement.leger@bootlin.com>
	<20230209133507.150571-3-clement.leger@bootlin.com>
	<CAMuHMdWUorkDYXZvsd-9rjwEkeJYC_FMfexZHaGYHDry=9Yjdg@mail.gmail.com>
	<20230215092933.2f71ece0@fixe.home>
	<20230215115441.361aed53@fixe.home>
	<CAMuHMdVhGFyrWx6oD-K9WhZRtYT_xJ_kWRA+vhdvB_JubFk8YA@mail.gmail.com>
	<CAMuHMdX4nMA6HSu=UkNEWJWKK432VB5YVQCWn_rDZ6mNSv+41g@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 21 Nov 2024 11:18:07 +0100
Message-ID: <87mshsvqjk.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Geert,

On 12/11/2024 at 11:50:29 +01, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:

> Hi Cl=C3=A9ment,
>
> On Wed, Feb 15, 2023 at 12:31=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Wed, Feb 15, 2023 at 11:52 AM Cl=C3=A9ment L=C3=A9ger
>> <clement.leger@bootlin.com> wrote:
>> > Le Wed, 15 Feb 2023 09:29:33 +0100,
>> > Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com> a =C3=A9crit :
>> > > Le Tue, 14 Feb 2023 17:25:14 +0100,
>> > > Geert Uytterhoeven <geert@linux-m68k.org> a =C3=A9crit :
>> > > > On Thu, Feb 9, 2023 at 2:32 PM Cl=C3=A9ment L=C3=A9ger <clement.le=
ger@bootlin.com> wrote:
>> > > > > The EB board (Expansion board) supports both RZ/N1D and RZ-N1S. =
Since this
>> > > > > configuration targets only the RZ/N1D, it is named r9a06g032-rzn=
1d400-eb.
>> > > > > It adds support for the 2 additional switch ports (port C and D)=
 that are
>> > > > > available on that board.
>> > > > >
>> > > > > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.co=
m>
>> > > >
>> > > > Thanks for your patch!
>> > > >
>> > > > > --- /dev/null
>> > > > > +++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-eb.dts
>>
>> > > > > +       pinctrl-0 =3D <&pins_eth1>, <&pins_eth2>, <&pins_eth3>, =
<&pins_eth4>,
>> > > > > +                   <&pins_mdio1>;
>> > > > > +
>> > > > > +       mdio {
>> > > > > +               /* CN15 and CN16 switches must be configured in =
MDIO2 mode */
>> > > > > +               switch0phy1: ethernet-phy@1 {
>> > > > > +                       reg =3D <1>;
>> > > > > +                       marvell,reg-init =3D <3 16 0 0x1010>;
>> > > >
>> > > > marvell,reg-init is not documented in any DT bindings document?
>> > >
>> > > Indeed, this is not somethiong that should be made available here. I=
t's
>> > > only inverting the LED polarity but supported by some internal patch.
>> > > I'll remove that.
>>
>> > I actually was confused by a property I added in another device-tree b=
ut
>> > marvell,reg-init exists, is handled by the marvell phy driver and used
>> > in a few device-trees. Strangely, it is not documented anywhere. So I
>> > can either remove that (and the LED won't work properly) or let it live
>> > depending on what you prefer.
>>
>> In that case, please keep it.
>> But the property really should be documented, one day...
>
> Any plans to follow-up?

Cl=C3=A9ment is no longer working with us; most of his ongoing work has been
offloaded to colleagues and mostly taken care of but this one has
clearly fallen into the cracks :)

I'm adding two colleagues in Cc in case they can have a look.

Cheers,
Miqu=C3=A8l

