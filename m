Return-Path: <linux-renesas-soc+bounces-32176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBugDytz+2m7bAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:58:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A82C84DE7C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40D573025E70
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C714A2E02;
	Wed,  6 May 2026 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvKsfPVd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D8A47B426
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 16:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086626; cv=pass; b=i66wvW1RlliU+SdqMYJpfa/se17NliI/LHEejosKgw7WoeFUEZnYiRBfxlp/pZt+IxU66jVEbCJVRe1MzHtyhUJDknzaas3/bQihJSln3AsGs/JdFF9OWR64m6R2JdyuvyNwz1uIEAhO/ZiO5APPrAOcm0qg+uW+fV/9vuBjt7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086626; c=relaxed/simple;
	bh=nnDPaFLuNjymt4tOlyK75CyPRpjnz6csTwevbm8ig3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCtD4ppQTtEeDtvugoM2UxqnWvqmRb/sTy/YiFvyw6ixdWxIJSfrSkQYduB9JMQdW0LgoFdp29koBcB/FmXB990B0GdF8gRk0MjxQmVy0xgFD/LXuYUd+DfHFD9N+JlyMuJYfxHak3Tp+qkOIcI+BClF3DOFNH76a8Qn5iProfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvKsfPVd; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso3328592f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 09:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778086623; cv=none;
        d=google.com; s=arc-20240605;
        b=Qo1VlEgWRrNehNo4bdBe2lWeN+yg2mw2MAjl6lA/FoRSOwjnWxj3rekwueLanoAb1t
         euJq8hvMmW/Cmfs2zXTbv/4o4eJ93qUJmuOJVPdMGewY6BhWUx0cos99aO6k2ahoDWfu
         oAWrnGpifBIV3/dL+AvVC+ROeSKjI7d5EfpUBG89bUlogchFX3h84lcV4TrrMe0tiazb
         mMhTCymbkLhBEEby8YFs2SPsVxXe/LTWwndVN4jN9JIe9DpOa+hLkKK8DX/MOcA813ov
         HJXvJMab3YtpE+8mnpokxztjvH/uBKCepaC1KM1+n8aE8trEZ+KW4F5Ertlbh8fNEHs2
         7FbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3VrhHynwF48UxqEaIGN6Be/106vwYx62+QwtkeJSSQ=;
        fh=TrCNhOxojXbYDC5I1YGiSeB9AUQ8ciY88Xaf19MtblU=;
        b=K4rsAUOx7n9jHX9T5CPF+J7+h5AfGcLGNXZIpu8pWe1TKUsdSFMiRChpz42qOkqjV5
         P59ICmYuJz0wElmuE/4sf4Bnde2khW0kmS//EK3XWZSTosEMZ9Qog9dFHs4u92fxr0nT
         ocnG68hht+wyFD4tLgnKvkU/tT0emfuyk32kMmpVisqlJrWxI+DaPZ02gm2yMcCtW72j
         UHOzWnpD/2ZfftzsdZ8CTysZAlAk8HqKpz6pOnSCdb3zPsUf/LC6v/w7FXh/lMqDQXKw
         0oGTaNmmKO4Nd9YrSa6UVEbs1hgFI0rHcchF62pUWR+H6OVh1+Hc1Zn3EYmcWDJyUeuB
         Z0iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086623; x=1778691423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3VrhHynwF48UxqEaIGN6Be/106vwYx62+QwtkeJSSQ=;
        b=DvKsfPVdrYrHRnwlyd3CYOEXYiDXhfu03/bnjD86bXkyGLIjE0W3tiA5rMqTYyFxom
         dRstHX8n8g4pMknBbVzZE67RMcitm+8cFvfH8znxoFAM+ownD0ZT/en8LryF0WQbJvFI
         ncqNYvBupY6Vwk8rghUSAaKVZsvOX1ScoZTVFxT6Y84clf4Ea+CchvXnl6Y3QlUDFYkK
         K0zo9ii2IBD4B65uIBY56hUxLTlohNZvTrFj8xjSVS0I0wU9YZzn6fcnn7Y36JgXbSvv
         Z5Adq6QnW7OK+l2p86z5Mx8KBEgfVEMyKlA/ixEAZi1QrxzmnqSyf0W2tW3lSx+6zzjz
         ZZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086623; x=1778691423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W3VrhHynwF48UxqEaIGN6Be/106vwYx62+QwtkeJSSQ=;
        b=jjHLYf4k85K7qAFs6xJOwJNgb5qLzDmfxqSm/lKeFHB1M18XqFe3AsC6T1abnraTux
         NaWctvvFtu9npkS6l1Z41dBLuGZ2hwaRbqgUoMjUR32pHp6GblN+QszDKzb+nN2Dzmb5
         c0XhEk2fCBIKGWQmvJ64IaUQNZhGN4xtdLcTPYkNsheK/f2uABUpcQyCvUp5xbqmuNW5
         SQyFLawH9VAYq8gTbrPphGMhvHqP6NSsBu0WWe4HFHpxJ+z2zYZ37TS8hwHXGWSl9xu1
         5X7DwNDKCM/Z7x4MZC03nK9qTKjm1Bjhu2nUk9J7Afqd9zLhMGCpL9VHDkTWT3ipbHyD
         Afnw==
