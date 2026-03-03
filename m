Return-Path: <linux-renesas-soc+bounces-28737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBNmKxxTp2lsgwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 22:31:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 031351F78D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 22:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A851F3006B25
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 21:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458BC3976B1;
	Tue,  3 Mar 2026 21:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MGpzjc1m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7613F377EB0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 21:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573389; cv=none; b=lbjzerLa0vaCcGjXp+9h2HnmnQN+2SzHTuEL5CYXbcORSRN7owh64/TVYxKDyQ5OvWr7wjC2utHnNfkQSEsMS+/87Yocq6cG70EjnM87ZeSVd2XB9P/D+bWfSgA59uW8gpLPRlPk9e6ncwnD6h1RNU62+iQZPTiaPLDQLiuHnag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573389; c=relaxed/simple;
	bh=rYzWvZPeiSesttxHsg0FGAeTmhFJl31Xd+6Rh1azMrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+ARYBO4fUC3nY0cxvbm7Q6jiLcdx4RHLN2xHM1qSOwMwF3qzEnveVZN+SLjOwka+dWlaVQ3jeMOVLKnAmf7WqJRHUTwsP7L6+qE05prbNl8RcnlBcYTEVBfBq0rW1skYC3ebcVE38EQxj2+emAfT+8Tj1zy2yVz5zOcGf0/MTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MGpzjc1m; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jW0V
	vRcB14fwAIFQP4ds/94VXeLdN5GXgVVKtYlJc6s=; b=MGpzjc1maauu4Rp28ym1
	9bheU0mwWvL/4d/HF9jy44lq4UU8nAjypiithyhonGOshUaDQ0H3iPnJEUBzI58r
	iChQEZEIrHaof/RHL8oK+kOvLzyvelvzDNpzYyK+xt2o+Zx+bc31PnKGV1UU99S+
	vz4eKr7CD++5kPrq6U6enFf1VeafQ4AgDdwIVDm3spvqSt/1mHibDpoP5rvF4e/O
	nAyaE5bb2/BLvvC/UCyPFa/6srUc6vVLxOgj4cd4SLEGSL5ZEJ7MGoq8gREXaAwF
	IxjTUd2wKGNqj1GCF5f9hszrMg3vQyB0fR/4IUaJtrTExCw2sYugVg7+4WuXhxKl
	sw==
Received: (qmail 461850 invoked from network); 3 Mar 2026 22:29:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2026 22:29:45 +0100
X-UD-Smtp-Session: l3s3148p1@bcHzZiVMJpoujnu+
Date: Tue, 3 Mar 2026 22:29:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v3] mailbox: test: really ignore optional memory resources
Message-ID: <aadSyJduOzrzRV8-@shikoro>
References: <20260303212738.12769-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="73D6jZrSYpQktwLQ"
Content-Disposition: inline
In-Reply-To: <20260303212738.12769-2-wsa+renesas@sang-engineering.com>
X-Rspamd-Queue-Id: 031351F78D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28737-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


--73D6jZrSYpQktwLQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 10:27:39PM +0100, Wolfram Sang wrote:
> Memory resources are optional but if the resource is empty
> devm_platform_get_and_ioremap_resource() prints an error nonetheless.
> Refactor the code to check the resources locally first and process them
> only if they are present. The -EBUSY error message of ioremap_resource()
> is still kept because it is correct. The comment which explains that a
> plain ioremap() is tried as a workaround is turned into a info message.
> So, a user will be informed about it, too.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Changes since v2:

* refactored mbox_test_ioremap() to have multiple exits which makes the
  logic easier to understand IMHO (Thanks, Geert, for the suggestions!)


