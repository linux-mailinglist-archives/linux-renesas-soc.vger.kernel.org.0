Return-Path: <linux-renesas-soc+bounces-29164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGu6MniWsGkukgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 23:08:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C95D258B69
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 23:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEFB63200C15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 22:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAAC3D0927;
	Tue, 10 Mar 2026 22:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KJmd+kH3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21FD3BB9E6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180422; cv=none; b=c3rQMLMdTvxWTtVcDvFCB/c6tWcj4il1YFOWA6fIXGTCWVaQj+no/Ax3ssYlGys8fIkkDnsRWLNW6wuXoV4kUMyY3cQ9cYmYgTJ+rkzrITPMj6Yu7tLs3iB2By7q/Kv1pshgENMkLTJwVpHanaDncHQjyeT9Dv33alaewb7vA7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180422; c=relaxed/simple;
	bh=KR88W6/3MEUiySLgVOsnO8U+amFoVaHSYPrt1wBRuzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RD7x8nk4zb9dW7v2IWylVwpbfVxLDjQmE7/6h9myD0lNfi0AvDoyp7YVSyvVJ+a5DanQb3l3u1WMmFDPfL9sbJprE3pxP1Ck98KlOvHaYTbrCxc0nSh8ZWyEf7qVch7pbINsei0/3e+gJ3tvjhspR6TxWSur1AcSB9XeeeNkAlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KJmd+kH3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LkUL
	HWuXg79SODw2AYpCKh0d7QmHHmvq0tOokfU4XyY=; b=KJmd+kH3qVuUCWxlIf01
	WOXGCq5oOEkuH77UFLC9wvreGRDLEQKS+SWl/SwG8NalPAq/vNlNDd+aKQqRlmwn
	ws1bP+cj7RkRUuqMlAIGYafNtJG5c3K9X78npG6pHs2YIM9uilpmS44PJM43ShvN
	cc5W3ygeZhtSxa8/C1ijSPaATbPQux7gh+RK7P7JwOg6vCmsFVrR7vengFGdpm3a
	g5I09otRpB6uH2PZHYMcEib5NT4QZXOcqo8ZZVClK85krt+U0Bf60knB/QXzEMah
	9yxaZ7JTUKmsQQKpjdhKBDIY5cPzYvwFNtfQeO0BhJP6UcfVvX2xr+ZxGnTeDXZF
	MQ==
Received: (qmail 3386356 invoked from network); 10 Mar 2026 23:06:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 23:06:58 +0100
X-UD-Smtp-Session: l3s3148p1@a4H0vLJMpo4ujntP
Date: Tue, 10 Mar 2026 23:06:57 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: r9a06g032: Add #address-cells in the GIC node
Message-ID: <abCWATS9MiRhcqlM@shikoro>
References: <20260303102029.147359-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0oKhQnZxzxJhR7xj"
Content-Disposition: inline
In-Reply-To: <20260303102029.147359-1-herve.codina@bootlin.com>
X-Rspamd-Queue-Id: 7C95D258B69
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29164-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org,se.com,bootlin.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email,sang-engineering.com:dkim]
X-Rspamd-Action: no action


--0oKhQnZxzxJhR7xj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 11:20:29AM +0100, Herve Codina (Schneider Electric)=
 wrote:
> When checking dts involving the r9a06g032.dtsi file, the following kind
> of warnings are reported:
>    Missing property '#address-cells' in node xxx, using 0 as fallback
>=20
> Indeed, #address-cells is not present in the GIC interrupt controller
> node.
>=20
> Fix it adding the missing property.
>=20
> No functional change.
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

How did you trigger this? It doesn't show up with the upstream DTs for
N1D. Can you share the snippet which causes the problem for you?


--0oKhQnZxzxJhR7xj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmwlgEACgkQFA3kzBSg
KbapNBAArlx6+fZzy6x/ZhTmzNm6zv5TwMGDBiWn85GGGiIPi31Jj23+41GRsv6a
HKKGYCwjGn8OZRF6sZaXVMoEGKzezguBwm7Lz5x/T2+vaa0HhC1BGcyv7471auE5
F1373FTD7xzuPjgg+5KwiXZhQKjmcLZhaKomYsc8V/ElBsz1hxkIIQ8E7FKVD4YQ
43N4jLsWkMcmeagzOuFk8mR+mcU3ZUm0KRnlGz3ot8TGP9ufwq6ZV0w6BEcoIVH9
C3fLOJaozP55cvJsW9SwEl9ylKsOJwNrY2hsfskH7w4q6V2ElEtpmLiZxJ5J25ND
Gl2vTa+8KQ1Cq+HpbLeluLk4Re0oEsYYDT7f6YrCNsub05s1gQwOzz7NnUOzWPjl
OcN7Hj22W1pGH/KFIG73/NP9mi/ZN0HezAQ+YdTYn/Tjv8TZFLSrMEGxGUZh/RUh
2epsuwlhl5bVFNz7ZLxT4FPn3MPooPnTw9kiW8Kx9TSCOVe608dfEusqZMq0eSb0
5fGogBXI9HwSm1YffYCRv35/VPzMcsGL4O6WUwVf8PEC6ZtHGgXAJtk8122wKIcK
p009s25pSlPF6t+oLxUb2zF6a8OBuXb+O6RlXjsoQm+B0z09TW69eNuzKpuiTPKc
HuIFiz34ZWWjNPUNIlICWHKmkzh4IkPVSa+IW5Bl/eOoe0CnFFI=
=Rc5H
-----END PGP SIGNATURE-----

--0oKhQnZxzxJhR7xj--

