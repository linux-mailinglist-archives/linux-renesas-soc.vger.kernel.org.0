Return-Path: <linux-renesas-soc+bounces-25020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D77D8C7BC66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 22:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC0654E11CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 21:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA0C2FFDC9;
	Fri, 21 Nov 2025 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0gtV3Gf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096E22E6CC6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 21:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763761308; cv=none; b=sCgvif4wJZ8gB+HUuzD7WUNPmZuNZjqqzcatA0kkevUwkRJvYGFtdrpienE8GnSz1nYBU4VDnb3is0k8GXMYw6X5I4gYNqMSM3X37zN0UsW5J0COiFrSGP5SWZ7374P1lPDMQWotJO167riidNy79fxAAySF3lnTKIOR7dHmIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763761308; c=relaxed/simple;
	bh=tWpGutvthbl0vmJC71Cjs0NJn9cl86bS2pwKW7GWMxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hdA/iEvERSMCisLsSDlSW8nZGHrckiY71NZaU249qataoqniL8XD+mVS5LrGGM9YhfUBUqpFz9LA0vXLrNUYvgRBPafNAlpqIFwpOdJ+YyUWiLUCW6InzTRDdpn3uTO7SL+ExEgzXS58jRKT6eMBrF6jAIym3Pe/VOM5sxcTdT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0gtV3Gf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779d47be12so19463755e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 13:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763761304; x=1764366104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEotC2Jer+OQWcHMmR588K4B9r/jwYBL3ATyOeVj44I=;
        b=J0gtV3GfPNnv9aKKJgGbIuwZfzzZRGcizYfvjZAE0eDsxoMBhGP3TCeNxBpMbnV6qs
         xR2PDBSo+K6yVTjoN/eAXxPvVownYOjrG1QLGoNLHtVKt8ePvgBUrg0J49ir72rnM0z2
         tNP8YSOpMHlvK0R9ASt9/ITaNY/0jR/E1zULD+af05VNRo4DuQZyfjjR2AWhTpNkNams
         KNwpVmWOJlbwlWNNVh9/wJU8j4REA/DYmW405l1e4Ekw8wIwhG4wbdMRZIZwlzwBYfY+
         E1cu/JZO8Pl7sc0LPxMhLhEpyp3WGuWR4cAMwGvcPwpcZFI98MTQel4//p/ot1jbklIW
         RfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763761304; x=1764366104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEotC2Jer+OQWcHMmR588K4B9r/jwYBL3ATyOeVj44I=;
        b=IJSDiJ0Rh2o33WSPntflzh2o03ZfuW877i5pSEjewJgI1jlgexFYKJ0IobSC1QwOEF
         mSnq7UKE250wHzXtftuqWECB4w3moNGdZZ78+DuR4OiO0U/9aWPBGVxQP4w+oVTlWPK4
         tZWIECKjr0/x1xTuf/GT7nVUoNN5dYqQSqGzo3GV/H3ZeiP+UXmBq9E25at1f/7rOdsY
         qA+5dg6xroJ87EonvyxFla+x5rOkEW3/I2TcF5jF1HYQkmJ+KblcqVUeAdxuLR8RZFUY
         zjZoqtghaZKnAJU5GvH8xKfdAmm2I3CxEU66IdPvLVHIMqaso6RvDoqicTLa+8fCxHOZ
         +oLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnDV0rseOx5KEn1hudylVwFtP6jK1Ro+82ejlshX2q0IKK4V3CNRRSYwMcRemCkQY8uy+d0n7vHKtaHTeADuUF0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8HsJOvSeJH1fGa/2WNXZhE5shXOV4YmeW6/OCtsEIOsRBHmJ1
	zZS6yCCLje2EWcS86QZPTso7MmyTKZJD1s4K48En265BFev/i5Yof5RaFTqwjeaPEFRfXFP06kn
	CokQYQZXMao3KYs8s35L8xmqUMrLHOFI=
X-Gm-Gg: ASbGncs4y59jaoFqQ5g0WrzC/vL1vhrMa8P/fYmtQ6+EbWeIPWumD8pFi+O4Pm3PC0l
	iIdPCu8LMZOnZ9/OrGjh48n/pMtvRI0d4aj33Plqi8Ddv6JM0jlG+BroLdnCfFsI4vG6ZgXYFOr
	WJzv3rcyx7Daht0zEPtCW/L3jVgcR8P3uapyk4uAchVAohcndCpHRW2lEKR6IkAfEAHuKV+xYgd
	Md/b7g+0pvQ42WlUIbH/gR6fIkjmctx2fOLVkxbil3eEVNd1kb+NJVqz8D4wRzTRjvRiLRDCjnK
	b3+nw7CWL1YH+niBedx6dYonclNw
X-Google-Smtp-Source: AGHT+IHeREyNsO6TawnTkYCrf9XGp32KZCYN1xfZZ5gkS4XCMZGcna8r1J1jHYakREKCoqjzMWX7Imhr8FoVJ4OHPdI=
X-Received: by 2002:a05:600c:1f85:b0:477:9c73:267f with SMTP id
 5b1f17b1804b1-477c01ff629mr32731045e9.33.1763761304086; Fri, 21 Nov 2025
 13:41:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251121203453.y6s46k4ttdtq5mgh@skbuf>
