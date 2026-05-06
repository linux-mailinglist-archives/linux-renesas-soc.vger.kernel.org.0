Return-Path: <linux-renesas-soc+bounces-32118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNZKMA0v+2k4XQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 14:07:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9934D9F84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 14:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBBB3300AB1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 12:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B29643DA3B;
	Wed,  6 May 2026 12:07:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9461A345CAA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069259; cv=none; b=CJtzRlk1nEhWJ6PuZexJH1b/tnS2sN8bCh+VN3BEhwnhN/uu87jGjoK31EpJgVF2/ef50mjGA6Tj1XzICWjeLOGWXdMezyIZ/7UJwbKluxHuLMHZ8xRLp6BK3DuP36wcLiLBpB1i9PUAYqV4Igd5SAJCFdlxxACJlLWpCp4lW4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069259; c=relaxed/simple;
	bh=soAn2vrnq+NZwkeJhBPM72OE9WgHbaIcXvtyW2rribo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLz6RFZ8on+u4BiApwM09uqAfaVSBzo1Nzc7HXlWU1sNKBKlKFPywlzSw+TVyUiQ4AC0Ku/nG+45o3A7w9RBKDg22Me7/MvDFD0tkbitLdKReyRZV0aHMuFQPE05t9XtMzv/M7ryO8Rq2ClhqsNV/e4onaotA9XrNho8xrOK52Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-62dff2771abso1375653137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 05:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778069256; x=1778674056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1b6tMUtONBmgXqH4JWcLF8QY3yG7D5JUUuZo3u2Uck=;
        b=QNndFgjsJEtxj15boCUwVynJ7R9U7t2dIqN+W+SPZ9TlZvQKXUFz2vDscnBdKxLBuD
         y8chcYa1mCewUOKHtLWDvNsYv15LbRhBFEgwXQz8v0Ie8XWfKvKNkgA968XZuvRarPfq
         cDexMoGrC62nSWr8Uz61aBU8jr13hskhIF/ccZbyTbBTv1HGZ0HNDqsDB3p6rD1Xwizy
         F6/zgMfW3v4s0KkZlXU4+t/azVEgR4VmP4jB6nhX6X9H51RN0009PV+/0eqYbMa+vZEp
         Y2QIMuwVkfd1uqv2dWLyqR4b0ezDnOVCGa3fheHcTZ6Rj41ge5f3dN/J8vfpuRcqXExL
         QpQg==
X-Forwarded-Encrypted: i=1; AFNElJ/WhaAYo7VWnfm9BlHQRrpwti7lUPzsvDw2xVhwWmnE+XJUU0+6gKDTX+5Eua6oO8n5WUzrGpBgk2hZre7UqEH4uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0n9guL87u6XNwJkuaHxxJBTKYKrg0qNWQwN/6zGXJ5B90QDmN
	jQN3fZHVEnCkvoEvGBisZZRjIHDMwsYcGOweSC/zhF4I3BO53f4EbL80G7mffhRJdSA=
X-Gm-Gg: AeBDiev7GEWZRxPcPwOKKhLRae7sJ5cO31Q9UKaKvt/XkJmmLaf22djZ5Z42OFTcwo+
	o2jG8anhVrBIewm/XsxgjCYcIgJRk8dLtF9H8D1drJUfjGRmripwK0+opY6l9eX9+gDxQ2pYI3t
	jMHYkLX/mHBUfUAV+xmeL1eYAI6JTupaUUm8Hvs8eJQi3oSO2jHOEJeGojDG3Gl1HzbnREJF8BE
	VMchJ8Vw/Z/sv+u19kcSRy8F8CgikwfMN4ujRnx/SZX/lvql1YB8oE2Ks5h9rhMiejJMBIEVVzQ
	CYW9qtXj2O91Ss2ouf8Txu9txUHO2scNiSSpArMrO9JD5U0Vu+SH9A628om822lUkZvXWpdsY/b
	fapPKwWimnad6fxiXFcjg4Y4s0LC7rHaakYAYp7nBL0oTch5qAMYKIeI9QjiSv0D95QkRCQNc8f
	+AMEyYU5sqMiaiZItqwWlwHK4SZtndFfHLU1uQNQ0Ctxnbp6ILn0Fp4tq3JuBCXoHmKpZBMLQ=
