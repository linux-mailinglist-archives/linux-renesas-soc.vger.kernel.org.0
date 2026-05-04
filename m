Return-Path: <linux-renesas-soc+bounces-31932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPecBSdj+GkytwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 11:13:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A55DE4BAC9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 11:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7029030065EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 09:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC546340283;
	Mon,  4 May 2026 09:13:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DE73112AD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 09:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777885987; cv=none; b=PlNyOu3boJMK6P8WZyyElDyyV/yoONRMDZspGt58AsRpWC01IGOV0qIY7O6eKDbFzz8QctwrJrHekc3O+UwsWRA2k3ZDCqrdcO5BUCsYLjbbigMjY6gNAawO5vmjyU0XgTAveJFzDBC5nzdkfo+435oiKQYdFTFXYr7hICvjlrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777885987; c=relaxed/simple;
	bh=NvZkJz2oTmRF8PSVjwwY5oHKDCA/yV3ifrPuiMpUAaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRwYXcBkyRE0/M8yS7eTics9ny5GMAPtTAuH3Wg/SqAYBa94fRhLs9C1XLj7pxHPcmBWC4095eNOaoKF6jKVZZRzSImRwzo8Em1fuQpVqlN0udb4peLmH1vvkCkFunJmJxZ/+CDX1WzKOPhHFbD5YNS9AInmePn9jHrhPn3oABQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so1614088b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 02:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777885986; x=1778490786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=plo5P6qpAaOBS1LGxtH3kAqckE95GaSrW4sXgxkjnV0=;
        b=jSRGKRbTH2MLaoVVhSQFPDSnfNyNilCt18l4Kjz/GhWmudK6/TvoxoX+h34/uUOTkG
         9EsI5SMV8dmpGLjgz3OeZdJ9OovhawCdNr+B+2kleRyFehLDX7o7I4dRWeN/EV0aJpV/
         E+x3HrDKqUh0xMCGxeVMdFZjNez7XFfDiCA/eWzvifEeg5iUCAojSHMZjPxUKV4me+Rv
         ZfFsgCSwwGGsagEkSp/MmAQBLxARKyIM8o4qSmOZGK1SJSATIdKSwsHPOE4TCKMgmsFH
         /Vr4eVnUuaVWCBOMnlHC+H1X8smJdZp3N/PiZ9CrchUMZu5aU1nEt9dHnRo06x/lj2bJ
         Y9UQ==
X-Forwarded-Encrypted: i=1; AFNElJ+E5n9y5Yf/3Uq9BSEAXITY23rlKzKHBwoH7tmVR4dXv/9/vVWxs8P6Mml2E5Tz7SJKZcgjXsnWZZPnP+aiWO6OJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyv6faUPu1xEi+/r/ULZ/pDRuoYYC2XJ3GiKYE/cnIKax3bsNP
	akoDe+c34QcNpIdr3j3oc9PWhjqvpeRI/McTxs85oZbCZVveN8G6idxEDYeegXD3
X-Gm-Gg: AeBDiet5QoastId0ud+R+8/P8feQzZmROQh3JdlPO0aU3+zLnDRF+Pqkqo/af+zYqWK
	lLkJjNMxaz06jyjF+mDjDkEm6S922B/nHrDdH6O7zZzUXbdGJ5wjw/DJ1ZnrSucl97kj1BSxbKf
	d2ECmbS/mTU/JrNkeMiVCiVyJO9iQU5fbG8iCmrGNxTUAHy15azHD3MpxAR0GSwOgKx1GWn+78W
	1DsI5jyVClTX7m4L92pwKgkA493ibn5EWdIkB4OXu2hbAgimrqZpZmUzzFJlfw51yn0NRkW3Xpz
	bKa9XG8X2a9sywHs7j7R8p+85WHUgY6X0wZsplJNwaW5xyeY56CTe/tWzfeQjiiaX+lWYkTa8+O
	zaBtBSTqjeC1A13/GyPZjlueNkB9Ykd4ughftGMjqxwAg1aHsRNgOMgU9RA1MyKqAa3YGl1NeAt
	StIDF/91zpLmtmKt96pw5f0oekYHoqWfY4gLoNw3/6o9+67jtDeq8kh2X4c72vIrXEnYakoQ==
