Return-Path: <linux-renesas-soc+bounces-31868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI4QKhyL9GnkCAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 13:14:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C74ABED0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 13:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8F7B301BA47
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 May 2026 11:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A6939BFFB;
	Fri,  1 May 2026 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axIijkgI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B8C39B496
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 May 2026 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777634066; cv=pass; b=b+uzLI6q3+OWdqEvkiYZf02CN5vvszMltsth6yOSCOATEGVNxXR6ge0i1CjvhscXnb58X8GO3YyKKxwrVT97ZEK+H1F5e6fDuVdHZFloulecn0RHRjvvj7JwMscZPSXXNtHUBxtKEGpEwnjD66JwVvErd1Z4P0B/oqxUvF50y4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777634066; c=relaxed/simple;
	bh=amzQLH9a7l5X3HtjNoS0vYiDRBkqF7DhfSZuVRXwufw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwRpq+0bKuT0Oib5YuD8+EL7YoSiPHdWpvzhTc06G21uvh133R6UPpMLnpL/8yiK5lmuaagcxBmdaF3j0YhXKF9NhUpXRgRhfsBwDtkHFOPXbT7Q7/uRSshgLpQ2v6x3/j5puVhiBeBWJtGwk1pMdqrCx/0vbJqtb0E0ApBzFlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axIijkgI; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so29628855e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 May 2026 04:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777634063; cv=none;
        d=google.com; s=arc-20240605;
        b=lc5c0QfMYzaN8P4nQMRlT7HB0wwyM0KND89VFuiOiaybAQ0pSP5VZVz3BJEDOb5+WQ
         WFmvUcTvlCvyzVt7Ua/CoQoWr01YnPq3Sy0Ymu5cpETAo2PJUCkB/Zl3m7sYN9Pzenhk
         bOciXlMiXb/mD+ZHhL7R+yqgM4W/pY+rPFN8S8lCqVqYAtXVRC186l8t3+UQkG2SEepL
         QM3Q7SZor0Rdsj5dBV7JT9D3zGBvfqawG45h5Ovgx2bSeuzN8aQyIJkc7eH3l3nVIY+L
         z/tQIhGDJrpg+2liioVrdHUG80zrten+aQRZNeNYUbKrUTpET0uN8qJxcOnVA4peYJ6c
         Dr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Koqn950l1gySxE0fMmqFZj9e/r7BOpcLy/k7MMhQ7Aw=;
        fh=UvggEfzb7vIBxraBCtIPJzbrfYr4uCPO2UeE1+y6GFQ=;
        b=KwyAXWUnZbv+VsnqIthVm1MLo4L82N8Mxml5uGfOaWW+TR2jmz/iBFa4WG0a/9k+kh
         urvlI5s3wBZs/+uPwmkSx6dPqdMZu6od6erWzC5MsdzWcJXoUizCvmDZB5Wu1iI/X11x
         2QSnrd8l+r+3HkFdi43lBsHHqW3DIpStMeObWSZo94RvqS9mU1TrkmaDCoAyIcLLgLfq
         wF5t2oGBs9EfG5advALvZBN7xTFyLww8ZJnFAC9Q95lszCT5FuT3OwOAHNDX4HxD001A
         I+c1FqY0iqy6hKSAF+IuPbnpxiOtzQyHFOFq8UfQm0fjQAtItJ5YUAloqn8tJct9tFIt
         dKmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777634063; x=1778238863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Koqn950l1gySxE0fMmqFZj9e/r7BOpcLy/k7MMhQ7Aw=;
        b=axIijkgI8qYh6KES+esGquTjrZh4KWxebgLpqXZcMkHYIceooGul6jafXCvWQmu9O4
         URMQQseZdbrTiXdKMFRSpMgDOUPLMtGUMSd/Ad00OSKJitCa4aMdhhmycvTwrr0iOUPf
         ne4sPP0GlQ+zr6cUU9DurnRPkqLkZDKlOnRvULy+amncVc5b+V7hrgLB83Eovy8upntI
         Ufy6TF/3bDGFoyDuDI6ZyilMK3KBIgX+ivXWLw8nSq1E5M8H7yqNTp5QZmeFUBF2UlQR
         eZn6st/5+jJLT+0UFwqREMTS1BbtgzLmTJBIppxovqE/NgI5ZR/9RJLaEiHncxM4xl8N
         Esxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634063; x=1778238863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Koqn950l1gySxE0fMmqFZj9e/r7BOpcLy/k7MMhQ7Aw=;
        b=G82kWj5rJYK9XC8oPv68tclfgzp4h+gjP9HgUY//ZMrEWzAte6Pk5XDo2ZAl7H8JFI
         +XRjZOCKiFvCFtsOkcTUXWDLh2OhV87uvT1CZ9WL9DY/J87TMwtxedaOizV+nNbO2C94
         38iGqY+CEIbrpV/9sGjgYHGets5IpBAV9Sy9Y7P4h6biFlYNF6p0qhjFeQKk23I5JVtG
         EkQ0eqMBUpvHtGVNBgQxW66zg+UufjhtHtmHhpbNraua0ME+7X7SYGFFveaU3fz3v0FR
         wFrm04iPHOt8w2OnanHoQj0bJuxMyUrzqLPUSXpiq+jmQPhV4Rd1eUoybAlvnv3NZxu8
         QZ9A==
X-Forwarded-Encrypted: i=1; AFNElJ8AMkdhTSirv2J72BSU2rcZ8lDbBcvLpfqOQb+PQUcQswfeBD4owMTY0hWP4varKyw0CCqCmahG4RWlWE5/AVt8aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1gyoIDtCj22ZfS4Wa1gLGiYmW3Ti2188WnoCCXlzZm/LcLLe8
	5Z0LmyU/+WsChXp1kub21ztH4vMecjewZqNcLVi/MlEfjv0OTto2V8ws1WJQc87047hs99v7Pdr
	goePxS1ZcVDMQkY/85EQZHXsDLwqpTlc=
