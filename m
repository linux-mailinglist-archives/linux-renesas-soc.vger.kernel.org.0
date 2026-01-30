Return-Path: <linux-renesas-soc+bounces-27690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDotGxXhfGmpPAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:49:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F199BBCA32
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E313B3010385
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 16:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D2B2F3C1D;
	Fri, 30 Jan 2026 16:49:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E2D34FF76
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 16:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769791758; cv=none; b=AjGJ+YV0OQbcEhILUh4BO/nJjeRPe6yhxnwHnhwqAIThPDoy8A534/hWqwxa2om39DIYV0gD9Y8XJP9a7XCpO/zg2AvcjI4i7iBD35fWJBlQ+RdPlyJXmtaF7Uu0agf/dB7sX/+QAnrD6GUFtbX0903zXt4br4WEUtx7CNWoxz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769791758; c=relaxed/simple;
	bh=fD9gxQetzThjMYtpnsCWqdvlRxlJACAFBEWU3vYi8Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UwXlYj2eooCmzG7bT2eIP1ED8C0og1CjJQ3sgOmBk64ozW4pdv9uHhiObaT4V6iopYCh2tUUGoKOIiXbC0eFwC/klwy/fzVqdizrxkbozMb+eSZHMUIToPsSdP5Ls/NR8jwcRNws6QDNyHs1xc6gs4Q9dZfpFx80LAyuvwhU1fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56379cb870bso739996e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 08:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769791755; x=1770396555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eZJO5fek5/fmG2q9I10L0AXJiVKK7FgcGE1eelPW63I=;
        b=n7O3VXCA8GzSbqk3UTWkamwC4zGRIbFmUZts1bSCH0EVQFd727TguqQGFfjJgXcQzI
         p7kXDFhwaKXv+6QhuH+O3uR8x+DrmBWgpaUw1axUHJe8M8+Drd4kQ/xJ6rE24WGJG7Ah
         KUB0zJyO+UpYui5GinlQRwUQlUBTMoMFuMS79k5x6XqjwFl8NaFFehoo+4zc80IYL9a3
         Y1ASQRVLq6F7KwNNnlScptUc244CCuGfEc9EVz4O+TSvizlRF5rZxa/cpv3B0DD8RH6h
         0ujlD2Jvvv1xOJoLPflymL+lgfBGiKqzeD8/ugU1GA9X+Xz0dBXVjBih4Hjl4+re1wUk
         Txpg==
X-Forwarded-Encrypted: i=1; AJvYcCXd7e8UNc1xOF0e9xGM+RIDLEk/1GpHVW48LEIxd8Hf0G/8nOV+Hzzt/0yIEJT8fnVn9aS8OrD/PRkMBTQU090K3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbJp/Rr2EXUzdXT6h8eR3/N5Q7Ct/Gwgxdt3qLU6hkfRZ1fCgM
	nC8h3XZU1b7sbuOWXaiU4OLHNN37DUtPAPtk+LaAPVOizyt/s/ogdmNwtxkSt/6ocS8=
X-Gm-Gg: AZuq6aLfQoewXGeuiybhk3h18Ixp2KIH1T3FAJJzieWzhGcn4mi+RpyfY0sbku8D0lZ
	KLSlXzzcErloBj2JqtIMF8ienkxYL1EZMeEOP2K/8gbC0QO2eGnbAG9GKF22zZ3iNeKBOGxET6J
	zmBiAPJZACM+a9g1HL/yJUJgxO60cwJ1izSTD1qRXRlPlUdsjBAox7LNAfTXGxlpAiDQ9avc6ee
	wdYE3j6+8YR1A8znwFeatGO3e1iIQ4mry3iYI/fQ/yBXCkYPjfWMQoN02GC1NyXOJvBpICujexT
	Nftz3tTehG9hVYHQ4QY6uR44407ilWksriMod7p8OfqpfxaYyuj0o1mx3Vms4Ik7nFigiwn+iVo
	n2UKl5O6omh8/iAMmtJmZYkKkkLlcWc2SFVRU2EfPOVH27/ZPiNbqWmRL1/cL7LlUP+6yBoxDX3
	QMy8/EzsWMF7xRkivDl6spjG5wK6QPSJWoJ3Xr1EhiP5hBZ7Up
