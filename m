Return-Path: <linux-renesas-soc+bounces-34318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NInIOd1MOWr5qAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:55:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8A26B0851
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:55:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OnnMZjUG;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 641683016B53
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 14:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B318B23D281;
	Mon, 22 Jun 2026 14:54:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4612F2C08BC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 14:54:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140067; cv=pass; b=QXA+cRmkZoKwhneNFDLn60bY/hEqWqgXDvr/Dv+RtlqQH4qBfQXreFM79AY6b/MQXk4JjixxvuzfrU7YHgnif1PvgGC2CLK5McSRwV3NkP34r246SNIKl0Muh5/xvOYa6sLjCjkpC3KvBg2+bzgKUVmfPV71/DMiZhmoGdwG5DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140067; c=relaxed/simple;
	bh=U1089BIw7iIyDBnxBwST4w5ZSkTY2BwrC/I7xAP7GTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aP1f/bVq+Xe0VBvPPKt/RtD62bOpqpJlR8P/c4RYGb201Qdq+GPFtaiWkPD4RkT/5GGzwvLzGlC1LAktoTQOufHBTHLpgLlXx2OqjzEnjAvDJpegIrbcQbcFpokeHObkCiAEpahGMTiWySo9l/Df4KUYw/1opd3BfhmLWP/KkiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnnMZjUG; arc=pass smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso67694645e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 07:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782140065; cv=none;
        d=google.com; s=arc-20240605;
        b=QVttl/GqCsAxJ+Z9SFQbhzXy9wc19zevaCPtHPyvVMuf4wbjTE77aQgPMHDREF/lF7
         ahEeDkX17pXC5qJ9cAdXlJtHBTGgNNh2CiqUektDlxoR65tAgBWVFRxBPLGi+Pmn5ya9
         FSMRGL1b4flCH/0QgEHVNwhOgkIPshLVoyawZ8jAFYdjJ/zt3QxcknZ2D9SxpJetL5yq
         EjatcTaO6aw9mzD/n39xfdycPCNRsRJzAkEOJDN8R1k7kmw2GoqCpPF2W/CNXyx8RVTj
         beU66hOmMcI3scycSFLUp2pX9/iXWOT45DGANR4tXF6uTWjodfc6jEDSUlJWhMIStZVj
         +jrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EverwGFGy7q/WGbEqhoYn+l8o6lObHXXPInFSiUXHk4=;
        fh=TJha/kXOlmxskGjnD6FKBjvunj0rzoQ0ToqZJXu2sV0=;
        b=Foi1/pLqUB4jCoJwOQkotTg0ncuePhb9t1/EPkZA8Kr+yil0Fl2FxHVhW5c37kKaEa
         7PeTUPwLxBcv3vFNgHibnp+Xyig27eilrZ3ATIz5zsSXDjdnT1CAH9Ej6PPzG6kRrbSu
         5pR6m3N/1adOaz502tZN3eMAGnMr+X+CiDpb2g3g1xhoax8GAG6iNkt6N2N1Je/KPhvY
         hIEjxa9oRAlOoA/GM3LOEjmgPiLYAjP0O8Z070Irc5oENoCRIpBaowA5a/RD5PE8WJEx
         hbXpVGyfx6jkFl5DhxdfHSEE2M0dZKA/gHBIowhZJ+4ubOxctZ2zK7kpf5dFmmX5X4EV
         ZKfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782140065; x=1782744865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EverwGFGy7q/WGbEqhoYn+l8o6lObHXXPInFSiUXHk4=;
        b=OnnMZjUGLY8Vd9Jq11a3ICcakyWkDJbmxP5GXQv8OrX0LMYVTGoi1cYdFdj9gMCXav
         aHeyFiqFvIOLHtNJ8bnKLwI/iF9IlinIRw5PcZ+eJm7eTjPYajVYjpeDx2KOgK4TRnjD
         kq8FmWyAfTTYQyK4GkXR/SfqDzWq4lzu8y+1GcYMOorwvPnVsNfJIfIVWVoEEjsB9fJe
         bfxFI0SNFSNlwpwgmy4I+q1Rso+eDayHBmmE29Ds5BnVfgRjEmYP+bIdj8vbab9nr+Pp
         trmJByfEbRTo40U9t7Yr4sWWA1rmKhqr5VIx4gqRjAhDJCZor80608z1iFzwJZO8ybIh
         3PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140065; x=1782744865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EverwGFGy7q/WGbEqhoYn+l8o6lObHXXPInFSiUXHk4=;
        b=mjkvmGMMhGVaPfBjeXKkuAvlzhlMFojmb9usRT/DG9gW0NOvIzAHyXO61bkvpmPEP1
         2w4192fyTc8QsLIoiJosNiMMMsxrKIsbxoxFuFLxDyXN0h8h0cFdC5VYJ3xnUEylf7d4
         UWfcM76N57cCnU3aOb3MFpYSmMkA2UtikGLS+3InkA6C0z/Z1tU+7NYOlqb7ce1LIVza
         dMVqHHhGBTSV+b2oLY16WpD1/eahxhiT8IgtHiT9mchhYzDArmz9voWESbat0uI3w1tB
         +hIXCIU7MPli+c0woNGz6i7pmj6G9wcO/ES1Vd7qukzi0DgXWPrOVOQoqush7HLPF/NF
         3QSw==
