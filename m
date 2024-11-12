Return-Path: <linux-renesas-soc+bounces-10472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945329C57B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 13:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 805BCB455C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 11:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26BC221FBE;
	Tue, 12 Nov 2024 10:50:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8943F215013;
	Tue, 12 Nov 2024 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731408646; cv=none; b=Y0TGS4k0QQ0WriEuDcZ6DLG8ZYf79V8TYh4NWEplq8uBzfclZUpf70cwGV1MiMfRME8p13Xp5k1joYCiE90bncmiJdxDmDrumVzk9fLXibGVt1Hv/RHPLdWThrxqKgAGAluTjeW+hbiBL8grpi0lh87ZTWs+vKjh6h5NlyXvp5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731408646; c=relaxed/simple;
	bh=5/DByjEEer8WXk/PaeapgQQMr9rzXdq1kcSHqwQGC4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Goilo5vnjeR/GLxxSVoqi/pKYL/2IZy/RzMbbGg1Gb4uIM/o+L09gDXAXTV3QrIvZWt+xVqdAeeSRX7rNYfMPt7bvnhLGoUobEGyW+61WobzjCR8xhWQEnL5iFNhaJpFcpoX0vGMmU9ZPPWT4IcA+Tky5g3SgV33xmEM08sVYyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea5f68e17aso55384807b3.3;
        Tue, 12 Nov 2024 02:50:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731408642; x=1732013442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0BSboSqMmas8utBDJVLngyLT8Ucl86axxgJRcwpUMQ=;
        b=iopOKNMKF5zXtyE+DMHwUkv1fSY/NVlEEl7IO8GLrNY+5qqdicnBPyHDVYg+4v3NFk
         MorJfkOFe6riIJt4SFTKjt89uACaPFjT3y8n31co+kTPliH6mCSVfNgeXXEGEzlnEA0q
         ngRgKRLEaS3VTK20wJ9oJ6lnNurhzKVrxFt7IESBFGcD6DXB/vZIiihxjSIvwH41GPqL
         72SIdTLJvivFIc58AOi8peGHdkDQdhGvPhs1hhIZmHpVJuUSuTc+l4oDE/MiEBEJ7r6B
         TFsoKiZXus7SECsXDxtIcnVsPYdh89MW/L1tXLxdC7hFoKgQ0H/S+T65rCacNINWdVC7
         aPow==
X-Forwarded-Encrypted: i=1; AJvYcCW7IDMX4tRDTebia+mb3ok1Rv/wcLDBlcH5EFgmfWJ4S2d5rroqbV0j9pyZrg4i+HbGLranyfljPyYaPG18dVS0EsU=@vger.kernel.org, AJvYcCWPrso06pO0y4IcBK2lMrIodLnMWhuf5k5DS0lM/OfAIMzo9BQNUwfCeOrh1uUWpAgmHYQjvjLT3YSdtn5T@vger.kernel.org, AJvYcCWSGv89OgkMB/qoLDiuAIsEpVsbzGWkJidFyvKVn3LTKBN3n6TouJhflknlEdRWXqM1zJOQ9SqDdBhN@vger.kernel.org
X-Gm-Message-State: AOJu0YzW6psa/pNzvb+7e4XcMDqXsvQEyaP8sMNkNHbt2+KyHfASG4Em
	kvf7zChgi5zVmvtEOp+/E2LInwCA2Z6HD6Iv+v17c1GmnywX7dmtjJSs3Cka
X-Google-Smtp-Source: AGHT+IEE8dqhj3QPdyCSXJsXrewnASvozcvMgJFIedqkGIrZRiyr9V8vK31qxKA2OnMIdBMON8aSwQ==
X-Received: by 2002:a05:690c:dc1:b0:6d3:f9a6:e29c with SMTP id 00721157ae682-6eaddda0e01mr147759387b3.12.1731408642671;
        Tue, 12 Nov 2024 02:50:42 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eace8f1d2csm24669967b3.42.2024.11.12.02.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 02:50:41 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so46627907b3.1;
        Tue, 12 Nov 2024 02:50:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVmlb142wAwJbk5buebo9G5A6vscfVNpFYfhZeclzN3M6xMAklg+zhTxOaxFjUlSpQkB813F2YTwwlo@vger.kernel.org, AJvYcCWmdmIU5WuaVRMxI/D0g2jZA5iurLSA6D0mHYXDhmHRhRDVP1Ey/pYVaFh62vh7KnBQBkHzvDXhClUL7ZqjdpXfQqE=@vger.kernel.org, AJvYcCX0xIWwHJ7WRgPt2HrdmBQjnuVPwJeyL8G0PjooOCXvDxrmJN4r9nb7C+mwvVvFpbFGeQA44kax/++C5Om0@vger.kernel.org
