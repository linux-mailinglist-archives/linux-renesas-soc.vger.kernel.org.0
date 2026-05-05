Return-Path: <linux-renesas-soc+bounces-32026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JGRLla9+WnxCwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 11:50:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3570F4CA214
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 11:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA59B301DC14
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 09:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B6530215A;
	Tue,  5 May 2026 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBjs0fqi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8122EC54C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974607; cv=pass; b=WvaVZ5rG/STxwOBGk0chVOmJYsDtVD/aAJWkrVGAj3lehR+rIRXw1QtsTYyMOEuKG/HKxB2kX6RqF/kwyWQeqMSkDAhg2QlhGgx1ydpyeKoboa2Tun521pfhn0Afu/kwV5E1UeXSgF332PKIagAjZ2LdmsKuG/o5eU+Cqp+gt/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974607; c=relaxed/simple;
	bh=qQ0fdreUZzC/7HdkK25NxWYh+tIDDlH4eCp9sTOS4JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjrcKF1Bh25SbHcY0CSUpWkYal6nhKUOPEOLe5bmXTcW8nSqKCa0RkGRz8DnJ1ChjRrYHPObTb5N47HoNcBI5E6HlSAjLHuy1f+XbouJRmecuGRWNOUWPHVWKjHaJxfsT0wcd42rPcqI0fp7hCTeyv31dEZqiyQFZA1htTCT1dQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBjs0fqi; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-449de065cb3so2654326f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 02:50:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777974603; cv=none;
        d=google.com; s=arc-20240605;
        b=erlHyPIKztmU6G1bQyrqWpTYNdwdJop7TG+ydCMsd33jYiw3GkIn2Ht14PfZxi2hTR
         fQG6jcBgFwrgxqZ8W2xroHXMWuwGUC+qhSLqsI55ydin9Ravzrs2A/SNM3+MuPpbP8XB
         UXIOE4H0hEuHT2/iCRiQtxwkSjnB4valKKdplIhoVNqNqzOdfFFQuqE7rHV0hIz1l/GO
         H29bn9JDOnJnEi5WKmcySGy0nyputeLy5dVVv+EVpYhSW8Fkg4XdCL7dFmmlnJmM+oCA
         vB+ni0ctIHDRkzObWH/BIql+bHZ+9W1D6jezOy/qUqsaEcCLUCF+MvphADdMdLamOYlw
         BjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yM4KcG56R9vbDU06owym0pp3y5nB/08M1mIBueRT0Dk=;
        fh=FMqB+fB5/VipB2Gm8DkgCoipY331oBVTLba+b9n84wM=;
        b=XlH4el9HA1J9xGN+lc27CJ+PNl4oqZv4SwaRbltE4QSLZy2Ied+ppPqK0c34L7q7T7
         diooXBmBFScHbahC/9FbWAOvMrXL5KttrwZRYhtvO2g0cS27HYM23AOrbnvCV2hrx7oZ
         gNZA51ZBOO0CIuttWrtGOolHud+b1e7+Jwm0GbAe8bFQhydn9ZdZvlK1dc3+P9uSsHgf
         p1crOyDpW85Iih5FXdlm6SWv0v+r5SRNGn2wE/2UA0rSPjSvxXrDN/wKhxF7ScoBXNWU
         0gHbFyTX8OV7DRR6gQlihtf/mTlNW35G4ci3H7kpovQqxD5vZnxERuuOWTztacI/SRS5
         eD4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777974603; x=1778579403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yM4KcG56R9vbDU06owym0pp3y5nB/08M1mIBueRT0Dk=;
        b=UBjs0fqiICJTxUYdi61u826nIJwUieJ7vazwRcShSJMxW9foPK1eNRe0q8ckskaGxu
         rV6PR6bnTRgN0y0AT96FnCb5DAwCYEsiOPZqM+PPOuFo1eRV1J/Z4m5au9oxpj9whOEp
         wtyG8RaOkF6elETkRWWJoha+JfDj4I9bgsMR5ibuDP6A2cmSgjEYn3p/hhpuQcHEpgR2
         uActrKlpdRDKdqOGqPQuL4y8Dqo8Dqa1sGyhKaIXCq6pdRO5yQUyk9Ljm7t+CXXBda9o
         mfD7A9o4lADip55AeiJiXE4oZfmwKvPDQPqDMfn6gFboCGSR6WbwRk/I6u/V90MMTB6c
         mUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974603; x=1778579403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yM4KcG56R9vbDU06owym0pp3y5nB/08M1mIBueRT0Dk=;
        b=hS3Zu8bXRFCvs0qIbiCeig+7cAiJB7kwDcx1sHfCmYcfCFthrhB7krJuos/H/8wtH2
         mkm0zGxdTrcgzMIQCgb5rFmzBRWpETiOBzvIuCU5zlYWiiGvWqq+rNpIFgr6AiQPl4Aw
         Z4npqXm9meMaPXlwaJ7AsMgJoVmAmMn3V9GrPcOHHGU45w3Jn8eSQDLaWB0eYmGkXL5p
         jXzi9u71MD+WoC9EspR3x/zxVZJ1Oh9QDsCrZUfywZY+G/laGwcLVyjcYDYg5Mplv+RZ
         vdkjhpMZdqZl5FdSLt1wlyYi052sMgw8n1YFygVVWAf9dor7xVmMc9dQWVtgEA5Vre63
         oprA==