X-Forwarded-Encrypted: i=1; AFNElJ9fIIOrfXq6vYWW2mlQNgnlDIdUh1wGXJqKuu0vr7SjYnFYyaoBT0pVuRWGVVdJq/8BSuWZTPxMlh/fQ8ixauh9Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSmVUe9AjCJTcKTgGG3k9sbH82uBXdCYMZ4aYQ04fdC00bB3Ds
	atPIoGXddANLMM1eFgf8w4jIF+FUnnmAUHA9oz6/Y4HvhcW+VNiFKmGMnxuvYAulU99J/aVrIHi
	a8Xn+KuzqA/MdNAc3DqAY5gEtoi4Z+t0=
X-Gm-Gg: AfdE7clFlvtATL2tYH/XWSu4g/cAgqvQVweaKXG9RGipI6fGBQSXKX7kDw7ioZylVFL
	PKREBIAgZI6gsbkJhnu57QovyYHyPomsQY0bKS1JtRRab+ta4BJDpr0UqLwUpP/r3eFRuqAypkx
	oqXtKOlKYe9GLD5G0QhUIN6oL8kyYvNZ4H5QZVGN8j+VzqAV+KlqZMSdKLv98punZ7+1oMPNbm+
	rjvICBLRYNNbSUiMK1hirA1sfMuCLJu9RQ3x6Sijmh/FCARI8gtr0WP7kce/4h/uZhp4d40TAAl
	r/3eoe7bUq3W+WqwH1W5iusIJliUNrA8D5gWmc68MtDsOTcDTjqer+uG9g==
X-Received: by 2002:a05:600c:5489:b0:492:4668:27b5 with SMTP id
 5b1f17b1804b1-4924668299emr206639315e9.6.1782140064335; Mon, 22 Jun 2026
 07:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <50a908557bb3ce5f14b67396d1e73e70289a583a.camel@pengutronix.de>
 <CA+V-a8uGho2RMhreDgieOOZTggUALoF0bGyjdEEDvyL_75sAyw@mail.gmail.com> <fuefvecgjdqbnbvpvam4gmewmpmhofllyq2ootwi6cjqhnyoys@edjzqlh6fjw4>
In-Reply-To: <fuefvecgjdqbnbvpvam4gmewmpmhofllyq2ootwi6cjqhnyoys@edjzqlh6fjw4>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 22 Jun 2026 15:53:57 +0100
X-Gm-Features: AVVi8CfxL1LYbXI4i0sLlo6UNgqoA-R9n854OJS7t3HTOGk64xjVruCWhx7GIqc
Message-ID: <CA+V-a8sRxoR96TRM2V3cFXS5NPiQUVrUJCWwkh7o10cGYPU9_w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] PCI: rzg3s-host: Use shared reset controls for
 power domain resets
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:p.zabel@pengutronix.de,m:claudiu.beznea.uj@bp.renesas.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34318-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[pengutronix.de,bp.renesas.com,kernel.org,google.com,glider.be,gmail.com,vger.kernel.org,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,pengutronix.de:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C8A26B0851

Hi Manivannan,

On Mon, Jun 22, 2026 at 3:30=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Fri, Jun 05, 2026 at 12:54:46PM +0100, Lad, Prabhakar wrote:
> > Hi Philipp,
> >
> > Thank you for the review.
> >
> > On Wed, Jun 3, 2026 at 9:16=E2=80=AFAM Philipp Zabel <p.zabel@pengutron=
ix.de> wrote:
> > >
> > > On Di, 2026-06-02 at 20:50 +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Switch to shared reset controls for PCIe power resets to prepare fo=
r
> > > > RZ/V2H(P) support. On this platform, multiple PCIe controllers shar=
e
> > > > the same reset line, requiring shared ownership of the reset contro=
l.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > ---
> > > > v3->v4:
> > > > - Added RB/TB tags.
> > > >
> > > > v2->v3:
> > > > - No change.
> > > >
> > > > v1->v2:
> > > > - Updated commit message.
> > > > ---
> > > >  drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci=
/controller/pcie-rzg3s-host.c
> > > > index d86e7516dcc2..a5192e4b58df 100644
> > > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > > @@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_get(=
struct rzg3s_pcie_host *host)
> > > >       for (i =3D 0; i < data->num_cfg_resets; i++)
> > > >               host->cfg_resets[i].id =3D data->cfg_resets[i];
> > > >
> > > > -     ret =3D devm_reset_control_bulk_get_exclusive(host->dev,
> > > > -                                                 data->num_power_r=
esets,
> > > > -                                                 host->power_reset=
s);
> > > > +     ret =3D devm_reset_control_bulk_get_shared(host->dev,
> > > > +                                              data->num_power_rese=
ts,
> > > > +                                              host->power_resets);
> > > >       if (ret)
> > > >               return ret;
> > > >
> > >
> > > I have a few questions about this.
> > >
> > > Can you move rzg3s_pcie_resets_prepare_and_get() and
> > > rzg3s_pcie_power_resets_deassert() up before setting
> > > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B in
> > > rzg3s_pcie_probe() without ill effect?
> > >
> > > Can you move rzg3s_pcie_power_resets_deassert() up before setting
> > > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B
> > > rzg3s_pcie_resume_noirq()?
> > >
> > > Those would have the same effect as the reset already being deasserte=
d
> > > by the other controller.
> > >
> > Yes to both. I have reordered the sequences as suggested, and it works
> > perfectly without any ill effects.
> >
>
> Are you going to respin the patches incorporating the review comments?
>
If I have not mistaken, no code changes were requested; it was just
that Philipp wanted to ensure the shared reset worked correctly after
shuffling the code around.

I can respin the series if it fails to apply on top of pci/next.

Cheers,
Prabhakar

