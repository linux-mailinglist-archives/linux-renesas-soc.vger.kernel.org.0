Return-Path: <linux-renesas-soc+bounces-25018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F366C7BC12
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 22:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0B1AD355733
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 21:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B22D306D3D;
	Fri, 21 Nov 2025 21:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBtjt9q9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C1141A8F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 21:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763760645; cv=none; b=Vif1qTlxna0nox6MexndGYOUsZI4kfFCypyM6t9s4QpHieAdYCzZdWINPD6vq8XKEqHHr1148S7VPMKivXJkznQQfNidxKCy5MBRKPvdE16GI8G4vq74Tp6QIxN9GzvgjEPmI+w2Q8TDoGz234A/D0aDLkBX+GTLvv9rLRrOcNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763760645; c=relaxed/simple;
	bh=D+5H3nNvGF2VIP+zpxewJTT4xj9DjwT6g7PTX/mjtl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAkaViCuZacZmd4wnVdzR+snSTY76Y1f11OPlNs3RUdUym5nbjjEJ4ntvC9SoQ0x2dFZ8KFpBaFsLadlInDjX+M2t4lUyWeYXBu99HTwurFO94gqLjdYfgRKMSNhCTOqCbkakwEvtwnub63Zxx57DGTppH3F53ju/QF0fitII5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBtjt9q9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b379cd896so1451136f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 13:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763760641; x=1764365441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcnfwnAnoq9Fhw37SyI9X8sGMiJgnd+Uv1hwKVjim2Q=;
        b=aBtjt9q9x8J/RfcmVjOBX0RyjEqwc7T+KKKCmC8bLp/3fyixJQfNfp+Eg3yzwSZF9f
         KsEKZ0XDMB7tlSDDY9rx+IJ68oNzgURCBrNWOdR6ybrSpBryDB34qEpLxokAqZMQ5+z4
         1NojEzsF70DmyP5rcR8R7vuBPN7KBcaS9s7XRxDnIfWES7BGpZrcN8JmCoimwEbxrZT+
         HMi5GVkiYp07m0jBjC/SdD94sG63AXUgpxnP0MeHYIbpTx5UcFtr5qsogER7JN9JiY+5
         zAqJXE25TI/8YDAAzTEm0RQenqGn+z5/vjRp0L7DT76nJBFMc72C3BA1qDZtHbKt87LD
         3tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763760641; x=1764365441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hcnfwnAnoq9Fhw37SyI9X8sGMiJgnd+Uv1hwKVjim2Q=;
        b=XEx9NF9v+W4jjJx7LZN8zpA1cFHEZO+0vvZxsMMIwZKembJ138X2tMOvyuAkLBQONP
         ekcq0qLdEqFEmhe9wtBzKphQp92IuNNw1BQ9pbvdJVEjPcsRcvon94yI1IoEyWV9Abct
         LmwthVkWvT/xQrhid+L7k3unDNr9pwPgoIfaPwolLCww+Kd7b57jswIjExQKQfyLn5f4
         6giEhPbuNTBs36NywU1tBHK9wIvacwCZP5Kd3kSZZnQMhD41RDhRfa/o1QLODU1jcPPi
         k/GpddqVjrTRftF5kRFop8eCSCBlVZpyQ4raBHKm/Oi0C3q0Tmdt6ByEOwClQzb5SuO5
         PSOg==
X-Forwarded-Encrypted: i=1; AJvYcCX2CIHAICM56ZesNraGwVIbXHixAqbYVcAgqJ8T4zR5xQL/y9Gz0VOtSzqiucawyPOrYIR8JVU6GRFEkvQ/W5CVpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfTD0qg59+BqpUftqv+SCa/fcOCc0Fgw+EIOOw45LZuPiJVscJ
	I1GsLDKUJ9hX2VfFXiiH7v3vO8d5eiLIGV9Je7kH8rBR2fyJmrf8C6SVk2w/8gT/EUUvhW94EBu
	iUPx566AN/O/Ts0dHuLOj9gacXYHENr4=
X-Gm-Gg: ASbGncsK23Eu3UHLBfB+zdr9DPjIh5I7rliWOLjvfUuJrMaIgUS0xR1iV/jNi/ntNgq
	5oUp82wOa09oLd1ILVhPfalHrIw4bd2kVHlyQdcxtzdmYhxQDCZwnazo6LAqJbOKmvsf5AjSjPu
	d89Z0vCpkQeX2T/tzi5J8UDWULD+K3L3jhVVJfAJxtqMyVfz8XG/DKvF2nLn2tZdSSIooDQHTIy
	Lc856+pvjUkhVU9oxmDCAPKvLZ4xDaSX115Wvetr2Rh/jsmKNi9KlUYsREBgK+PC0nZa4aHmCkS
	SZkV098g2DW+jRN6GH56tWBe0gFW6LnGS8ClqWA=
