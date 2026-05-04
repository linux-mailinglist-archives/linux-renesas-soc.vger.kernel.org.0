Return-Path: <linux-renesas-soc+bounces-31933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP1SNO5k+GkAuAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 11:20:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5164BADE9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 11:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B4E9300A74D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 09:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD5837702A;
	Mon,  4 May 2026 09:20:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFD3347FC4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886426; cv=none; b=J6w0b/U8k5pJq0uYKiN3Ad0I9yWBSJXwhzuhSXl0zzt34953ZD3yQ/pwNcunIkyMacs60BQP+bPPqcXUooFJmoZxxCbwzexhFZ0GOYKnk+qS23/K6Z/sybMw65aNygFGYwH5/jHf6GJDvop8Xrb3m0J8zC+/zfP2eEyguqYL2SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886426; c=relaxed/simple;
	bh=Y30a/Oc/ZpLcfEvZRO6RE54BICXHkQ3pkt1I8Ae9uRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgDKEb57BshsIjxFTTcBcKaIlW5Otzp8aoX4oIvFX7jsWyXiHSp8XNp3RsmOdB2p6KrvmulbXLTCK1IrwiI6hRy+dUqpBTWgiG1M/aJQC6IiUuyUpeNkCkGsy7ZIloHj+f51fev2RorTDR1l0siMFoJnlz1TNpCJ7qXMj9oVB3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8eae9229110so682212785a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 02:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886424; x=1778491224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n5hHHo+yfxt7H7E3OF8Dc5zPcnFuji78/mo4OM09ccQ=;
        b=lg6UpWAxOTAy10QviZNaiEhNQGk+Yw5wGC5och9+uBG3FvLskJ5zdfBG6u0p27b20+
         pzBFUCoUevfLYTilwH+E2lyw+abYBEa9EJ4WQLdxjXJs6SfQvbEMWZHwNL7dt84dYCNv
         AvVv6IqsPomwold/vXkZeJGYZRUwn7IUiaYN7wR6klyy7yBSSnOri2rP1A4Ew2cQdzE3
         MTxd9er7s8uInVtMelgjVuiFEU0SIdRBBGjk+At2b1KNdfljNf5+THgYxSfBKcLB2VV1
         AJ89Im/NIv0GuH5I3KjTwMxNe9HJ70AqN6zXVJbvtQsmshRqRY/QPKghuxGy1SnlWJsd
         vWmA==
X-Forwarded-Encrypted: i=1; AFNElJ/5oIyh3dqdj5uX70KJGkdO3ftmUX0IzZKElIPsAPIg8ilT1rbHGDWAsWIov5SrEqNoWuZxlbT4ZwmFmUi4NIrIiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt0AYhZCIj+mqhvlhL+049G73yHa7i7zvkwAi6rgjuVWN6fHia
	D0zfqiw83yLtBpkSGLK0/3HjiB6X+Ydr6Vnz8IYrubtfpLNbalg+YVDbXlZruAhm
X-Gm-Gg: AeBDievQ1mX/uiHcb5BU7tDNiyjHre+ybZcoZ7tiRl0YyFkddnCq5HzAlI0COHxE5i7
	Pb0AXZcxQtjh8RDXTySO/U2pk2ylLLqyP1P4pgvE+VEBZhISYQeyro/dtA0lgTtQY1HvY0BmaU/
	36w1uEHpk7oqBxdD9RaDuC/7U/xexjjS+Q1Gm4tHOE5ctujQJU3F4SXQTh1PnvWiJmj6+M7TImK
	7se55l5gcI0E4kNaXg3sqeC7pYWJVeM18IPxy8SyIFXx5ODWko4TwwnIYdk4YhoGGQpLT/XvBN8
	SSCoKrMb2Jnx4ez8m2RkHwF9aU8lW1XC7VPE88nV/o7OatWP5hDFvslLx43usWay8y+ZW0MHxek
	6A+K6OuCY+pS5CEM1vTU3C0C2Dx4sC/7+8HSEqSFYd/3Uxbac7hLpkxxdafe36dorClSmSWeFVe
	qedcj55fI9Kjk8hb2BOlibBHbn5a9Rz26LjMd78nOt52P7mekNCjOz58xluncQL/aAaqT/cnI=
X-Received: by 2002:a05:620a:31a2:b0:8cf:d9a8:561b with SMTP id af79cd13be357-8fd129a9689mr1397164885a.0.1777886424061;
        Mon, 04 May 2026 02:20:24 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d35787esm111550216d6.44.2026.05.04.02.20.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:20:23 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8b81586dff3so16911956d6.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 02:20:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8GJVxvnMmGEu0QjjEZfKX12PKUb5Bdmydntq/UpGi4yniJYVwY2MnWtAxFGzwWTyKExdXjnA7Fat+SVIryACdhEg==@vger.kernel.org
