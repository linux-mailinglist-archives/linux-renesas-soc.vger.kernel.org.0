Return-Path: <linux-renesas-soc+bounces-13877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32503A4B500
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 22:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAE931888F1A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 21:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B987D1EE017;
	Sun,  2 Mar 2025 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtAJBxym"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F636A94A;
	Sun,  2 Mar 2025 21:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740951856; cv=none; b=mnZ23kwJbB6LK1jRLXjxXodO8hfaUzUAMsrO36pL6QggwPfNsdy6xT4ye9DTNYJc/GpabUEXvtRoelT5CxYw/YHiXSzuT9itoZX0Qy+9WKvjZfcXnsGMgZ88gpQBbbiaS/UIp/YHJI+Rnh52lYrozIt1CZPjx82N4w3XWlGgJJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740951856; c=relaxed/simple;
	bh=Pt1/1ePhSuiFjsZY3MAubYmQ37RO3s1+FP9MwI1YvUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwv0cm/wXEEDpmh0Kot5mFV3mpRGKfJpXY9rMZLg8tWyaQJ0JlrHtSNB9OoSUBuAEpUfaellBA1GL0JZh28tB87Q5v5EqM6F2I9Vm4+iMDXBN8fzGlt0lw6YrEvy9CLNjUlNnLDMYWH0mn8DJUClDZnlhIhvCuy5x3JUvThdjGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtAJBxym; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-520a80b1015so1433412e0c.2;
        Sun, 02 Mar 2025 13:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740951854; x=1741556654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5JwVMCZre6uhLIEdVMmxlAbiSgu8NDx8d4H7p526V0=;
        b=RtAJBxymMfthdFOi7GQ0RyFOIyO85RZMQbttdxGDYOEeJKTu2VXMvrJgWHIYG9ASgA
         8RYsKKiSVaVGfzGbt1nJZA9djsREa+uqY1iFJpvN5oWrCI5SjPZ2ewaQ3asIXgGYXKyd
         6ZVQdqnGcVINCQ/rHTcHm28uXwngGbb2s6XFRUFDO0PJeZRGCWLRaR63FK0uuDO3YfBq
         IZVlW/WiUmRV01niBKGkXOgIP59DoATFDfQ5wUHPl8Q7j50HUTp8xw7n7pzyoYYk+q/N
         pzawXtFIpHo4sUCA4nk2zGG/Ur0990t49rVeorJIrRLNZAVSK46i+NgVNH9Riaty6j9L
         UYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740951854; x=1741556654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5JwVMCZre6uhLIEdVMmxlAbiSgu8NDx8d4H7p526V0=;
        b=QTaEmnGi35Y5wBlOHFu7u0KoIAogD9CyyYwn8AQgWLz+YLiAOqye6iUN8CtUza+wgp
         Rur3kI68dpzJBFKd9BP8/vHj2RAfewR4CrGollcj1zTMbRc1p5HDnktbw08H4ufTCv8e
         HPWTxF+M1eCUoTKmgMjmF0PKNsU5loD5sswzjJwhWpAQYV424bSgDTU4uPPOYzVMU+BF
         mGckB/pOmc0JkPuhcIPt/YFxsQFfZIEqWeo2BxgviFUv8lbU5wG1vJ564i93SLqLwo+M
         aupN6PtTWRAoza1oaRHHFn3kbK088dnn57lTXDfNE49T4DvGmudX4EmI9wvQLv1ZIHN8
         52qA==
X-Forwarded-Encrypted: i=1; AJvYcCU18/PHv2AzZUdFAUsK4ApM3WaqZ1VyhA+pdyjv8XCQBpZtPF7ZZxovCx9yWXoZW3wajOY1fhhEqKIz@vger.kernel.org, AJvYcCVnHTZP48vJJlXWp83o0OjkHtGQj+7XE0dEnw8BxtiDdODGjoVfztXiPCSzWMRChvHHvvpGedx3@vger.kernel.org, AJvYcCWPQoFsRJqOB2rCqrkqadAqBsZ+Nv6CLnkqTJERyTqCd0/S0ewIVw1k1wQFWwvlrdf+pGMUEi6sIvjvClZZC6FKpUA=@vger.kernel.org, AJvYcCX2dUChzu2hKnkXtKqgwiZvT5EkqL2B2y2/b+T8n8vMNTc7O8T4cl1VQAS9Fx0/ZybnEg9vjOf69C5jItwt@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/BR2ARi+3R0+UyuvfCdew70GGmfXn7GmPX2V27qC/dq0qnBi
	AzPBHm/9ShqtZceq7gJbGCg/rodsIupUUxIoaebGBMZ7vt1laIduJQ8FNZ0hOsgjP9wM2pj1RLd
	v6ZADpszaT6cWbIesRiCrKnz+SGU=
