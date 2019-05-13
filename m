Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC5BF1B762
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 15:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbfEMNvR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 09:51:17 -0400
Received: from sauhun.de ([88.99.104.3]:40712 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729465AbfEMNvR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 09:51:17 -0400
Received: from localhost (p54B3324F.dip0.t-ipconnect.de [84.179.50.79])
        by pokefinder.org (Postfix) with ESMTPSA id 745163E42F7;
        Mon, 13 May 2019 15:51:14 +0200 (CEST)
Date:   Mon, 13 May 2019 15:51:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "George G. Davis" <ggdavisiv@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "George G. Davis" <george_davis@mentor.com>
Subject: Re: [PATCH] serial: sh-sci: disable DMA for uart_console
Message-ID: <20190513135114.GA20443@kunai>
References: <20190506194233.GA32430@vmlxhi-102.adit-jv.com>
 <1557413011-1662-1-git-send-email-george_davis@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <1557413011-1662-1-git-send-email-george_davis@mentor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2019 at 10:43:30AM -0400, George G. Davis wrote:
> As noted in commit 84b40e3b57ee ("serial: 8250: omap: Disable DMA for
> console UART"), UART console lines use low-level PIO only access functions
> which will conflict with use of the line when DMA is enabled, e.g. when
> the console line is also used for systemd messages. So disable DMA
> support for UART console lines.
>=20
> Fixes: https://patchwork.kernel.org/patch/10929511/
> Reported-by: Michael Rodin <mrodin@de.adit-jv.com>
> Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> ---
>  drivers/tty/serial/sh-sci.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 3cd139752d3f..885b56b1d4e4 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1557,6 +1557,9 @@ static void sci_request_dma(struct uart_port *port)
> =20
>  	dev_dbg(port->dev, "%s: port %d\n", __func__, port->line);
> =20
> +	if (uart_console(port))
> +		return; /* Cannot use DMA on console */

Minor nit: maybe the comment can be made more specific?

/*
 * DMA on console may interfere with Kernel log messages which use
 * plain putchar(). So, simply don't use it with a console.
 */

Other than that:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Much better than dropping the properties, as Geert noted.


--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzZdk0ACgkQFA3kzBSg
KbbUJg/0D+EF6AyzLCGEPsV3puYcRKlpa9CGvd9V4bDHTn0Ft4v3pq+VR8CZg8Xc
GGERKTh4+uu5SAFeYT9ZamkFLTBcyrzJ+qJWVuSmkZROJg6OlRn10tMV5Vw1L5PY
O4IHapY707vQb6c9Sey6xoF15n7sKWD3HeoNyTDKwncPPwdDulsri2Q0WLIwrq3T
L5T+wDTVlAW+Vbw4TA3FBZVjWjWthT85hpTZW802YWyA+ZJMwS678BU6eL7UZFwN
+/raK/zqcTfyoY3vk03nG82BIQeZ4IVenLo7F9eXSYUY2d0JBzBbPqJOqINy2pbD
j1eaOap+xS4TmlDNRSI9mIJb75AQXNaVz47P/tCQmLvJnNsFXREtzTlKT5pk489k
FNQ0S1wpAf2clOUr+of53LKKnK2nS5vtWnoTcIE+g8dOztRDn2WkW20Ly0TgF8e1
UPPOeoNkdGzeHHOQh0CA4yOlaKef0CV/WpxLTtRmlP+hPkyQOSbyYeVkipVd7TWu
wwVBCSkIzUPnv6Ybmrrp0B0T6F5pZ3+c0Gy9SZH895dzYZF3ybnAqrRQ/T62UBvV
7birU3vYq5sr4pyoQtnsrF2pAfcJecMcGem5WeQlbAlhRUkq7k89BJ91FNf73blL
QsZr8CAATc7aCb/7Cj8O38Ify07O45dNe/djQ25GyP+rfrL+OA==
=7vLz
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
