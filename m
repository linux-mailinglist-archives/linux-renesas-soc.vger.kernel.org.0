Return-Path: <linux-renesas-soc+bounces-33942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kcY3Ck4wLGrzNAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:14:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AF967AC5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:14:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=H6k8mWy4;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1750D30074F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF10384CF6;
	Fri, 12 Jun 2026 16:09:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF01E322533;
	Fri, 12 Jun 2026 16:09:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280596; cv=none; b=QUcofu87RG9z1WHuJMj3jY4aZVh8mLeVVgAwH3XhJ8BReZxbzKFFyG7VCi9b6qkw5iob5XAvuYwRCi7xafQQiNO2hU+eegyX3VMo/i93qj5M3GidEtTrxvNxjH7lcGulLulvHHtUUQ50knHkLJyQ2rTt5SLOamAg0cId+JAkdXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280596; c=relaxed/simple;
	bh=01l/O8R4HecZ8L0+V+LVdv+trjfBuwRmsZ2uxmVpcbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xawq2f84lBW9NHcoWEMtaUPtsJhCRx6qCBEj9DX47nvmbNFeMK6lnuydQaS5krU1bYnb7xDJGIhrjqZrR+UbaTFHOOf6bT62NKJcrIy2VFg+cd8mXOAVtWdALT4MlA8w6SvnpvWFV0MGZXt+N/dj+KkloZYXFC55qBaf/ztT6oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6k8mWy4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730D61F000E9;
	Fri, 12 Jun 2026 16:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280595;
	bh=aq30D6zmaSTWmTNk1Ul9iMUE0E6w3wNjjVKpsq5EvFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H6k8mWy4TC8tyaXRV2lAwWRt+GtZq9P8UssA7HzpXGV7c59YQAA+QA7bFju+UCbhi
	 hh7mT3ggZdykbP//wPq0+ISWJILWKaX86hFTCYKPiXrFSQKbOF+O2RlUpuwcJYf7gp
	 8aITC0X04i0rN5jdZ/TLNFmGIWyaBn1NbnmE6vJM9Vsvx8g2cLbE0g9pkgp4ponSDi
	 CjGdnhAgyqn49qYaVmTC79tvMqeLKmLTq7ns2VqYbTmduxZa3rnqFDm/dW1lkCU9qH
	 1F6EERd3sztheY6UkJbXynr54DcZxqWMiyBIhkoTfHXR8GPdcb+m2VcR2f3N4EHN+H
	 t/c78+cbb/tzg==
Date: Fri, 12 Jun 2026 17:09:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Message-ID: <20260612-landed-remedial-79582e900699@spud>
References: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
 <20260515-rcar-du-dsc-v2-2-f6b9240a1240@ideasonboard.com>
 <20260515-fraying-trickle-7511a2eeaf44@spud>
 <81f89aa1-84d8-44e1-813b-2bbcafe3687e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M3NyARh4jghnVALM"
Content-Disposition: inline
In-Reply-To: <81f89aa1-84d8-44e1-813b-2bbcafe3687e@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:Laurent.pinchart@ideasonboard.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,s:lists@l
 fdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33942-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,glider.be,baylibre.com,kernel.org,intel.com,linaro.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spud:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03AF967AC5D


--M3NyARh4jghnVALM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 01:43:44PM +0300, Tomi Valkeinen wrote:
> Hi,
>=20
> On 15/05/2026 20:32, Conor Dooley wrote:
> > On Fri, May 15, 2026 at 10:56:15AM +0300, Tomi Valkeinen wrote:
> > > From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > >=20
> > > The Renesas DSC Display Stream Compression is a bridge embedded in the
> > > Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> > > 8k or 400 Mpixel/s .
> > >=20
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > [tomi.valkeinen: fix the example]
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.co=
m>
> > > ---
> > >   .../bindings/display/bridge/renesas,dsc.yaml       | 96 +++++++++++=
+++++++++++
> > >   1 file changed, 96 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas=
,dsc.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.ya=
ml
> > > new file mode 100644
> > > index 000000000000..2918d592732b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.ya=
ml
> >=20
> > Filename matching the compatible please.
>=20
> All the other Documentation/devicetree/bindings/display/bridge/renesas,*
> files follow the same style, where the file name is in a generic format, =
but
> the actual compat strings are per SoC (and no generic compat string).

No idea why it's like that currently, but filename matching compatible
is the policy.

--M3NyARh4jghnVALM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiwvTAAKCRB4tDGHoIJi
0qMpAP4jTzOgRW+PnemiZMAnA+L5VxOTwHJSxg1B/d89AGSqYQD9EtGaiGfY4js1
HpJoegRSMqdIGa0omBue8WXQpiD9XQ8=
=IqDA
-----END PGP SIGNATURE-----

--M3NyARh4jghnVALM--