X-Received: by 2002:a05:6102:f8c:b0:628:1e7b:cd0e with SMTP id ada2fe7eead31-630f8ecb6c1mr1129728137.11.1778069256313;
        Wed, 06 May 2026 05:07:36 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95d338eefe9sm2560020241.7.2026.05.06.05.07.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:07:34 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-956948531a1so1763474241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 05:07:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+0tdLaZqzUyKn1dgoSQhtwY2Z4TctaDBCfoD065QrBwDIq6Jw97yk8Qg/Lulon6vwD5sq+JpJhHmTIzpHRMaRQCw==@vger.kernel.org
X-Received: by 2002:a05:6102:5693:b0:611:7c7b:4d40 with SMTP id
 ada2fe7eead31-630f907cbb1mr1000566137.30.1778069254404; Wed, 06 May 2026
 05:07:34 -0700 (PDT)
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
 <CAMuHMdUpzABKKRBwK3mMmTS1+S21R+0k94bOX-+4ZBoa+bRWSA@mail.gmail.com> <phuerp2kp6ngruqjkpyjczpn5ya7iywrsiaqiiydvqxwlkntks@gyfcws3intsw>
In-Reply-To: <phuerp2kp6ngruqjkpyjczpn5ya7iywrsiaqiiydvqxwlkntks@gyfcws3intsw>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 14:07:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_f5676cmimQYNyO3FZyi=DY_3sdVdUSUqXyZXpqCN0Q@mail.gmail.com>
X-Gm-Features: AVHnY4JBLrNERmCgzgZxToIaKZzdpYZg7PBuCPB4L1Dje6XmwXVPrc9hRXm7oGY
Message-ID: <CAMuHMdW_f5676cmimQYNyO3FZyi=DY_3sdVdUSUqXyZXpqCN0Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
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
X-Rspamd-Queue-Id: 2A9934D9F84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,tuxon.dev,bp.renesas.com,pengutronix.de,sang-engineering.com,vger.kernel.org,renesas.com];
	TAGGED_FROM(0.00)[bounces-32118-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid,tuxon.dev:email,add1:email,linux-m68k.org:email]

Hi Manivannan,