X-Forwarded-Encrypted: i=1; AFNElJ+devSb3A4C3QXwje09Yv+J9zHZea+VDnkUigeFp4Zn5ADEhvg03id/IHq6a//6ZODUbgcpI9ZeB49bHigi3DkaxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbHAFvCCSJ1lSy6BRWMoWqFgCHVHDnEF3c2BmO8ANTqSoekAEp
	6mq6aBNvaB23S8KJsyWaE8B0A2nv0w14mOStzmX1A1U/iI5Y3sUdRWZMP4OVlDmfoud6PA+sjbp
	ILfV8EErokN/HrN79D5/s3jJO1193z2Y=
X-Gm-Gg: AeBDievmfpkmp0L/HQp0BS7/14m/EgftiDzqCLDMGqlGZmcHauoF3mAlXzYSjAulGm4
	xQ7AzDGN9UelFhs2T7jNR8dQrHnbhFUeyRdT5owKSGVf4ww4zze4a7uAzhC9+xcE3AXzXKqB3k1
	fF2HnlB5pP0+SXC7Hk7htd+aR7P3Ls+KaV8npSMrsc4f4hhqWWGp0CUrzZYZr0GDV/dXOLYxWot
	DHETU1j4K3BP2iyM+UNizy32qBjFSBqth1ko1/jMaG9jkAR6yBi7eJbDAceSijqvOYW7Sp5hLnz
	pMTrYcNQ9h6zKYoXBtHmUxduFuxABs7E+CPmw4G2lYcjpDkatBijLRmF1Dl3Fa+LmhJclcCJh7P
	HxEsUVL3Dv3z3WT8PL8w5qN6MDT+ZVLFSmJ1v
X-Received: by 2002:a05:6000:1ac6:b0:43e:a9ba:b194 with SMTP id
 ffacd0b85a97d-4515d5c6b69mr7472966f8f.34.1778086623205; Wed, 06 May 2026
 09:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev> <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
 <lvix7p4e7c4dtchtdti3rwrs7jkda5iy7lthcffhqc7g6vgu2p@54qywklrspi7>
 <CA+V-a8sd=dyTZmViLbDrCPYbx5ujWzjk74HxhP0aBEqxLuEqJA@mail.gmail.com>
 <leky6ktelj7t3uwd4bakgefrk32m3ceyxmwbkkjpp5zqp6rjgj@jtiqktxchws3>
 <CAMuHMdUpzABKKRBwK3mMmTS1+S21R+0k94bOX-+4ZBoa+bRWSA@mail.gmail.com>
 <phuerp2kp6ngruqjkpyjczpn5ya7iywrsiaqiiydvqxwlkntks@gyfcws3intsw>
 <CAMuHMdW_f5676cmimQYNyO3FZyi=DY_3sdVdUSUqXyZXpqCN0Q@mail.gmail.com> <ed3g6ff6rprbmho6aegkl3p3rzr2lroskf3h2rk774jhxpbqkt@pkuovjn3hrlw>
