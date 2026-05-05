Return-Path: <linux-renesas-soc+bounces-32027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKjEFifB+WngDAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 12:06:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B26AD4CA82C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 12:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0A5F30ABE1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 09:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBDB345CD3;
	Tue,  5 May 2026 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEHsKYha"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C9E3451CD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974885; cv=pass; b=AuTY2SPMoRd7bP0gbWhJgFrDXUSk4bO3sXaAIwKKbS8WK8NDV3tE70gZVtvifOvTfpwqQ070CyT8HGn/YubunTDveRSIjyyZk9hNjEfXHjHJ+l813HVl5W1egGzQDUXPtxFrdjKk66TOq8gVrRqG8ml7ZHeo2SPESovobllp1RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974885; c=relaxed/simple;
	bh=E35b9v/9N86s+jnlEC41wZVsmhcr4qcpURavxyfZD9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=us85BxNf6qD+w0WDSSm2cfPaCiEiUZXIo8N9Z7/kF7CFK7tlipI4ZZuy/A+1iLupRrGxTaG2FGQCNMzjAnMdpMU+xeIdpOkQIpSfjw6I/oQTNPcEIdqd2B9XJvZ7+j7rVTPDU27UvEDu4l9teUTnEsejfzHU7ghhAwtRbZoBQlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEHsKYha; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48896199cbaso44652345e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 02:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777974882; cv=none;
        d=google.com; s=arc-20240605;
        b=DcFOA1mwzfoBAY0uh5BAC6W0gq7NdaWvQnnnx2sEArY78rFCDmd6FhIQQ0i7rfsbRw
         su5SPuBPoVgPJ+OkwCcuTrofoRrzxQUWdarkdLZR7sxuAPCIJtIvX9AUbbXdWrfYUgC/
         j98yrHBeN3chh8CPUo68XQKr9SfgIrfWJIM3FWXrbJB16h3vAT36kOBDFd/nhdE1Tc1l
         na63E0AErKgd5oazX4tww3iPU/Er3DKy8lqfPjQ3McrfsoCQAQFBRPui8/SzTHP2vLbM
         RCmfHaYoldFO7H6P2dhe1pH6Gd9OdGU/ezi7zlvnImxNqzTVQ7FGWzg1pU+vpOCCj1au
         8V7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/OFVXXRgPbKb/k/EVNaXDuuccfuOclNAixih9iVgxqg=;
        fh=Lyome1aVX+QtTRJXYwW82xSz880gz+QJ6WettjlnpSs=;
        b=Mnn9nCS+glGwtur8k/DkkzI+7gVfAE7vzARdQJDnixAFPU9hSUrvvAuS9zvv8iNmG1
         TPeeS1RBVxPKTtNrby2rORqVYSNeCQcWICt0dM9+0byg72+C6jH6iaKuQXgW/yYpwzUm
         yfFFYIEF/9Nz4vMBB9pykU95wAK5HBCtMZkfXt8yuoT4IqL3suoLvdjVjFyPEsnsnwsI
         1YWkh1rWSJg53g5YHZ6O8Nj9x1eATLu3t1zp9rnUXVeW0F+4gJc21VMS2U19TmDPCQPU
         jgIGnnLuYXPzkNNMlutspjS7f4WYDdOBWsyY3blOEbaj73aSJmHudqoAKzDNTCk5Vbm9
         HgYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777974882; x=1778579682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OFVXXRgPbKb/k/EVNaXDuuccfuOclNAixih9iVgxqg=;
        b=ZEHsKYha81Il5yhbFlSBZdApQeIN0/u+vgCZx7aHUilChCBH9AGMZflSPaNQimVOQY
         88cYh887Jm9nWH3PzwP0UMY/M3Zecx9lmweanyrS319w6o8AZ9P7jg8acXRRyLhjClUE
         VAVuKwroK74wgcA61/JWu6dWI3R0oB8oLCzxgB+dQfSDgF4+1xbMN/bENUw8qolOCRrM
         NkmuHLsJYZMi9YtW01gRlrkREYQg+knJq/HDrP8TIcs6NirW5hxhSUMZrhsT44sl8XCa
         4noUOHrRdLp93S5/q4LpNfnphQ/icZGjITewT0u9jN0Va3It9ZLx83zIVVzS/brrQhxJ
         eShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974882; x=1778579682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/OFVXXRgPbKb/k/EVNaXDuuccfuOclNAixih9iVgxqg=;
        b=H45IJgo8mCCMN0YGJikeLhlA+63jHZp298rurcCMvTMaMK6cUC2NtDKFTHX+QXSQ4+
         5vwJKOZ3u76Uetn7hfpCi0JzO8HnkGGltknKOteAS17epgsZ3jXV2x+ErcU4K+kKklJF
         LbWhdwj6tOht/rz1eye1sQiIY6MeXh0U/hQ+xq7sXPdMVlj9b11u62qYgQYXJL607jum
         LKFawaC7rZhFDbVC+lg5IZMvhFBTGJB0aJGyyCK0vIbeOu6+JFe7kNJACFw6+VPi7chL
         2E2T+UAWDVYXYwygke1CxhY1gbZxa9B346omLUCGCvitbHzhSaH3pwPS2KPZY58ZrgM/
         zjZw==
