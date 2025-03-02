Return-Path: <linux-renesas-soc+bounces-13882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CA4A4B51A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 23:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F27B83AFF67
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 22:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74061EB9EF;
	Sun,  2 Mar 2025 22:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Td5DlzlA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278822AE96;
	Sun,  2 Mar 2025 22:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740953028; cv=none; b=mMDSNO5NsDkQ/FCU/Bof1K5YpFO8HQGGEj459cLkIpgl1PBEHZPDKBUqWNuZZQKM/UGo0n9XnepLxOsddF5V5QZm9S/rLLOUn/s/ObCnzYCQVy5f7/km3mu5iVJdHZoqNN2Tx8yE1d5JanfR5Q42Hi9HLHlDmY05qJGdDLqXlME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740953028; c=relaxed/simple;
	bh=jZSWQtT1MoRNWumuCtYcb5b9s57EYgTMeTTtZs7awTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSyxer/Tg/3syyy+J4kImtoVUO87qgnVcQQtGlLUt8GGhELUw+D4J07Ab618lBJbqgrlyX4JEDckPX4YznK24XHXsSN2DZLehfWwV/XTap9psQGldgCEQa8VhsmULdkZo2y/zFl4UEuk44KXfkQwcza3UNqtTA0hZT+J2LvjBBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Td5DlzlA; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523909ec175so134961e0c.0;
        Sun, 02 Mar 2025 14:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740953026; x=1741557826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rBYV72AXHGlxFfj7JTW/kVWLVkCEZCZeGHRRY9RxD0=;
        b=Td5DlzlAJbnPo5l9WRVX7sZotxkxsJjawpKZL6WF4SMX5NLHIHkkoz1sAggDJq0Fw7
         zIBWupCFJJbTq58gxEe4IO9VH5eM2V5PAeG9JXdXVTzOrU+drHY88lle66wQlq7AeRrk
         qXtAe/QJHjh3q/vgY9aoFRo4ezb9sotLCE+xfAvuLcjrdFnhfQP3ku2E09cx5gf6Ow9u
         5RylRBG6Y8I46hg4RofHywrSmVJNcd56J+SG4PsKY4gC8p6O375g0CxRbkXOx5GDqYuV
         u+BohvTou3BTMbdoI9zGX9+gTCRL++tkgp2+As3KZc3IRgkrrmJC4QS0Sj6FW8zioanR
         OqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740953026; x=1741557826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rBYV72AXHGlxFfj7JTW/kVWLVkCEZCZeGHRRY9RxD0=;
        b=dYr6D7vDR/UnJPXk4TyAKkvs67tDasN+OND7lZXtHjOZp1GVmKkMtSalYkQoLkhA8v
         JoCAraCy08sO4OtFwgXmOdoMQ+0DKrQ0uZ2fIeSwW+eop39awa0swwXbgXtwsAuC5pDs
         LXeIxT5jZMlC+yBsFCETKHauGlysZjubfOxDTU2yEDLLPYsC9lGjg2KJAP300Cj5WLB0
         C53UnL3NomcKUfKMywqtKwfEX5KESiYJStHfFHzcwtxYo8kKaQv/JJb99gk18VRZQIgL
         QXdBkreEPZCRMeZQ8Xa1+Wp5P0h36jIfpl5Tqpjzbq4qRcx6miIn88RC6Xssq8uB8ZCV
         CXgg==
X-Forwarded-Encrypted: i=1; AJvYcCV9RIBXU89CvnhVx0Lgnr7atVzJKkCdPsGcFQPOsldu+WaF3q4Xxyrw707PzOzhAK1Rp+rZlHOMA1fa@vger.kernel.org, AJvYcCWYhxZulV/ON0rYg/PYkcx8bk+DJYSxCPwUb9r0V8iepq3xU27sXziccjLVK/lLTgNFFRK7LC2H@vger.kernel.org, AJvYcCWfh7rH12laHaotIXxpV212LpUNsK9pIMVl5LVYh3licdfuewpcaFdjUoWeYGu7Nvc6/DXxzz6sI6UafQCBuRTVJHI=@vger.kernel.org, AJvYcCXdGFL5pwFlEVXtwO9J5Kga8vZdRDX5D/yWwP7TjdNIkecWUFqCA+Z/wz6+TEsxcpZaIvp1UDh3WZ/Ldr1s@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/eGXCs4pcRKbWFmOzci8gti12E+30TtNbLLxtsYpVlHdTpAr
	cDi5yKL8yJbyOKOpBEmQXaGQHsrd8PDNC/7a/fWzo+/zz2Ou8LTZXL90UvnQmOThZL1alHqnHds
	4YVulY+u3x4LFV7ZTW/a2agXPdak=
