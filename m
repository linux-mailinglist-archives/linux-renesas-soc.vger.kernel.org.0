Return-Path: <linux-renesas-soc+bounces-2513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E39C384EE36
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 01:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 694EAB233F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 00:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961B4360;
	Fri,  9 Feb 2024 00:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A/obAKFp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00936D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 00:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707437447; cv=none; b=CxJQF4R7IDN94TDLd9n+M5KWcXshyWBCYMwSM8rp3/Ftb4z7uX+vcS5CnYekIGpuZr8fIRk0f7TZaVNDg2f8CieKlYoeO7LdNuCqmNe+4IrrOEaUZkhQKhyEY+L001jP8aA9ELjSGOvZOoccIdlmrRYHCoTnx2/kbG9+e/iZxXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707437447; c=relaxed/simple;
	bh=VeZGmdkWu2a9tcJVHKHFxcVcovTPejnxYaNB+QF/nKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SelM9rwbJZ1rPbR6f2IL1QolLN9tyV3Z5d4hHr4c0OBi8AbSlQxh1oNP3a2dLgoPAGjtWd6I5wKqctBAcPc9oYvQmHXY1VvvlN9KaaLFRoCsUvwxCUAwnEoDMm30Q6mx9wWQTD29KeqtTUgjjL7nROmPCNjI1lBAgLvgcVDO+sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A/obAKFp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VeZG
	mdkWu2a9tcJVHKHFxcVcovTPejnxYaNB+QF/nKU=; b=A/obAKFpBGAFUmLPvdQ6
	zm8LIA8OYziJ93q8wyuCZ+3It425RrgtFUQKQA/yb9HK/+iJCGoweDsOI2J+OhKG
	nRWV7B5BrnZcxCGI+a+P3i/p8VlWyJ7bF9IcGpc++FiaR2FvGuCNuA1yQjKuI6Rl
	v3Dj7uulpwPNNEayvdu2XDwkd38O1MbGkYk/QV5wppBMmSnI4lej+9xcmEEwcuUt
	aT+ULuoVYY2+4LqK8VCp2iWnslCvWGcPr7BsbSYqRcXmuXqbbt9a03AP2MErta4S
	rhAuLDjHkwgyqB2WYhWmy5PusRv7oqQpV81TVAOKur0atwojLG12IwLYjg7OhhKm
	LA==
Received: (qmail 2756342 invoked from network); 9 Feb 2024 01:10:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Feb 2024 01:10:40 +0100
X-UD-Smtp-Session: l3s3148p1@Wq4WwucQQOoujnsZ
Date: Fri, 9 Feb 2024 01:10:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: use typedef for dma_filter_fn
Message-ID: <ZcVtfzeeOnHm6xs-@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240208202137.630281-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gbY9D5s4ZrTDvJIk"
Content-Disposition: inline
In-Reply-To: <20240208202137.630281-1-krzysztof.kozlowski@linaro.org>


--gbY9D5s4ZrTDvJIk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 08, 2024 at 09:21:37PM +0100, Krzysztof Kozlowski wrote:
> Use existing typedef for dma_filter_fn to avoid duplicating type
> definition.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gbY9D5s4ZrTDvJIk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXFbXcACgkQFA3kzBSg
KbYHlg/+NXyqZnSAPRj0qIaGasZogGhPCcNolE9AR+mpZ+nbC/q6I7+bugEFp/FP
P3Ho9Se9RMjTu77k0a3A5PJ7KsL9v68UYQ3qS0PG60xqCf/ghATY2TrwcV5SH/4X
JEi5hFyp3pKmTRHBHpCncEhojfK5amOjleZzEjlWbApdfpzT9YFnNFK3aaoHZ1x1
3k+7kujR5h9a6YOyrHm2ZMMgrhoy6DqwD5XqDlaGZbYHYSeaDei6WXEE4QDLBg3I
K4dAoRX/lbuY4Q2rJLhKRmv+OxDsvTXmUfx29KpBj1ZR/wVudR09DmLCtzbpd9KJ
yS3txqoAGQ8UN6/pug+s6rGUayn7arU9ThxVBlMkARWm+TslYsyylqNSDPMNRW4o
QrQTNzJwSS+EWlKCMjCLTi012dGxvELcCDBsi2V2Dey6riYu9EOI2f9sbUEIkmiF
m/L1WfIubZduElAXFVaROQksbByvvtHDevd9js85Ip+E1zvT7mBQv8mXVbTTN2LH
fMHeWpUT6DAIi4Ne3NQqT0b5tV1fRHBvHbizeoAC1IkV3++FsIRRivuQXIbnYUpC
/kGxd0evCh7bVb7tmgKIjWyOBiJAvevaFuoJKcNxfqFVP5tmccda93AzMRfSZh9f
LmvXlpMw1vYtFQvHyZP8wcocoIY1GevCzzYdUeleExrBhEIr8Uc=
=srAI
-----END PGP SIGNATURE-----

--gbY9D5s4ZrTDvJIk--