X-Gm-Gg: AeBDievKwxYZoSFX0txtiypK2T9H9ml13blbpiLZ00GZZpvHGZ4Pc0GJessQwKIGbsq
	TSL6xUWLJOd5HPk0c5zBEKdJ9PsdbwHCjOtGQn9a/8jFxT+ZNSMrfQDsonkSS5VOQS+4TkwzNbK
	zps2NBdcl7ff2X4tRdtp6f7u38mFe13PM/dk/ek0xm1exXL/JzYraYqVmCV4/NOAfwKtmdZ33Ps
	JORoH9NbVWMB/6kMip8br+ylKv1N7gOaznxy19DSLF1jMk8mE+6W+9DJ5Y5TWpG44I6olsKVLTY
	Sxp/i1UN1YbGgt/jRQGclC4SKWixSGq0vLxTICaNfMWulzidCC3W2u1UeEEf1QmaKRhu0SMDkX3
	ARV6n
X-Received: by 2002:a05:6000:1445:b0:43d:309b:9c4f with SMTP id
 ffacd0b85a97d-4493cb42dfbmr12335940f8f.6.1777634062788; Fri, 01 May 2026
 04:14:22 -0700 (PDT)
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
In-Reply-To: <lvix7p4e7c4dtchtdti3rwrs7jkda5iy7lthcffhqc7g6vgu2p@54qywklrspi7>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 May 2026 12:13:55 +0100
X-Gm-Features: AVHnY4JvYGy7lDhdnr1gOrUfRCtB0xtova51_6-0ql6JWYIskMQxloPDeXCK7c4
Message-ID: <CA+V-a8sd=dyTZmViLbDrCPYbx5ujWzjk74HxhP0aBEqxLuEqJA@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
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
X-Rspamd-Queue-Id: 7E2C74ABED0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31868-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,google.com,tuxon.dev,bp.renesas.com,pengutronix.de,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,add1:email]

Hi Manivannan,

On Thu, Apr 30, 2026 at 4:26=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrote:
> > Hi All,
> >
> > On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> > <claudiu.beznea@tuxon.dev> wrote:
> > >
> > > Hi, Prabhakar,
> > >
> > > On 3/18/26 14:44, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-host
> > > > driver.
> > > >
> > > > The RZ/V2H(P) SoC features two independent PCIe channels that share
> > > > physical lanes. The hardware supports two configuration modes: sing=
le
> > > > x4 mode where one controller uses all four lanes, or dual x2 mode
> > > > where both controllers use two lanes each.
> > > >
> > > > Introduce configure_lanes() function pointer to configure the PCIe
> > > > lanes based on the number of channels enabled. Implement
> > > > rzv2h_pcie_configure_lanes() to detect the active PCIe channels at
> > > > boot time and program the lane mode via the system controller using
> > > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > >   drivers/pci/controller/pcie-rzg3s-host.c | 142 ++++++++++++++++++=
+++++
> > > >   1 file changed, 142 insertions(+)
> > > >
<snip>
> > >
> > > This introduces some limits in the systems with RZ/V2H(P) SoCs with r=
egards to
> > > the usage of linux,pci-domain. I would like the PCIe maintainers take=
 on this.
> > >
> > > As this is necessary to index in the system controller driver specifi=
c data (as
> > > there are different SYSC offsets for different PCIe controllers) I se=
e the
> > > following alternatives, if any:
> > >
> > > 1/ add a dedicated DT property for this, e.g. renesas,pcie-controller=
-id
> > > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used to =
specify the
> > >     system controller register offset and mask for different function=
alities.
> > >
> > >     E.g.:
> > >     renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > >     renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > >     renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > >
> > >     And use them in each controller DT node. E.g.:
> > >
> > >     pcie0: pcie@add1 {
> > >         // ...
> > >
> > >         renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > >         renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > >
> > >         // ...
> > >     };
> > >
> > >     pcie0: pcie@add1 {
> > >         // ...
> > >
> > >         renesas,sysc-l1-allow =3D <&sysc 0x1050 0x1>;
> > >         renesas,sysc-mode =3D <&sysc 0x1054 0x1>;
> > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > >
> > >         // ...
> > >     };
> > >
> > I'd like to get a clearer steer from the PCIe and DT maintainers
> > before investing further in either direction.
> >
> > To recap the two approaches on the table:
> >
> >   Option 1: A single renesas,pcie-controller-id property used to look u=
p
> >             SYSC offsets in the driver.
> >
>
> Can you explain what is the limitation with 'linux,pci-domain' property?
>
As sashiko pointed out.dev, The linux,pci-domain property is generally
an OS-specific logical property intended to assign a stable PCI domain
number across reboots. Restricting it to [0, 1] would prevent system
integrators from using non-conflicting domain numbers like 2 or 3 if
the board incorporates other PCIe controllers.

> >   Option 2: Explicit per-controller DT properties carrying the SYSC
> >             phandle, register offset, and mask for each functionality
> >             (L1 allow, mode, link-master, etc.).
> >
>
> Are the register offsets going to stay the same across controller instanc=
es?
>
> If they are not going to change and you can derive the offsets using the
> controller index, then there is no need to go for individual DT propertie=
s.
>
The offsets will remain the same across the controller instances. So
instead of using linux,pci-domain property we could use below is that
OK?

pcie0 {
  renesas,sysc =3D <&sysc 0>;
};

pcie1 {
  renesas,sysc =3D <&sysc 1>;
};

Where 0/1 are the controller instance IDs that the driver will use to
derive the correct offsets.

Cheers,
Prabhakar

