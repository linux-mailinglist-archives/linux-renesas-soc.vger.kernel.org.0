Return-Path: <linux-renesas-soc+bounces-13874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 821B5A4B4EB
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 22:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 172C27A55D9
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 21:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68AD1EB9FF;
	Sun,  2 Mar 2025 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZ1PfD5l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D8F4A3C;
	Sun,  2 Mar 2025 21:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740950603; cv=none; b=A7juxVsUQ6zCk2As3nHcgze4FUJGug8xDqnNH7BiC37Jz1x5AbMJRlTlAZa5e1AGPreZDA3rSaNY6wbTkWP404ZfX6ZJzvJsGgKCu1iQ3f+bwoVcalIxiaGhS678sC3LuZB/U95Gvh4ZEgopNHecIyAl3NuzhdussxJMVQSYV/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740950603; c=relaxed/simple;
	bh=itmERjA8wLIzggiNkT1BkrNcaT1kTLk2BdGZZhTB3zM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWfKzagk7lZmtE9GQdD6Uzzn1EOJV1xY9Y4jOLWeZBVOc/BySOh7PlPS3g3JRsVSt4NZt6Q1S+FL7meg4YtdiiavJP6uaEFKF/qxDBSkOCsq/3B8HwtATGDajz6X83EPg3X2VTq5kR93qKsTMX49RHfW7mZX7KqOsiZtoloumiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZ1PfD5l; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-520a48f37b4so3620927e0c.2;
        Sun, 02 Mar 2025 13:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740950601; x=1741555401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a5VcwD256xt8hZeIi+3nzpsD3+r1ozerOjCt/VO9fM=;
        b=WZ1PfD5lVMtI05XPd9S5h52gCX+W0I1/dzIg91OmIRo3rT1EZYxXse6XT+GNB1gt2e
         A6SvBM4AcHTIcZIU6ly0TAKp9KlKFIj4JqViryIvjmKvC9/dQSgZ6pyVtUdMeE8QqH/G
         xwjd1XmiK+9qkPTqMECJ6yOfAnKjLTfqGVIRD0BAFxwoNq84Eru5IgAUvw91UGKfudO7
         MKVP6Txhr+C6K2UGVJnGME3en2BVdPtHiuxeboHURHVJpZjQpzCb7rRIXTBXTumetOg/
         1GWH5OBFlcFwwAzLC0Czrts4qyLGTs9FulE1b1W0a6SfwcGkMhOV/FLvuRuizWJ2nVs6
         FrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740950601; x=1741555401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0a5VcwD256xt8hZeIi+3nzpsD3+r1ozerOjCt/VO9fM=;
        b=V36maLFdaxv19UV5Vr5fdjnalaI8rUuAf6o/iZGIiOugqft0jFwlgHpM/jFLX1uDs4
         BOXnpO0X0y/V6lEGQTKYs/MK07HSbrhssrmWQR5u5CfqOcxkM0+uC+f8cXo7EJSz14N2
         eh5aigFrnmR3jifrdrWsYaCtgIp21h6MyaZUd4twboh5+WinJFQeag/WKQZ3beFD/nX0
         Z4+BCM+T4QAknqe0SL9mzUKmDvE6DxeoKvMzIo+hf1tLF8EKZeNdf0o5t0rlUALK8xO1
         s34R19/I+xLFUo1q2rVhQ5HXZHLLRpLdtViyXfpRUl/fCniAAwX33UbkAnagRiO1QP1C
         xCsw==
X-Forwarded-Encrypted: i=1; AJvYcCVL9v8xwXaydoPhPpW8T7s4guSLUOgSbq0T13tD4popYL3dOXsRwmehoY2uu8NQVF3CtnqDhtZ4DvQsTi6E@vger.kernel.org, AJvYcCW2umaWr/DsFe+7thRmW7Hqwz78PmfYuybuGBbfrzkH6buWgokw84Li048wW/jst/GHy5sxpL1XD8XcgWVRqCrqbfE=@vger.kernel.org, AJvYcCWu6IFay+ow9etpwBw7O0L+pPZCbMqWhFTshwrYkLjbJYDPtDL9a2SO9fzl6y26AB5xf9n5LVVU43EZ@vger.kernel.org, AJvYcCXVOP0n9nBbYaapehsRXYAR9dQZ6j/176OB/3QSKfSvwFw3NlNFJV6guIz/4BK98lfxKgZT/WDD@vger.kernel.org
X-Gm-Message-State: AOJu0YwuN3KHUApNzJZKAps9Xvyybdb8qt9EdGMtIL+E2yLIzqOT4uuo
	XLDBw8IPcQwUN6cb011eCiQGI+/FSV2f9at8L3eBbQ1Fht1zafoW0W8wiNtxb5Zq4XzvWDEL6bi
	CZ6AGFyq+oo8teP6SiX39AQHzm1c=
