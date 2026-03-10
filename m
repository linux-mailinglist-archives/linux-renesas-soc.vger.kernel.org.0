Return-Path: <linux-renesas-soc+bounces-29166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O0FGcuksGnQlQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 00:10:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C242592C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 00:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E542A3137619
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 23:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6D7372B3B;
	Tue, 10 Mar 2026 23:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="W4jfCE0x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA6A2D9EFF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 23:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773184190; cv=none; b=AffmFoVdLkm6vNfQyr8UnbnnvHiSGuUQ3A6icvhtkvSmx2vRcs3ffTVLK6wp6wRlpRf5FkbQ4pvY56TkxKGnYEHLVQ7xi8in4xtIcnPG8Q0eoD7odQoirW3rKY5duBb/NsuO319rtHoG3Pe8OAxGYw8e5iWyKuXLZStxBf9RBks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773184190; c=relaxed/simple;
	bh=tvxfEPo+gdJgHh01uCZf5wLBgdbC4fQGClyZ8m9Ht3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCeVTi5CMrLSmJIGmh1nYNk10SHrKRLFfPPx6AwdFlcSoomOhyKN9IyWh1kXxmW/EiGeDGQcYi2O9PBh9UvjjOimnyIe403MXo5nahCVrr2MiMO3CQ2wwQagi0OiAAD7VvZG3LsLa7Na/ye9/Zg/WpeKV6iwVurm2hpePYZwHJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=W4jfCE0x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=R1Fz
	WpugAaJ/+Bq6pMXLKwsRLGEgvyjwk4uFAKO1uq0=; b=W4jfCE0xq8Xr3wei9m7J
	6f7G92G6G5UXy+68Cas1IOE4LajLWhNWEa2VOjgKs1HLSx1XGPAaC7DH2wb0fV5U
	URWnm/s3U4zZl0B/hXsNTZH4A/RdgC4/Cov1h/T1v0McFKzWXNrPbAR1px/kOacH
	S0xR0sWRbkgwHWYr0YWpa1VkzPkZW3kU5C5zIGm5NJYQH1K/DzOcDz8HC/hT3ori
	PcUWsn3UhG5d77xw9yg1hExyiSubXqNc3h9IiqbHx1PVGXofLmiUZPqB7MB3meuN
	64R0ZT0Z1OQ61hnxU5ImjK61ERsIdPxuNqN82iHgPBB10l0RoAvk0DCkh4Dsd5e8
	fQ==
Received: (qmail 3401801 invoked from network); 11 Mar 2026 00:09:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2026 00:09:47 +0100
X-UD-Smtp-Session: l3s3148p1@EWSSnbNMVLIujntP
Date: Wed, 11 Mar 2026 00:09:46 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: phucduc.bui@gmail.com
Cc: krzk+dt@kernel.org, geert+renesas@glider.be, krzk@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
	hechtb@gmail.com, javier.carrasco@wolfvision.net, jeff@labundy.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH v4 0/2] Input: st1232 - add system wakeup support
Message-ID: <abCkulmW8XDXkXiT@shikoro>
References: <20260309000319.74880-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="awZPapTNl2nZOXsf"
Content-Disposition: inline
In-Reply-To: <20260309000319.74880-1-phucduc.bui@gmail.com>
X-Rspamd-Queue-Id: E3C242592C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29166-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,oss.qualcomm.com,vger.kernel.org,gmail.com,wolfvision.net,labundy.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_TWELVE(0.00)[16];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,youtu.be:url,sang-engineering.com:dkim]
X-Rspamd-Action: no action


--awZPapTNl2nZOXsf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> Demo video showing wakeup from suspend:
> https://youtu.be/POJhbguiA7A

Nice video! You really put some effort here, kudos.

Really awesome seeing Linux 7 on this old platform :)

Happy hacking,

   Wolfram


--awZPapTNl2nZOXsf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmwpLoACgkQFA3kzBSg
KbbIQRAAoZK4e//jULOzL1yFbhFsEGwYhnvQ7h6+SBunlCcFjZIxoqOPhJ4acEsh
qNwKnmMwbY5DOsVK3PsGdrXyjLFoAShlU1G2wxpqr/k7BFxOmPSjg/9XaaHlY0wT
s3KB9x0G0iAvVSi3XQvOK8suvuYw7zvQjcLQr+rKQRgQfZ1eRKLGk/xqvupOcjSy
19YjKDJ/46FbPr+QzhhHAXTxZZ2awHEacrqvq4QCLojSmCOWyyMeUeyJ9Nua4IMd
J8YhBl+yr7Ykf7VF8fm92GxPBw9ADIiF9nMT2Q/kA9w7mjzMLuXZAQ3EMWQACd+l
V3biiKZ6uT/RmTkcAHHNngHYqvE7QOHpLh1Hv3MNHIRCn4gOoFFR0zbHfhmxOywk
gzMPb/o82dG4J4Tz9oHDV8GSKTPR200n3P2I+l8RhOqBPXKrh8t9mhDCUqCilMCh
FvLpriEvQElchUe3Ist85YMv0TjGfeajr+Dv6IGiAQH1/eJpSapYz4rTo09odaOv
FTn7+D/PJgtfYneccY0zhn4WR4BpBeNX6/T3afLWH3lfovVA9jead1BY5ISjnU96
qzmaMlAgdK4nh9S9Jo2g6HslIQQSv7JIpkQOhTk1qeyrUGT5i85vJN0U6wley+vZ
N/gbZnJo5CrGhPu2fSRffddLR2x28BZ2cpIFZ5tOt+/CD/ZT0tE=
=fB3I
-----END PGP SIGNATURE-----

--awZPapTNl2nZOXsf--

