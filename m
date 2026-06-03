Return-Path: <linux-renesas-soc+bounces-33501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 92RKEAXjH2pPrwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 10:17:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB536359C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 10:17:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8947F3039B45
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 08:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C52640962A;
	Wed,  3 Jun 2026 08:16:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB032413240
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 08:16:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474617; cv=none; b=OwrjMQyPR3IKhG2o+8M2jv/UQj/78oQwvMbhlpYFzSnKcDFjMWd5WyIIvEL3z1C6nHWw0dto3cdfgdGOCaqqnuP6qkQf3mRz2mi9NKodntoNqOFMIPmGf7P8G1EyNP5zumD3LtFSEHlBg3HuU+XeX3ehBsPiFugTYgXmN9bgEmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474617; c=relaxed/simple;
	bh=NRGp7ciKl4RNiUi+iulN7hzq/FhBMMKaYzGB9VRrhxU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DlD4qv3PLd1Fjqm/S86drIPF7rmPu+U7BtSV4zaLCGSQ3K0tWEyffV7Rjlf6hzX0FT335st8A2Eig1iqsvcnzrErq/DLwk51TqcSuwjCjm56WUKDKlUSyzlynJlvgZArZUnnpbpeQBHKdXRXl9hCu9gqNqn+/t/Fu4WjsYQXOLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUgmJ-0001Xn-Ca; Wed, 03 Jun 2026 10:16:43 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUgmI-000sok-30;
	Wed, 03 Jun 2026 10:16:42 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUgmI-000000002l3-3UCX;
	Wed, 03 Jun 2026 10:16:42 +0200
Message-ID: <50a908557bb3ce5f14b67396d1e73e70289a583a.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/4] PCI: rzg3s-host: Use shared reset controls for
 power domain resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Claudiu Beznea	
 <claudiu.beznea.uj@bp.renesas.com>, Manivannan Sadhasivam
 <mani@kernel.org>,  Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring
 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven	 <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, 	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Wed, 03 Jun 2026 10:16:42 +0200
In-Reply-To: <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
	<20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:claudiu.beznea.uj@bp.renesas.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,bp.renesas.com,kernel.org,google.com,glider.be,vger.kernel.org];
	FORGED_SENDER(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-33501-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,pengutronix.de:from_mime,pengutronix.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCB536359C2

On Di, 2026-06-02 at 20:50 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Switch to shared reset controls for PCIe power resets to prepare for
> RZ/V2H(P) support. On this platform, multiple PCIe controllers share
> the same reset line, requiring shared ownership of the reset control.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> v3->v4:
> - Added RB/TB tags.
>=20
> v2->v3:
> - No change.
>=20
> v1->v2:
> - Updated commit message.
> ---
>  drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index d86e7516dcc2..a5192e4b58df 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_get(struct=
 rzg3s_pcie_host *host)
>  	for (i =3D 0; i < data->num_cfg_resets; i++)
>  		host->cfg_resets[i].id =3D data->cfg_resets[i];
> =20
> -	ret =3D devm_reset_control_bulk_get_exclusive(host->dev,
> -						    data->num_power_resets,
> -						    host->power_resets);
> +	ret =3D devm_reset_control_bulk_get_shared(host->dev,
> +						 data->num_power_resets,
> +						 host->power_resets);
>  	if (ret)
>  		return ret;
> =20

I have a few questions about this.

Can you move rzg3s_pcie_resets_prepare_and_get() and
rzg3s_pcie_power_resets_deassert() up before setting
RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B in
rzg3s_pcie_probe() without ill effect?

Can you move rzg3s_pcie_power_resets_deassert() up before setting
RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B
rzg3s_pcie_resume_noirq()?

Those would have the same effect as the reset already being deasserted
by the other controller.

Is the "power-on" mentioned in the comment about the delay in
rzg3s_pcie_power_resets_deassert() the same for both controllers or are
they powered on individually? Specifically, when the first controller
deasserts the resets during resume, is it guaranteed that the necessary
delay has also passed for the second controller, which is resumed
later?

Can the reset_control_bulk_assert(..., host->power_resets) be moved
down past setting RZG3S_SYSC_FUNC_ID_RST_RSM_B in
rzg3s_pcie_suspend_noirq() and in the rzg3s_pcie_resume_noirq() error
path without issue? That would have the same effect as the reset still
being held deasserted by the other controller.

The power_resets are initially deasserted in rzg3s_pcie_probe(), but
never asserted in .remove. This unbalances the deassertion counter if
one controller is unbound and rebound while the other still holds the
reset requested, which would cause the reset to never be asserted
during suspend.

regards
Philipp