X-Forwarded-Encrypted: i=1; AFNElJ8Rvqy0NQ5MvBC7oMLgZsJoaLfTwIn0D/SOjKJaOdyMF/DitMbl2m5IB4homjxlq5G9oGDrMGTC/8qksEkOp04LkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtSUZOljr8tjV9sNp79PbtD1iRSHL5DEJ8AMzAqq08lC0fDFK7
	eA9hdYiAOb9GgnWCcpIeprradchqUWg0wdy0CafWSWwIlHl2i9hrT7fbTKapvNSQnNzYC9MuvgX
	7Ko4NLwh3+nl5ycAGcrAluSLT/2cUNe0=
X-Gm-Gg: AeBDievyNSLZW27UzeXkpULkIluaP/3FntHBOy5IpX7R4eZYarQkdDyKnZLsDbKORja
	BzzK6h7KjmAQ4uFOlftTL6L8GSggzVpgElurzsBwEh6EqSBPeWmFKNhMkUBqwkZtQUapN8gQFZH
	qQAdEZihl2f+Yuuy8nHHICpI40ekWNaCZyEsIYyJEyu0enJN2x6Q1QWK21FbZuDlU3jZMKsmqdA
	a5OtUwvlQgfb1OW/My9/+RF7RoVuW2rXLpn6rseRy2AFTIqJviXUmi6zeQNf80eArAmY16Ti0rT
	Jfg8u2CPsC6GO6HB+CDSILcZF/4HhmMS7hIdKfy5dogT0BQyBRb9wF7X2XbC5aRs4a3hlGYQtte
	JOJp3EMoMIiuW/A==
X-Received: by 2002:a05:600c:8b58:b0:488:9bf8:7f17 with SMTP id
 5b1f17b1804b1-48d18be5b32mr36270575e9.14.1777974881868; Tue, 05 May 2026
 02:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev> <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
 <CAMuHMdXRtAOZrQbebng5pLXNENUeZenA1Hng1kER+1vbSwaj0Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXRtAOZrQbebng5pLXNENUeZenA1Hng1kER+1vbSwaj0Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 5 May 2026 10:54:15 +0100
X-Gm-Features: AVHnY4LoB9VhkRhCHgWKDjlqC7kBQg0p7x7zE8Yn05GYW88TH9I1loXaSoAIan0
Message-ID: <CA+V-a8t2HhtMWT6v489PZbi+-Yzc0ybgYXFuPd2QeEndn-x+TQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-Rspamd-Queue-Id: B26AD4CA82C
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
	TAGGED_FROM(0.00)[bounces-32027-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,add1:email,tuxon.dev:email,linux-m68k.org:email,renesas.com:email]

Hi Geert,

On Mon, May 4, 2026 at 10:14=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 8 Apr 2026 at 20:55, Lad, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> > <claudiu.beznea@tuxon.dev> wrote:
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
>
> > > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > > @@ -1687,6 +1712,63 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host=
 *host,
> > > >       return ret;
> > > >   }
> > > >
> > > > +static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *ho=
st)
> > > > +{
> > > > +     struct device_node *np =3D host->dev->of_node;
> > > > +     u32 domain;
> > > > +     int ret;
> > > > +
> > > > +     if (host->data->num_channels =3D=3D 1)
> > > > +             return 0;
> > > > +
> > > > +     ret =3D of_property_read_u32(np, "linux,pci-domain", &domain)=
;
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
> >   Option 2: Explicit per-controller DT properties carrying the SYSC
> >             phandle, register offset, and mask for each functionality
> >             (L1 allow, mode, link-master, etc.).
> >
> > Both have trade-offs. Option 1 is simpler in the DT but moves hardware
> > knowledge into the driver, tightening the coupling. Option 2 is more
> > verbose but fully describes the hardware topology in the DT and avoids
> > a driver-internal lookup table.
>
> As this is SoC integration description, I think it belongs in DT.
> But adding many properties is indeed cumbersome.
> Fortunately the two register blocks inside SYSC seem to have the same
> layout for both channels, so you can just use a single property to
> refer to the base offsets (0x1000 and 0x1030).  Even if a difference
> would pop up later, you could check for e.g. =3D=3D 0x1000 in the driver.
>
Okay, something like below?

&pcie0 {
  renesas,sysc =3D <&sysc 0x1000>;
};

&pcie1 {
  renesas,sysc =3D <&sysc 0x1030>;
};

> > Are there other approaches the maintainers would prefer that we
> > haven't considered?
>
> Option 3: Look at the unit address.
>
Indeed but this might be discouraged by DT maintainers ;)

Cheers,
Prabhakar

