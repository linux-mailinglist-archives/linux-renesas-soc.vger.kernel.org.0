Return-Path: <linux-renesas-soc+bounces-13352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06286A3C225
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 15:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246773A82E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 14:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8D51EFFAE;
	Wed, 19 Feb 2025 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AfOejkfP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33251EDA36;
	Wed, 19 Feb 2025 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739975239; cv=none; b=pHQ9GNi2391n4f05627QzlwM5uTVcRamDEom4S9f3D97ge0TZi8Cln54BwXs+0zbkFi/beCBEHcUUhLzetWrQSn0zB9OYIbMOmTc/1Q6SOpgFycwmrxFDT65ho3DPFYhSqudJqPHBtpVEyaUdZNDpp95bS8w+8eqzqbtLhXJT3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739975239; c=relaxed/simple;
	bh=0pFWGoZn4Prj7Yo7wgKAH1aCq2wU+y2KNw3p/vWZ0jk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eQbRDT5Ko6E+PXB9OinTXiifcvEtD3lYwIZVAyYlLvn7iBiP80N22gb57D7KC2ULGMI1zLPu3qjVRmExGYobYXzM+MhK+b67jaCTh/yJgSB+pzthS9Nd8yT4fTtdrX34lrssX/MLfYdJk7ZQx6iEGynVegknbsoLww8FIPzt4cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AfOejkfP; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ED624429B;
	Wed, 19 Feb 2025 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739975233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EkMPD/etQhH7KFsqRASd4glbb25QFa2tlMnA5cz7dtI=;
	b=AfOejkfPWIIkVVS8W7N/WjFh11EKqwCpwvfUvhcCF55VbZgZ+7dyzRVerahYA/U5QKvNfs
	14b6ciDDvT7hBKzP3DiDkgFYkYytOirMWDUkTGuq+DbMLhUY3MRZHPoP3bJA1XNSKD1wjW
	8t8dSAltbX1VBysPio9J42dgWNJuSh6bn7Ps7Yyx7asiipVUQt2goxVnpcf1Cdp4L378N3
	xhxHuXcUx9G6CXd8eiplIkEuQWPr840iwyVF6m4MZPa7E4XaetWFV535aJ9gTLca+/EtiA
	vBvfP3BS8R+ApQ0LHDv799HcSP6zWqhBEKTNqLobfSTtmzE2LwgFbCuvDyeXeA==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Feb 2025 15:27:11 +0100
Message-Id: <D7WHQQM7K8NI.3JS09W4941HY1@bootlin.com>
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Romain Gantois"
 <romain.gantois@bootlin.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
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
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20230209133507.150571-1-clement.leger@bootlin.com>
 <20230209133507.150571-3-clement.leger@bootlin.com>
 <CAMuHMdWUorkDYXZvsd-9rjwEkeJYC_FMfexZHaGYHDry=9Yjdg@mail.gmail.com>
 <20230215092933.2f71ece0@fixe.home> <20230215115441.361aed53@fixe.home>
 <CAMuHMdVhGFyrWx6oD-K9WhZRtYT_xJ_kWRA+vhdvB_JubFk8YA@mail.gmail.com>
 <CAMuHMdX4nMA6HSu=UkNEWJWKK432VB5YVQCWn_rDZ6mNSv+41g@mail.gmail.com>
 <87mshsvqjk.fsf@bootlin.com> <D7S772FNL7ZM.JNEXBJY6PJ44@bootlin.com>
 <CAMuHMdVAJRhSLYbt27P-AzwHc89+MYKi-3KmkhT=hhXq27UFbQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVAJRhSLYbt27P-AzwHc89+MYKi-3KmkhT=hhXq27UFbQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfvfhhohhmrghsuceuohhnnhgvfhhilhhlvgdfuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffekjeefheeuhfehtdeulefhieekteejuddvuddvuefgkeeiheffjeethedtieffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgm
 hgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkihdoughtsehlihhnrghrohdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.bonnefille@bootlin.com

Hello Geert,

