Return-Path: <linux-renesas-soc+bounces-13166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C47A35F68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 14:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B61D3A5460
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 13:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC772641CE;
	Fri, 14 Feb 2025 13:42:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E88B188713;
	Fri, 14 Feb 2025 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739540551; cv=none; b=CL3a/e1SlsBuXTOPANqK0EnT3CLagQap98WxETFD8cv4FFl1ADXz70cKKd1BxuV7a0X9GnLz+tsF3tG/9w3xGGA2gFIQHttHnTPxKx1M/xZ4FC87rV5jMgpVC2HPQwSzTsN2CPd0FNOtvhTYog5XiGYjcKpbOiPia+ZsNlQTtR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739540551; c=relaxed/simple;
	bh=AtePGr6YAyojvfsTe4DnSvj53t5BUnnlpM+hjDPoXzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoU1Ia4XSKHLrGndd3zXIgVKHvD3w3x18qv1msspdtzW79vqiOFvd54Pnrqwaf7OT+hK/8I9NG3btnepR7nON9GBDqq2xuVvO9PCiHpoLJIkUaArWByH2Rp3aeiEdd9g/KKDnE8NjNHmWZU3j3uuisRvIIMa76y/T0mtkSsBkHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5203e42d3a2so1225681e0c.2;
        Fri, 14 Feb 2025 05:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739540548; x=1740145348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eMtORqUA5GVqEKLwv62D8ADXo844fPuBQqktXQZ6Kw=;
        b=sL8b4DzP/VQTk3oDPyvRiPrxjT4/3qtuI8GiVMiR/LtvS5iRTN+1iKqykMBGXnfOZh
         W9P7+WNkPAg28YxTvdbyE86kkKCtlcRgNMqlIsOBJAIj/mCbYvDElp7wwQ4z15nQwmEL
         AtpX9iJASdLgrplubIStJoTm77CMYZW/cGJCe0Bk139FEAOE92DHSZSgpQziubE3ntY0
         PX0anr3MM1yes+M4i9qj+UhkWP2cUsC9bQDirQ3UH7UBwwj/v6TAJ75S6rd6liyo4U7u
         Beaeo/Awztm1UQeQXiSeRQBmth3IMBMsx6pbvE1CoAxAUuQrk0wyNbUMk3qx+eOvJ3mF
         7gqw==
X-Forwarded-Encrypted: i=1; AJvYcCWpXoL2E6RcIZzHBq4j2Ilm6c4EzY/vOy4r6GvOc9A6kd1oURAYOyl20TAUASQGe1il/XgYlxuZK5kcU5YN@vger.kernel.org, AJvYcCX06yrRvJjT2zqAhbBpbSGtFg2lYTgScc+yyShkTDc0rI8h13iEkkw+su9FS7Fby678e3AI4qZR5UzfVcuQ7m2Nm24=@vger.kernel.org, AJvYcCXjaVQCR/b8ouvBbovwv0/kpB8cUfn60io3em2203VsvDsKjUV4eF9FUvZM3C10/FjKESney4/XrEJQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4HZaefdlWufxdAREiG5PbDmnqjVTwdpWgPQDRPU+5Kv0xlWi2
	AybslTMr6X4Thtp5++5QgVBQjKbDyxcFGOfqRmcIh9VUk80Fa02Nq7KIjNrsxNc=
X-Gm-Gg: ASbGncv28FWoLj1bwRzdt3IEHzCm0TNdTLxDmTEZj5nOL9uo3z8ggvxazISzNb4krdd
	cU/B57igCD7llih1zMeeeYutONrBuehIAMajM3oVfRU+BbKSb75KsKXHuUWu9gyg85JI6qUKvM8
	TheOgo4zCxmQRpvbN9ZqzZALLCI9IoqLD/Z0RPUHbnhB7EVX6RI7auYUUTPaDMGlujkVOnufTha
	n8o/uEbGu8tcPi/jLCvM6SJ04+2+fX/52VM71U1uk1EMSwi5g781HXPtZpMynIqXMDeDleWC1ZL
	XLNkHCzxS1ytyRBBr8BhLGA7Y68Sfpp2BHqFDJOy0Jjb03s1laeeMVLotw==
