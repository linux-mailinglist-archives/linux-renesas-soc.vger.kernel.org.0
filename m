Return-Path: <linux-renesas-soc+bounces-26491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB8D08257
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 10:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B523C300645D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 09:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FD9350A12;
	Fri,  9 Jan 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeeiqsSJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156023254A3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950375; cv=none; b=GyYHfCF+q+j9XF6XKiiA1NmEKHqJACrY6ts53e/07+F5wqwwdMsLxK5VcdHWWxEVIj1sWO+Hskh3joUvwa7Yt4PL91Ijye+3JvCw/lRBBa+s6bH8jxlF+0+BYihw2DrA3wQMCW5X833lzOM/0J11tL8fAa3GBuf16maQPXKb7gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950375; c=relaxed/simple;
	bh=i8EAGqlGkdioBJ+426x2kqrVYP/t6CIiIJg3LnnAuBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAG5hV2Gx1j6c8f5kgdACjpyAzfmv8MRary5FfCCFfyTekkWGmOoEUd6v/W4J7o9RBiJ0b6ZRF2wctmg3L8/sWudfRKvz+vojEQtRDPLCj5oq+qdARbjZHGijUsoP2y7ZJH/HFszsbKu+NBqvkqk3PDXooPtu2WokedAWrHlUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeeiqsSJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so23728735e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 01:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950369; x=1768555169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8EAGqlGkdioBJ+426x2kqrVYP/t6CIiIJg3LnnAuBM=;
        b=HeeiqsSJl7/hkNDgU7yTVeteIo2nTwJQ00bO6ToTeUIb5I34+YcjWfCPxJ9bfUrmpQ
         G+lB19JlCjHhhjsvx907+NoQIuhA2AaG4bThOfiJwKniIa1XBBLQmrRquFrM/fEicP8G
         DRcXyGnhH66MPZmKsZzYbcEBODOuJqdUDDe9depq5Klsdby2TZQJwhsjYctrPsd8v2sY
         R5HTXYlvpNc+kVyhA67Y7zpHyijwOillwuEM75+0yydVybh+m6KxhR61Lm21NzyqX28P
         MypgsH0+5yLJm3nyyIRlhUvjsNIGe3lBP1dvV1TPOAIn7w5kWRCF8gaI2tXrbv5IoSdW
         xVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950369; x=1768555169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i8EAGqlGkdioBJ+426x2kqrVYP/t6CIiIJg3LnnAuBM=;
        b=l5x8cuWucve+iTR1AQ2aWcqSTnSnElTXMiavdlbSDPu/sqmVNs0WgS0Qtvl46lFVZL
         ZFdt25kWyOHtdYpUy+4Vyzq6ZUzWrEJRCsc4Ckx6PlI3T6bBJThfKERZLqPzN6y9gCpX
         VJqs96opzLzAtBeyGGoSA6ifj2rc6/jQAc2kOkoEBCqRNg7ImkiOAzq8spUhuuNhU1wh
         DBTF5pUk2fhUlrrXKntrwqtnlSzIF91YMM3J59T7B0tk+UCYk3RyCR/YZPDnOuVs5n41
         KjmeflJFJWvFlFCTU2qqe1G4iS5QNGcfMB0f1WnIjH5iMhv70uez5E3cXzRMXN46zq54
         lS6w==
X-Forwarded-Encrypted: i=1; AJvYcCU2rfHZNaYZGEr8PY1ku89I8dWYM0FlIR24XfxkhTCywdQ+VIMJB7bT0p5Zly8j0aNGS5Q++tfQfbBLH5ZYfGJmFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbbJj+QILTZVQQ1/yEM70cOiLn8b+2lP2Z5Q3A5Qol+QCrETAI
	CXyf/hzJJOEXIKpEsJIhy5ggF6Z3/9PbfHFnR0ntbM4vZGBqm3LUTEWP868/SnlTfnQiXoSnBhu
	sGPg1SXFy7N31Hp8m2Rrp0QNpJD0cXLE=
X-Gm-Gg: AY/fxX4qHbP4EQ2F1rw+iFwL7HDodAWuvnALR/Wi1Ve2gz3ElYHMtFEjj7elHii33Wq
	/l1FCQMvvR3L2++CqdXb5PfktyVIn1oIqbsR7XR35CQav1l2MkMZFQYCFvd3y9Dx15BgmwnMxG7
	83vLdeKCp0ZT0J0NqwslDHY3WU34IPn8cWKCpDe4xH+mJ2jRI9dUY1o5QO7SRjJ8hNgZqoknuhs
	axq22wpZdKVlfo3sDuE5GzYUapbTaorODcX6zQ3YD+EitQkHWtazu2Z9VmSk7xiX5xqhVpKMkLY
	q0YmGjisZ8eAeCJX5+YqnnjNBHGP1mkota9Xpy5qdGGuuI1tSkr6/EFdMA==
