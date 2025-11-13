Return-Path: <linux-renesas-soc+bounces-24595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AC901C59AF6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 20:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2BEC4353492
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 19:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D3931A7F9;
	Thu, 13 Nov 2025 19:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDhzrdGL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649B431A7F1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 19:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763061053; cv=none; b=Y2v+sGcYQ0MU2UbZ+scoNzEWifnkHcddGVF83pAJwN/HXZ5QT5AefQOIleT41D87nAQDWrHVi/luETxonJs01aNlZaaoKA5TkeFR2zoJbE1d+eMKCFTxaiotwc2yYw3kkJhBxJSsaVsx5zV8njbCIRIdyqBclWYM/lLPbWYROso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763061053; c=relaxed/simple;
	bh=K9zxC8rOP0HhJ74SIXWJ6fpPHD24AThD3V6aOOnpsGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0pC7q8npukWpyxKL+Jd6Aoxln7r37dMugT9SY4TjleZXxJBRSgoUXFDINa9ZvGGpRhG/evdTbvmWbcbPyWgPtefzlOsFMDCEdWusGqNXWFJJJIWlh6a4LvuAlIHepWMCQh+VnjzKbKZh9JYx1vDNylymi1UZJmBs2rtJRN+6zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDhzrdGL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b387483bbso972401f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 11:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763061050; x=1763665850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvMijRFL2EQNEqoZ0zYEHf4ZN1SnZIgg9umKg1Y6MRk=;
        b=kDhzrdGLa//zYMpD57jWIj7yR2cl04QKGvNUgd0qMju7NP6+6kBw0KI182+nWN96e+
         FWTbtiLd5UUwhL6MRR20DnhLHbBnMnrWNwcQRR9Q53ahAkINCsK6yLQwBfEGwldlL1qT
         gxkbbtyetsSIXOHKMUcnfqhoIk3GOMBU3BT2QG3P6Qh7g1OrQSZ5BzXMbi2yUiNqvqPo
         Qode2x/FzgQcqWy6UmxRVWjfLypZUH48XxtiU0+dE72B4Sa5x19v0xroFWYmIGbD8FXC
         udm5SC246GzqB3YvY6yK409H87XffTwJGq5XfZHTzzAg5Z1NWBHmC+1YvXj1Ggyap1qv
         pluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763061050; x=1763665850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kvMijRFL2EQNEqoZ0zYEHf4ZN1SnZIgg9umKg1Y6MRk=;
        b=IEL/vRwJpG7AkI5sPEbk6xZ+RHJ9I+cmlgQ7rjhEvRAg1mRbrEj2QEZOb7HnMNm2BQ
         ncyza36Tb7aPE1Lx4aI6P2jYm0ku4GdMrertVq+fMNYkHjCGccocpMsNNnnZ60ftBbP0
         VuUnYHK3SNwGr2im75rmqwa8PWjwsGqHKwbLE33TU4340hRqqnzX3o33EJR5fUIqJ9LQ
         m1VFCy02AhDGvd+R+cet2Fde2QW6R/vez15HJYz8ZmnEBu4+3pHKyyO/wF3KgZ/BBZEY
         40HmSZWodgGiM3ekkxnhGdy8oNsGJF1K8EsfIcNilc02hTf7k8eisR2zVzlgAM7lGaKU
         rXZg==
X-Forwarded-Encrypted: i=1; AJvYcCUwMISJp3sBbEeUgzdzECJpIy0+Q++zpPWeOJRWDD/NB9SgMUvGMWULtqcjmnRLDHkwSM90xTeqLIl4TH4jPI4zuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMFZckxvGVhApeQQWNBnAHU1sErBqacieYw2KavudmJ7ZbqGiw
	e9FxxckcmKPxWpYgA0dxyx/uWTS4XaaTIOR37uGf07MZU2r8J46oC7QL8/jzUxutTEW2uRkIpIY
	TRNlUKQbz+h1sKbKaN8SkhaFN8lYz0iI=
X-Gm-Gg: ASbGncvYsX5jHYGQC2ExTPSaAdPbEa+nYbdAYhw+d6pUrF0hDX/YkpAcEbyoINLiLsI
	LKW/sLcQfy3yjr0eMt0jV+n7DT933U9aYCbIMMofutaQLslb6bQJI6bxXfKL0rxPrP1EY05+S4X
	IdXc6eFy30Q+/59ZTRBG+CPOLkKE2cWtgzvqQ3Lsgusv80GznA2J+qA6DBgN96KLudPFXWQ/iNu
	k+QDcmWHREmdfRzpYjzKHNmTHvknW2hyXPZURpSIVA1r+FmykqVrqum42Va5ctTqBlfgfiG
