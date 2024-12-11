Return-Path: <linux-renesas-soc+bounces-11228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712CE9ECC76
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEAB9284721
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D74B23FD34;
	Wed, 11 Dec 2024 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcYlxUDm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DED523FD10;
	Wed, 11 Dec 2024 12:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733921187; cv=none; b=NjE8iA6tRGPk96CY7wWZnMi+AjN0dEeUBTrjVZ+XNG0wy73Rpz+Zk2pomZORF5T0hlARiMUV/7clWGJ0jd4ly/LePhoaLtAaXGjedL+2G63c5FqWQBvO66jnSSQuK4+YcMSzEc3mkGgSB3MmMHi759vpknkmA69UsZe1bqaEltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733921187; c=relaxed/simple;
	bh=EkVzbf3G5rM9qDm6rnu4x6G4ljxJpqFU6D3ZAwpBTqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I6SkGPCxmDMCVY7XB9l1iAoRUJ0pzLW8LKib6IXyhK8xwdp0H+ZoRztfZrB6wVYf0BzWXHNGyaO/2kpiQE32ZJYjq/+EwiBi7q34MJNw/MPLQDyQFJwuV9nYpqyy4/6jk3j20sYgN6Ll7lbTfJ0Nz+kAo1bLS91/eNBVCjy0iKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcYlxUDm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95691C4CEE4;
	Wed, 11 Dec 2024 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733921186;
	bh=EkVzbf3G5rM9qDm6rnu4x6G4ljxJpqFU6D3ZAwpBTqo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rcYlxUDmt70x52hloJFIxDPxv41BVpk0S0BIGtg4gvV0ThEqONuaF2y46d41bK8W4
	 K0nFiHeZzbY8/AT1NVnc4UGKs2PMiRDpqw7lnVCd6fHJOEAW6fCEXGZDOxMdnITdNn
	 DDO5Z4jZsmRnMYzplLrsl74A8k0kBrfxyXSwj4nR7I8unpryiJrJz4ZuCa4j0spi90
	 ABfVa/FleHrMiitDQaRfRwpK/gbIKuMcns1C8p8f/T/vKgBmUMpmKyaks72vHyMBHV
	 VQmkBDXW1ZeiBc7bcmog0INFk5yX1KS9BEq35C7cWUvIoN7FGEHbQJcw/8RIqBeWSZ
	 bbtHv2ViVCH1w==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3990bbe22cso5507298276.1;
        Wed, 11 Dec 2024 04:46:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJy1RRLYB4IKO33CbcRZzxFf1mDTpDAOVmJg9jqcuB3zjdg9nJFw+QDlR/WPUP5szQJpl0B2wEJeVf@vger.kernel.org, AJvYcCVOn5BtGKJdr6vAH8X4ThgkTykTSwCM7lSFTs3SMA2mTvj85qms45M+xpnrxN0qhD0DCWxjQsuh0R2i@vger.kernel.org, AJvYcCVV48xrwhk3vtFAOhWLKBaFZaOcVrxPgkPhBkZyo+lAP73ZxMUT0+02Jr2Eulf48BLDojq17868y9dt/SO/@vger.kernel.org, AJvYcCWwbzOhwKfur2zHI5Tzn5qq4cJnJvqCFNPgnBMYKUnfrZeRWrs/BVenc8kEeGuxK4kwuNKxhHL12w46wrqmi7Mlqkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTwRw7+Syyltlz7M5fSqFYi4/px7V9LTI0igo82Mk1jzdORx7M
	A7tj2MtsYixLziJ305h2saZdjTwu/Y1nvXiweLRRDnxKhi3NfT5B/GHAK1xyK7sxSQnW0aMCAhq
	PY2pdkzPwQx9Oz6RmxdaXgvz8Kw==
X-Google-Smtp-Source: AGHT+IHNpYJO6aDWAk8XmMc0DlN3Slr9o3xM35rzk7b1IHRTtwZ/GiqTwCD/k2ZnNmZtSytykpHpx9Uc1ENKHwldLbM=
X-Received: by 2002:a05:6902:120d:b0:e39:a780:d104 with SMTP id
 3f1490d57ef6-e3c8e614af9mr2455162276.24.1733921185643; Wed, 11 Dec 2024
 04:46:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-2-claudiu.beznea.uj@bp.renesas.com>
 <20241210184542.GA4077820-robh@kernel.org> <437b8d13-8ec1-40c7-b95c-ddb836e123d6@tuxon.dev>
In-Reply-To: <437b8d13-8ec1-40c7-b95c-ddb836e123d6@tuxon.dev>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Dec 2024 06:46:14 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+sdX+3R0USwfYT2yqC9aTGc+LzwyPsQiT770fJ1BgEAw@mail.gmail.com>
Message-ID: <CAL_Jsq+sdX+3R0USwfYT2yqC9aTGc+LzwyPsQiT770fJ1BgEAw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: soc: renesas: renesas,rzg2l-sysc:
 Add #renesas,sysc-signal-cells
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
	magnus.damm@gmail.com, gregkh@linuxfoundation.org, 
	yoshihiro.shimoda.uh@renesas.com, christophe.jaillet@wanadoo.fr, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-usb@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 6:23=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tuxo=
