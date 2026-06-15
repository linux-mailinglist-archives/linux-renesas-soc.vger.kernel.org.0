Return-Path: <linux-renesas-soc+bounces-33997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VkujN0PIL2pZGQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:39:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E9E6851E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:39:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=mchp header.b="cQE6uE/o";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90652301CC66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 09:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB4D3DA7D0;
	Mon, 15 Jun 2026 09:39:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1618330B14;
	Mon, 15 Jun 2026 09:39:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516351; cv=none; b=f9LIYtyBsUyF3658PWJGxqLBJXHN+8sVgQ5cmFGpv3B567SDqQ4RCXgx5ZXK+kWW9wYqZnFf3Lete+b3NyvjL1Vq6QMWVkia+zShhBmpsM+P7BQ49kzPVEuRy/gO8jwsBMoH94EqWb7oWbzZFbHI6ebFUCdgHihG5M6xcGqs+gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516351; c=relaxed/simple;
	bh=dnONPYD6XzHhp9EBOgFNHs7pj4H4LDKb5beDVT0zjho=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTozMDUayrxNENwXOkhSt4SrEBxAgEfqxhuYxaiBydEb6KgP3Z1tPBkwJqh0iEgpXfRqlWhei0hqzjG8FTJwDUULhvNjAQJvL6EdNSXbrUEKP+AY0XQFLx9zAmc7RzfS+8xyyWY2Q7o6v7XrK14AiS7Ojvd80WOGvfGuqdhKMT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=cQE6uE/o; arc=none smtp.client-ip=68.232.154.123
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781516349; x=1813052349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dnONPYD6XzHhp9EBOgFNHs7pj4H4LDKb5beDVT0zjho=;
  b=cQE6uE/osYndA9+53fxO5LpgJcax07WKMQKhUTfRvf2XyH8EHNV5thVq
   Nx/gzTj8yC+3vrI7bQtVzCXGTvUTrnw9LmtK1/CH0meUpz/5kDlZiDSEb
   D3ebq2kT+MjFMnFkT2f/M9fTXd6tbJtMYX2M8Mj8MFXBVCCnZMVD9rUbc
   CUrGQUoIWJc50Ui9Mkd0yyAuheR9HUw5wj3SCYqCqNZg1bTKr7BSN/HZC
   drBcc3yYDGyRoYH2RuwQcIt7NCfuEou3a3ruihwOX0+bEJQ7tdNEHirLR
   EeQ/zH1YMeL8XKpNultaHNdEgYtc7oGEf8pbQ8sWsu6zkGMo6Edmr3/FS
   g==;
X-CSE-ConnectionGUID: +Wai5PhcQwyFvCCU3De2TA==
X-CSE-MsgGUID: vqn+V4SDSieryT8ypJm+tQ==
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="asc'?scan'208";a="58296024"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 02:39:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Mon, 15 Jun 2026 02:39:02 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 15 Jun 2026 02:38:57 -0700
Date: Mon, 15 Jun 2026 10:38:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, <linux-renesas-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Message-ID: <20260615-undiluted-gallery-d7318905c8fe@wendy>
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
 <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Uh78Vh1VzfEi4O33"
Content-Disposition: inline
In-Reply-To: <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33997-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor.dooley@microchip.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:tomi.valkeinen@ideasonboard.com,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:laurent.pinchart@ideasonboard.com,m
 :kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[microchip.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:dkim,microchip.com:email,microchip.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mailbox.org:email,ideasonboard.com:email,wendy:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86E9E6851E6

--Uh78Vh1VzfEi4O33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 09:28:07AM +0300, Tomi Valkeinen wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>=20
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/display/bridge/renesas,dsc.yaml       | 99 ++++++++++++++++=
++++++
>  1 file changed, 99 insertions(+)

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a779g0-dsc
> +      - const: renesas,rcar-dsc

I didn't provide an ack for this FYI, I was giving the ack for the
file being called renesas,r8a779g0-dsc.yaml. Since Geert isn't happy
with what's here, could you drop my ack when you send another version?

Cheers,
Conor.

--Uh78Vh1VzfEi4O33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCai/IAgAKCRB4tDGHoIJi
0lGiAP4i+hsdDIWn5Ob66ARc+soBDeG/vc4lEZHkeIcbNWBX8QD8CvRTmZfRwU0o
J33Zs5Y0tg/53Ixvcqhdm9vClQTuzQo=
=DIro
-----END PGP SIGNATURE-----

--Uh78Vh1VzfEi4O33--

