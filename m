Return-Path: <linux-renesas-soc+bounces-27559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J0yMjNJemkp5AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 18:36:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 64166A700E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 18:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BABFB3001031
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 17:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10C435B144;
	Wed, 28 Jan 2026 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzpe8C7E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE76309EFB;
	Wed, 28 Jan 2026 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769621809; cv=none; b=tlHDQhNaPwMjJ3IHUGyve/ZkIghQ9+LhiuJRVhv5wKLNnHU3nBJmzGat+doXZXCEOyX9UpOpqMZocN3rfWMj5yLOoANMGaBiXzeRCFf6OiRFnoPA8CkptSNxwPg5TQ3VecOMfMSIliWCGQIuWXpcm7EigUWKNdveEeizHBOvtYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769621809; c=relaxed/simple;
	bh=9fqxtAPG8/RCc6gsmGDEejHfxFpsZRDkffY+H/Opu7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSmk2hKF23zMpRaY/3N3j1ABJsDgTD6g9psxNo5Yr8oEdJYpDPGHqQNkNACttoAS0IpyUXNJGcM17Azk9VXv0awJzzw+nRBmAuUE58MmII+wGjQfjGsnD4GKpO83PYbbX8a4ZP6QrlfNHdfhNGmhyNUzvTOv2J7SYcWq4h86AYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzpe8C7E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20306C4CEF1;
	Wed, 28 Jan 2026 17:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769621809;
	bh=9fqxtAPG8/RCc6gsmGDEejHfxFpsZRDkffY+H/Opu7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hzpe8C7EQo37y8Ek80GxNJZ1EKMJPqa4UADD/CFMc2g1vQs4TluC3bmVDyV4Hg+UZ
	 s8uoX8CONLUnNvg2S11IMYMiuEPGTMJ96VVeuQLW4A7zuD1r37lFkN3o8ZrxaFAgrB
	 /aBydZMurEsxW6qnjQ4b9A19P5URdtZsLoPaqt6KfAy6P3qhsmgffz8vnDV4uia/I+
	 hu2oSoVQ91R1iuKer+sk0S0MZGugKMY/pK0zBm1DHiLp0+eU1Tb/72jsJnirEo04y5
	 7XcTlvZNQ74/TVyi7REwh3lz/G18KRmCIYiXs4A0gClCVM4odUOlf+Fv4vlr1UdEWJ
	 Tkwi/7GP3QWiw==
Date: Wed, 28 Jan 2026 17:36:44 +0000
From: Conor Dooley <conor@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
	krzk+dt@kernel.org, robh@kernel.org, bhelgaas@google.com,
	conor+dt@kernel.org, magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Subject: Re: [PATCH v3 05/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Fix naming properties
Message-ID: <20260128-dispense-catnap-2ea8238da580@spud>
References: <20260128131647.120511-1-john.madieu.xa@bp.renesas.com>
 <20260128131647.120511-6-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+YYa1w3urjn3YIOp"
Content-Disposition: inline
In-Reply-To: <20260128131647.120511-6-john.madieu.xa@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27559-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64166A700E
X-Rspamd-Action: no action


--+YYa1w3urjn3YIOp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+YYa1w3urjn3YIOp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXpJKwAKCRB4tDGHoIJi
0lOaAP4/L8vpYWkWirn8v1LfmpbYRO7rDS52Hu7Btdv2C3i69gEAiw9zniaFt4ld
/ofs4HK1WMSwWecXZkNn4N0eGWPMEww=
=x69g
-----END PGP SIGNATURE-----

--+YYa1w3urjn3YIOp--

