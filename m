Return-Path: <linux-renesas-soc+bounces-34358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vC3VFQoiOmpE2AcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 08:04:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C826B4579
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 08:04:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aUnsruAv;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52F893011065
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 06:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F0D3AB26D;
	Tue, 23 Jun 2026 06:04:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F93F306746;
	Tue, 23 Jun 2026 06:04:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194695; cv=none; b=FBb0yvkEJQJvIDIYfY5h7Yi77IDs8C79cRskG9rHGGiRqn3rxfFqssDuh1pFN/YsLRC6GKvloUPj6ttpvrlrXhmuDlZ2m1ARv4m/XNlpTKhL/GMqB/JiwwLj/BZQ7uX3uzg1sPtTyhcn5czKpgJAy+1lNoAiGh/IJ0VncmuuXa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194695; c=relaxed/simple;
	bh=fGs6zTIutUW0qECkrDbevTMOjjIx02kPZ3JtVZXIzBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6bGRkgzsj2yWSKDZh9regE0oZj/KqVbFJy+chfz+8TLn7M4WNqbfdD5xV+3YJNcM7evxf8FFqIuiA5E5nPTEYUzGvKMbLshHbkgkbuv8vNx3DE4KPp4jngrW8m0dL6Qg4ONueg6cimBze9VA0zywXHWNFNYQIlGzEOvSdud8KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUnsruAv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC5C1F000E9;
	Tue, 23 Jun 2026 06:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782194694;
	bh=7P6aWzyQ8qict/dJu3CzxuJcqtMPA0MghThn8dibXEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aUnsruAvyoLMArbh/g4mBxzC0FmEOROTkWum6xPDMW4bEqPiEargO13uDS9XyBMiE
	 QyOFqwK0Xk5aqDvdXzYSFMY4NxMoWqqO+a9CIqwxyeRE0bwcT1zrY1r8UQHtYdg+nW
	 NrbCMsDLtk1HqmXx8UDAlk7d+dA+hIu2cbNt2X7Rq63oRpO8oieDvg/qU9zlnGc/i3
	 3wWug6E8m/aHNeef9+H+dWrv7bM1bMCYjF/U1DXFboEAVshR/nD+Mln+dt9/BC8ia3
	 snAMZAOFStso0+W8K2y+F0LxdWZZROH7cjHw9hM2WaO9vHhXfZQy5FIkuOnXXTGYXE
	 kqwWrIxMgVfXQ==
Date: Tue, 23 Jun 2026 08:04:42 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 2/4] PCI: rzg3s-host: Use shared reset controls for
 power domain resets
Message-ID: <txpkke2xogecipyetascqajgaxamd3ualcuhsibxf75llzcym5@xgcn7efcbmp4>
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <50a908557bb3ce5f14b67396d1e73e70289a583a.camel@pengutronix.de>
 <CA+V-a8uGho2RMhreDgieOOZTggUALoF0bGyjdEEDvyL_75sAyw@mail.gmail.com>
 <fuefvecgjdqbnbvpvam4gmewmpmhofllyq2ootwi6cjqhnyoys@edjzqlh6fjw4>
 <CA+V-a8sRxoR96TRM2V3cFXS5NPiQUVrUJCWwkh7o10cGYPU9_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8sRxoR96TRM2V3cFXS5NPiQUVrUJCWwkh7o10cGYPU9_w@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:p.zabel@pengutronix.de,m:claudiu.beznea.uj@bp.renesas.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34358-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,bp.renesas.com,kernel.org,google.com,glider.be,gmail.com,vger.kernel.org,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,pengutronix.de:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6C826B4579

On Mon, Jun 22, 2026 at 03:53:57PM +0100, Lad, Prabhakar wrote:
> Hi Manivannan,
> 
> On Mon, Jun 22, 2026 at 3:30 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Fri, Jun 05, 2026 at 12:54:46PM +0100, Lad, Prabhakar wrote:
> > > Hi Philipp,
> > >
> > > Thank you for the review.
> > >
> > > On Wed, Jun 3, 2026 at 9:16 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > > >
> > > > On Di, 2026-06-02 at 20:50 +0100, Prabhakar wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Switch to shared reset controls for PCIe power resets to prepare for
> > > > > RZ/V2H(P) support. On this platform, multiple PCIe controllers share
> > > > > the same reset line, requiring shared ownership of the reset control.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > > ---
> > > > > v3->v4:
> > > > > - Added RB/TB tags.
> > > > >
> > > > > v2->v3:
> > > > > - No change.
> > > > >
> > > > > v1->v2:
> > > > > - Updated commit message.
> > > > > ---
> > > > >  drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> > > > > index d86e7516dcc2..a5192e4b58df 100644
> > > > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > > > @@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_get(struct rzg3s_pcie_host *host)
> > > > >       for (i = 0; i < data->num_cfg_resets; i++)
> > > > >               host->cfg_resets[i].id = data->cfg_resets[i];
> > > > >
> > > > > -     ret = devm_reset_control_bulk_get_exclusive(host->dev,
> > > > > -                                                 data->num_power_resets,
> > > > > -                                                 host->power_resets);
> > > > > +     ret = devm_reset_control_bulk_get_shared(host->dev,
> > > > > +                                              data->num_power_resets,
> > > > > +                                              host->power_resets);
> > > > >       if (ret)
> > > > >               return ret;
> > > > >
> > > >
> > > > I have a few questions about this.
> > > >
> > > > Can you move rzg3s_pcie_resets_prepare_and_get() and
> > > > rzg3s_pcie_power_resets_deassert() up before setting
> > > > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B in
> > > > rzg3s_pcie_probe() without ill effect?
> > > >
> > > > Can you move rzg3s_pcie_power_resets_deassert() up before setting
> > > > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B
> > > > rzg3s_pcie_resume_noirq()?
> > > >
> > > > Those would have the same effect as the reset already being deasserted
> > > > by the other controller.
> > > >
> > > Yes to both. I have reordered the sequences as suggested, and it works
> > > perfectly without any ill effects.
> > >
> >
> > Are you going to respin the patches incorporating the review comments?
> >
> If I have not mistaken, no code changes were requested; it was just
> that Philipp wanted to ensure the shared reset worked correctly after
> shuffling the code around.
> 

Ah, I was mistaken.

> I can respin the series if it fails to apply on top of pci/next.
> 

Sure. Please respin once v7.2-rc1 is released.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