X-Google-Smtp-Source: AGHT+IHFza28/HLNlBLJhQc7+YEkrnjCLxc+DtrDhOWTi1679uZaJ42r/nuYALOcGS6zFbQIlAAVjgM+8yjpShMR5wE=
X-Received: by 2002:a05:6000:22ca:b0:42b:3746:3b88 with SMTP id
 ffacd0b85a97d-42cc1d22a43mr3976603f8f.57.1763760640501; Fri, 21 Nov 2025
 13:30:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121192700.3eg5h2eqk7bruxeu@skbuf> <CA+V-a8vyjt43TPUmu+1TFHFvQsBwYTzKFSQOQm=O3R0dpZWG_w@mail.gmail.com>
 <20251121204833.hu4jfq6bx2kdamd3@skbuf>
In-Reply-To: <20251121204833.hu4jfq6bx2kdamd3@skbuf>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Nov 2025 21:30:14 +0000
X-Gm-Features: AWmQ_bkQ2IeWhsgefdLasYqIq_ZXdqTdPdH9Mzx8FAtJ2y9VFLAWaJ5rpjXrzn8
Message-ID: <CA+V-a8uA-p9wGXNVdf8Oykt518_2X6fyK6s2-R+G_AR2DqXckA@mail.gmail.com>
Subject: Re: [PATCH net-next 02/11] net: dsa: tag_rzn1_a5psw: Add RZ/T2H ETHSW
 tag protocol and register ethsw tag driver
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

On Fri, Nov 21, 2025 at 8:48=E2=80=AFPM Vladimir Oltean <olteanv@gmail.com>=
 wrote:
>
> On Fri, Nov 21, 2025 at 08:29:04PM +0000, Lad, Prabhakar wrote:
> > On Fri, Nov 21, 2025 at 7:27=E2=80=AFPM Vladimir Oltean <olteanv@gmail.=
com> wrote:
> > >
> > > On Fri, Nov 21, 2025 at 11:35:28AM +0000, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add an explicit tag protocol for the RZ/T2H ETHSW and register a se=
parate
> > > > ethsw tag driver so the existing A5PSW tag implementation can be re=
used
> > > > for RZ/T2H without code duplication.
> > > >
> > > > The ETHSW IP on RZ/T2H shares substantial commonality with the A5PS=
W IP on
> > > > RZ/N1, and the current tag driver does not touch the register field=
s that
> > > > differ between the two blocks.
> > >
> > > Tagging protocol drivers are specifically written to not deal with
> > > register fields. I would like a clarification that this is a phrasing
> > > mistake and you mean the packet header fields that differ between the
> > > ETHSW and the A5PSW tag format.
> > >
> > Unlike the other drivers, tagging drivers don't have compatible
> > strings to match against. For the ETHSW IP, the current driver is
> > reused as-is. My intention with the comment was simply to point out
> > that, if an issue ever arises that requires us to split the paths, we
> > can future-proof things by using DSA_TAG_PROTO_* identifiers.
>
> The tagging protocol's name uniquely defines the layout of the DSA
> header and general interaction procedure required on RX and TX (for more
> complex things such as PTP). It doesn't have to be further namespaced by
> its users just because. In other words, two switch drivers using the
> same tagging protocol with the same name is fine (even if due to a lack
> of imagination, the tagging protocol's name comes just from its first
> user), and introducing a new name for it would be unnecessary. For
> example, felix_vsc9959.c, a switch different from ocelot_ext.c, uses
> DSA_TAG_PROTO_OCELOT because the protocol is identical.
>
> The exception would be when there exist packet headers which have
> different layouts - then irrespective of whether those fields are
> currently used or not, we should register a new driver.  This is the
> only thing that matters.  I thought that you were saying that such
> differences exist, but after your second reply, it seems not?

The Tagged Frame Format is the same for both the SoCs (like below)
---------------------------------------------------------------------------
7 octets PREAMBLE
1 octet SFD
6 octets DESTINATION ADDRESS
6 octets SOURCE ADDRESS
2 octets ControlTag (default: E001h)
2 octets ControlData
4 octets ControlData2 (timestamp, portmask)
2 octets type/length
0..1500/9000 octets PAYLOAD DATA
0..42 octets PAD
4 octets FRAME CHECK SEQUENCE

Transmit processing (switch to CPU) is different,
On RZ/N1:
ControlData
[0-3] =3D Port number where the frame was received
[4-15] =3D reserved

On RZ/T2H:
ControlData
[0-3] =3D Port number where the frame was received
[4] =3D Timer used for timestamp
[5] =3D reserved
[6] =3D RED period indication
[7-15] =3D reserved

Also there are differences in receive processing (CPU to switch) the
ControlData and ControlData2 bits differ.

Based on the feedback received I would need to register a new driver.
Do you agree?

Cheers,
Prabhakar

