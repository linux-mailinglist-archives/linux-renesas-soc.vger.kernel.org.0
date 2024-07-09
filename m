Return-Path: <linux-renesas-soc+bounces-7197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4292B573
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 12:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F915285169
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 10:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928F3156967;
	Tue,  9 Jul 2024 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L54uR2Tt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B0E156883
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jul 2024 10:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720521458; cv=none; b=upJ0xnaNYmBawM7hWFxeYUFN0hFEiV2M2JqwOKJcwFCtB6FLd3qKkZ/JMchgakmoLw5wPVZN1re5v6ZBcYgz4zPrvQ6lQWrw3sRmZz8iaya8nmWo9S4BzGEnhjH/mJpouDPr/h86tbPXPz/Jj+SZHbMVEn0EksLDAvI2nnhJKbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720521458; c=relaxed/simple;
	bh=c68Rl+i540qanf1DGJH9pTc6YgVH2lalM9vUm9e5H0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2meuSh6VNmxKZbFXhnXjzRvDN+CWLzLSlBQP7tNTBfOB2oCn0rwWayNj3vHcLuuuQMAujzBy60sZoqvtPrZjp9MFCLi62UH89JRcT7VKIW1hS4rhpf0ec2PJjD2orfaiEsS5h6WN4gYuE6UGodvFStKZCecEVHKYYhVdI7GtIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L54uR2Tt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=c68R
	l+i540qanf1DGJH9pTc6YgVH2lalM9vUm9e5H0s=; b=L54uR2TtQY2tqLVRtMNO
	011+lNvub/8tOV/GSicWb2sqJk3BtMFmcQIRg2N5XvtfvILaDfm5aLCeXnQI0gtu
	mNsq48F7mEXs1GI+qD7/W7GDnt1Pt6ghAbjCsX6ELHta6qEun43/QJIgO8RPCYJG
	hGUj/dA+PuYWa6b4xwBI65v5KcHMUbG4LBBK8aZ+Ke1JP6JGztGO0B0smK31xaJz
	E/kfUnohNxwOTA9icBCcmnubhACqzkjan9jOvZuPF0k/0qzeUxruta+OvWMj9IAU
	ts3yiMHcCag33ANiH9Nlaku3mAhFqpDCOSX8VIicS2tUJlLuFSHCfaLQ9sYMRhWB
	4A==
Received: (qmail 184676 invoked from network); 9 Jul 2024 12:37:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jul 2024 12:37:25 +0200
X-UD-Smtp-Session: l3s3148p1@eN6SHc4cxrMujnsa
Date: Tue, 9 Jul 2024 12:37:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 0/6] mfd: tmio: simplify header and move to
 platform_data
Message-ID: <Zo0S5DauR8MWRIyI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lee Jones <lee@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-sh@vger.kernel.org
References: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
 <172051805084.1217090.8146208079593611090.b4-ty@kernel.org>
 <20240709094131.GE501857@google.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3pBwgW7iImMiA0Ek"
Content-Disposition: inline
In-Reply-To: <20240709094131.GE501857@google.com>


--3pBwgW7iImMiA0Ek
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Applied and pushed - should be in tomorrow's -next.

Thank you!


--3pBwgW7iImMiA0Ek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaNEuEACgkQFA3kzBSg
KbbIfw/9EzJwX1Jz+Or2CeqDXGA6QnI8fSj+9m3zQIjZiHG2L5g8GdcpqkrAMlYn
z8S3MPgOd8WN+AuAQlF1MBxlfe+zfcJdegRVy7zonsF9GbizRyHgslstU0ELSf0k
STufrWp+CuYdmMkLiaUcRK4lWBAUHGoq3BSb8DQFsHDqOlqO+RBQMpzTZHQN5NZr
C+3WXaK8VfDxKzFg3F/n4Y7NQMOyHIfT0IjhY8LEeVDwQ/Dn+uqvb6dPEABqrGhY
YznyfqmMViiv7dxXjBxTk05wNPFRin+rCjtxr882vgLCJvxL7Mv58EGcumQ3DW4R
2AlZlsKLCBz6XgdqSx65zeY2rG9dNsmbo9uMfS/zOz6yL5Wi7ZObBPT57K4MTgJQ
bLZRt2TOwF5GKTbLGCahcWwLMzLs7dVlMbVTemVIpnqXu3kdK42socgq8bE12xVh
VlmTzcophR4vN6VpFTtkZd6xTt6faOQID7bD1iOiAxtLNgaY7iLxn8v3ak3dCkvA
U+iKb2+M3i540GTPIP62blN9MslUo9VHg7WZaaTVQBym5NG0jAhyEM7t20IWLcZz
qrlKiQh2ccPJapZ37ktfonROBHt+TSZOKWURUIYl8QIzkIVfRwGROVqpF2lSHFy0
KzB49ZgI2wLHQktQCfdR/tqli4rgDNDveMUDrXCGfjjPp2NJIf4=
=E8bx
-----END PGP SIGNATURE-----

--3pBwgW7iImMiA0Ek--