On Wed, 6 May 2026 at 14:02, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Mon, May 04, 2026 at 11:05:11AM +0200, Geert Uytterhoeven wrote:
> > On Fri, 1 May 2026 at 16:42, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
> > > On Fri, May 01, 2026 at 12:13:55PM +0100, Lad, Prabhakar wrote:
> > > > On Thu, Apr 30, 2026 at 4:26=E2=80=AFPM Manivannan Sadhasivam <mani=
@kernel.org> wrote:
> > > > > On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrote:
> > > > > > On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> > > > > > <claudiu.beznea@tuxon.dev> wrote:
> > > > > > > On 3/18/26 14:44, Prabhakar wrote:
> > > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.co=
m>
> > > > > > > >
> > > > > > > > Add support for the RZ/V2H(P) SoC PCIe controller to the rz=
g3s-host
> > > > > > > > driver.
> > > > > > > >
> > > > > > > > The RZ/V2H(P) SoC features two independent PCIe channels th=
at share
> > > > > > > > physical lanes. The hardware supports two configuration mod=
es: single
> > > > > > > > x4 mode where one controller uses all four lanes, or dual x=
2 mode
> > > > > > > > where both controllers use two lanes each.
> > > > > > > >
> > > > > > > > Introduce configure_lanes() function pointer to configure t=
he PCIe
> > > > > > > > lanes based on the number of channels enabled. Implement
> > > > > > > > rzv2h_pcie_configure_lanes() to detect the active PCIe chan=
nels at
> > > > > > > > boot time and program the lane mode via the system controll=
er using
> > > > > > > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > > > > > > >
> > > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.r=
enesas.com>
> > > > > > > > ---
> > > > > > > >   drivers/pci/controller/pcie-rzg3s-host.c | 142 ++++++++++=
+++++++++++++
> > > > > > > >   1 file changed, 142 insertions(+)
> > > > > > > >
> > > > <snip>
> > > > > > >
> > > > > > > This introduces some limits in the systems with RZ/V2H(P) SoC=
s with regards to
> > > > > > > the usage of linux,pci-domain. I would like the PCIe maintain=
ers take on this.
> > > > > > >
> > > > > > > As this is necessary to index in the system controller driver=
 specific data (as
> > > > > > > there are different SYSC offsets for different PCIe controlle=
rs) I see the
> > > > > > > following alternatives, if any:
> > > > > > >
> > > > > > > 1/ add a dedicated DT property for this, e.g. renesas,pcie-co=
ntroller-id
> > > > > > > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be =
used to specify the
> > > > > > >     system controller register offset and mask for different =
functionalities.
> > > > > > >
> > > > > > >     E.g.:
> > > > > > >     renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > > > > > >     renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > > > > > >     renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > > > >
> > > > > > >     And use them in each controller DT node. E.g.:
> > > > > > >
> > > > > > >     pcie0: pcie@add1 {
> > > > > > >         // ...
> > > > > > >
> > > > > > >         renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > > > > > >         renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > > > > > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > > > >
> > > > > > >         // ...
> > > > > > >     };
> > > > > > >
> > > > > > >     pcie0: pcie@add1 {
> > > > > > >         // ...
> > > > > > >
> > > > > > >         renesas,sysc-l1-allow =3D <&sysc 0x1050 0x1>;
> > > > > > >         renesas,sysc-mode =3D <&sysc 0x1054 0x1>;
> > > > > > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > > > >
> > > > > > >         // ...
> > > > > > >     };
> > > > > > >
> > > > > > I'd like to get a clearer steer from the PCIe and DT maintainer=
s
> > > > > > before investing further in either direction.
> > > > > >
> > > > > > To recap the two approaches on the table:
> > > > > >
> > > > > >   Option 1: A single renesas,pcie-controller-id property used t=
o look up
> > > > > >             SYSC offsets in the driver.
> > > > >
> > > > > Can you explain what is the limitation with 'linux,pci-domain' pr=
operty?
> > > > >
> > > > As sashiko pointed out.dev, The linux,pci-domain property is genera=
lly
> > > > an OS-specific logical property intended to assign a stable PCI dom=
ain
> > > > number across reboots. Restricting it to [0, 1] would prevent syste=
m
> > > > integrators from using non-conflicting domain numbers like 2 or 3 i=
f
> > > > the board incorporates other PCIe controllers.
> > >
> > > "linux,pci-domain" is supposed to be used in SoC.dtsi, not in board.d=
ts. AFAIK,
> > > the board designers have no reason to change it.
> > >
> > > Yes, the property name implies that it is a Linux specific property a=
nd if you
> > > want, you can propose a generic one (not vendor specific one). Other =
than that,
> > > I don't see a blocker in using this property. Many SoCs already do th=
is and
> > > other DT projects like u-boot do not end up parsing this property.
> >
> > Sounds like this overlaps with pciN DT aliases, which are in use on
> > some (PPC) boards?
> >
>
> Hmm. DT aliases are discouraged these days, AFAIK. Are those boards also =
need
> these register configuration? I thought only RZ/V2H(P) SoCs need them. If=
 not,
> then RZ/V2H(P) DTS can use 'linux,pci-domain' property.
>
> If yes, then it would be better to hardcode these offsets in the driver b=
ased
> on the compatible. DT's job is to describe the hardware topology and reso=
urces,
> not register offsets.

The offsets cannot be hardcoded based just on the compatible value as there
are two instances.  The offsets do describe the topology.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

