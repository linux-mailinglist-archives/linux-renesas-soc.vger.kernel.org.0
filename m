Return-Path: <linux-renesas-soc+bounces-13165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B2CA35F0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 14:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62B3516EF56
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 13:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F64264FBA;
	Fri, 14 Feb 2025 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V4gbX4vD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC6F264FA8;
	Fri, 14 Feb 2025 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739539245; cv=none; b=jjH5YiEtWs+dYHUODLUyT+40qYANbFThVdBg+FRRQfYD61OeNgwLY7nLAPkIWoeEhCTL1i1W645GKM6Q/iv5xei6K11QefeR8TetzRDCzBn/th509DeZuroMoQ+4J0ecFAUqbbOQzbdREz0raoBpF3l6iT+3NLVgaQaofoO0Ml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739539245; c=relaxed/simple;
	bh=e4a+q+RAMhA8fYnShfynVbYqZqP4/1an4yJ9FOUP/jk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=d6+1bI4EfQ+PK/Bk++Al/63wfOcAFXXt4C8sgwTQ0u/s1kfn+3SpnKrUb/4DJjKQNQ82DExMIKl8eAwobYcr/zUNIsiYTBTXwCRxs26iMrSt2XuCfzoKJjhIgvsu/x7r7gf1+au0OURYBwSqk4XJ5uuYSwchqMF/qZ5I1GpkTGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V4gbX4vD; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF63644428;
	Fri, 14 Feb 2025 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739539241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOCi9rhcANoHWr2ZMX7vTB+ne39Ad/Gv+eLqaTBAmak=;
	b=V4gbX4vD59+0iFSy3lk0mjAWfXowsqy/5PmB67YkkNUjabN9S0wutbebsfbMQtCwGDjivi
	mY6JHqKCtfV5EcewFobpb2PZzrG484q3aA5oHQyZNQF0NB/s5+fELSSkW3/MBxKe2R0d0W
	BJHca2LVlOsILgju/B+aGG9j3OWGRUr7sPOzKY7pTW3mzdh42gsj7OORL+pqCj3/yZAWqX
	dpgNTj+Ju0cRCuGi9e/NMIvLqMDP+spMOagq2vmmR+ytr7xFo0yXBW/yxWMXZHrvPKNpxm
	BH/qkSpbsEWfuPZfLq6sHd1USFPT3Wr0Sv9vMNKSM6y1LIYahm7tKoa/8D3fLg==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Feb 2025 14:20:39 +0100
Message-Id: <D7S772FNL7ZM.JNEXBJY6PJ44@bootlin.com>
Cc: "Magnus Damm" <magnus.damm@gmail.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 "Milan Stevanovic" <milan.stevanovic@se.com>, "Jimmy Lalande"
 <jimmy.lalande@se.com>, "Pascal Eberhard" <pascal.eberhard@se.com>,
 <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Gareth Williams"
 <gareth.williams.jx@renesas.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb
 board device-tree
From: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, "Romain Gantois" <romain.gantois@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20230209133507.150571-1-clement.leger@bootlin.com>
 <20230209133507.150571-3-clement.leger@bootlin.com>
 <CAMuHMdWUorkDYXZvsd-9rjwEkeJYC_FMfexZHaGYHDry=9Yjdg@mail.gmail.com>
 <20230215092933.2f71ece0@fixe.home> <20230215115441.361aed53@fixe.home>
 <CAMuHMdVhGFyrWx6oD-K9WhZRtYT_xJ_kWRA+vhdvB_JubFk8YA@mail.gmail.com>
 <CAMuHMdX4nMA6HSu=UkNEWJWKK432VB5YVQCWn_rDZ6mNSv+41g@mail.gmail.com>
 <87mshsvqjk.fsf@bootlin.com>
In-Reply-To: <87mshsvqjk.fsf@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurheptgffkfevuffhvfgggffofhgjsehtqhertdertdejnecuhfhrohhmpedfvfhhohhmrghsuceuohhnnhgvfhhilhhlvgdfuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeelfeefhfdtveehjedthefhtefggfdtheduieekiefhjeevheffhfelteefuddtnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgm
 hgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkihdoughtsehlihhnrghrohdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.bonnefille@bootlin.com

