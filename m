Return-Path: <linux-renesas-soc+bounces-30632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO38CoSOy2kuIwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 11:06:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83026366B48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 11:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D62D30557D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 09:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8493ECBE3;
	Tue, 31 Mar 2026 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YwtAKqL5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159AA3E5581
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947794; cv=none; b=PaD+ujC3GeVHlAouN2sAyNPxxfOi4yOrT+6Q0g+7DCzbTo5oaspaBx6ZDQs8Ul/i/8OIyuqtKif6lBANbFX8ZK/bJ5C/4qC7HdF8dTmT2eHpsBmht8hFrLtdgpduhEahmCBYl9v+bqvnllkgCsEbPzGX+yZCifE66GPgEc64hhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947794; c=relaxed/simple;
	bh=OE0d6x0WYxexc0/kcde8+XfSkBRMrA4wj8pT4StRBeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3axOaB4lTcKsek7+aaLu9HRgnLwJWNCgEh2WriIkO20JdkR+YQDg/44o+nuEnBaFU+kNayBFhj95tb1QGU6dx/ZBK9C82KXAfkmFdY7+4OSZqUqjmkrf03Ti4ZKIuC+9o2fZ8IMvNVyjw/DxgeggIb2+qEyV/Fc3XHAAKXUxwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YwtAKqL5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OE0d
	6x0WYxexc0/kcde8+XfSkBRMrA4wj8pT4StRBeM=; b=YwtAKqL56B5AOZt9sApl
	m3EJ1VxjYD9CxlTVRi35+Fw08EuPkf+DRCn0BAuoHdhPrQZyRVcvV0Z9ZXXZOcgI
	O2pw3dZPSuJLouU7XGiC++tf77ZEi6d+K86zWDunv2xQRnOAO9XOyQvYq+s2qCZZ
	fBQzgb16dYqYCUA7g6uM+TlraHgWe/l5Dx+gFiLSWZsA9hxa2Sy6w/d6prbtjhOB
	hCK+o7XdVXec7UCG8PlkRSN3y2L4taljVgsSRG8Sc50qY3e/Am7L2Eu4/q+F4tvQ
	I2LkmCNRK0ehDKN2ivfRScNexxRpI1X6LEL/iodwT5HU8o232QJZ3C1pJ6/w4NB9
	Ow==
Received: (qmail 1618107 invoked from network); 31 Mar 2026 11:03:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2026 11:03:03 +0200
X-UD-Smtp-Session: l3s3148p1@t8EWPE5O8Ncujnu8
Date: Tue, 31 Mar 2026 11:03:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: Add Renesas R-Car MFIS driver
Message-ID: <acuNxnT-b5x9Az--@shikoro>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
 <CABb+yY06e1boahM5CL1MNBKZj6DLCmGa-hgsfMDcnTn23h+cvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DosHLkaJcfHVms9q"
Content-Disposition: inline
In-Reply-To: <CABb+yY06e1boahM5CL1MNBKZj6DLCmGa-hgsfMDcnTn23h+cvA@mail.gmail.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-30632-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,renesas.com,glider.be,gmail.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 83026366B48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--DosHLkaJcfHVms9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The mailbox part seems reasonable to me, apart from the nits already
> pointed out.
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

Great, thank you!


--DosHLkaJcfHVms9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnLjcIACgkQFA3kzBSg
KbbQwg//SyjevBYUnBLKuhVaxQc9Wd72XR4v4iKcaRfoAhgAter4uexh4C0Bk0jw
5WEvuj/dvlk5sT+Zx1esPVZi6jFMPsAyxW+bAR4gU3+SSalTjs5nrWS/KZ8vKpgV
jU2TgFTP5W2oi8XnQSxNYlogEDqNpn31K350vRDWgPeZa0lLmCKXB4iix/nxx+w+
xHiAShZkoE6aXh2yHHvBncxQzu7EQZcG7AGJk9mlu3Yip2o1LnGg39BeFe3OmOwa
7mDuf4YqGTWqJ73kdnIfQ7dK4Woz2JRDYDxMFOWu+gYsyM75LvngRwB1aoDRvDYI
EyGxMTeojbnvirwIhHSc9YW8K6D1CZQPx38Wv5+xE53eCwwrHj7Vb1F1ZbNZKXHf
N4c/o1a3XOfEMN3fzo20kkmtizsJD0fl//Tnt841WTIF8rSAj1bPXo4TbKtDSVK7
B2dsoHooWXI6llNXUIVvHfY3A4v8dbslc08v4jK3Hm1I0ikdsRxFkNSqm225zA6T
KOBzUOUe3mr5X2PnR/G/pCsbpVq74SjQim9ZQj6H0aKantgkRCcdqZDrTeAg4FZL
gNh9htpQX7Zvphx86IDOpfZINhqsWuc44Ioq2ZGvIEzoFU3KzXuv5sDQFxURWad+
Zt11aPylVnW0l9qdkuh+M04rDJe/W1MeGBkffywp4koZwCjGWsQ=
=gALX
-----END PGP SIGNATURE-----

--DosHLkaJcfHVms9q--