X-Gm-Gg: ASbGncsrEE0uqBPCZ/DFZJi8utKuT0HOxFiLPMOWgsvK7o0vPK/V/J3lIk9ADs6ajaE
	sfQxA4Rrmzc+S2UtqOPj06f1wAzCFqA3GofhTadDdxi/85lS0nOHR+H46pElyzpjBE92l75NSrC
	VcGHceKBuMNn9pcWYdGoAv/Cd1Qw==
X-Google-Smtp-Source: AGHT+IH3UJrdA3i/Xvxm3LE77AjR0LEEM62ZR0frZhH2KAS0toglW6edmZbgKkcRvi1ggqaXXw7R+RbANl0jewTEKpA=
X-Received: by 2002:a05:6122:21a1:b0:516:240b:58ff with SMTP id
 71dfb90a1353d-5235b855371mr6600043e0c.5.1740953025964; Sun, 02 Mar 2025
 14:03:45 -0800 (PST)
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
 <86f41f06-d544-42f5-b2c0-6c4a76ad9eac@lunn.ch> <CA+V-a8tjOmn4BAamr6BrniTiyMxNYMCRrnZaqzEs_Xr=359Rvg@mail.gmail.com>
 <Z8TSgxLqNwZ6zc3V@shell.armlinux.org.uk> <Z8TS+CsLa/uF36Xv@shell.armlinux.org.uk>
In-Reply-To: <Z8TS+CsLa/uF36Xv@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 2 Mar 2025 22:03:20 +0000
X-Gm-Features: AQ5f1JpkvC5pXHw3RqCBlSNswegbmIqYSMa12ZfJW-aj1djGEZXEKNRaU64l9-8
Message-ID: <CA+V-a8v9SUur1c7357oWW2kgpLXSvCq3KLk5RgLXbUxBMxMAEg@mail.gmail.com>
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

On Sun, Mar 2, 2025 at 9:51=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Sun, Mar 02, 2025 at 09:49:55PM +0000, Russell King (Oracle) wrote:
> > On Sun, Mar 02, 2025 at 09:43:47PM +0000, Lad, Prabhakar wrote:
> > > On Sun, Mar 2, 2025 at 9:39=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> w=
rote:
> > > > > > Your SoC designer really implemented the 0=C2=B0 and 180=C2=B0 =
as two separate
> > > > > > independently controllable clocks?
> > > > > >
> > > > > Yes there are separate bits to turn ON/OFF the 0=C2=B0 and 180=C2=
=B0 clocks.
> > > >
> > > > Do you know what the clock tree actually looks like? I can think of
> > > > two different ways this could be implemented:
> > > >
> > > > ----+----------on/off---
> > > >     |
> > > >     +----not---on/off---
> > > >
> > > > or
> > > >
> > > > -------on/off-+------------------
> > > >               |
> > > >               +---not---on/off---
> > > >
> > > > In the first, the clocks are siblings. In the second there is
> > > > parent/child relationship.
> > > >
> > > It's the first case in this SoC.
> >
> > Umm, okay. I'll just pick my jaw up off the floor. :D
> >
> > Given that, then yes, go with your existing clock binding, because
> > that's the most sensible.
> >
> > However, what would be useful for future maintenance is to put some
> > commentry at the top of the new glue file describing this (pictorially)
> > so that when someone looks at this later we know why it is this way.
> > It'll be useful information if someone else does the same because then
> > we can say "hey, we already have a binding for this situation!"
>
> Additionally, it would probably be useful to include it in the dt
> binding commit description because that will probably assist the
> review of that patch.
>
Sure will do that.

Cheers,
Prabhakar

