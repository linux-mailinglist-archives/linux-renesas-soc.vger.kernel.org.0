Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70821405920
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 16:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346972AbhIIOgx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 10:36:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:48572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240410AbhIIOgu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 10:36:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13949610FF;
        Thu,  9 Sep 2021 14:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631198140;
        bh=3WvRIwVpeyfq0j1sXzeynJnZRS8SyezNEtQxr3hPK38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qqgdmDBG/Fns3u1i7A0XzFuTXxpYaXKQucLMx76M7+ZqS1ktKmorYCP/i/SZxgy0l
         UmydXrFPcVWfv4ao+ygwl3W+/lQYA7tXNdikrmZ/Odzrg4Pu7X9e7Gix/fOmWeezUd
         cNhUAhkIAdwQgUY5KzTdbmSwOCc7RxusBIiG+R+iK9zaHeLBUUyu5tMP+qkiQU2r9Z
         MWNdRl6O90c8eghjehJiZqda/6LOs6Rx3kWnNNHIdhSWjSEbmDLWkjERmFMkEbIGib
         FoVJAGgPdFEP4SB9Ryjxu8Ri0dMYlyk6/ZY359neTF1AUyXBZ3yMS28xSJOnyTUdKv
         +IBfEjWgUfa8A==
Date:   Thu, 9 Sep 2021 16:35:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        geert@linux-m68k.org, yoshihiro.shimoda.uh@renesas.com,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: sh-sci: fix break handling for sysrq
Message-ID: <YTobuY6QL9e7dyIK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        geert@linux-m68k.org, yoshihiro.shimoda.uh@renesas.com,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        linux-kernel@vger.kernel.org
References: <20210816162201.28801-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J8NgKiLIdiyTObQC"
Content-Disposition: inline
In-Reply-To: <20210816162201.28801-1-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--J8NgKiLIdiyTObQC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 06:22:01PM +0200, Ulrich Hecht wrote:
> This fixes two issues that cause the sysrq sequence to be inadvertently
> aborted on SCIF serial consoles:
>=20
> - a NUL character remains in the RX queue after a break has been detected,
>   which is then passed on to uart_handle_sysrq_char()
> - the break interrupt is handled twice on controllers with multiplexed ERI
>   and BRI interrupts
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

For the record:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--J8NgKiLIdiyTObQC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmE6G7QACgkQFA3kzBSg
KbbTbg//SBsGYNRxfyZXzrX2V0ZjytLsziaOOE61d2ipc+1hSPR6bwCWiV/g0QIb
otdJozr4RJonEOaqHN2yGjTK8EwrJjGKtaBhSPyJRu8A1G0h/63hkZ8CRKNb4yV9
Y91Wk16/NFuKedaof8l3VI86b5vAhSS5wmN1Iyh16gOzghmgo5eqOCukJmCb1Awu
h5YNYskA1M+sEPQ2IbhlWzUWXOhFiniiWsQnyUMehreXOkYhC9CofqO8CBnIA2Xd
KvrWvVxrgmZ0Y2gAUlzizo6jHUKCawmt1EjEJnWZSmOAsguFhtsaIdVKsi5Bw7na
VC9gjM+etaVYGVlNU8VcKyNb1scaJ5FAg7wo8mKVS3CnuZMqY+ksRADHbo4OObVl
3FS7jFF6sGvBBqOCfrFV6aXpZ++Llt/1XyPFrn8ASFUqGPIGM5KtWR011NfwVhsf
nH11bzWYgfBCPYA7AupC5pwIIkq3U917PDQSwHpvFIAwGFirPKbQAfZoXmqYOYps
hzK+I81XFGhn+XqPyLN3oYcrxhvQBoplQZtrgGEyhArzMYWOFU3We6OooIDGoVQn
KU9tQ97UmduI8GhFaq3fc+bYj/7qimCCFSl2dg91fPL2c1elcZ+Tw4KQMZIrsdzp
Q/QNm6BcvZZohyzM00T733nXnqB0DCYuG736H7LzMKntmyAu2D0=
=NyQP
-----END PGP SIGNATURE-----

--J8NgKiLIdiyTObQC--