In-Reply-To: <20251121203453.y6s46k4ttdtq5mgh@skbuf>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Nov 2025 21:41:18 +0000
X-Gm-Features: AWmQ_bnkkDC-5qzFEr6hKU9cjN4WecnAvwwlnGTCtwbWhs045dHTVDk3pOihUVk
Message-ID: <CA+V-a8sRr9FzR8pCXJbeuyidv+zVLykhPnj_71zuEGf8U4xS7A@mail.gmail.com>
Subject: Re: [PATCH net-next 07/11] net: dsa: rzn1-a5psw: Make switch topology
 configurable via OF data
To: Vladimir Oltean <olteanv@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

Thank you for the review.

On Fri, Nov 21, 2025 at 8:34=E2=80=AFPM Vladimir Oltean <olteanv@gmail.com>=
 wrote:
>
> On Fri, Nov 21, 2025 at 11:35:33AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move the switch topology description-the number of ports and the CPU-po=
rt
> > index-out of hard-coded constants and into SoC-specific OF match data. =
The
> > driver previously assumed a fixed 5-port layout with the last port acti=
ng
> > as the CPU port. That assumption does not hold for newer Renesas varian=
ts,
> > and embedding it in the code made the driver inflexible and error-prone=
.
>
> That assumption has 2 parts: that the port has 5 ports, and that the
> last port is the CPU port. It's unclear from your statement which part
> does not hold. I see that for the new switches, the CPU port is still
> the last port (not that there's a problem with still parameterizing it).
>
> >
> > Introduce a small a5psw_of_data structure carrying both the total numbe=
r
> > of ports and the CPU-port identifier, and rely on this data everywhere =
the
> > driver previously used fixed values. This ensures that port loops, PCS
> > allocation, management-port setup, and bridge bookkeeping all reflect t=
he
> > actual hardware configuration.
> >
> > Making these attributes runtime-selectable allows the driver to support
> > RZ/T2H and RZ/N2H SoCs which use different port counts and CPU-port
> > assignments-without rewriting common logic or forking the driver, while
> > preserving correct behaviour on existing RZN1 systems.
>
> The code is mostly fine, but reading the commit message had me jumping
> or twitching any time I would see the words "configure" or "make attribut=
es
> runtime-selectable". These expressions have their own meanings having to
> do with adding kernel APIs through which these parameters can be changed
> (by the user), so I wasn't really sure what I was going to review. None
> of that is the case, according to the code. Please choose other wording.
> You're not making the driver attributes configurable, you're just
> replacing constants hardcoded in the .text section with constants
> hardcoded in structured data in the .rodata section, selected at probe
> time based on compatible string.
>
> I'm sorry for saying this, but the commit message is too long for the
> amount of information that it transmits. You repeated 3 times the
> properties that need to be parameterized (port count and CPU port index),
> and there's more bla bla about irrelevant things like forking the driver.
>
> The commit message has to serve as an aid in understanding the change
> itself, not detract from it. In this case, giving the motivation and
> context in one paragraph or two is fine, but then you can use the space
> to focus on listing the transformations that need to be followed when
> reviewing the patch, and if not obvious, explain what led to those
> choices. What you want is obviously correct changes.
>
Thanks for the detailed feedback.

I understand your point regarding the terminology using phrases like
=E2=80=9Cconfigure=E2=80=9D and =E2=80=9Cruntime-selectable=E2=80=9D was mi=
sleading, and that wasn=E2=80=99t
my intention. I=E2=80=99ll revise the commit message to avoid implying
user-accessible configuration and instead describe the change more
accurately.

> For example, why ARRAY_SIZE(a5psw->pcs) transforms into
> a5psw->of_data->nports - 1. Is this the best choice? The code looks
> worse, and it's not obvious that the last port would not have a PCS as a
> matter of architecture. You had several other options: introduce an
> "npcs" extra parameter, or even compare with "cpu_port" and place
> comments explaining the lack of a PCS for the CPU port (since "cpu_port"
> is "nports - 1").
>
Agreed, I'll rework on it.

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/net/dsa/rzn1_a5psw.c | 26 +++++++++++++++++---------
> >  drivers/net/dsa/rzn1_a5psw.h | 17 ++++++++++++++---
> >  2 files changed, 31 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.=
c
> > index 99098bc06efe..d957b6d40f05 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.c
> > +++ b/drivers/net/dsa/rzn1_a5psw.c
> > @@ -382,13 +382,14 @@ static void a5psw_port_bridge_leave(struct dsa_sw=
itch *ds, int port,
> >                                   struct dsa_bridge bridge)
> >  {
> >       struct a5psw *a5psw =3D ds->priv;
> > +     unsigned int cpu_port =3D a5psw->of_data->cpu_port;
> >
> >       a5psw->bridged_ports &=3D ~BIT(port);
> >
> >       a5psw_port_set_standalone(a5psw, port, true);
> >
> >       /* No more ports bridged */
> > -     if (a5psw->bridged_ports =3D=3D BIT(A5PSW_CPU_PORT))
> > +     if (a5psw->bridged_ports =3D=3D BIT(cpu_port))
> >               a5psw->br_dev =3D NULL;
> >  }
> >
> > @@ -924,20 +925,21 @@ static void a5psw_vlan_setup(struct a5psw *a5psw,=
 int port)
> >  static int a5psw_setup(struct dsa_switch *ds)
> >  {
> >       struct a5psw *a5psw =3D ds->priv;
> > +     unsigned int cpu_port =3D a5psw->of_data->cpu_port;
> >       int port, vlan, ret;
> >       struct dsa_port *dp;
> >       u32 reg;
> >
> > -     /* Validate that there is only 1 CPU port with index A5PSW_CPU_PO=
RT */
> > +     /* Validate that there is only 1 CPU port with index matching cpu=
_port */
> >       dsa_switch_for_each_cpu_port(dp, ds) {
> > -             if (dp->index !=3D A5PSW_CPU_PORT) {
> > +             if (dp->index !=3D cpu_port) {
> >                       dev_err(a5psw->dev, "Invalid CPU port\n");
> >                       return -EINVAL;
> >               }
> >       }
> >
> >       /* Configure management port */
> > -     reg =3D A5PSW_CPU_PORT | A5PSW_MGMT_CFG_ENABLE;
> > +     reg =3D cpu_port | A5PSW_MGMT_CFG_ENABLE;
> >       a5psw_reg_writel(a5psw, A5PSW_MGMT_CFG, reg);
> >
> >       /* Set pattern 0 to forward all frame to mgmt port */
> > @@ -1147,7 +1149,7 @@ static void a5psw_pcs_free(struct a5psw *a5psw)
> >  {
> >       int i;
> >
> > -     for (i =3D 0; i < ARRAY_SIZE(a5psw->pcs); i++) {
> > +     for (i =3D 0; i < a5psw->of_data->nports - 1; i++) {
> >               if (a5psw->pcs[i])
> >                       miic_destroy(a5psw->pcs[i]);
> >       }
> > @@ -1174,7 +1176,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
> >                       goto free_pcs;
> >               }
> >
> > -             if (reg >=3D ARRAY_SIZE(a5psw->pcs)) {
> > +             if (reg >=3D a5psw->of_data->nports - 1) {
> >                       ret =3D -ENODEV;
> >                       goto free_pcs;
> >               }
> > @@ -1223,7 +1225,8 @@ static int a5psw_probe(struct platform_device *pd=
ev)
> >       if (IS_ERR(a5psw->base))
> >               return PTR_ERR(a5psw->base);
> >
> > -     a5psw->bridged_ports =3D BIT(A5PSW_CPU_PORT);
> > +     a5psw->of_data =3D of_device_get_match_data(dev);
> > +     a5psw->bridged_ports =3D BIT(a5psw->of_data->cpu_port);
> >
> >       ret =3D a5psw_pcs_get(a5psw);
> >       if (ret)
> > @@ -1268,7 +1271,7 @@ static int a5psw_probe(struct platform_device *pd=
ev)
> >
> >       ds =3D &a5psw->ds;
> >       ds->dev =3D dev;
> > -     ds->num_ports =3D A5PSW_PORTS_NUM;
> > +     ds->num_ports =3D a5psw->of_data->nports;
> >       ds->ops =3D &a5psw_switch_ops;
> >       ds->phylink_mac_ops =3D &a5psw_phylink_mac_ops;
> >       ds->priv =3D a5psw;
> > @@ -1310,8 +1313,13 @@ static void a5psw_shutdown(struct platform_devic=
e *pdev)
> >       platform_set_drvdata(pdev, NULL);
> >  }
> >
> > +static const struct a5psw_of_data rzn1_of_data =3D {
> > +     .nports =3D 5,
> > +     .cpu_port =3D 4,
> > +};
> > +
> >  static const struct of_device_id a5psw_of_mtable[] =3D {
> > -     { .compatible =3D "renesas,rzn1-a5psw", },
> > +     { .compatible =3D "renesas,rzn1-a5psw", .data =3D &rzn1_of_data }=
,
> >       { /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, a5psw_of_mtable);
> > diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.=
h
> > index 81be30d6c55f..d1b2cc5b43e6 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.h
> > +++ b/drivers/net/dsa/rzn1_a5psw.h
> > @@ -195,8 +195,7 @@
> >  #define A5PSW_aCarrierSenseErrors            0x924
> >
> >  #define A5PSW_VLAN_TAG(prio, id)     (((prio) << 12) | (id))
> > -#define A5PSW_PORTS_NUM                      5
> > -#define A5PSW_CPU_PORT                       (A5PSW_PORTS_NUM - 1)
> > +#define A5PSW_MAX_PORTS                      4
>
> Poor naming choice - it makes nports larger than A5PSW_MAX_PORTS, which
> according to their name should be directly comparable.
>
> Perhaps A5PSW_MAX_NUM_PCS (a comment explaining the relationship with
> the CPU port would be good).
>
Agreed, I will rename it.

Cheers,
Prabhakar

