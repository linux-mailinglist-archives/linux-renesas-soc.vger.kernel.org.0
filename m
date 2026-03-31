Return-Path: <linux-renesas-soc+bounces-30627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFZzAcSCy2l4IgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:16:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A791365F02
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACA3F302F99F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 08:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4B83B19A6;
	Tue, 31 Mar 2026 08:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kt2R4R/m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1684036E469
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944512; cv=none; b=gfN19z5bwKVU7TbNbmtyTKtRfF/bcr+rM2HpMQ7LbBD8e3OT0NjAT4MRLpkYutOOFL0hJlske4BoFYjY7iIim9biTmHJpLgrnw1UKuxcvjhXokNvxCNIHHB5sPAiE+b1yafNWrAIgC3aeFeAEaC3BXLHTjYuTNNjkCIc4DsOtJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944512; c=relaxed/simple;
	bh=bX6mYUh1q46esTsAhrkpOPARg+6xLOKnBTouLgFbMeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UD1qeaIBv8qn6T0GEhvA7H/qDfyeHiXQyip3YWT7rjtiOuEb3y0PEJtd5eCzKLTvea80iYw0Wv3C377Ddc8mAVw/SQRE9Z4z0kJGWCBMPZmL41yaIsuehxba4M5KtRRtD9kgMSCyCQprpqmycALB/2lVb/nNAfcbXtn0bTpa/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kt2R4R/m; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bX6m
	YUh1q46esTsAhrkpOPARg+6xLOKnBTouLgFbMeM=; b=kt2R4R/m0rX2dJMDT7BG
	herUnTE5+auHc1b8mJ1ZT9pmlS3TqnlNjDAwld1YgHOw4TqL5Cb/EUXKQl4X2tOD
	T7qk3dyKt1g6sWSQMFtoo6FB+v9IRkSqZx0RMWbRi8oSxewkKZhbrlMiT/tQ5vVY
	YzjXj4AwPWLhHBrY/uQV4O0hbJ9BjksBP/zkbfDBbSFSJLdqYMJluboeKN8LpuoT
	DiaqE5xPwgdb8W0lN9lex3WSdMJJPQWTGXfbWF/i7ttRTkU+pR1bXXpWMiS3D7/E
	WMXiMD5DtfvgBK4HImUQIEZZ86a5WcKgO3vBufGrUhcGLlPbRBjp8WbxOwc/jdo4
	8w==
Received: (qmail 1599631 invoked from network); 31 Mar 2026 10:08:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2026 10:08:29 +0200
X-UD-Smtp-Session: l3s3148p1@mL/yeE1OpqAujnu8
Date: Tue, 31 Mar 2026 10:08:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Marek Vasut <marek.vasut@mailbox.org>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: renesas: Document MFIS IP core
Message-ID: <acuA_CGZNrsdmXy0@shikoro>
References: <20260325110717.17083-1-wsa+renesas@sang-engineering.com>
 <20260325110717.17083-2-wsa+renesas@sang-engineering.com>
 <20260326-magnetic-cautious-earthworm-aee7ec@quoll>
 <acZtECu-1kuIuNrx@shikoro>
 <dd3587eb-f91e-4a9a-8a0b-b55bfba2c23a@kernel.org>
 <cfee8254-8573-4106-b71f-293073b64c89@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LGBJfoL9rLTgw+mZ"
Content-Disposition: inline
In-Reply-To: <cfee8254-8573-4106-b71f-293073b64c89@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30627-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,mailbox.org,glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9A791365F02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--LGBJfoL9rLTgw+mZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You made the posting unnecessarily complicated - this patch went to my
> DT address, but the rest to non-DT. Why not using b4 which gets it
> correct without effort? Plus it gives you much more like changelog with
> lore links and trailers handling?

Switching to b4 is on my to-do list. I will give it a priority boost.

> So now I found the driver (in different place...) and indeed you use
> some of the constants, so this is an ABI. It was so easy in v1 to just
> point me to usage of the ABI when I asked how do you use this in Linux...

Well, IMO I pointed you to the ABI by sending v2. I still think this is
a valid choice, I understand that you would have liked it differently.

Back on topic: As I understand it, I will prepare v3 by adding interrupt
constraints, fix the indentation and use your DT address properly,
right? The ABI issue is resolved now?


--LGBJfoL9rLTgw+mZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnLgPwACgkQFA3kzBSg
KbaD8g//SI/oEtq+zBXYZMTa3dA4k1op5hAe3mxosJyBka/+30szGoKUr2PeG4gF
DoQo4oLdDhBgbPb4mvbjGL+IwRrPFB1BAKhv0ctCjfGN/gjDBAph7hvx73p6Mabr
c/h245TxDFakiCrxD6q+4ByRycRDhVxD3W4Czw95Qw0ElvArm5FQzUF5uxanfYhx
LXxEcYXnJHoiEOUz6GKNu5r950UXlhM/GFG4mD4LTnxSfHdG8aSwT8l4NIpfn0yD
2JtpzzNobv+DxEjAs4LonrWw4HzwIoBQfcmvWzRCIMwX1KO40UIRbbip9o3TlwYt
X0hMFidoo9PYvRLcU5PTsWSuTYycUFVyEu7e37hLUSQJ6ROx26KRT4ipTUF5AKh0
rkXwo+VaVEjh7MycMXU0dgSyI97tg8SPIesVU1QO03QaEKlgchiz3ekuWhyOquE8
vyOJtuEcuFjXLA3rJqXUlYuaLLdH2yFKQeKniYBjD+IrRYfQcuJB8NuGvRNlKd51
PMGZ493vX/NAf8Ef97O/bMZw9si4wjoASbOgFPmN0GwJ9sD3UCpJicG1C71/4VD6
SIVLuzWx5H9P3hQnKBfSXPxLLnIJqoBdmvvuD2Lwt/jtGjFGxg8xiciRhZwQsVC+
4TkrhIVQhsjgrnNlQur0S8xhsyzuKDjTX2w5ciTCORy6fH3rHA8=
=D0Z5
-----END PGP SIGNATURE-----

--LGBJfoL9rLTgw+mZ--

