Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B91BA3AC5CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 10:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhFRITa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 04:19:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:38368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229848AbhFRIT3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 04:19:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67EBD6120D;
        Fri, 18 Jun 2021 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624004241;
        bh=jqwS6iDBiJXSOWn/05eobs8QF6Gg9eW5WUiwoOfUIa4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jhf7C8VzVSchlCEIeQOR7U3OO6zieoOka6lQ8vvro2HaZT5jCj6eqCSB4qZvkH3Iv
         fUY/47GwLxsXDGrHzTWYMlJWH9OrVqsufMvwysPKaNS5xv145buMHsToVnhHtpB9i6
         3UMtrwjzWdUQYpuy83iqBvOdqnDpzTyBhbGgPqq1csUN6i6pyaEJqPjP4i2S7xOl8m
         DG/R3KfaVT+RKXDUKd4Ie/tHBCvy9ueYIXHXG0LR06L7T3mZPGym50gK6kBkZnLyV/
         lzXjdoOc0cx4QP77ybNxAUpoPQiZ0aFNLW8R9DiJ0Y6Ms1yt8rdCmmQxHjwqZPOBpJ
         2+S88klk3Sb8g==
Date:   Fri, 18 Jun 2021 10:17:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ulrich Hecht <uli@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org
Subject: Re: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Message-ID: <YMxWjsAQNt9DG0Ef@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ulrich Hecht <uli@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
 <YKUf9TVcKetApd1J@ninjato>
 <461686971.488794.1622648414815@webmail.strato.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SqUlJqbQK6D0nCb9"
Content-Disposition: inline
In-Reply-To: <461686971.488794.1622648414815@webmail.strato.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SqUlJqbQK6D0nCb9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Uli,

> _mmc_detect_card_removed() calls mmc_sd_alive(), which tries to send a
> command to the SD card to see if it's still there, which in turn
> triggers the retune. IOW, this is expected to fail, and the error
> message is misleading.

This makes perfect sense to me. I disabled tuning in
_mmc_detect_card_removed() and the message is gone, of course. I'll send
a patch right away. With that sorted out, the patch works for me nicely
and we have *finally* RPM kicking in for SDHI. Looks good to me.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

However, I'd appreciate if Shimoda-san could also test this against his
test-suite to make sure there are no other issues unearthed now that RPM
is finally suspending the device. I will also add do additional
suspend/resume tests before I say Tested-by.

Good work so far, thanks!


--SqUlJqbQK6D0nCb9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDMVooACgkQFA3kzBSg
KbbUNw//bZOUNLwYhEu/NNPDSabO0WHMinTTgEGvHPbQCBLh60N/jSSo3+OeFOQx
w+VO+ZMP1IU8woWU3x+f/M3VxTnNwOcMbfHoUsWMyLfJuwXtx0uPL70VdrH8u2ay
VDs5uvbBasdaYYVbZIjvFRzpTKeyH528/Lup9BduLEXd0tRx97kTEthmGL+G0kfi
H9TOASaAjoOneA8AxRQrYNvIOz62D6oALYqdku4hW0lpI5kG2+g+W+oC/Vk4pEhF
ZD1IIldtmfITPpC4d+paCkOqHrXrK6aFnBqK89qjV5bHFvBFlb9URTDsnW+kh2DW
PVcpC8GFC9vRo///KWtzYrAm8UBRkacVw/EN5vPZVV64vjJ2PVOWxoLaBxPmkQy/
XO9Cs1wX4ZN80osuH+V2Jdix9nqI/x95n5BK4tkKpBk9YLqzOALsisYcy9bEdcSo
eGdMNZrxaQ1GtrKaF4nU62tL3Sjsfbe3O149uYRSxid/0MF2HibtcUy7vXviZO9f
cmlP34OXHY71N3hLTLKdO0n68RsCjfJPBUS63urevGM8YWznkSWKWmgWfxcuEmpO
5JFEBMn6AqN2dgY6ggNSgspq01DUD+rLfJ+bct0nl9NQV8N26FmvUJeAXOd16ymI
y3hylGAuu5ka937FpYxx1KRofbLMDh/n4g0Tab1d3aqYta3oGxc=
=iLIO
-----END PGP SIGNATURE-----

--SqUlJqbQK6D0nCb9--