n.dev> wrote:
>
> Hi, Rob,
>
> On 10.12.2024 20:45, Rob Herring wrote:
> > On Tue, Nov 26, 2024 at 11:20:36AM +0200, Claudiu wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The RZ/G3S system controller (SYSC) has registers to control signals t=
hat
> >> are routed to various IPs. These signals must be controlled during
> >> configuration of the respective IPs. One such signal is the USB PWRRDY=
,
> >> which connects the SYSC and the USB PHY. This signal must to be contro=
lled
> >> before and after the power to the USB PHY is turned off/on.
> >>
> >> Other similar signals include the following (according to the RZ/G3S
> >> hardware manual):
> >>
> >> * PCIe:
> >> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
> >> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
> >>   register
> >> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
> >>
> >> * SPI:
> >> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
> >>   register
> >>
> >> * I2C/I3C:
> >> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
> >>   (x=3D0..3)
> >> - af_bypass I3C signal controlled through SYS_I3C_CFG register
> >>
> >> * Ethernet:
> >> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
> >>   registers (x=3D0..1)
> >>
> >> Add #renesas,sysc-signal-cells DT property to allow different SYSC sig=
nals
> >> consumers to manage these signals.
> >>
> >> The goal is to enable consumers to specify the required access data fo=
r
> >> these signals (through device tree) and let their respective drivers
> >> control these signals via the syscon regmap provided by the system
> >> controller driver. For example, the USB PHY will describe this relatio=
n
> >> using the following DT property:
> >>
> >> usb2_phy1: usb-phy@11e30200 {
> >>      // ...
> >>      renesas,sysc-signal =3D <&sysc 0xd70 0x1>;
> >>      // ...
> >> };
> >>
> >> Along with it, add the syscon to the compatible list as it will be
> >> requested by the consumer drivers. The syscon was added to the rest of
> >> system controller variants as these are similar with RZ/G3S and can
> >> benefit from the implementation proposed in this series.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >> ---
> >>
> >> Changes in v2:
> >> - none; this patch is new
> >>
> >>
> >>  .../soc/renesas/renesas,rzg2l-sysc.yaml       | 23 ++++++++++++++----=
-
> >>  1 file changed, 17 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg=
2l-sysc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-=
sysc.yaml
> >> index 4386b2c3fa4d..90f827e8de3e 100644
> >> --- a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc=
.yaml
> >> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc=
.yaml
> >> @@ -19,11 +19,13 @@ description:
> >>
> >>  properties:
> >>    compatible:
> >> -    enum:
> >> -      - renesas,r9a07g043-sysc # RZ/G2UL and RZ/Five
> >> -      - renesas,r9a07g044-sysc # RZ/G2{L,LC}
> >> -      - renesas,r9a07g054-sysc # RZ/V2L
> >> -      - renesas,r9a08g045-sysc # RZ/G3S
> >> +    items:
> >> +      - enum:
> >> +          - renesas,r9a07g043-sysc # RZ/G2UL and RZ/Five
> >> +          - renesas,r9a07g044-sysc # RZ/G2{L,LC}
> >> +          - renesas,r9a07g054-sysc # RZ/V2L
> >> +          - renesas,r9a08g045-sysc # RZ/G3S
> >> +      - const: syscon
> >>
> >>    reg:
> >>      maxItems: 1
> >> @@ -42,9 +44,17 @@ properties:
> >>        - const: cm33stbyr_int
> >>        - const: ca55_deny
> >>
> >> +  "#renesas,sysc-signal-cells":
> >> +    description:
> >> +      The number of cells needed to configure a SYSC controlled signa=
l. First
> >> +      cell specifies the SYSC offset of the configuration register, s=
econd cell
> >> +      specifies the bitmask in register.
> >> +    const: 2
> >
> > If there's only one possible value, then just fix the size in the users=
.
> > We don't need #foo-cells until things are really generic. Plus patch
> > 8 already ignores this based on the schema. And there's implications to
> > defining them. For example, the pattern is that the consumer property
> > name is renesas,sysc-signals, not renesas,sysc-signal.
>
> OK, I'll fix the size in users.

You already did for the one in this series.

> >
> > Maybe someone wants to create a 'h/w (signal) control' subsystem (and
> > binding) that is just 'read, assert, or deassert a h/w signal'. Perhaps
>
> Until then, is it OK for you to keep it as proposed here?

Yes.

> > even the reset subsystem could be morphed into that as I think there
> > would be a lot of overlap.
>
> The USB PWRRDY signal handling has been initially implemented though a
> reset controller driver but, after discussion with Philipp it has been
> concluded that it should be handled differently, since it is not a reset
> signal.

Every reset is a signal, but every signal is not a reset.

> > Maybe that would cut down on a lot of these
> > syscon phandle properties. I would find that a lot more acceptable than
> > the generic 'syscons' and '#syscon-cells' binding that was proposed at
> > some point.
> >
> >
> >> +
> >>  required:
> >>    - compatible
> >>    - reg
> >> +  - "#renesas,sysc-signal-cells"
> >
> > New required properties are an ABI break.
>
> I've added it as in the old DTs the system-controller node is disabled.

Ok, so it depends if the consumers treat this node as required or not.
Or maybe they are all disabled too.

> With that, do you consider it OK to keep it?

No, as we're dropping the property aren't we?

Rob