X-Gm-Gg: ASbGnct7WyCZzrqPkx2Aq+wUs44uXPFayJkfJP4J/HoJ+Qkt5WDuiRKj6RiBourKbVJ
	KbUC6xheMc7ijy9mH36b3jzVqm44rZJQMxxWy5dMCzy+y9WP5cTgwbKjVS2eUC/fR5rVrWqBwzM
	C88IZIxm4tAROO6GU0mSgmUzaETw==
X-Google-Smtp-Source: AGHT+IGndDDGmewKWDtmUxTydeztNKHvUvtibFqnwg0VQdtrGbzuWY9J+Y50s372cumJA719pYtTZRxuFo7lSV70GIQ=
X-Received: by 2002:a05:6122:d9e:b0:520:5a87:66ed with SMTP id
 71dfb90a1353d-5235b89104amr5937291e0c.5.1740951853948; Sun, 02 Mar 2025
 13:44:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c5a75f20-9b61-448e-941b-1106cd06ea04@lunn.ch> <CA+V-a8sCMn+v5y5v9CyyV2VsRmLj-Uyowt61tTS9dWN43CD0_A@mail.gmail.com>
 <Z8THE2hpybzP74bH@shell.armlinux.org.uk> <CA+V-a8up3Kv08sNarvC3gWLRpik3=_aKb3JCTGkxyGYMcj4Wbg@mail.gmail.com>
 <86f41f06-d544-42f5-b2c0-6c4a76ad9eac@lunn.ch>
In-Reply-To: <86f41f06-d544-42f5-b2c0-6c4a76ad9eac@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 2 Mar 2025 21:43:47 +0000
X-Gm-Features: AQ5f1Jq3Z7ZO6g5lBzU3kpAHiehZldhn7eFDOeje-QGKpm-wiETBBFjOy2VPBa4
Message-ID: <CA+V-a8tjOmn4BAamr6BrniTiyMxNYMCRrnZaqzEs_Xr=359Rvg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: net: Document GBETH bindings for Renesas
 RZ/V2H(P) SoC
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
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

On Sun, Mar 2, 2025 at 9:39=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > > I can certainly do that, but not sure in the DT we will be describi=
ng
> > > > the HW correctly then. I'll have to hide *-180  clocks In the DT an=
d
> > > > handle and turning on/off these clocks in the clock driver.
> > > ...
> > > >              clocks =3D  <&cpg CPG_MOD 0xbd>,
> > > >                             <&cpg CPG_MOD 0xbc>,
> > > >                             <&cpg CPG_CORE R9A09G057_GBETH_0_CLK_PT=
P_REF_I>,
> > > >                             <&cpg CPG_MOD 0xb8>,
> > > >                             <&cpg CPG_MOD 0xb9>,
> > > >                             <&cpg CPG_MOD 0xba>,
> > > >                             <&cpg CPG_MOD 0xbb>;
> > >
> > > Your SoC designer really implemented the 0=C2=B0 and 180=C2=B0 as two=
 separate
> > > independently controllable clocks?
> > >
> > Yes there are separate bits to turn ON/OFF the 0=C2=B0 and 180=C2=B0 cl=
ocks.
>
> Do you know what the clock tree actually looks like? I can think of
> two different ways this could be implemented:
>
> ----+----------on/off---
>     |
>     +----not---on/off---
>
> or
>
> -------on/off-+------------------
>               |
>               +---not---on/off---
>
> In the first, the clocks are siblings. In the second there is
> parent/child relationship.
>
It's the first case in this SoC.

Cheers,
Prabhakar

