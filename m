Return-Path: <linux-renesas-soc+bounces-34315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wBkDIHBHOWpBpwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:32:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1826B056E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:32:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GGDzqL9U;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5E3E3019AB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 14:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCBC30C178;
	Mon, 22 Jun 2026 14:30:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31C729D291;
	Mon, 22 Jun 2026 14:30:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138650; cv=none; b=UXdCihG30vD4PSkGEoHvUeYcU/1rZWQ9p4WKXz9EuWb1jETgsMNRqwmkmzTZeqbjuNqVmJVaIy3axQeeOI4JrFn5arSTS3BmWKGnfjny3oYFdiRDF6Or7TqhadsE0zrzH+DDGORTTntzAQLDZxlsSK7s1LovHhd5+w3Y/Hhl3L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138650; c=relaxed/simple;
	bh=2/KCs5cXviVR0AWXnT72lyR1D13dxtQZZGsCKYjBlvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWzScgN60XsbGidT05yKh8q7itPTFO5G7RAK2NKxhuenzIZeZXM4PbGuCzXQa/cDPwPzs05+qrlShsasGlHA9ySkckVJzSbP7/ociYBl5d+QkttkfShGxR1rXFJB7JE6qSX0868xl9zzr1IEM75M/pk6JHTGddaJK25aZamYie8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGDzqL9U; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53441F00A3A;
	Mon, 22 Jun 2026 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782138648;
	bh=Sh2R1sfAQBWk4IEUspavNMGRBRkiMYOuCiBxaMrOB88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GGDzqL9U0o/ME1ub4lBGJ1/VIUgsPexkDLuWdcp8Q5X11zzcMopYU6WKdnrp8Cda3
	 SeMDKHzRP3ZFPahd6l69xdjGJmKQiRGoaQerBTXcdQ01V/TSTqTJQzv3i+Gr40CogW
	 JsdxdiHj42K2E6DdxErMTecfA/Z5Gwut61beCciwc7D58j7F/Dcv25XTDbBKaXL31V
	 hfw07sBZrYsDOC4zTHyQ/VIp/v6caLw5CkH8KOeHf3Rg6/twquH+2KtvN9aLhbEjvW
	 uBgNPxaGco750ZF+fZ90EciDbcTsH2aZ0o62NMFgG1Q9dseMsD5d1eNIK9Xk0lAEZZ
	 7GO5yAe9MCoyw==
Date: Mon, 22 Jun 2026 16:30:37 +0200
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
Message-ID: <fuefvecgjdqbnbvpvam4gmewmpmhofllyq2ootwi6cjqhnyoys@edjzqlh6fjw4>
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <50a908557bb3ce5f14b67396d1e73e70289a583a.camel@pengutronix.de>
 <CA+V-a8uGho2RMhreDgieOOZTggUALoF0bGyjdEEDvyL_75sAyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8uGho2RMhreDgieOOZTggUALoF0bGyjdEEDvyL_75sAyw@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-34315-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,edjzqlh6fjw4:mid,renesas.com:email,vger.kernel.org:from_smtp,pengutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB1826B056E

On Fri, Jun 05, 2026 at 12:54:46PM +0100, Lad, Prabhakar wrote:
> Hi Philipp,
> 
> Thank you for the review.
> 
> On Wed, Jun 3, 2026 at 9:16 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> >
> > On Di, 2026-06-02 at 20:50 +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Switch to shared reset controls for PCIe power resets to prepare for
> > > RZ/V2H(P) support. On this platform, multiple PCIe controllers share
> > > the same reset line, requiring shared ownership of the reset control.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > ---
> > > v3->v4:
> > > - Added RB/TB tags.
> > >
> > > v2->v3:
> > > - No change.
> > >
> > > v1->v2:
> > > - Updated commit message.
> > > ---
> > >  drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> > > index d86e7516dcc2..a5192e4b58df 100644
> > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > @@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_get(struct rzg3s_pcie_host *host)
> > >       for (i = 0; i < data->num_cfg_resets; i++)
> > >               host->cfg_resets[i].id = data->cfg_resets[i];
> > >
> > > -     ret = devm_reset_control_bulk_get_exclusive(host->dev,
> > > -                                                 data->num_power_resets,
> > > -                                                 host->power_resets);
> > > +     ret = devm_reset_control_bulk_get_shared(host->dev,
> > > +                                              data->num_power_resets,
> > > +                                              host->power_resets);
> > >       if (ret)
> > >               return ret;
> > >
> >
> > I have a few questions about this.
> >
> > Can you move rzg3s_pcie_resets_prepare_and_get() and
> > rzg3s_pcie_power_resets_deassert() up before setting
> > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B in
> > rzg3s_pcie_probe() without ill effect?
> >
> > Can you move rzg3s_pcie_power_resets_deassert() up before setting
> > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B
> > rzg3s_pcie_resume_noirq()?
> >
> > Those would have the same effect as the reset already being deasserted
> > by the other controller.
> >
> Yes to both. I have reordered the sequences as suggested, and it works
> perfectly without any ill effects.
> 

Are you going to respin the patches incorporating the review comments?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

