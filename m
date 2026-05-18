Return-Path: <linux-renesas-soc+bounces-32773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LHQF0k+C2oJFAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 18:28:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2717570E84
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 18:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 292F83002B66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 16:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A290D3FE661;
	Mon, 18 May 2026 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7ExYI8T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA0026ED5D;
	Mon, 18 May 2026 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121690; cv=none; b=sCPZPJD3eZR1Bv4TbQ3s0w1iqIKiPpL0LEvnGI9YGu5A81oMduu0EzDar/MHFJOV/55qh+AjvzwSyIsg2s5SaHLg/FpLH6jIhaHbnBpdVw/74GcnkYTbzjZ6Yg9vzN9rNKl4uuHAGTBnm5TvjccepANbd+Y300QAerYwrcL9x0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121690; c=relaxed/simple;
	bh=3jGoaYLrIdfY8fxCt8RE2gFSjMDiP51+IVix3OYHhPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYtjoK+/9/EGP6Yhp0GDuqtD/YQOQL+omlMdLbfjKs08CGAw1KUSTQ6idmYDNjA77gvKgIlTKdq9hv7TWETk3EW+WAwbzdG8pnUrNMTORJaq7wGk4jKfd/4xwR89WZJvYJHRLq2psXqZeMBBWrlLExo+kMZY30DWblYPoenu/gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7ExYI8T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FF6C2BCB7;
	Mon, 18 May 2026 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779121690;
	bh=3jGoaYLrIdfY8fxCt8RE2gFSjMDiP51+IVix3OYHhPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7ExYI8TItuqZz95XMRoZ60wsT3UBHH2czPLr5/hOQB77QY5jQITBge2xlNIE8AU5
	 Cd0yMJccZO37BZlp4CSoOlnL6pKqrLS9AB00DVqJEdwEElj1djSAdXCcCbPfLBYDIc
	 y0wr49RKJ5QoWDhKZCXz9PsOGJtOkdPnpO67XXfslPcJrojB6I2crWCJuJVyshJ5mp
	 /JAVg1+isUTuinLFcZ2Ttug/pj3bhbuIL2qERaPCyvdFsE7ur2Ak8laaFj31/A6+Dq
	 wBfAvnmllN92N02lhiySqatuyuNrOXtfqogL0yUJKMjI1Ji+FdUhSa7OSp76aK+0fQ
	 XOLggQ0TPB4OQ==
Date: Mon, 18 May 2026 17:28:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Cheng <neilcheng0417@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Meta Rainiera6 board
Message-ID: <20260518-contented-untimed-85b12903469f@spud>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
 <4f7aee0a2dfc44770347ccc82e54820e7b35317c.1779088499.git.neilcheng0417@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D4Ni9Iy8zbLh/XVa"
Content-Disposition: inline
In-Reply-To: <4f7aee0a2dfc44770347ccc82e54820e7b35317c.1779088499.git.neilcheng0417@gmail.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32773-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,jms.id.au,codeconstruct.com.au,glider.be,gmail.com,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C2717570E84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--D4Ni9Iy8zbLh/XVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--D4Ni9Iy8zbLh/XVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCags+FQAKCRB4tDGHoIJi
0h/xAQD/GO09ESffxZeEWy0y0qDA2FYxyklacN0+YEI/W2UZ3wD9EAzOZtufjk4m
QRtp9ItGZJ9m+ezm/FyqrNQTH/CIlg4=
=dcZV
-----END PGP SIGNATURE-----

--D4Ni9Iy8zbLh/XVa--

