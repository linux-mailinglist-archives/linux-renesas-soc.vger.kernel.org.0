Return-Path: <linux-renesas-soc+bounces-9947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B03759A6DBD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 17:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 646C81F2205B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27CF1F8EFC;
	Mon, 21 Oct 2024 15:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbdNIhiy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFEE47F69;
	Mon, 21 Oct 2024 15:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729523508; cv=none; b=Z0sPdaB7755TPAWSxifwVZ7ZC5NTmh0GVaYR7mGczPPjgejtlhItmFdlDcB7+F+zKxwEU3jzrr03s0tDb95hEkwt7rNgmqXbwXV7VXmpCpQTCeaMeI4t9DBsVd2sSj0nyBmj1DVtPHp+OCwvpvI1j16hAF9DP+P7FwvL9xEM4os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729523508; c=relaxed/simple;
	bh=gVN6Hc0LCjlTvsdRC2MJy0ZweuMThirJY3S3dDqn65I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqi7Tnubdjsu/qjqvwqrqXjmyMTY+bzos5+/6QvWI/g71ldipu09VYIb2MfW+n+y/p0TLGu1W6AbZ0id/oYDnOB3IL5pHJljoyhAS658Zp7KYJOapnsu7uPuc4+tJ6DrGUjHxHtfC4XioK3nnM/2w3p21iIBx7k24bEj9RAGTlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbdNIhiy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05D2C4CEC3;
	Mon, 21 Oct 2024 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729523507;
	bh=gVN6Hc0LCjlTvsdRC2MJy0ZweuMThirJY3S3dDqn65I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TbdNIhiyR5lAD8664xmXvuteNT0pc7nVjQcFFL2Sc3E6uZZrA5GgRCGCYagIbMKSU
	 iBgsZpcxHPAQUsxShW31zrGGouEU9mvjYBVYP0/ycSVK9lDPD2JwvO7REgYGvSNr0E
	 VGTsAc7QrVVgjEYynrIqfzewKklyoMcrB+xuCFrP6WnsEjXSfuxJTnpm83douqSIKl
	 CejpicwkcGCGC0k/0vGRONx8+yK9Ky7t6RfscxrQqMiUz2pk/SAkG9qvuSUWJpmAWA
	 B6aDwgHh/A+FCsP7lKx938L1Dmnd4/LWTlEC1pBUlYa4X7PsNrFp+NG/STHBii/xqW
	 Ef8cEHZSQ4gKw==
Date: Mon, 21 Oct 2024 17:11:43 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC] MAINTAINERS: Re-add cancelled Renesas driver sections
Message-ID: <ZxZvL37ZdKg1P-QE@ryzen.lan>
References: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>

On Mon, Oct 21, 2024 at 01:56:51PM +0200, Geert Uytterhoeven wrote:
> Removing full driver sections also removed mailing list entries, causing
> submitters of future patches to forget CCing these mailing lists.
> 
> Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to various compliance requirements.")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Anyone who wants to take over maintenance for these drivers?
> Thanks in advance!
> ---
>  MAINTAINERS | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f04cba42a59301fa..97a23cea2729942e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19521,6 +19521,14 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
>  F:	drivers/i2c/busses/i2c-emev2.c
>  
> +RENESAS ETHERNET AVB DRIVER
> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +F:	Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> +F:	drivers/net/ethernet/renesas/Kconfig
> +F:	drivers/net/ethernet/renesas/Makefile
> +F:	drivers/net/ethernet/renesas/ravb*
> +
>  RENESAS ETHERNET SWITCH DRIVER
>  R:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  L:	netdev@vger.kernel.org
> @@ -19570,6 +19578,13 @@ F:	Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
>  F:	drivers/i2c/busses/i2c-rcar.c
>  F:	drivers/i2c/busses/i2c-sh_mobile.c
>  
> +RENESAS R-CAR SATA DRIVER
> +L:	linux-ide@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported

Seems a bit weird to keep the "S: Supported" line, if there is no
"M: " or "R: " entry. I suggest you kill it.

Regardless:
Acked-by: Niklas Cassel <cassel@kernel.org>


> +F:	Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> +F:	drivers/ata/sata_rcar.c
> +
>  RENESAS R-CAR THERMAL DRIVERS
>  M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
>  L:	linux-renesas-soc@vger.kernel.org
> @@ -19645,6 +19660,15 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
>  F:	drivers/i2c/busses/i2c-rzv2m.c
>  
> +RENESAS SUPERH ETHERNET DRIVER
> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +F:	Documentation/devicetree/bindings/net/renesas,ether.yaml
> +F:	drivers/net/ethernet/renesas/Kconfig
> +F:	drivers/net/ethernet/renesas/Makefile
> +F:	drivers/net/ethernet/renesas/sh_eth*
> +F:	include/linux/sh_eth.h
> +
>  RENESAS USB PHY DRIVER
>  M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  L:	linux-renesas-soc@vger.kernel.org
> -- 
> 2.34.1
> 

