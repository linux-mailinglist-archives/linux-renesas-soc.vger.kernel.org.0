Return-Path: <linux-renesas-soc+bounces-16629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD15AA709C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 13:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D62A69C26CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 11:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CA123A99F;
	Fri,  2 May 2025 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="ABCJeatZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB16722D4C8;
	Fri,  2 May 2025 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185211; cv=none; b=ArB6NEpSnNg3ZO3WEfu062+fChqpANjya9myeDq8KCyVcOJHVepbl26vhyPqqugQhQkMxP9W1v6+eW/Dpl2g7e3Qc/LFn6jS5tT/gUggoMMBMivDEplHScSQ2DA3uFsrzbsBglX7pKo4iF7Fx297OGjgx8r6nGS7JAkQVPNbZjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185211; c=relaxed/simple;
	bh=TVu53Z1WcqkvHK42PLg/ZYx2Pnqog5c/hPLqF1GlX+U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EC3CFMraICaDZc6e59c/O0hSsD1cY0oUlT7XNW37fVjEkIgbTZ1N5GzcNWrZi9v87U/HMZnXzy5NdYft+0I2ZqiM2HZP71oDznvO+9TmmBjlSYj3tsrmD9iW2R2UXmUam7+S+F/5a8y48i2SpFABBM0M/sw2eODEucip7tPp0x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=ABCJeatZ; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C5SCq8cDAQvOmVxRz+4lR3dSKFT+fPVPJ9EHwjtoThc=; t=1746185208; x=1746790008; 
	b=ABCJeatZl7e+y/4tDIBDm7ZEfy067J7trF55bWiSXSQFkZzuMXpnf0ldAuG5pVuLsjmrvTBlFQv
	S6AHE+EtZWeTJ17UPh8E+jAj7andxHPMldEhEkGwmu7XWPJOayQkd6DA0mAqpQ48Vaxsyhqv3NXJ4
	9KoocFFuCj0unJZ6anrnGmGeIIw4zA2An0d/iTZMivfFZ8Tit1DivVxVdX5cWELZ1W4lXnm2HAoD6
	bWUKl5LxieJcTFhP6MWjsGMyZDa9HIyILXRiCK2kdDvKDbosmhenRzIUcETlE190wFCYjTf5KwEDZ
	8MhnpcQe0/mOKk+pOd2rcSQY3yzHQYFv0uGA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uAoXW-00000003SY7-3hnL; Fri, 02 May 2025 13:26:46 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uAoXW-000000004hl-2hzp; Fri, 02 May 2025 13:26:46 +0200
Message-ID: <616fe930c9a38f3a0c4ac23f92287481834c9a1d.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] sh: ecovec24: Make SPI mode explicit
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, 	linux-sh@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Fri, 02 May 2025 13:26:46 +0200
In-Reply-To: <CAMuHMdVRU4LVKF-PMjWgnx+dyAUoyYkD3SFXjLSc=niZnkhUsQ@mail.gmail.com>
References: 
	<430f42c458dc8e514ae678099b298cd41a050fb9.1746184374.git.geert+renesas@glider.be>
	 <c766ba851cde51b70c8516b921c5d1e2dc30c198.camel@physik.fu-berlin.de>
	 <CAMuHMdVRU4LVKF-PMjWgnx+dyAUoyYkD3SFXjLSc=niZnkhUsQ@mail.gmail.com>
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

On Fri, 2025-05-02 at 13:19 +0200, Geert Uytterhoeven wrote:
> Hi Adrian,
>=20
> On Fri, 2 May 2025 at 13:18, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > On Fri, 2025-05-02 at 13:13 +0200, Geert Uytterhoeven wrote:
> > > Commit cf9e4784f3bde3e4 ("spi: sh-msiof: Add slave mode support") add=
ed
> > > a new mode member to the sh_msiof_spi_info structure, but did not upd=
ate
> > > any board files.  Hence all users in board files rely on the default
> > > being host mode.
> > >=20
> > > Make this unambiguous by configuring host mode explicitly.
> > >=20
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  arch/sh/boards/mach-ecovec24/setup.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/ma=
ch-ecovec24/setup.c
> > > index 6f13557eecd6bb21..a641e26f8fdf7369 100644
> > > --- a/arch/sh/boards/mach-ecovec24/setup.c
> > > +++ b/arch/sh/boards/mach-ecovec24/setup.c
> > > @@ -825,6 +825,7 @@ static struct spi_board_info spi_bus[] =3D {
> > >  /* MSIOF0 */
> > >  static struct sh_msiof_spi_info msiof0_data =3D {
> > >       .num_chipselect =3D 1,
> > > +     .mode =3D MSIOF_SPI_HOST,
> > >  };
> > >=20
> > >  static struct resource msiof0_resources[] =3D {
> >=20
> > Is MSIOF_SPI_HOST actually the correct identifier?
> >=20
> > I'm asking because the commit above lists only MISOF_SPI_MASTER and _SL=
AVE:
> >=20
> > enum {
> >         MSIOF_SPI_MASTER,
> >         MSIOF_SPI_SLAVE,
> > };
> >=20
> > Unless the identifiers were renamed a few years later to avoid politica=
l issues.
>=20
> They were indeed renamed in commit 1cb3ebc417fe6cc5 ("spi:
> sh-msiof: switch to use modern name") in v6.6.

OK, thanks. Might be an idea to mention that in the commit message.

Otherwise the patch looks good to me.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