X-Received: by 2002:a05:6122:3a18:b0:566:221e:a98e with SMTP id 71dfb90a1353d-566a0157117mr943667e0c.18.1769791753955;
        Fri, 30 Jan 2026 08:49:13 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56685afc974sm2331261e0c.2.2026.01.30.08.49.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 08:49:13 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93f573ba819so769438241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 08:49:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVaxeB6CRDSMAs9fdtQopRGCfK40UMCoYAT9MbrlM54mKSbpfGgC67aqcO3vxGDT5C2SxX9IS10r/OpZ/lH1tdUw==@vger.kernel.org
X-Received: by 2002:a05:6102:3f05:b0:5f7:24d8:537c with SMTP id
 ada2fe7eead31-5f8e2659a26mr1102545137.31.1769791753256; Fri, 30 Jan 2026
 08:49:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
 <20260120150606.7356-5-ovidiu.panait.rb@renesas.com> <CAMuHMdVOCFS-31HA2Uxiu7CSmiOf_XwPk1kijYf_WkD0aJJJMw@mail.gmail.com>
 <TY7P301MB1984CB3A92C79442592B045DD39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
 <CAMuHMdUwsC96cnsZqkV63hnG=C86G5ymScY3qnLR9v830D4m4Q@mail.gmail.com> <TY7P301MB1984FB85250A9B18B5F981F5D39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
In-Reply-To: <TY7P301MB1984FB85250A9B18B5F981F5D39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Jan 2026 17:48:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVObafuLMBOt=atHJtBBcZ8s0C21Ep2juRE0XPih+iHBA@mail.gmail.com>
X-Gm-Features: AZwV_Qh4mmsGcgcGKwaS7OePDsuvOPtDv-k1-Xv8XUGlO0JwZUtIwuEb4QXisgw
Message-ID: <CAMuHMdVObafuLMBOt=atHJtBBcZ8s0C21Ep2juRE0XPih+iHBA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: "magnus.damm" <magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27690-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,0.0.0.12:email,mail.gmail.com:mid,0.0.0.69:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: F199BBCA32
X-Rspamd-Action: no action

Hi Ovidiu,

