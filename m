Return-Path: <linux-renesas-soc+bounces-7904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C642956E5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 539052826E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 15:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43301741D9;
	Mon, 19 Aug 2024 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFhzgHr5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4092AD2C;
	Mon, 19 Aug 2024 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724080486; cv=none; b=uqwh5eYPBam3I1P2jgklNBjRxmEMJb/lXz36ETrwC+QO7xjSo8Wc0RMKJcNWbWZH7aJKBVi5Up6QEZ2HQ9R+Osi/E9gYSW3b0RoSw+box0vXW1BGXo9l0cFQ4ce+SaK67iUeFFYxWtU1oj114c4/gj5x/E+xybd2DTpugLcR4kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724080486; c=relaxed/simple;
	bh=x6k3R4EU/ySREcupfJckvuQNMR+F/nbZQwUkTP02WIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LG2S2khqc4BuGFttj6U9JwDgsWp7sr5xCA7lpj/0KVs7MWy2Jny84emy/BOyza6qEQlpPVj7mCjjDqpb4kYz7e+oIFpKXYH1zEBaEV5U0ImU3Ky7DrvGIiyaiE88+k1JeFh4UBUt3a7QWI5h3raUzJ9DGlBE9MeWjQEsfxfqbvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFhzgHr5; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4503ccbc218so46729181cf.1;
        Mon, 19 Aug 2024 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724080484; x=1724685284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucZ04oFwZj6mOfUJrf+lvS3gMyRDR/VTX/HhN+IcKWs=;
        b=iFhzgHr5z83zdKgekEyxKSr8iKb4j/jhq/NUWe73FJQhjM7Zj23lZHCnQ64TBwuGH5
         QYFRc1seyQ8VJveVcysOBbIj+F3KCrKJfF4v6OX8p/5Qb5XikrBEpREo47VXT0rJUOrj
         hw6leLMu2TfKQB5v+5Ydx36eJDH+EV9yx8YuHc/Q0HvNn8wftciQtajO9JIX6pOrQhbk
         swdijV5kEowcmaMf0fcNCnJ4Ul3S+a3MPfdmobR+tw1QjV+1QR9AI3z777SdRtZIQhq6
         2JaifY/ExVEDtTiEnUSCOE4xfay6+hjdGYRierivzjL3D0nRI59B8SH+YCyLY3gBv/rD
         yqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724080484; x=1724685284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucZ04oFwZj6mOfUJrf+lvS3gMyRDR/VTX/HhN+IcKWs=;
        b=LY8AljoH6pDXwoqaeU8oAncXoBLS6O9x+NrLNTl54LmwLMKjoS8YnfF4MwWgIT/zmX
         aYIJyz25E441K70KlFfw3Y0s1IUOnzQhkO1KvRtS9UGCWsBOHC+XFaIXmKYyVVNVB8yg
         L4ti9XOP25x4cPaJTxKUMoVeJGh47mlM9SYffpMq0fRFJzDntq5FGEqVqDY51oQHjJHx
         EvpeHU8wTHX2VL4o/6eZFuPo7fdalWd5OtTVZY1jleiaVB6YjW0WrIjsfWaoDFGXlXTr
         YkTuJaA1xGTBP3fOuPTwcuPpt4NgD1LsLLloq6BPkIIRsIbp/oosch+nH6sqpUlOtt5C
         XjVw==
X-Forwarded-Encrypted: i=1; AJvYcCWjEhqRW9i5aNOlAeB4DpThOv/X8ZPGUKvlreNybBMwFXPf1IY7ZVUpRc6xjymjpCCunR18xclU/II2vOntXzX/VpTaOssXJn49M8k/sQ/X0By3PcUJh9aOMc07aVY+BHv1rWhUH0satRIYxSDHeEDzOw7LudGBTzPzTpIU4BuXPLqyvua4sJRDiCp2
X-Gm-Message-State: AOJu0YzQJEvOrKbCk3QyDnzHCXIaRNXexJZAGefQbwbvKU4QL8DnwWRz
	OGRD8Q4BF2R7uzBD/Y9HpbW4EJphYyexq9JCUokNYRPtlcjHD3R706gvQM8Szab6gNyAPyXSWap
	y+AgG4Twnvf5qTOLYRuABSZvA+94=
X-Google-Smtp-Source: AGHT+IE02OqvEqWfe89oZTFUQLix9Z6pW46qNUFmlFTQHpZIZ0ip6ALaksFOxrKQf8DlMj9qJhwITSp4xGDlIpZnkpA=
X-Received: by 2002:a05:622a:5b0a:b0:453:75f2:db3e with SMTP id
 d75a77b69052e-45375f2dc3cmr172863381cf.7.1724080483747; Mon, 19 Aug 2024
 08:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <69b7f374-9037-4373-90e0-676cce0cd0fa@tuxon.dev>
In-Reply-To: <69b7f374-9037-4373-90e0-676cce0cd0fa@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 19 Aug 2024 16:14:17 +0100
Message-ID: <CA+V-a8vjQPBH2TMKGEqCdsHbhGq0mNhy=miV03hfSUQS2ko42g@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: renesas: r9a09g057: Add RIIC0-RIIC8 nodes
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Mon, Aug 19, 2024 at 9:13=E2=80=AFAM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
>
> Hi, Prabhakar,
>
> On 11.08.2024 23:49, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add RIIC0-RIIC8 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - New patch
> > ---
> >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 198 +++++++++++++++++++++
> >  1 file changed, 198 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a09g057.dtsi
> > index 3d6c3a604ec9..c9e1e21b820d 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -141,6 +141,28 @@ ostm1: timer@11801000 {
> >                       status =3D "disabled";
> >               };
> >
> > +             i2c8: i2c@11c01000 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     compatible =3D "renesas,riic-r9a09g057";
> > +                     reg =3D <0 0x11c01000 0 0x400>;
>
> According to [1] compatible and reg props are preferred to be at the
> beginning of the node.
>
Thanks I'll update the nodes according to [1].

> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
Documentation/devicetree/bindings/dts-coding-style.rst#n112
>

Cheers,
Prabhakar

> > +                     interrupts =3D <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 523 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 522 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "tei", "ri", "ti", "spi", "st=
i",
> > +                                       "naki", "ali", "tmoi";
> > +                     clocks =3D <&cpg CPG_MOD 147>;
> > +                     clock-frequency =3D <100000>;
> > +                     resets =3D <&cpg 160>;
> > +                     power-domains =3D <&cpg>;
> > +                     status =3D "disabled";
> > +             };
> > +
>
> [ ... ]

