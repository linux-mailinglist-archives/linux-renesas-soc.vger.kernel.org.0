Return-Path: <linux-renesas-soc+bounces-16628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A57AA709B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 13:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69B3D1BC842F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 11:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0B223814D;
	Fri,  2 May 2025 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="OvDmHi/F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2383A1E5B62;
	Fri,  2 May 2025 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185169; cv=none; b=e0laJCAkaOiIXOVa4H6wUKrK+jV6WeWS+ctaLPDd7Cle73TS9Dzstuc/9aiCt/t8gV16TvNPITdHj4DZnbvive714fj5TTLYAZpTHsNyyHparajHHQWEZpeyO8MNpJAJA4j3DtaaiY+karDK18sfXHoRf22vxNx2AOOWfLWQs6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185169; c=relaxed/simple;
	bh=GvAbP3cX1ukqopkxMBHjqwePnfQYfjJN/4yRXigG9Qo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VroEFBoPQMVQtVwhGpVtxIxHCIAdzIlHx4/3vMuvlEStpd2wWdh8Bcc1OwSOV3pPrI/sE91xr55QZo08x+nzsaQT0JoV36JZA1Z2VFsQT9Sr85B8DP6XIoKo29EH7ETajgwTGcqQ96eSthX8b/USf3bUezg2UphIutxjnyw2Z28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=OvDmHi/F; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sxmutXQh7sBWOBetbNBfbjROvtjMPxO4cDkg2JUREYo=; t=1746185167; x=1746789967; 
	b=OvDmHi/F63Sma3GIacph9IveE4i+vctRxPMiW5pK/cPuXjif+LKmVSSX3tEZKVbLjrAihZ069jD
	s3uyY+wKiPDXSbENkvPkNnNNZ+FkTRHfvhPmmLpOzCzx69DB1pOqxXFvMoLPijEYWM+7240C//ne4
	5UsQyBNrG3dbKy+SFsW4KuAQ77zo1yfWCu62kuAWqiOxnc/DyOfZA9sx94JLbjuj9h6kSYlQTaUAd
	s2HHvmrNSlGRxCYQXgz+cUrMMkqHppWc54c/4FmE8RMWt/AcWA+I687AJ9dCvOqjAM4ZDq8V41xg2
	qrmQX1O4B8l+4i6PwebLSeY5QErGcaiZBI9Q==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uAoWq-00000003SSz-2MSQ; Fri, 02 May 2025 13:26:04 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uAoWq-000000004dG-1RJm; Fri, 02 May 2025 13:26:04 +0200
Message-ID: <19265edba686ac682e9095fdc50d31ca3632d16f.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] sh: ecovec24: Make SPI mode explicit
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Yoshinori Sato
	 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Fri, 02 May 2025 13:26:03 +0200
In-Reply-To: <430f42c458dc8e514ae678099b298cd41a050fb9.1746184374.git.geert+renesas@glider.be>
References: 
	<430f42c458dc8e514ae678099b298cd41a050fb9.1746184374.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Geert,

On Fri, 2025-05-02 at 13:13 +0200, Geert Uytterhoeven wrote:
> Commit cf9e4784f3bde3e4 ("spi: sh-msiof: Add slave mode support") added
> a new mode member to the sh_msiof_spi_info structure, but did not update
> any board files.  Hence all users in board files rely on the default
> being host mode.
>=20
> Make this unambiguous by configuring host mode explicitly.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/sh/boards/mach-ecovec24/setup.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-e=
covec24/setup.c
> index 6f13557eecd6bb21..a641e26f8fdf7369 100644
> --- a/arch/sh/boards/mach-ecovec24/setup.c
> +++ b/arch/sh/boards/mach-ecovec24/setup.c
> @@ -825,6 +825,7 @@ static struct spi_board_info spi_bus[] =3D {
>  /* MSIOF0 */
>  static struct sh_msiof_spi_info msiof0_data =3D {
>  	.num_chipselect =3D 1,
> +	.mode =3D MSIOF_SPI_HOST,
>  };
> =20
>  static struct resource msiof0_resources[] =3D {

Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