Hello Geert,

I've started working on this issue, however I have one problem :

>> Hi Cl=C3=A9ment,
>>
>> On Wed, Feb 15, 2023 at 12:31=E2=80=AFPM Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>>> On Wed, Feb 15, 2023 at 11:52 AM Cl=C3=A9ment L=C3=A9ger
>>> <clement.leger@bootlin.com> wrote:
>>> > Le Wed, 15 Feb 2023 09:29:33 +0100,
>>> > Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com> a =C3=A9crit :
>>> > > Le Tue, 14 Feb 2023 17:25:14 +0100,
>>> > > Geert Uytterhoeven <geert@linux-m68k.org> a =C3=A9crit :
>>> > > > On Thu, Feb 9, 2023 at 2:32 PM Cl=C3=A9ment L=C3=A9ger <clement.l=
eger@bootlin.com> wrote:
>>> > > > > The EB board (Expansion board) supports both RZ/N1D and RZ-N1S.=
 Since this
>>> > > > > configuration targets only the RZ/N1D, it is named r9a06g032-rz=
n1d400-eb.
>>> > > > > It adds support for the 2 additional switch ports (port C and D=
) that are
>>> > > > > available on that board.
>>> > > > >
>>> > > > > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.c=
om>
>>> > > >
>>> > > > Thanks for your patch!
>>> > > >
>>> > > > > --- /dev/null
>>> > > > > +++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-eb.dts
>>>
>>> > > > > +       pinctrl-0 =3D <&pins_eth1>, <&pins_eth2>, <&pins_eth3>,=
 <&pins_eth4>,
>>> > > > > +                   <&pins_mdio1>;
>>> > > > > +
>>> > > > > +       mdio {
>>> > > > > +               /* CN15 and CN16 switches must be configured in=
 MDIO2 mode */
>>> > > > > +               switch0phy1: ethernet-phy@1 {
>>> > > > > +                       reg =3D <1>;
>>> > > > > +                       marvell,reg-init =3D <3 16 0 0x1010>;
>>> > > >
>>> > > > marvell,reg-init is not documented in any DT bindings document?
>>> > >
>>> > > Indeed, this is not somethiong that should be made available here. =
It's
>>> > > only inverting the LED polarity but supported by some internal patc=
h.
>>> > > I'll remove that.
>>>
>>> > I actually was confused by a property I added in another device-tree =
but
>>> > marvell,reg-init exists, is handled by the marvell phy driver and use=
d
>>> > in a few device-trees. Strangely, it is not documented anywhere. So I
>>> > can either remove that (and the LED won't work properly) or let it li=
ve
>>> > depending on what you prefer.
>>>
>>> In that case, please keep it.
>>> But the property really should be documented, one day...

As Cl=C3=A9ment mentioned, this property is used to set up the LEDs for
Marvell PHY. However, Marvell's PHYs have no dedicated bindings; only
their associated switches do. PHY's usually don't have their own yaml,
so there is no easy place where to add this property. We could however
describe them in the numerous switch bindings that embed a Marvell PHY,
which are: Qualcomm ETHQOS, Cadence MACB/GEM, Gianfar, Freescale FEC,
Renesas switches and of course Marvell switches.

I already thought of doing it in the binding of the renesas switch, like
this :

Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml:
```

\[...\]

mdio:
$ref: /schemas/net/mdio.yaml#
patternProperties:
'@\[0-9a-f\]+$':
properties:
marvel,reg-init:
- description: Lorem Ipsum

unevaluatedProperties: false

\[...\]

```
but it would document it only for this particular switch.=20
It is also possible to do it in the main mdio.yaml on the model of this:
https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/devicetree/bi=
ndings/spi/spi-peripheral-props.yaml#L121

What's your opinion on this ?

Moreover, everywhere this property is used in the kernel, it is to set
up the LEDs. Nowadays, the Marvell PHY driver should be able to handle
LEDs without this property. Therefore, this property should be
deprecated in this case.

Regards,
Thomas