X-Google-Smtp-Source: AGHT+IGNd+jyC1GKymunGpi5AKQlz863e5qjTK4/FBszeENFmFxobZ+cshacK1w8O4w5qSvDnwk+Gg==
X-Received: by 2002:a05:6122:2028:b0:520:3d87:5cdb with SMTP id 71dfb90a1353d-52067c9792amr9476433e0c.9.1739540547605;
        Fri, 14 Feb 2025 05:42:27 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52099016353sm82051e0c.31.2025.02.14.05.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 05:42:26 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5203e42d3a2so1225643e0c.2;
        Fri, 14 Feb 2025 05:42:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFhk1rsop2CTFoZO/AkKHi7qD7YtjbQI0XExI3i/OlvZTiy2fnesNbslJI0A8VlsypzFjB0nWDLbTR9NAM@vger.kernel.org, AJvYcCVyZdSDSvnEVuPPfmlQ5VkqJMUMsniRk6hlGpV8n/VMgKMvVIUB/h7UC8+7U+u6SwX0QRQdp41QALEi@vger.kernel.org, AJvYcCWsWO1qw10undvap0fp2AmBaTxfIQiPWOgSRi3LZ+tUaEKAOBtw3q7guIUB6vjCE9soNCTGZDDJzoe78opzp5CB/8A=@vger.kernel.org
X-Received: by 2002:a05:6122:1d08:b0:516:1ab2:9955 with SMTP id
 71dfb90a1353d-52067c67ffemr10980118e0c.6.1739540545745; Fri, 14 Feb 2025
 05:42:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230209133507.150571-1-clement.leger@bootlin.com>
 <20230209133507.150571-3-clement.leger@bootlin.com> <CAMuHMdWUorkDYXZvsd-9rjwEkeJYC_FMfexZHaGYHDry=9Yjdg@mail.gmail.com>
 <20230215092933.2f71ece0@fixe.home> <20230215115441.361aed53@fixe.home>
 <CAMuHMdVhGFyrWx6oD-K9WhZRtYT_xJ_kWRA+vhdvB_JubFk8YA@mail.gmail.com>
 <CAMuHMdX4nMA6HSu=UkNEWJWKK432VB5YVQCWn_rDZ6mNSv+41g@mail.gmail.com>
 <87mshsvqjk.fsf@bootlin.com> <D7S772FNL7ZM.JNEXBJY6PJ44@bootlin.com>
In-Reply-To: <D7S772FNL7ZM.JNEXBJY6PJ44@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Feb 2025 14:42:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAJRhSLYbt27P-AzwHc89+MYKi-3KmkhT=hhXq27UFbQ@mail.gmail.com>
X-Gm-Features: AWEUYZk7VVTGlam-ur_pAJ81xAGhmUj5VnlwuOsDrKgVXc4P7jxY7Yys2w81cLQ
Message-ID: <CAMuHMdVAJRhSLYbt27P-AzwHc89+MYKi-3KmkhT=hhXq27UFbQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb
 board device-tree
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	Milan Stevanovic <milan.stevanovic@se.com>, Jimmy Lalande <jimmy.lalande@se.com>, 
	Pascal Eberhard <pascal.eberhard@se.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gareth Williams <gareth.williams.jx@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, 14 Feb 2025 at 14:20, Thomas Bonnefille
<thomas.bonnefille@bootlin.com> wrote:
> >> On Wed, Feb 15, 2023 at 12:31=E2=80=AFPM Geert Uytterhoeven
> >> <geert@linux-m68k.org> wrote:
> >>> On Wed, Feb 15, 2023 at 11:52 AM Cl=C3=A9ment L=C3=A9ger
> >>> <clement.leger@bootlin.com> wrote:
> >>> > Le Wed, 15 Feb 2023 09:29:33 +0100,
> >>> > Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com> a =C3=A9crit :
> >>> > > Le Tue, 14 Feb 2023 17:25:14 +0100,
> >>> > > Geert Uytterhoeven <geert@linux-m68k.org> a =C3=A9crit :
> >>> > > > On Thu, Feb 9, 2023 at 2:32 PM Cl=C3=A9ment L=C3=A9ger <clement=
.leger@bootlin.com> wrote:
> >>> > > > > The EB board (Expansion board) supports both RZ/N1D and RZ-N1=
S. Since this
> >>> > > > > configuration targets only the RZ/N1D, it is named r9a06g032-=
rzn1d400-eb.
> >>> > > > > It adds support for the 2 additional switch ports (port C and=
 D) that are