In-Reply-To: <ed3g6ff6rprbmho6aegkl3p3rzr2lroskf3h2rk774jhxpbqkt@pkuovjn3hrlw>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 May 2026 17:56:36 +0100
X-Gm-Features: AVHnY4IxAQNfa7ZXVBZBUZ_-kUL61L7PlHFWw3kP1JJ8Ny6Y6D4wlmNswfFeMso
Message-ID: <CA+V-a8t01Rf-i--7RL3A+O4xVGOtDLEJWSnztH0S-OGWDLQ94Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Manivannan Sadhasivam <mani@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A82C84DE7C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32176-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,google.com,tuxon.dev,bp.renesas.com,pengutronix.de,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[add1:email,renesas.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:email]

Hi Manivannan and Geert,

On Wed, May 6, 2026 at 2:12=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Wed, May 06, 2026 at 02:07:21PM +0200, Geert Uytterhoeven wrote:
> > Hi Manivannan,
> >
> > On Wed, 6 May 2026 at 14:02, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
> > > On Mon, May 04, 2026 at 11:05:11AM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, 1 May 2026 at 16:42, Manivannan Sadhasivam <mani@kernel.org=
> wrote:
> > > > > On Fri, May 01, 2026 at 12:13:55PM +0100, Lad, Prabhakar wrote:
> > > > > > On Thu, Apr 30, 2026 at 4:26=E2=80=AFPM Manivannan Sadhasivam <=
mani@kernel.org> wrote:
> > > > > > > On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrot=
e:
> > > > > > > > On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> > > > > > > > <claudiu.beznea@tuxon.dev> wrote:
> > > > > > > > > On 3/18/26 14:44, Prabhakar wrote:
> > > > > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesa=
s.com>
> > > > > > > > > >
> > > > > > > > > > Add support for the RZ/V2H(P) SoC PCIe controller to th=
e rzg3s-host
> > > > > > > > > > driver.
> > > > > > > > > >
> > > > > > > > > > The RZ/V2H(P) SoC features two independent PCIe channel=
s that share
> > > > > > > > > > physical lanes. The hardware supports two configuration=
 modes: single
> > > > > > > > > > x4 mode where one controller uses all four lanes, or du=
al x2 mode
> > > > > > > > > > where both controllers use two lanes each.
> > > > > > > > > >
> > > > > > > > > > Introduce configure_lanes() function pointer to configu=
re the PCIe
> > > > > > > > > > lanes based on the number of channels enabled. Implemen=
t
> > > > > > > > > > rzv2h_pcie_configure_lanes() to detect the active PCIe =
channels at
> > > > > > > > > > boot time and program the lane mode via the system cont=
roller using
> > > > > > > > > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@=
bp.renesas.com>
> > > > > > > > > > ---
> > > > > > > > > >   drivers/pci/controller/pcie-rzg3s-host.c | 142 ++++++=
+++++++++++++++++
> > > > > > > > > >   1 file changed, 142 insertions(+)
> > > > > > > > > >
> > > > > > <snip>
> > > > > > > > >
> > > > > > > > > This introduces some limits in the systems with RZ/V2H(P)=
 SoCs with regards to
> > > > > > > > > the usage of linux,pci-domain. I would like the PCIe main=
tainers take on this.
> > > > > > > > >
> > > > > > > > > As this is necessary to index in the system controller dr=
iver specific data (as
> > > > > > > > > there are different SYSC offsets for different PCIe contr=
ollers) I see the
> > > > > > > > > following alternatives, if any:
> > > > > > > > >
> > > > > > > > > 1/ add a dedicated DT property for this, e.g. renesas,pci=
e-controller-id
> > > > > > > > > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would=
 be used to specify the
