Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5454A10CF65
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2019 22:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbfK1VHb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Nov 2019 16:07:31 -0500
Received: from sauhun.de ([88.99.104.3]:46874 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbfK1VHb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Nov 2019 16:07:31 -0500
Received: from localhost (x4db74569.dyn.telefonica.de [77.183.69.105])
        by pokefinder.org (Postfix) with ESMTPSA id 0F8472C039E;
        Thu, 28 Nov 2019 22:07:29 +0100 (CET)
Date:   Thu, 28 Nov 2019 22:07:28 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 4/4] mmc: host: renesas_sdhi_sys_dmac: Set
 dma_buswidth value to 32 byte
Message-ID: <20191128210728.GA864@kunai>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1574403231-18512-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <1574403231-18512-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

Interesting series!

> -	.dma_buswidth	= DMA_SLAVE_BUSWIDTH_4_BYTES,
> +	.dma_buswidth	= DMA_SLAVE_BUSWIDTH_32_BYTES,

Two very high level questions:

1) can't we set dma_priv->dma_buswidth at runtime when we know what the
card is capable of? Either DMA_SLAVE_BUSWIDTH_32_BYTES or
DMA_SLAVE_BUSWIDTH_4_BYTES? Then we don't need to fallback to PIO.
AFAIS, we only Gen2 sets .dma_buswidth in of_data, so we could even
remove it from of_data entirely?

2) Just by grepping in mmc/hosts, I see that no driver uses
DMA_SLAVE_BUSWIDTH_32_BYTES. Do you have an idea why? Because it is the
convenient setting which works for all cards?

Thanks and kind regards,

   Wolfram


--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3gNwsACgkQFA3kzBSg
KbagxRAAjT+tabpNv2so/CUX8CLhHugj5nbuLpTLH7wO83Gsedt3COqxFlsVyKDN
oYqUaUtGd/vuVsa9XXvrLtC1BwB3f9vbeb4k2OAbQhG5VHC/B6YwVv3ZiWTrpv+m
ZzSRy5e/uzgk0gH0PG+YUXjuX9aSPW0Dg0UTfZnPwSodizrsZpyPazLU7mT5h0xV
mhsWCoxuf+ZlVqFDOq/bNmJ6RLQyrCEFfkc0hxTGwh95XFPRYOWjtVtit2Nwdl+R
F+hM4Y+8I+YfjgrOA7ck2U+Z9HbImwWdpnFk/yvmrHo1VS3A1KvrKhPA9FVAQxV5
Sg9nAsVGUGWJrujJCQ7bjAWfdIHtFEx4ePYI2UGLGBuZO86cmICGMRBANW3wbE1U
bhGj+/Rz5XwnFiQoy5jgYu47lpcN4tk45aTD846T2/uqi7wL6sjxwmYQ3WYK0Wue
ScdojHRrhxl3OB9LsoYM4JmFJGoKfl5vEx0XFimSKBuVvgmo45iD+J+2mXjjWq5h
OMvTlTqnkefd+iKFck00ahVxUcxJJj9olryCQnl4O7iW05Z9y/bNCeOT0APGRsvK
Q0otug5OIIGOJyWDyF3f3suJ+xAgGavDa598iRCD2b9hYHbgNlXJeigmoqHIvRpU
/y4XhbURpyx6dRfe1NWzOHnQC8qzs1vAxpiMWnW3zaoyykd3zWU=
=Pq77
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