X-Forwarded-Encrypted: i=1; AFNElJ+6Tl5lZehO4VVTLrUix74HeWlrv2mlxYoUgqiS8ctw0ihSisLo8jU+u37KIQ3E/GT/03epzVs9AiLCKTRvvKIrTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOfI78B0yJ6ixNzofUKam8UyMI30oqHg3z5dsHrJ3Ft/XaMAvl
	mfdcnEgCjdc01tDt1b5MOrtZz8ISgds3pLx7OnInVdlY3IvbBuOX3Tr1DdUfwy9Z+Z1c0zH7dO+
	LAwDyLEXKqojwR9tcDw+bcy1X2EbTbZM=
X-Gm-Gg: AeBDieshdRKH5IhsUkPfR9g+YYKDe2X+eBYa9mFoFq09MgA0ItrO2X224LNIb6MP7Z+
	0ybcsvzB6TkOn0KXhJgb9T3/fM7szWDD5/Jim/zR9qEYCsbKSbuiSkBzeKOATBMTQCBsyuCGiV8
	3b/j2aVa63n7szjSQRMDobK5E0kYas2tkJcXw6iGJnDOeBzSQ2/HiBZ3JBv+GG5pYykK1P3ugx4
	+Pv+XF82AcYOak9bbm2rfNH6hSmhDDE2Q4shj1MDSgegCjPPvmFGW9LWBM7t5add8hmA9/TJWt4
	yWXTF5EQxbo2fS9Q7rsFPHSvhAqjbrML4jQikNXtb0hacAY0BCxtr31eMFVrz21SM7bGI3M92u+
	S80w=
X-Received: by 2002:a05:6000:18a5:b0:43d:7c1b:b8c7 with SMTP id
 ffacd0b85a97d-44bb65e0664mr22072385f8f.21.1777974602954; Tue, 05 May 2026
 02:50:02 -0700 (PDT)
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
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 5 May 2026 10:49:35 +0100
X-Gm-Features: AVHnY4IoCllXpa4rpkEn8ddmDkn7rn864MKfmonI0Q9JZNQwspbW0qaX6F7JYzw
Message-ID: <CA+V-a8ve9+Dz1kxZDXUROAuiKMYp=+q0BqMfGo12dsy=SXjyfw@mail.gmail.com>
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
X-Rspamd-Queue-Id: 3570F4CA214
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
	TAGGED_FROM(0.00)[bounces-32026-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:email,add1:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Mani,

On Fri, May 1, 2026 at 3:42=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Fri, May 01, 2026 at 12:13:55PM +0100, Lad, Prabhakar wrote:
> > Hi Manivannan,
> >
> > On Thu, Apr 30, 2026 at 4:26=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrote:
> > > > Hi All,
> > > >
> > > > On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> > > > <claudiu.beznea@tuxon.dev> wrote:
> > > > >
> > > > > Hi, Prabhakar,
> > > > >
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
> > > >
> > >
> > > Can you explain what is the limitation with 'linux,pci-domain' proper=
ty?
> > >
> > As sashiko pointed out.dev, The linux,pci-domain property is generally
> > an OS-specific logical property intended to assign a stable PCI domain
> > number across reboots. Restricting it to [0, 1] would prevent system
> > integrators from using non-conflicting domain numbers like 2 or 3 if
> > the board incorporates other PCIe controllers.
> >
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
>
> > > >   Option 2: Explicit per-controller DT properties carrying the SYSC
> > > >             phandle, register offset, and mask for each functionali=
ty
> > > >             (L1 allow, mode, link-master, etc.).
> > > >
> > >
> > > Are the register offsets going to stay the same across controller ins=
tances?
> > >
> > > If they are not going to change and you can derive the offsets using =
the
> > > controller index, then there is no need to go for individual DT prope=
rties.
> > >
> > The offsets will remain the same across the controller instances. So
> > instead of using linux,pci-domain property we could use below is that
> > OK?
> >
> > pcie0 {
> >   renesas,sysc =3D <&sysc 0>;
> > };
> >
> > pcie1 {
> >   renesas,sysc =3D <&sysc 1>;
> > };
> >
> > Where 0/1 are the controller instance IDs that the driver will use to
> > derive the correct offsets.
> >
>
> What if you have other register blocks using the same pattern in the futu=
re?
> You'll end up with renesas,xxx =3D <xxx, N>. You should stick to
> "linux,pci-domain".
>
As Geert pointed out this overlaps with pciX DT aliases on PPC boards.

Cheers,
Prabhakar