X-Google-Smtp-Source: AGHT+IHlN+mSmvjaq8KJG/vwMIL+nxuQojpEhdEewYe8DHGKczJpKSan/fIqm3KvXe1+oQeC/+ZVhFDWt9+JSXLL3/0=
X-Received: by 2002:a05:600c:500d:b0:476:d494:41d2 with SMTP id
 5b1f17b1804b1-47d84b3bc37mr77626185e9.29.1767950364610; Fri, 09 Jan 2026
 01:19:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112201937.1336854-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <de098757-2088-4b34-8a9a-407f9487991c@lunn.ch> <CA+V-a8vgJcJ+EsxSwQzQbprjqhxy-QS84=wE6co+D50wOOOweA@mail.gmail.com>
 <0d13ed33-cb0b-4cb0-8af3-b54c2ad7537b@lunn.ch> <CA+V-a8vx5KTUD_j7+1TC9r5JrGo2fJ0D7XXJCc-oHidtbUN=ZA@mail.gmail.com>
 <116b3a93-2b65-4464-821a-cbc7aa1b3dc1@lunn.ch>
In-Reply-To: <116b3a93-2b65-4464-821a-cbc7aa1b3dc1@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 Jan 2026 09:18:58 +0000
X-Gm-Features: AZwV_QhimVeaj0BZo6vXeCQ2DEHzUWu3cuaX8HijxvgSw9R7wuUKdQOxBALTGcw
Message-ID: <CA+V-a8tJp8bNNPAFmRN3WMmo1e+QPARCOkkoUdwsaiv1oDfG_A@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: pcs: renesas,rzn1-miic:
 Add renesas,miic-phylink-active-low property
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Nov 26, 2025 at 9:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Nov 26, 2025 at 08:55:53PM +0000, Lad, Prabhakar wrote:
> > Hi Andrew,
> >
> > On Thu, Nov 13, 2025 at 9:58=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > Each of these IPs has its own link status pin as an input to the So=
C:
> > >
> > > > The above architecture is for the RZ/N1 SoC. For RZ/T2H SoC we dont
> > > > have a SERCOS Controller. So in the case of RZ/T2H EVK the
> > > > SWITCH_MII_LINK status pin is connected to the LED1 of VSC8541 PHY.
> > > >
> > > > The PHYLNK register [0] (section 10.2.5 page 763) allows control of
> > > > the active level of the link.
> > > > 0: High active (Default)
> > > > 1: Active Low
> > > >
> > > > For example the SWITCH requires link-up to be reported to the switc=
h
> > > > via the SWITCH_MII_LINK input pin.
> > >
> > > Why does the switch require this? The switch also needs to know the
> > > duplex, speed etc. Link on its own is of not enough. So when phylink
> > > mac_link_up is called, you tell it the speed, duplex and also that th=
e
> > > link is up. When the link goes down, mac_link_down callback will be
> > > called and you tell it the link is down.
> > >
> > Sorry for the delayed response. I was awaiting more info from the HW
> > team on this. Below is the info I got from the HW info.
> >
> > EtherPHY link-up and link-down status is required as a hardware IP
> > feature, regardless of whether GMAC or ETHSW is used.
> > In the case of GMAC, the software retrieves this information from
> > EtherPHY via MDC/MDIO and then configures GMAC accordingly. In
> > contrast, ETHSW provides dedicated pins for this purpose.
> > For ETHSW, this information is also necessary for communication
> > between two external nodes (e.g., Node A to Node B) that does not
> > involve the host CPU, as the switching occurs entirely within ETHSW.
> > This is particularly important for DLR (Device Level Ring: a
> > redundancy protocol used in EtherNet/IP). DLR relies on detecting
> > link-down events caused by cable issues as quickly as possible to
> > enable fast switchover to a redundant path. Handling such path
> > switching in software introduces performance impacts, which is why
> > ETHSW includes dedicated pins.
> > As for Active Level configuration, it is designed to provide
> > flexibility to accommodate the specifications of external EtherPHY
> > devices.
> >
> > Please share your thoughts.
>
> Please add this to the commit, to make it clear what these pins are
> for.
>
Sure, I will add this in the commit message.

> It actually seems like it is mostly relevant for link down, not up.
> If the link goes down, it does not matter if it is 10Half, or 1G Full.
> All you want to do is swap to a redundant path as soon as possible.
>
> It would however be interesting it know more about link up. Does the
> hardware start using the port as soon as link up is reported by this
> pin? So it could be blasting frames out at 1G, until software catches
> up and tells the MAC to slow down and do 10Half? So all those frames
> are corrupted, causing your nice redundant network to break for a
> while?
>
Sorry for the delay, Ive now got the answer from the HW team:

When a link-up is reported by this pin, the hardware starts using the
port. If a 1Gbps connection is lost and then re-established at 1Gbps,
the ETHSW will transmit the buffered data. In general cases, there is
a possibility that a link that was previously at 1Gbps/Full-duplex
could, for some reason, change to 10Mbps/Half-duplex, but this is
usually unlikely. At least when using DLR, it is common to set
auto-negotiation so that both speed and duplex are fixed. If the link
comes back up at 10Mbps (a different speed than before), the EthPHY
will likely follow at 10Mbps if auto-negotiation is enabled, but the
ETHSW will continue operating at 1Gbps and start sending out the
buffered data.

If you are happy with this, I will send a v2 series updating the commit mes=
sage.

Cheers.
Prabhakar

