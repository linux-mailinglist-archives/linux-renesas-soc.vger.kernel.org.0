Return-Path: <linux-renesas-soc+bounces-16626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B34AA7088
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 13:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9ADA16EBD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 11:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279EB225795;
	Fri,  2 May 2025 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Td1EM8hb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FB6216396;
	Fri,  2 May 2025 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184685; cv=none; b=InH+nUm5iOy7xNcV2A2EL68kBWeVDh7RxPZz/telGchvAAcRNc+aj56Y8v6ODIC9+gsNw+n1VSsSxDH5/9eY26tdb+oSOXvwyobUZmTvdp25p/c5KeYJkss4LBtUOnPwsq5F70SWPZS81gn4By2IzQJ0YF0gbv49OCgUVsG5ScQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184685; c=relaxed/simple;
	bh=H/TEiSEJ6/9hy9WaT1RKrLQ2PaMZq5NkX/3l0/t7cYM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aPklkiM2WVGO6T7xtIXvVr5DiImSkxZgaFHNA2n13A++6SffTUzT+IcMnFil02OTgAogy4JXWgM+uTj6vihsIne4/lOnfUU+5l0FW0yPLQ0IzDbBxM6E7M+s8wahQqI2xehHtTJpxbIdkj8/aZ2d7dLrfgVaxslA1/sXM2VFPNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Td1EM8hb; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=adW5IqgZk+OZ+NrINndgbeRu5RdBlWXgWDAdmJGwG/Y=; t=1746184681; x=1746789481; 
	b=Td1EM8hbcOfmFV2tPaSr+b7k3vbrcSnBIxjJ6BBgZ08oyDPZUObsUPmQlayy7jv1jWpNT3S1r4x
	gEuNEqKjVLXs0piIxO6YvctYqFuG323aGQqLY+nAZ+7mTq0BggzjhFmAMufZrQdwZTytUZUEhtlRn
	aZlTtye283eDNcP1+mfB7KTDENUTQ9whQzuLLVlajsWzleOkvlq6FD8XYU2+DGhh1Bh+IKTBeo40I
	ATLbzxeUhvbsUnaeF9Yt1qlwehaQfaNvUTEq9AFPUg/kTWEj43Lbe23hc3oE1KpnqoVYQPDsvrL6Q
	YhRs2/Ory8Psn3dz0j0tsNVSXy95srjaaCGA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uAoOy-00000003NaN-3P4i; Fri, 02 May 2025 13:17:56 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uAoOy-0000000032r-2PwK; Fri, 02 May 2025 13:17:56 +0200
Message-ID: <c766ba851cde51b70c8516b921c5d1e2dc30c198.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] sh: ecovec24: Make SPI mode explicit
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Yoshinori Sato
	 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Fri, 02 May 2025 13:17:55 +0200
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

Is MSIOF_SPI_HOST actually the correct identifier?

I'm asking because the commit above lists only MISOF_SPI_MASTER and _SLAVE:

enum {
	MSIOF_SPI_MASTER,
	MSIOF_SPI_SLAVE,
};

Unless the identifiers were renamed a few years later to avoid political is=
sues.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

