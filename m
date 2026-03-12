Return-Path: <linux-renesas-soc+bounces-29310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FURN1/5smmLRAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 18:35:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E0B2769A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 18:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EDC63017DE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42183FE354;
	Thu, 12 Mar 2026 17:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cK1UchNb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11533B6362;
	Thu, 12 Mar 2026 17:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336923; cv=none; b=nwrES3THYgGAOXlzofBFqsswNRkWAJ3LVmCe2x2duWz4LxfJ+QO8wfSb74l0xepp3wmyW2K86Th+9QUwU/MCs9lVmY+4K/VmGFpDyUqTa3AFN1Gvu/cJErOw1M/+ySRaWNDWA1wJXNoeiTUZRwKdvdbxpyUki6EaQ+WsOp1D0MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336923; c=relaxed/simple;
	bh=zqJtnU1nEvbJJL1d/slZXEhUndKtU4g0Iwm1n6uuyTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvMJQ/deK28UlYgxN3ita1Zx5/IV6Aps4mTJTdUl4yyMMWZBiFWowU1FOD54oRRAPdCVZKlFXOmBcAR7qAVHbmqTp5GjKLZFFcfUsP0n+wek3HFjzgcw+74r1s23z1Wt2qY7xDKeYwb3CQ7/rMSFIYhdIB76xCutCoj4NtIZNqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cK1UchNb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CFFC4CEF7;
	Thu, 12 Mar 2026 17:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336923;
	bh=zqJtnU1nEvbJJL1d/slZXEhUndKtU4g0Iwm1n6uuyTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cK1UchNbfmhQwG2WGp2v/mmMfKXYWq8iXcgOznoHKuv2rEHDqHQJ0K9UpjfBJ/VMv
	 l3iJmWN+mMwPejz/74wthUjM2BonkWl6r4ttnhI07Bks4RMlkythVN2v6F0R+kdzhE
	 RNE/LDK+TMVZdL/VlOAnF2Vm+I0jqsHXnXzwU31gNfey2rcUWP1QjCVh8ygFUdJ0Rk
	 2OHk80hLI3J09lvL4azsIrd3JhNQvZM7oGj9XrMYfI/PqxdPL7OP8qKr0/ylY/ZGx+
	 33qrD7XROkdPthjWAs7mk4Eb2cGe+QNwC4onpPPWO2q7yhnnNKBI/0a5EBz7lN4E6k
	 FnKiP0K/WEFwg==
Date: Thu, 12 Mar 2026 17:35:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Stefan Eichenberger <eichest@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: net: micrel: KSZ8041RNLI supports LED
 mode
Message-ID: <20260312-chomp-liver-4b484d25f9b1@spud>
References: <cover.1773321267.git.geert+renesas@glider.be>
 <6ccda7a00f250e87b0457e276ac1070cb0708d71.1773321267.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jatNYVOcOCvwMss2"
Content-Disposition: inline
In-Reply-To: <6ccda7a00f250e87b0457e276ac1070cb0708d71.1773321267.git.geert+renesas@glider.be>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29310-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 85E0B2769A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--jatNYVOcOCvwMss2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--jatNYVOcOCvwMss2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL5VgAKCRB4tDGHoIJi
0qOVAP981BwJHmeinQ4TPuX6XyLTJOZRDN/soQfzPy8S6T25NQD+ODGHaXg732DT
76G/x9Ck1a+XLyEPCiEoX4B0+lvywgA=
=6U/t
-----END PGP SIGNATURE-----

--jatNYVOcOCvwMss2--

