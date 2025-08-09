Return-Path: <linux-renesas-soc+bounces-20176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC89B1F3AC
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Aug 2025 11:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 923AA5823E1
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Aug 2025 09:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC13F2236FC;
	Sat,  9 Aug 2025 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YrKkuyM8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F3F1D54E9
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Aug 2025 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754731072; cv=none; b=jt1AuRPR60z+Mlrm13Fu1DPkqckXjP6aluxNN6msNK5p7lsEi+7dz2rYp4WZBTJeTkGxP7O2qIgsfJ1mUPCkTIYTZY2R8zHoq2gBzelBP2Vj/Qshf0Bofl1nC6WIRszHiFw5J9fE9G6WdQe+MFYADq4Jyq05jvltJmN1ar+tZT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754731072; c=relaxed/simple;
	bh=N9jG7yBOQ3lgsJ6r9KwbZQPPO7TU5zlxFhX5Aov/qtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXZPhW7NrGQRkjCCH6LJYEWwcdvji+hpvfFl2b9fjk+VFLKbb0kSVNzMJx0nkIfMO4bK3dtORkhhm68jRaAijGw6aOHWkcuNTYIVx99alSnimgnCfbI4hfn13MFI101MPMY7Kreb+mDUkQ/6y4CQSbOob6WWD/8pPagRYv7ln/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YrKkuyM8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zpP4
	8XR9326heaIe2nRhrf3XsUp8VuGSg8W0cEXGVtI=; b=YrKkuyM8fPQCMJYI5jEE
	rJyBfI9UjTrBllOsFhURdmu/sESvL6GimXcFNgNRGHsCZa7W6ZtQcsG7/w9dqEHp
	LMgpSqFHyzNY05864yL9E7dwI+k1GZ/2GcuDkacD4Ol6+tO9uwfI6YY9k40oRFyu
	qjBuZloGW6JUjUuCE5XfkZt4QtVdWI960MGHrM1oylMzAUQ6r+UWK6HCxa1hyb13
	olbCCChgH2xxT2IEvHHUKyI7xO/dmzR3YI/H9omMY4Hql1rqZZa4mmUJgMRFkoFf
	Al21xUgw0TwZU4PWF/9v0JuyWxyf0OzUYBwX/ZP++DvoXbI2DdJHtzF23sJYonwK
	kg==
Received: (qmail 2035045 invoked from network); 9 Aug 2025 11:17:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Aug 2025 11:17:47 +0200
X-UD-Smtp-Session: l3s3148p1@syDrKes7ZudtKDNO
Date: Sat, 9 Aug 2025 11:17:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Message-ID: <aJcSOlS1kfem0Bd2@shikoro>
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
 <20250807151434.5241-9-wsa+renesas@sang-engineering.com>
 <7737de72-701a-43ce-88a4-90d2d17c48f8@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="INP1QZBzwbeRc3Uu"
Content-Disposition: inline
In-Reply-To: <7737de72-701a-43ce-88a4-90d2d17c48f8@tuxon.dev>


--INP1QZBzwbeRc3Uu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> - there is I3C_SET register (bit POC) which controls the I3C voltage, so, I
>   presume, depending on the SW_I3C_VIO_SEL switch on the board (which
>   selects the output of VDD_I3C regulator)  the pins would have to be
>   configured with proper power-source = <1800> or power-source = <1200>

I assumed the firmware is setting that bit. Never checked, though, and
can't do before end of August.


--INP1QZBzwbeRc3Uu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiXEjoACgkQFA3kzBSg
KbbLKxAAryQFc5GWymo5P4NVRzMRxnaYOqirDFDa6co+5kqnUxAlw0EzibOjvLvd
gWienQ5KnFC6VHWbwDoVtj79/JGJ9a9Rrvmv7qW00ogB08VmxyCKRtqyMVnHlo0V
fkuEobxl4xLjfTk9ae5JSTefCFHjVqkWeVfdi7HhUJuFxTr9Ikrih8eNjevmq9Td
qsSylgpwK4NIoVYrwTArpj0x5Y4OQAp214SvRT6WjD4sU6WRpKPx5AkjmoApNppp
plxE+phvqqWwi7uFUqJ+kreIfXBHnFzuMPjrRRQYba/XG5jeKsMwDtGBgy+IN29W
VSkZPt9R2Ag6BJb0eflieq0lJcE4SOSV1rl/J/0DJZcaqD2pB/FRdY/Kr964ul+v
/NV/LOzaXoOcs1PbWaYD1rm1V3TAOKPsOdlcc8gpaEmkELe+cFZV/POk/ySfsc8N
GC5xeLI4k+YwPT6Yu0YBXb8yJ39Gwu+VBJCe4zcTsRgAEIvZMBiQy3gb3JgZQTrf
bLWmk6qPsPj2t49slykoj7hFFG73W8hAc3ogzV4ZCrZpveC+WWJYUI/JwYdW1fK8
7No7jTgpASRQ1V766e9w8rrzpLecdEPyXHXoU+rj1RRWWSVzQqDanF8Jrs0NT+sd
p2S/TP0ah199CKzSEIVYRpIuRpXgCuNDt1zBUPBudAAQPlfI0gA=
=gkLV
-----END PGP SIGNATURE-----

--INP1QZBzwbeRc3Uu--