X-Received: by 2002:a05:6122:8889:b0:575:19a7:ae16 with SMTP id
 71dfb90a1353d-57519a7c4edmr1523286e0c.11.1777886051499; Mon, 04 May 2026
 02:14:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev> <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
In-Reply-To: <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 11:13:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRtAOZrQbebng5pLXNENUeZenA1Hng1kER+1vbSwaj0Q@mail.gmail.com>
X-Gm-Features: AVHnY4IwZDZQbmmfAhrkW3faVQFI1p5tavPs1Lp33uXjss7HBIDZ1-3ZwYbIoeM
Message-ID: <CAMuHMdXRtAOZrQbebng5pLXNENUeZenA1Hng1kER+1vbSwaj0Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2C5164BADE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31933-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,google.com,tuxon.dev,bp.renesas.com,pengutronix.de,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxon.dev:email,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email,add1:email]

Hi Prabhakar,

On Wed, 8 Apr 2026 at 20:55, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> <claudiu.beznea@tuxon.dev> wrote:
> > On 3/18/26 14:44, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-host
> > > driver.
> > >
> > > The RZ/V2H(P) SoC features two independent PCIe channels that share
> > > physical lanes. The hardware supports two configuration modes: single
> > > x4 mode where one controller uses all four lanes, or dual x2 mode
> > > where both controllers use two lanes each.
> > >
> > > Introduce configure_lanes() function pointer to configure the PCIe
> > > lanes based on the number of channels enabled. Implement
> > > rzv2h_pcie_configure_lanes() to detect the active PCIe channels at
> > > boot time and program the lane mode via the system controller using
> > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>

> > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > @@ -1687,6 +1712,63 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *=
host,
> > >       return ret;
> > >   }
> > >
> > > +static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host=
)
> > > +{
> > > +     struct device_node *np =3D host->dev->of_node;
> > > +     u32 domain;
> > > +     int ret;
> > > +
> > > +     if (host->data->num_channels =3D=3D 1)
> > > +             return 0;
> > > +
> > > +     ret =3D of_property_read_u32(np, "linux,pci-domain", &domain);
> >
> > This introduces some limits in the systems with RZ/V2H(P) SoCs with reg=
ards to
> > the usage of linux,pci-domain. I would like the PCIe maintainers take o=
n this.
> >
> > As this is necessary to index in the system controller driver specific =
data (as
> > there are different SYSC offsets for different PCIe controllers) I see =
the
> > following alternatives, if any:
> >
> > 1/ add a dedicated DT property for this, e.g. renesas,pcie-controller-i=
d
> > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used to sp=
ecify the
> >     system controller register offset and mask for different functional=
ities.
> >
> >     E.g.:
> >     renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> >     renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> >     renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> >
> >     And use them in each controller DT node. E.g.:
> >
> >     pcie0: pcie@add1 {
> >         // ...
> >
> >         renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> >         renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> >
> >         // ...
> >     };
> >
> >     pcie0: pcie@add1 {
> >         // ...
> >
> >         renesas,sysc-l1-allow =3D <&sysc 0x1050 0x1>;
> >         renesas,sysc-mode =3D <&sysc 0x1054 0x1>;
> >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> >
> >         // ...
> >     };
> >
> I'd like to get a clearer steer from the PCIe and DT maintainers
> before investing further in either direction.
>
> To recap the two approaches on the table:
>
>   Option 1: A single renesas,pcie-controller-id property used to look up
>             SYSC offsets in the driver.
>
>   Option 2: Explicit per-controller DT properties carrying the SYSC
>             phandle, register offset, and mask for each functionality
>             (L1 allow, mode, link-master, etc.).
>
> Both have trade-offs. Option 1 is simpler in the DT but moves hardware
> knowledge into the driver, tightening the coupling. Option 2 is more
> verbose but fully describes the hardware topology in the DT and avoids
> a driver-internal lookup table.

As this is SoC integration description, I think it belongs in DT.
But adding many properties is indeed cumbersome.
Fortunately the two register blocks inside SYSC seem to have the same
layout for both channels, so you can just use a single property to
refer to the base offsets (0x1000 and 0x1030).  Even if a difference
would pop up later, you could check for e.g. =3D=3D 0x1000 in the driver.

> Are there other approaches the maintainers would prefer that we
> haven't considered?

Option 3: Look at the unit address.

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

