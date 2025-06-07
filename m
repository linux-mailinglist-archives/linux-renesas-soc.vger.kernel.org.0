Return-Path: <linux-renesas-soc+bounces-17936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1007AAD0D90
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Jun 2025 15:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1A5B172FF4
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Jun 2025 13:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB24C1FBC91;
	Sat,  7 Jun 2025 13:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="BHZfiSeF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957DCA5A;
	Sat,  7 Jun 2025 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749301746; cv=none; b=WH2V0zmYtOZhklRyF/xJBHzOz9CAxnGADwZqNIVDYdYHhGVFZ+pPScWuMg58/TRFEWKY+dz/06hWfO43qQpeZ7fyArORPzWT3r/viTaBu1OQNDMh24OgUwmzSLo3r4EnxPb/41SMX70OxQrdFwWsqavJNyNRxVYqL5VtdvMgeak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749301746; c=relaxed/simple;
	bh=PvDMXouBiecHrvxx2Xohozp4qwovdV5idHEQUOIMmxs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rv6x3LX5McvllGxfKmjuS5dZX4vFafCB0EJGMv8NOVsS0XEOhvpgdelhEWmvn5hZQCj82PzDK/aMIuOrw5V5I4XG/YBxrd/STxljilv6C+4PxkjUpAXMII8qha80E+W8U5MBHGuuryHymRiXIvZO33DtWXh8P0KjTv+5KMCBUkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=BHZfiSeF; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kSJhLDE3C0fmzlnSBVXMsxH/IsHASEZfW2DU5E2IPJk=; t=1749301742; x=1749906542; 
	b=BHZfiSeFgOoBToLGM/eZFPwPNYo+F/HNtZpNYXqrkNtS56CIdcBT1tuvhTnXb8Mlo82SZYu4ejT
	ul4AudHdOFnHYd7FJZ0aLb9Umi+zWtLFx6aPfkrrvyPRslHaX3TaVTFhrO2OTbDo6dcz3M9M7LvL4
	MvM91HLCM5pfjxZfMlKa+UVGVIZuOTdtXTYNai4P6ieSsS5CVd9sgnjMF10qDdB+VOM7CAeq9zde0
	1Za3vJoHd2MuZ/v177En0X6emVFPtmKb0CFVbx7gVvSJ1UPTGHbRSdo0k+ADw/kSS5FkC2XfgdA+z
	6SwB1//T2dPJ1r3d79TG/b/0B8MtyEVHtM5g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uNtIC-00000001nvi-1EU0; Sat, 07 Jun 2025 15:09:00 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uNtIC-00000003OkQ-0L9p; Sat, 07 Jun 2025 15:09:00 +0200
Message-ID: <1bd561fc01d6164af3bc3e007cfc5bfa1ef5800c.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] sh: ecovec24: Make SPI mode explicit
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Yoshinori Sato
	 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Sat, 07 Jun 2025 15:08:59 +0200
In-Reply-To: <430f42c458dc8e514ae678099b298cd41a050fb9.1746184374.git.geert+renesas@glider.be>
References: 
	<430f42c458dc8e514ae678099b298cd41a050fb9.1746184374.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
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

As mentioned in the previous discussion, looks good to me.

Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