> > > > > > > > >     system controller register offset and mask for differ=
ent functionalities.
> > > > > > > > >
> > > > > > > > >     E.g.:
> > > > > > > > >     renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > > > > > > > >     renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > > > > > > > >     renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > > > > > >
> > > > > > > > >     And use them in each controller DT node. E.g.:
> > > > > > > > >
> > > > > > > > >     pcie0: pcie@add1 {
> > > > > > > > >         // ...
> > > > > > > > >
> > > > > > > > >         renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > > > > > > > >         renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > > > > > > > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>=
;
> > > > > > > > >
> > > > > > > > >         // ...
> > > > > > > > >     };
> > > > > > > > >
> > > > > > > > >     pcie0: pcie@add1 {
> > > > > > > > >         // ...
> > > > > > > > >
> > > > > > > > >         renesas,sysc-l1-allow =3D <&sysc 0x1050 0x1>;
> > > > > > > > >         renesas,sysc-mode =3D <&sysc 0x1054 0x1>;
> > > > > > > > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>=
;
> > > > > > > > >
> > > > > > > > >         // ...
> > > > > > > > >     };
> > > > > > > > >
> > > > > > > > I'd like to get a clearer steer from the PCIe and DT mainta=
iners
> > > > > > > > before investing further in either direction.
> > > > > > > >
> > > > > > > > To recap the two approaches on the table:
> > > > > > > >
> > > > > > > >   Option 1: A single renesas,pcie-controller-id property us=
ed to look up
> > > > > > > >             SYSC offsets in the driver.
> > > > > > >
> > > > > > > Can you explain what is the limitation with 'linux,pci-domain=
' property?
> > > > > > >
> > > > > > As sashiko pointed out.dev, The linux,pci-domain property is ge=
nerally
> > > > > > an OS-specific logical property intended to assign a stable PCI=
 domain
> > > > > > number across reboots. Restricting it to [0, 1] would prevent s=
ystem
> > > > > > integrators from using non-conflicting domain numbers like 2 or=
 3 if
> > > > > > the board incorporates other PCIe controllers.
> > > > >
> > > > > "linux,pci-domain" is supposed to be used in SoC.dtsi, not in boa=
rd.dts. AFAIK,
> > > > > the board designers have no reason to change it.
> > > > >
> > > > > Yes, the property name implies that it is a Linux specific proper=
ty and if you
> > > > > want, you can propose a generic one (not vendor specific one). Ot=
her than that,
> > > > > I don't see a blocker in using this property. Many SoCs already d=
o this and
> > > > > other DT projects like u-boot do not end up parsing this property=
.
> > > >
> > > > Sounds like this overlaps with pciN DT aliases, which are in use on
> > > > some (PPC) boards?
> > > >
> > >
> > > Hmm. DT aliases are discouraged these days, AFAIK. Are those boards a=
lso need
> > > these register configuration? I thought only RZ/V2H(P) SoCs need them=
. If not,
> > > then RZ/V2H(P) DTS can use 'linux,pci-domain' property.
> > >
> > > If yes, then it would be better to hardcode these offsets in the driv=
er based
> > > on the compatible. DT's job is to describe the hardware topology and =
resources,
> > > not register offsets.
> >
> > The offsets cannot be hardcoded based just on the compatible value as t=
here
> > are two instances.  The offsets do describe the topology.
> >
>
> Oops. I mixed it with the PHY compatibles... Anyhow, I'd suggest to go wi=
th
> 'linux,pci-domain' to get the domain ID and use it to calculate the offse=
t.
>
Thank you for the feedback, I will go with the 'linux,pci-domain' property.

Cheers,
Prabhakar