X-Gm-Gg: ASbGncv1T0o9llYE+kbfzlK0c5V7RW4bf/iL5u40mp1LKyoSlvseM1s8y6MUyI10vtQ
	8t2j6rlwjOQk6Gj3nQFK8/eqn1gefdEdKq4/b8VqTyyb7zQ/6nDSA+TNMIvvKofWahZjTMHgm7S
	a81GSgmBlMHRara9EPE657Zfj5oKuKTp+DlCdcxdAivKUAYFviVfz605eW3kY=
X-Google-Smtp-Source: AGHT+IFJ3UmbV+l9CMcGhEU5IciKWaa4PDrXdrIX76I/NuKeDaRss+5ljbh83eQJRozs53b+HVsRcIqQrS5BXgQ5Scs=
X-Received: by 2002:a05:6122:3c51:b0:520:5a87:66ff with SMTP id
 71dfb90a1353d-5235a927992mr6262114e0c.0.1740950600980; Sun, 02 Mar 2025
 13:23:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c5a75f20-9b61-448e-941b-1106cd06ea04@lunn.ch> <CA+V-a8sCMn+v5y5v9CyyV2VsRmLj-Uyowt61tTS9dWN43CD0_A@mail.gmail.com>
 <Z8THE2hpybzP74bH@shell.armlinux.org.uk>
In-Reply-To: <Z8THE2hpybzP74bH@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 2 Mar 2025 21:22:52 +0000
X-Gm-Features: AQ5f1Jo8S_PYjx1kcN8o7cIhZ_VvEnN9r-baJSZ7mFVdP-O1OOvd3RytrD5Xi5Y
Message-ID: <CA+V-a8up3Kv08sNarvC3gWLRpik3=_aKb3JCTGkxyGYMcj4Wbg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: net: Document GBETH bindings for Renesas
 RZ/V2H(P) SoC
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Sun, Mar 2, 2025 at 9:01=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Sun, Mar 02, 2025 at 08:41:39PM +0000, Lad, Prabhakar wrote:
> > Hi Andrew,
> >
> > On Sun, Mar 2, 2025 at 7:25=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: stmmaceth
> > > > +      - const: pclk
> > > > +      - const: ptp_ref
> > > > +      - const: tx
> > > > +      - const: rx
> > > > +      - const: tx-180
> > > > +      - const: rx-180
> > >
> > > As Russell said in an older thread, tx and tx-180 are effectively the
> > > same clock, but with an inverter added. You should be able to arrange
> > > the clock tree that if you enable tx, it also enables tx-180 as a
> > > parent/sibling relationship.
> > >
> > I can certainly do that, but not sure in the DT we will be describing
> > the HW correctly then. I'll have to hide *-180  clocks In the DT and
> > handle and turning on/off these clocks in the clock driver.
> ...
> >              clocks =3D  <&cpg CPG_MOD 0xbd>,
> >                             <&cpg CPG_MOD 0xbc>,
> >                             <&cpg CPG_CORE R9A09G057_GBETH_0_CLK_PTP_RE=
F_I>,
> >                             <&cpg CPG_MOD 0xb8>,
> >                             <&cpg CPG_MOD 0xb9>,
> >                             <&cpg CPG_MOD 0xba>,
> >                             <&cpg CPG_MOD 0xbb>;
>
> Your SoC designer really implemented the 0=C2=B0 and 180=C2=B0 as two sep=
arate
> independently controllable clocks?
>
Yes there are separate bits to turn ON/OFF the 0=C2=B0 and 180=C2=B0 clocks=
.

Cheers,
Prabhakar