>  drivers/mailbox/mailbox-test.c | 37 +++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-tes=
t.c
> index cfd5429df17e..df53d918d9fa 100644
> --- a/drivers/mailbox/mailbox-test.c
> +++ b/drivers/mailbox/mailbox-test.c
> @@ -356,11 +356,27 @@ mbox_test_request_channel(struct platform_device *p=
dev, const char *name)
>  	return channel;
>  }
> =20
> +static void *mbox_test_ioremap(struct platform_device *pdev, unsigned in=
t res_num)
> +{
> +	struct resource *res;
> +	void *mmio;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, res_num);
> +	if (!res)
> +		return NULL;
> +
> +	mmio =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (PTR_ERR(mmio) =3D=3D -EBUSY) {
> +		dev_info(&pdev->dev, "trying workaround with plain ioremap\n");
> +		return devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	}
> +
> +	return IS_ERR(mmio) ? NULL : mmio;
> +}
> +
>  static int mbox_test_probe(struct platform_device *pdev)
>  {
>  	struct mbox_test_device *tdev;
> -	struct resource *res;
> -	resource_size_t size;
>  	int ret;
> =20
>  	tdev =3D devm_kzalloc(&pdev->dev, sizeof(*tdev), GFP_KERNEL);
> @@ -368,23 +384,12 @@ static int mbox_test_probe(struct platform_device *=
pdev)
>  		return -ENOMEM;
> =20
>  	/* It's okay for MMIO to be NULL */
> -	tdev->tx_mmio =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> -	if (PTR_ERR(tdev->tx_mmio) =3D=3D -EBUSY) {
> -		/* if reserved area in SRAM, try just ioremap */
> -		size =3D resource_size(res);
> -		tdev->tx_mmio =3D devm_ioremap(&pdev->dev, res->start, size);
> -	} else if (IS_ERR(tdev->tx_mmio)) {
> -		tdev->tx_mmio =3D NULL;
> -	}
> +	tdev->tx_mmio =3D mbox_test_ioremap(pdev, 0);
> =20
>  	/* If specified, second reg entry is Rx MMIO */
> -	tdev->rx_mmio =3D devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> -	if (PTR_ERR(tdev->rx_mmio) =3D=3D -EBUSY) {
> -		size =3D resource_size(res);
> -		tdev->rx_mmio =3D devm_ioremap(&pdev->dev, res->start, size);
> -	} else if (IS_ERR(tdev->rx_mmio)) {
> +	tdev->rx_mmio =3D mbox_test_ioremap(pdev, 1);
> +	if (!tdev->rx_mmio)
>  		tdev->rx_mmio =3D tdev->tx_mmio;
> -	}
> =20
>  	tdev->tx_channel =3D mbox_test_request_channel(pdev, "tx");
>  	tdev->rx_channel =3D mbox_test_request_channel(pdev, "rx");
> --=20
> 2.51.0
>=20

--73D6jZrSYpQktwLQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmnUsgACgkQFA3kzBSg
KbZQIhAAgCNOTVR7X3Ocul+ZUWku+lg4fDyzZEOgtWqYLee4DmJEV3Z3goWOFhNn
plAbMaTW6X1r2U9T9nWFLLUfgHLFnySXc2/uy3KNrhRNnskF5KwhT1zW1ljUX2iy
rQ8M8Ks6PlYtzJQitcukQGlTdUP1q2Qmc6nTH4fVFIhrCP6F7nK1Vm1cksW6Pyvs
06Y0YOA2uFcmzk8+3x9QqHZGF74vkdEx34C3bf+KVs//bxYxPPwHEde5557WaNeM
1iQ0pSkk7jJCXstXWeQ/aqknH1ik9vV062tJB/2nU06hH/Qpr8fiRx1lisSEWPMf
ba7yBsRTGgqmmWDp0a+hPZyoUmespXeVcd9aa/YgAVACCS9F/Ne4mmE/6ZhqGaYg
xoRKR8GYILYmeNCO7g7y98jvseQk3xtFiKdihAuan7NNQBLbHMFjzdfw3FqgXR8L
p+96zZHgiWFWChNTWQg4S9qaT9iD019nkPDeITYuLRQAb+3tyxK4bhji8y2DmMNm
rt8kbVFkedVutBcMIX6QhBjdM0ll9rlI9DtDlfW2Jo3MkrMId8ODO9GiqTWdwOLd
ZGvuofO28bcpFZJOUAlYb8lafn4BhxklPBfbDdOrShHZIiTm5rLJ0nWMf374FzV6
+AbqTiVrDnZsxhn7iXK/CsD6XtT6nQhyeWhnECXKYIO2OhHF1R4=
=7RGI
-----END PGP SIGNATURE-----

--73D6jZrSYpQktwLQ--