X-Received: by 2002:a05:690c:48c8:b0:6e3:2192:e0e6 with SMTP id
 00721157ae682-6eaddda2d9fmr160448687b3.14.1731408641672; Tue, 12 Nov 2024
 02:50:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230209133507.150571-1-clement.leger@bootlin.com>
 <20230209133507.150571-3-clement.leger@bootlin.com> <CAMuHMdWUorkDYXZvsd-9rjwEkeJYC_FMfexZHaGYHDry=9Yjdg@mail.gmail.com>
 <20230215092933.2f71ece0@fixe.home> <20230215115441.361aed53@fixe.home> <CAMuHMdVhGFyrWx6oD-K9WhZRtYT_xJ_kWRA+vhdvB_JubFk8YA@mail.gmail.com>
In-Reply-To: <CAMuHMdVhGFyrWx6oD-K9WhZRtYT_xJ_kWRA+vhdvB_JubFk8YA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Nov 2024 11:50:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4nMA6HSu=UkNEWJWKK432VB5YVQCWn_rDZ6mNSv+41g@mail.gmail.com>
Message-ID: <CAMuHMdX4nMA6HSu=UkNEWJWKK432VB5YVQCWn_rDZ6mNSv+41g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb
 board device-tree
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	=?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
	Milan Stevanovic <milan.stevanovic@se.com>, Jimmy Lalande <jimmy.lalande@se.com>, 
	Pascal Eberhard <pascal.eberhard@se.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gareth Williams <gareth.williams.jx@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Wed, Feb 15, 2023 at 12:31=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Feb 15, 2023 at 11:52 AM Cl=C3=A9ment L=C3=A9ger
> <clement.leger@bootlin.com> wrote:
> > Le Wed, 15 Feb 2023 09:29:33 +0100,
> > Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com> a =C3=A9crit :
> > > Le Tue, 14 Feb 2023 17:25:14 +0100,
> > > Geert Uytterhoeven <geert@linux-m68k.org> a =C3=A9crit :
> > > > On Thu, Feb 9, 2023 at 2:32 PM Cl=C3=A9ment L=C3=A9ger <clement.leg=
er@bootlin.com> wrote:
> > > > > The EB board (Expansion board) supports both RZ/N1D and RZ-N1S. S=
ince this
> > > > > configuration targets only the RZ/N1D, it is named r9a06g032-rzn1=
d400-eb.
> > > > > It adds support for the 2 additional switch ports (port C and D) =
that are
> > > > > available on that board.
> > > > >
> > > > > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com=
>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-eb.dts
>
> > > > > +       pinctrl-0 =3D <&pins_eth1>, <&pins_eth2>, <&pins_eth3>, <=
&pins_eth4>,
> > > > > +                   <&pins_mdio1>;
> > > > > +
> > > > > +       mdio {
> > > > > +               /* CN15 and CN16 switches must be configured in M=
DIO2 mode */
> > > > > +               switch0phy1: ethernet-phy@1 {
> > > > > +                       reg =3D <1>;
> > > > > +                       marvell,reg-init =3D <3 16 0 0x1010>;
> > > >
> > > > marvell,reg-init is not documented in any DT bindings document?
> > >
> > > Indeed, this is not somethiong that should be made available here. It=
's
> > > only inverting the LED polarity but supported by some internal patch.
> > > I'll remove that.
>
> > I actually was confused by a property I added in another device-tree bu=
t
> > marvell,reg-init exists, is handled by the marvell phy driver and used
> > in a few device-trees. Strangely, it is not documented anywhere. So I
> > can either remove that (and the LED won't work properly) or let it live
> > depending on what you prefer.
>
> In that case, please keep it.
> But the property really should be documented, one day...

Any plans to follow-up?
Thanks!

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