> >>> > > > > available on that board.
> >>> > > > >
> >>> > > > > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin=
.com>
> >>> > > >
> >>> > > > Thanks for your patch!
> >>> > > >
> >>> > > > > --- /dev/null
> >>> > > > > +++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-eb.dts
> >>>
> >>> > > > > +       pinctrl-0 =3D <&pins_eth1>, <&pins_eth2>, <&pins_eth3=
>, <&pins_eth4>,
> >>> > > > > +                   <&pins_mdio1>;
> >>> > > > > +
> >>> > > > > +       mdio {
> >>> > > > > +               /* CN15 and CN16 switches must be configured =
in MDIO2 mode */
> >>> > > > > +               switch0phy1: ethernet-phy@1 {
> >>> > > > > +                       reg =3D <1>;
> >>> > > > > +                       marvell,reg-init =3D <3 16 0 0x1010>;
> >>> > > >
> >>> > > > marvell,reg-init is not documented in any DT bindings document?
> >>> > >
> >>> > > Indeed, this is not somethiong that should be made available here=
. It's
> >>> > > only inverting the LED polarity but supported by some internal pa=
tch.
> >>> > > I'll remove that.
> >>>
> >>> > I actually was confused by a property I added in another device-tre=
e but
> >>> > marvell,reg-init exists, is handled by the marvell phy driver and u=
sed
> >>> > in a few device-trees. Strangely, it is not documented anywhere. So=
 I
> >>> > can either remove that (and the LED won't work properly) or let it =
live
> >>> > depending on what you prefer.
> >>>
> >>> In that case, please keep it.
> >>> But the property really should be documented, one day...
>
> As Cl=C3=A9ment mentioned, this property is used to set up the LEDs for
> Marvell PHY. However, Marvell's PHYs have no dedicated bindings; only
> their associated switches do. PHY's usually don't have their own yaml,
> so there is no easy place where to add this property. We could however
> describe them in the numerous switch bindings that embed a Marvell PHY,
> which are: Qualcomm ETHQOS, Cadence MACB/GEM, Gianfar, Freescale FEC,
> Renesas switches and of course Marvell switches.
>
> I already thought of doing it in the binding of the renesas switch, like
> this :
>
> Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml:
> ```
>
> \[...\]
>
> mdio:
> $ref: /schemas/net/mdio.yaml#
> patternProperties:
> '@\[0-9a-f\]+$':
> properties:
> marvel,reg-init:
> - description: Lorem Ipsum
>
> unevaluatedProperties: false
>
> \[...\]
>
> ```
> but it would document it only for this particular switch.
> It is also possible to do it in the main mdio.yaml on the model of this:
> https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/devicetree/=
bindings/spi/spi-peripheral-props.yaml#L121
>
> What's your opinion on this ?

Oh, so this is a similar issue as the one preventing us from converting
the Micrel PHY bindings to dt-schema[1]?

You could still document it in a text binding file:
Documentation/devicetree/bindings/net/marvell,phy.txt
That cannot be used for validation, but at least people can find the
property using git grep...

> Moreover, everywhere this property is used in the kernel, it is to set
> up the LEDs. Nowadays, the Marvell PHY driver should be able to handle
> LEDs without this property. Therefore, this property should be
> deprecated in this case.

So the LED works now on this board without the property?
Then the property can be dropped?

[1] "[PATCH] [RFC] dt-bindings: net: micrel: Convert to json-schema"
    https://lore.kernel.org/linux-renesas-soc/943cb31d01d0da3a63911326e24fb=
f9b328f7206.1731580776.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

