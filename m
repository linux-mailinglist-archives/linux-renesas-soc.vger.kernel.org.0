Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51EC361337
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 21:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbhDOT6e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 15:58:34 -0400
Received: from www.zeus03.de ([194.117.254.33]:55728 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235143AbhDOT6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 15:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=5tovTDeHzPj5ExlMjLt8c1ercRbv
        AUu2n5q1aCiAdzA=; b=VwzABQ93yopWW5x95q4ECHi7JPzuwu36Ba1b3S4BWcGH
        YI2LSHNFxCE0B7ArAcjUT0ClCTeCbOrgFkBCPmWmtlXw2nw7iJxDS1QAqCLI4a6Z
        ORPr7qI+bqKB+TGFk5ggBRX7AdLlxLzutIFt1dhEmtHGZc+0g88AR9UzYjd3AI4=
Received: (qmail 1887231 invoked from network); 15 Apr 2021 21:58:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Apr 2021 21:58:08 +0200
X-UD-Smtp-Session: l3s3148p1@8e5FSAjAxJ4gAwDPXw+xAIyDzo7aEHVj
Date:   Thu, 15 Apr 2021 21:58:07 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2] mmc: tmio: always restore irq register
Message-ID: <20210415195807.GB2360@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210413083137.11171-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqZtg+hPf74_oQ0ugEsS3yRzbAQbpnirsVr4jOKMXo2gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline
In-Reply-To: <CAPDyKFqZtg+hPf74_oQ0ugEsS3yRzbAQbpnirsVr4jOKMXo2gg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Applied for next, thanks!

Thanks for being so super-quick, Ulf!


--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB4ms8ACgkQFA3kzBSg
KbYB8Q//R0o8YmR3YJdJfpyoQAiwBQfi/+ahPT9zyWSGhsCa4o4BHZ2uECiYW5cD
ygByhUDLg+5BFl4EjV8K6h2wIMCYbUjh4dCQP1CensH3rcWA2yqM2iodZtIJvLsV
Zr5nktVj5h8tPk7X0OOwyoQHySLLgmEbHXnqK5voeBiafc+cMxJP+G91sm3yM+4x
yXOTbkbk13w0Btz8IZ3MAstAvRxFBzCyhH7tM0YfO1vrBQWrbnENPQcajDBN5ILU
pNAJpb32xdY9ZqIVyr9GreQpV8bBT4OZ6jO6b855IGq9EqRSEVU1vHs0XiKEWWu4
qTQwJ5BotoKFARnUE5v4QsXUYeTzyhralJaEY8OfbkYAwhF4X8oQIEufjsSFoISg
gRfJ5Q/U8szkNh0ps3Vy0qTlT4i2r5PKSIrOBvd3ZX5fpZqJoU9PEsD4B0tuIVYi
Ia9wX4Qg8eO+gj3RJ+VFUckdjsrIzzg9WzX5WdyL5uYJ6vMx3VQDLApKsy4inBck
liz6ck4DU7a4k4Y2s05whRIm+pzlxxJQ6XhpJUHHVks0Lf0MtWLxll0CLvD2rI4d
qO1IXgkQ3cabiCeX+2ulNmFwNz6gmMDlkKQUWJVuGt8GwzR3DgWHRxsI1l+3Uesk
7CvAMUOSVp3KoIR2SNvcZtiUSV4JoAGc0nHE79KeUefzfi6G4L0=
=L/Mz
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