On Fri, 30 Jan 2026 at 17:25, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> > On Fri, 30 Jan 2026 at 14:43, Ovidiu Panait
> > <ovidiu.panait.rb@renesas.com> wrote:
> > > > On Tue, 20 Jan 2026 at 16:06, Ovidiu Panait
> > > > <ovidiu.panait.rb@renesas.com> wrote:
> > > > > Add versa3 clock generator node. It provides clocks for the RTC,
> > PCIe
> > > > > and audio devices.
> > > > >
> > > > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > > > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > > > > @@ -108,6 +108,12 @@ vqmmc_sdhi1: regulator-vccq-sdhi1 {
> > > > >                 states =3D <3300000 0>, <1800000 1>;
> > > > >         };
> > > > >
> > > > > +       x1: x1-clock {
> > > > > +               compatible =3D "fixed-clock";
> > > > > +               #clock-cells =3D <0>;
> > > > > +               clock-frequency =3D <24000000>;
> > > > > +       };
> > > > > +
> > > > >         /* 32.768kHz crystal */
> > > > >         x6: x6-clock {
> > > > >                 compatible =3D "fixed-clock";
> > > > > @@ -277,6 +283,25 @@ raa215300: pmic@12 {
> > > > >                 clocks =3D <&x6>;
> > > > >                 clock-names =3D "xin";
> > > > >         };
> > > > > +
> > > > > +       versa3: clock-generator@69 {
> > > > > +               compatible =3D "renesas,5l35023";
> > > > > +               reg =3D <0x69>;
> > > > > +               clocks =3D <&x1>;
> > > > > +               #clock-cells =3D <1>;
> > > > > +               assigned-clocks =3D <&versa3 0>,
> > > > > +                                 <&versa3 1>,
> > > > > +                                 <&versa3 2>,
> > > > > +                                 <&versa3 3>,
> > > > > +                                 <&versa3 4>,
> > > > > +                                 <&versa3 5>;
> > > > > +               assigned-clock-rates =3D <24000000>,
> > > >
> > > > Shouldn't (at least) qextal_clk and
> > > >
> > > > > +                                      <24576000>,
> > > > > +                                      <32768>,
> > > >
> > > > rtxin_clk be overridden to point to the corresponding versa3 output=
s?
> > > > Same comment for [PATCH v2 5/5].
> > > >
> > >
> > > I tried implementing this by overriding qextal_clk and rtxin_clk with
> > > fixed-factor-clock nodes that reference the versa3 outputs as parents=
:
> > >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > > @@ -504,7 +504,11 @@ io {
> > >  };
> > > =C2=B7
> > >  &qextal_clk {
> > > -       clock-frequency =3D <24000000>;
> > > +       compatible =3D "fixed-factor-clock";
> > > +       clocks =3D <&versa3 0>;
> > > +       #clock-cells =3D <0>;
> > > +       clock-mult =3D <1>;
> > > +       clock-div =3D <1>;
> > >  };
> > > =C2=B7
> > >  &rtc {
> > > @@ -512,7 +516,11 @@ &rtc {
> > >  };
> > > =C2=B7
> > >  &rtxin_clk {
> > > -       clock-frequency =3D <32768>;
> > > +       compatible =3D "fixed-factor-clock";
> > > +       clocks =3D <&versa3 2>;
> > > +       #clock-cells =3D <0>;
> > > +       clock-mult =3D <1>;
> > > +       clock-div =3D <1>;
> > >  };
> > >
> > > However, this breaks the boot. The problem seems to be probe
> > > ordering:
> > > 1. fixed-factor-clock uses CLK_OF_DECLARE, so it registers very early
> > > 2. At that point, versa3 clocks are not yet available (since versa3 i=
s
> > > an I2C device, it is probed much later)
> > > 3. The clock framework registers the fixed-factor-clock with rate =3D=
 0
> > > 4. Consumers (RTC, timers, etc) probe and see rate =3D 0, causing fai=
lures
> > >
> > > I'm also concerned that if qextal_clk (the main SoC clock) depends on
> > > versa3, nearly everything would need to defer until the I2C subsystem
> > > and versa3 driver are ready.
> > >
> > > Could you please provide any suggestions on how to handle this?
> >
> > I meant to override the references to qextal_clk and rtxin_clk, i.e.
> >
> >     &cpg {
> >             clocks =3D <&audio_extal_clk>, <&versa3 2>, <&versa3 0>;
> >     };
> >
> > However, that could still delay everything, in which case we should
> > just document the routing in the DTS using comments.
> >
> > Can you please give it a try?
>
> With this change, the board doesn't boot at all, no output on the
> serial console.
>
> I think with this we are introducing the following circular clk
> dependency chain:
>
>     cpg -> versa3 -> i2c -> cpg -> ...

I was already afraid so...

OK, then please just add comments like:

    @@ -289,9 +289,9 @@ versa3: clock-generator@69 {
                    reg =3D <0x69>;
                    clocks =3D <&x1>;
                    #clock-cells =3D <1>;
    -               assigned-clocks =3D <&versa3 0>,
    +               assigned-clocks =3D <&versa3 0>,  /* quextal */
                                      <&versa3 1>,
    -                                 <&versa3 2>,
    +                                 <&versa3 2>,  /* rtxin_clk */
                                      <&versa3 3>,
                                      <&versa3 4>,
                                      <&versa3 5>;

Any others needed?

Thanks for testing!

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

