Return-Path: <linux-renesas-soc+bounces-27151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKNZGVv0b2m+UQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:32:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5814C4DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 494F050EC38
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDD83A1E9E;
	Tue, 20 Jan 2026 19:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZ6qGrHy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EDB39A7EA;
	Tue, 20 Jan 2026 19:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938658; cv=none; b=Ofz5iB1VWm+GSdo4u3QTgPlP5TLTZlHObt9HqpWRprUcYEJfw+Uzo8SUiXGlrufUEJMPji82V0VnwXSYhYd+F+N5SM6KduwzDGPKApQyCqBdlfjXVCbspe4dAWXBFCHpDa4qr0agSAz2KJhl/YkHZlBpiyxlDufy0YnWWEB8dls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938658; c=relaxed/simple;
	bh=rNm/BkKJ2SsiZEmOA6OjQ7wXIRmMYA9ar56PDVxN4+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZcN08eODpTuxzwHcjcVXSK8fFJfh0XGAW64BLG5OSlIKxSdobZY3zo6P83Fd53mERUsCFO2Uz7BBEolXekwi2rV3fRQn74Pq+PDmWH+JVtS6wdfZe3Sdugaa34q7ywsdLvLYdjU0xd34RUHUL/+JJo/vzHfY3C+pFboVeXJMgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZ6qGrHy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C426DC16AAE;
	Tue, 20 Jan 2026 19:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768938657;
	bh=rNm/BkKJ2SsiZEmOA6OjQ7wXIRmMYA9ar56PDVxN4+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZ6qGrHyuB96elpG2KxNCHyAp6Kodbkn6r+hDHyimuRLW/+UYbXKjNC9i1K3n3/Up
	 7YME1JkYRcvH/pAQkT1mvgryKQyxcSv2FLHPP3VB9zggrn+B6cRRfxzjTHnYGgFFQw
	 80VTeXr/ddjR87k8k1fFuxrIRkRf1xBTzv+GssbIA/KqmppgyVZYDCE+tuh/ZCb7UZ
	 kIcgYJiqi9hTQRgPXZ6eelpPTMb6cv5w8C3elYUiUYuyeAIxff0Y6MglbVnEPVt9Qc
	 3CiriA0xixEaN6hCjbHrXNxpq+ZSyUCCB6ZtXGAVWCUOzBjLBvzSGMB3QlLrtwqep8
	 E1nw6i+y/gWiw==
Date: Tue, 20 Jan 2026 19:50:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 05/12] dt-bindings: soc: renesas: renesas,rzg2l-sysc:
 Document RZ/G3L SoC
Message-ID: <20260120-payphone-aloft-eda520f321b8@spud>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-6-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3PWG9u3tglYC55KE"
Content-Disposition: inline
In-Reply-To: <20260120125232.349708-6-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-3.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27151-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: DA5814C4DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--3PWG9u3tglYC55KE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--3PWG9u3tglYC55KE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW/cnQAKCRB4tDGHoIJi
0hBCAP49o8uP93CKKSVtfEoeB92gILJ5vr4IxKiN7AIbN4p6VgD/aFXv8y8h7dLo
pmPE8pZ3AWtsbU1mJqM5hDOTBJrDGwA=
=qhC4
-----END PGP SIGNATURE-----

--3PWG9u3tglYC55KE--