X-Received: by 2002:a05:6a00:3d44:b0:835:cc47:6ff8 with SMTP id d2e1a72fcca58-835cc477f6amr4191190b3a.45.1777885985718;
        Mon, 04 May 2026 02:13:05 -0700 (PDT)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com. [74.125.82.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835293f022asm8202586b3a.45.2026.05.04.02.13.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:13:05 -0700 (PDT)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12dfee30612so5457038c88.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 02:13:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/4197BSr3jVQximmuKW8CyV5HcUwfrbsw166Ysxm/+oEYhJS+m3J0pFshFjqfuSgOC0Y6rHMA8XrvltCIl/4wN8g==@vger.kernel.org
X-Received: by 2002:a05:6102:2ad5:b0:628:397c:ecea with SMTP id
 ada2fe7eead31-62d854946bemr3171395137.10.1777885522827; Mon, 04 May 2026
 02:05:22 -0700 (PDT)
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
 <CA+V-a8sd=dyTZmViLbDrCPYbx5ujWzjk74HxhP0aBEqxLuEqJA@mail.gmail.com> <leky6ktelj7t3uwd4bakgefrk32m3ceyxmwbkkjpp5zqp6rjgj@jtiqktxchws3>
In-Reply-To: <leky6ktelj7t3uwd4bakgefrk32m3ceyxmwbkkjpp5zqp6rjgj@jtiqktxchws3>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 11:05:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpzABKKRBwK3mMmTS1+S21R+0k94bOX-+4ZBoa+bRWSA@mail.gmail.com>
X-Gm-Features: AVHnY4LeZA0N6FCy7UX3qdh0-rhPGX17H6io1xUI_gkSOdYz_S3cRhnSj4PBBRg
Message-ID: <CAMuHMdUpzABKKRBwK3mMmTS1+S21R+0k94bOX-+4ZBoa+bRWSA@mail.gmail.com>
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
X-Rspamd-Queue-Id: A55DE4BAC9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,tuxon.dev,bp.renesas.com,pengutronix.de,sang-engineering.com,vger.kernel.org,renesas.com];
	TAGGED_FROM(0.00)[bounces-31932-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.960];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,tuxon.dev:email,add1:email,mail.gmail.com:mid]

Hi Manivannan,

On Fri, 1 May 2026 at 16:42, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Fri, May 01, 2026 at 12:13:55PM +0100, Lad, Prabhakar wrote:
> > On Thu, Apr 30, 2026 at 4:26=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > > On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrote:
> > > > On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> > > > <claudiu.beznea@tuxon.dev> wrote:
> > > > > On 3/18/26 14:44, Prabhakar wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-=
host
> > > > > > driver.
> > > > > >
> > > > > > The RZ/V2H(P) SoC features two independent PCIe channels that s=
hare
> > > > > > physical lanes. The hardware supports two configuration modes: =
single
> > > > > > x4 mode where one controller uses all four lanes, or dual x2 mo=
de
> > > > > > where both controllers use two lanes each.
> > > > > >
> > > > > > Introduce configure_lanes() function pointer to configure the P=
CIe
> > > > > > lanes based on the number of channels enabled. Implement
> > > > > > rzv2h_pcie_configure_lanes() to detect the active PCIe channels=
 at
> > > > > > boot time and program the lane mode via the system controller u=
sing
> > > > > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renes=
as.com>
> > > > > > ---
> > > > > >   drivers/pci/controller/pcie-rzg3s-host.c | 142 ++++++++++++++=
+++++++++
> > > > > >   1 file changed, 142 insertions(+)
> > > > > >
> > <snip>
> > > > >
> > > > > This introduces some limits in the systems with RZ/V2H(P) SoCs wi=
th regards to
> > > > > the usage of linux,pci-domain. I would like the PCIe maintainers =
take on this.
> > > > >
> > > > > As this is necessary to index in the system controller driver spe=
cific data (as
> > > > > there are different SYSC offsets for different PCIe controllers) =
I see the
> > > > > following alternatives, if any:
> > > > >
> > > > > 1/ add a dedicated DT property for this, e.g. renesas,pcie-contro=
ller-id
> > > > > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used=
 to specify the
> > > > >     system controller register offset and mask for different func=
tionalities.
> > > > >
> > > > >     E.g.:
> > > > >     renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > > > >     renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > > > >     renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > >
> > > > >     And use them in each controller DT node. E.g.:
> > > > >
> > > > >     pcie0: pcie@add1 {
> > > > >         // ...
> > > > >
> > > > >         renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > > > >         renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > > > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > >
> > > > >         // ...
> > > > >     };
> > > > >
> > > > >     pcie0: pcie@add1 {
> > > > >         // ...
> > > > >
> > > > >         renesas,sysc-l1-allow =3D <&sysc 0x1050 0x1>;
> > > > >         renesas,sysc-mode =3D <&sysc 0x1054 0x1>;
> > > > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > >
> > > > >         // ...
> > > > >     };
> > > > >
> > > > I'd like to get a clearer steer from the PCIe and DT maintainers
> > > > before investing further in either direction.
> > > >
> > > > To recap the two approaches on the table:
> > > >
> > > >   Option 1: A single renesas,pcie-controller-id property used to lo=
ok up
> > > >             SYSC offsets in the driver.
> > >
> > > Can you explain what is the limitation with 'linux,pci-domain' proper=
ty?
> > >
> > As sashiko pointed out.dev, The linux,pci-domain property is generally
> > an OS-specific logical property intended to assign a stable PCI domain
> > number across reboots. Restricting it to [0, 1] would prevent system
> > integrators from using non-conflicting domain numbers like 2 or 3 if
> > the board incorporates other PCIe controllers.
>
> "linux,pci-domain" is supposed to be used in SoC.dtsi, not in board.dts. =
AFAIK,
> the board designers have no reason to change it.
>
> Yes, the property name implies that it is a Linux specific property and i=
f you
> want, you can propose a generic one (not vendor specific one). Other than=
 that,
> I don't see a blocker in using this property. Many SoCs already do this a=
nd
> other DT projects like u-boot do not end up parsing this property.

Sounds like this overlaps with pciN DT aliases, which are in use on
some (PPC) boards?

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

