Return-Path: <linux-renesas-soc+bounces-12731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93917A229A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 09:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A0197A2F98
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 08:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0098E1AF0B7;
	Thu, 30 Jan 2025 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="pqLr2AS6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A7D18F2DD;
	Thu, 30 Jan 2025 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738225987; cv=none; b=WAlYAXhP7B6rePv0aMDnOEav3w5u9zMmLDux8nEt3+h9kyVdUDD3gsRtmw1qXV1eIR4RNLxQ9KTuQda5tBmzOGQsfC4YimfBUKaF0vULVqExDqqRsD7cdeHQ2pht1HXYajVgaeRbTnKu3SRfAnEclWbt20CqZE9ApL9S+SPAbUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738225987; c=relaxed/simple;
	bh=hnQ1v+oMPKp2PMWU6ncam0hpEyuQ7qcl1v7r8Gvx9Zo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KLQm66v9BAUwj8z/n1+LkxWK4g3HK7KHabNzk4y7907q9UWVSz150f7JusHvfVXLLFoF9nmHP3WE7bQk/oKuYBZE+YHSzAk5i0RoCEZTKCXnJ80IsZHFX0iXjBn/VJHNa6c1fCFAoE1gZFcq7RDemFb/eX+IxVEvXcuyKTD2X8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=pqLr2AS6; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N4dgd52Of6FcUlgl8rSDcpg7TYKOfzb/xbujhysv99w=; t=1738225986; x=1738830786; 
	b=pqLr2AS6tvDpUJDC2l0Wih5hTpWYJvdUE3saHvy0pj3RC1GB7hzQ4ynNZEbmtyoRBoiuNpUKhzW
	0FJ5DT/wtO9SIMynC1xH+RnYcX2z58HZ7pnRvyFGH4pWTCDLp8BCphBsB+KdfkEfOMuFY2AiX2iaH
	Ele3idaZ23NPU1IIgVjNkxFpVXHcOtyOBC4u0NhNWVvVRBTthImvRY+wfmshtjOqcCQRX9UNNDXuB
	2OkJTk4w222uvsX6+01E0PlmOdZYz60fMTHUcyjyPl4N3pCvnXKu/W4gY1Rl59UREx4e/lvhVGYTx
	mnzD+/KZ0dOwsTPC9WywZTnNkVFGu9Z2VUmg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tdPyw-00000000CVs-2047; Thu, 30 Jan 2025 09:33:02 +0100
Received: from p5dc55198.dip0.t-ipconnect.de ([93.197.81.152] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tdPyw-00000001jpa-0wX4; Thu, 30 Jan 2025 09:33:02 +0100
Message-ID: <79f5c04056398aac4cb6b4d7eb68c20c69c419a4.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] serial: sh-sci: Use plain struct copy in
 early_console_setup()
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Wolfram
 Sang	 <wsa+renesas@sang-engineering.com>, Claudiu Beznea	
 <claudiu.beznea.uj@bp.renesas.com>, Lad Prabhakar	
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sh@vger.kernel.org
Date: Thu, 30 Jan 2025 09:33:01 +0100
In-Reply-To: <e097e5c11afe5bd4c01135779c9a40e707ef6374.1733243287.git.geert+renesas@glider.be>
References: 
	<e097e5c11afe5bd4c01135779c9a40e707ef6374.1733243287.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Tue, 2024-12-03 at 17:30 +0100, Geert Uytterhoeven wrote:
> Using memcpy() prevents the compiler from doing any checking on the
> types of the passed pointer parameters.  Copy the structure using struct
> assignment instead, to increase type-safety.
>=20
> No change in generated code on all relevant architectures
> (arm/arm64/riscv/sh).
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/sh-sci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index df523c7444230836..1ed13ce2c2952547 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3542,7 +3542,7 @@ static int __init early_console_setup(struct earlyc=
on_device *device,
>  		return -ENODEV;
> =20
>  	device->port.type =3D type;
> -	memcpy(&sci_ports[0].port, &device->port, sizeof(struct uart_port));
> +	sci_ports[0].port =3D device->port;
>  	port_cfg.type =3D type;
>  	sci_ports[0].cfg =3D &port_cfg;
>  	sci_ports[0].params =3D sci_probe_regmap(&port_cfg);

Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