X-Google-Smtp-Source: AGHT+IFj2gcB8Jq/A294dUhBecmRquJTSl2UVaLJoxB4ETslW58PCUzHj3jYFMs2rYa/VkuNoCw16gLMBPhR7DExwx4=
X-Received: by 2002:a05:6000:1ace:b0:3ff:17ac:a34b with SMTP id
 ffacd0b85a97d-42b59383b2dmr540646f8f.42.1763061049654; Thu, 13 Nov 2025
 11:10:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112201937.1336854-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aRTwz5QHq9U5QbQ-@ninjato> <CA+V-a8s5fg02ZQT4tubJ46iBFtNXJRvTPp2DLJgeFnb3eMQPfg@mail.gmail.com>
 <aRYADfD8QkIw9Fnd@shell.armlinux.org.uk> <CA+V-a8u5QAY2WheMxXhoHd09KTi31ZnVO2T0FmXiVWdH8x=rxA@mail.gmail.com>
In-Reply-To: <CA+V-a8u5QAY2WheMxXhoHd09KTi31ZnVO2T0FmXiVWdH8x=rxA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Nov 2025 19:10:22 +0000
X-Gm-Features: AWmQ_bmF7qomPmVVwlpUvSLUHi_QYtSH6ttgrTzZPBxmaCqds2xAW8SBPihV9F8
Message-ID: <CA+V-a8s39qSBLsbEkGJTjg7cLPHuKTFTONLCLh39KO30Y+1_kg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: pcs: renesas,rzn1-miic:
 Add renesas,miic-phylink-active-low property
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Thu, Nov 13, 2025 at 7:05=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Russell,
>
> On Thu, Nov 13, 2025 at 3:58=E2=80=AFPM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Thu, Nov 13, 2025 at 02:45:18PM +0000, Lad, Prabhakar wrote:
> > > Hi Wolfram,
> > >
> > > On Wed, Nov 12, 2025 at 8:40=E2=80=AFPM Wolfram Sang
> > > <wsa+renesas@sang-engineering.com> wrote:
> > > >
> > > > Hi Prabhakar,
> > > >
> > > > > Add the boolean DT property `renesas,miic-phylink-active-low` to =
the RZN1
> > > >
> > > > Hmm, we already have "renesas,ether-link-active-low" in
> > > > renesas,ether.yaml and renesas,etheravb.yaml. Can't we reuse that?
> > > >
> > > On the RZ/N1x we have the below architecture
> > >
> > >                                                       +----> Ethernet=
 Switch
> > >                                                       |           |
> > >                                                       |           v
> > >     MII Converter ----------------------+      GMAC (Synopsys IP)
> > >                                                       |
> > >                                                       +----> EtherCAT
> > > Slave Controller
> > >                                                       |
> > >                                                       +----> SERCOS
> > > Controller
> >
> > I'm not sure that diagram has come out correctly. If you're going to
> > draw diagrams, make sure you do it using a fixed-width font. To me,
> > it looks like the MII Converter is bolted to GMAC and only has one
> > connection, and the GMAC has what seems to be maybe five connections.
> >
> Sorry when typing the diagram the mail client showed the diagram OK
> but when sent everything was messed up. Ive represented now in a
> different way.
>
>                                     +-----------------------+
>                                     |   MII Converter     |
>                                     +-----------+-----------+
>                                                     |
>            +-----------------------------------------+-------------------=
------------------------+
>             |                                                  |
>                                                |
>             v                                                 v
>                                              v
>  +---------------------+
> +---------------------------+
> +------------------------------+
>  | Ethernet Switch  |                   |  EtherCAT Slave      |
>             |  SERCOS Controller   |
>  +---------+------------+                  |  Controller
> |                   +------------------------------+
>                |                                  +----------------------=
-----+
>                |
>                v
>   +-------------------------+
>  |  GMAC (Synopsys  |
>  |       IP)                     |
>  +--------------------------+
>
Looks like this was messed up too, Ive pasted the diagram here now
https://gist.github.com/prabhakarlad/9549df941eaced5b06efc572ff6c82b5

Sorry for the noise.

Cheers,
Prabhakar