> On Fri, 14 Feb 2025 at 14:20, Thomas Bonnefille
> <thomas.bonnefille@bootlin.com> wrote:
>> >> On Wed, Feb 15, 2023 at 12:31=E2=80=AFPM Geert Uytterhoeven
>> >> <geert@linux-m68k.org> wrote:
>> >>> On Wed, Feb 15, 2023 at 11:52 AM Cl=C3=A9ment L=C3=A9ger
>> >>> <clement.leger@bootlin.com> wrote:
>> >>> > Le Wed, 15 Feb 2023 09:29:33 +0100,
>> >>> > Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com> a =C3=A9crit :
>> >>> > > Le Tue, 14 Feb 2023 17:25:14 +0100,
>> >>> > > Geert Uytterhoeven <geert@linux-m68k.org> a =C3=A9crit :
>> >>> > > > On Thu, Feb 9, 2023 at 2:32 PM Cl=C3=A9ment L=C3=A9ger <clemen=
t.leger@bootlin.com> wrote:
>> >>> > > > > The EB board (Expansion board) supports both RZ/N1D and RZ-N=
1S. Since this
>> >>> > > > > configuration targets only the RZ/N1D, it is named r9a06g032=
-rzn1d400-eb.
>> >>> > > > > It adds support for the 2 additional switch ports (port C an=
d D) that are
>> >>> > > > > available on that board.
>> >>> > > > >
>> >>> > > > > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootli=
n.com>
>> >>> > > >
>> >>> > > > Thanks for your patch!
>> >>> > > >
>> >>> > > > > --- /dev/null
>> >>> > > > > +++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-eb.dts
>> >>>
>> >>> > > > > +       pinctrl-0 =3D <&pins_eth1>, <&pins_eth2>, <&pins_eth=
3>, <&pins_eth4>,
>> >>> > > > > +                   <&pins_mdio1>;
>> >>> > > > > +
>> >>> > > > > +       mdio {
>> >>> > > > > +               /* CN15 and CN16 switches must be configured=
 in MDIO2 mode */
>> >>> > > > > +               switch0phy1: ethernet-phy@1 {
>> >>> > > > > +                       reg =3D <1>;
>> >>> > > > > +                       marvell,reg-init =3D <3 16 0 0x1010>=
;
>> >>> > > >
>> >>> > > > marvell,reg-init is not documented in any DT bindings document=
?
>> >>> > >
>> >>> > > Indeed, this is not somethiong that should be made available her=
e. It's
>> >>> > > only inverting the LED polarity but supported by some internal p=
atch.
>> >>> > > I'll remove that.
>> >>>
>> >>> > I actually was confused by a property I added in another device-tr=
ee but
>> >>> > marvell,reg-init exists, is handled by the marvell phy driver and =
used
>> >>> > in a few device-trees. Strangely, it is not documented anywhere. S=
o I
>> >>> > can either remove that (and the LED won't work properly) or let it=
 live
>> >>> > depending on what you prefer.
>> >>>
>> >>> In that case, please keep it.
>> >>> But the property really should be documented, one day...
>>
>> As Cl=C3=A9ment mentioned, this property is used to set up the LEDs for
>> Marvell PHY. However, Marvell's PHYs have no dedicated bindings; only
>> their associated switches do. PHY's usually don't have their own yaml,
>> so there is no easy place where to add this property. We could however
>> describe them in the numerous switch bindings that embed a Marvell PHY,
>> which are: Qualcomm ETHQOS, Cadence MACB/GEM, Gianfar, Freescale FEC,
>> Renesas switches and of course Marvell switches.
>>
>> I already thought of doing it in the binding of the renesas switch, like
>> this :
>>
>> Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml:
>> ```
>>
>> \[...\]
>>
>> mdio:
>> $ref: /schemas/net/mdio.yaml#
>> patternProperties:
>> '@\[0-9a-f\]+$':
>> properties:
>> marvel,reg-init:
>> - description: Lorem Ipsum
>>
>> unevaluatedProperties: false
>>
>> \[...\]
>>
>> ```
>> but it would document it only for this particular switch.
>> It is also possible to do it in the main mdio.yaml on the model of this:
>> https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/devicetree=
/bindings/spi/spi-peripheral-props.yaml#L121
>>
>> What's your opinion on this ?
>
> Oh, so this is a similar issue as the one preventing us from converting
> the Micrel PHY bindings to dt-schema[1]?
>
> You could still document it in a text binding file:
> Documentation/devicetree/bindings/net/marvell,phy.txt
> That cannot be used for validation, but at least people can find the
> property using git grep...
>

Ack, I'll do that.

However, after the third version this series will no longer be related
to the marvell,reg-init property. Therefore, I might document it in a
different series.

>> Moreover, everywhere this property is used in the kernel, it is to set
>> up the LEDs. Nowadays, the Marvell PHY driver should be able to handle
>> LEDs without this property. Therefore, this property should be
>> deprecated in this case.
>
> So the LED works now on this board without the property?
> Then the property can be dropped?

Yes it does, I "just" have to add an LED as a child node of the phy in
the device-tree.
I'll send a third version using this mechanism soon.
However, I will not be able to test it on the real evaluation board but
on a proprietary board using the same SoC and PHY. It should not cause
any problem as I will reproduce exactly what the marvell,reg-init
property was doing.

Regards,
Thomas

