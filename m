Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7EA83B7C6B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 06:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232790AbhF3ELc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 00:11:32 -0400
Received: from www.zeus03.de ([194.117.254.33]:58310 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229548AbhF3ELb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 00:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=2QIlR14ZkxijDjlRM62rKnOUixTv
        8hUKPSqVOJ19kHs=; b=rS1NlL9FvuZpGHmPegmea7DccaGayRlmLM6eZSOBywTX
        wdVfFQLFX/0qHcoLwqMurqu+PXgsfAVi2bAHFTfoOePZPZi5kRy1dS2h2tUfCsjL
        l1HdNR67TWKVZKyJBCnzhltytXe2am69y+9T5PHFYp4wxwV8VL8NEaJwmPNLK+c=
Received: (qmail 717796 invoked from network); 30 Jun 2021 06:09:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jun 2021 06:09:01 +0200
X-UD-Smtp-Session: l3s3148p1@uwqg4fPFqtQgAwDPXwaiAGDoJRk6bv4I
Date:   Wed, 30 Jun 2021 06:08:56 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     Ulrich Hecht <uli@fpond.eu>, Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: disable tuning when checking card presence
Message-ID: <YNvuWMjr+Hnl8abE@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulrich Hecht <uli@fpond.eu>, Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqkW9uwtJyWPFKggi2AJMtO4NJLW-6hviWgGSfoHyDm1A@mail.gmail.com>
 <bbfbed66-5058-1263-159c-dabd345286c8@intel.com>
 <563832257.373371.1624260736936@webmail.strato.com>
 <5adc8601-23c7-4378-94e2-cb3641d9039c@intel.com>
 <YNBJq7Lrtlc/qExN@ninjato>
 <b5062770-ba5c-32d5-15f0-505a09bb4a2e@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ShEBYf1wyxmP5cwZ"
Content-Disposition: inline
In-Reply-To: <b5062770-ba5c-32d5-15f0-505a09bb4a2e@intel.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ShEBYf1wyxmP5cwZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Otherwise, you need to introduce a new card state or flag to indicate
> that the card may not be present, and use that to suppress the message.

I now went this route and, for me, 'detect_change' worked. Will send a
patch in a minute.


--ShEBYf1wyxmP5cwZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDb7lMACgkQFA3kzBSg
KbaJ5xAAiOPGJam0MTywU4zQ2zXS8OVjJbZMrxEkJvHykWFoCtAIED+9pfn5+z3Q
noMVERS8ZkN5gMXSyvqtr8Yng/C3LvRMIJzel3lw2a7sz6BDAt+2iJczD+A671fU
RbsCM2L9rd7EXsdr9ARRQNLOOINH7fhMVuXClzET43ME8vl/C5VuCxHsoeewOpY/
hPmg+rk3K2z2eB7EWmalPuJIQpX725Dp6AWNYCuP2Td65pp78qYKyp0zksG+3yIf
aEAvaPv/iBcXeBCufvA8S1oVwXFp7xQdEQd5HKi/l2ox0bbGVS2/bnz3UK7u87JK
O59KQIlD4pqpFgul4yQp1BuKUm2oBbcBKQ5H+xaWrEpoTHptbdx6oDpEKjRHz9/x
IX00gdgPxaiJJC+iNCbzPk4GOyDbjQdOjnGzv7ALSWH+h44w2ZQmd/7YBFP19Y99
v18rrolzeS5TBPq+zP/iAKmoYhSxPxZnsH50BdCgDxQRqWO8yDzOTrNHjF9tXqL7
Lz9JA5EiSmqZNAfBh6/2RnCpTHsRXlUwWeWkn0D4NKd2d4tCI39vmEUl0FMHdcOh
kS3AO2oYMarS9R1jOboCBOoz4GwfA874rb7gq7HgQGbqFlZw4oRJ2oSYY5Hw9Fo+
c8ffYz+7dX8wuiazzeSOXPyc0CnCo+I6jM8y8p5VKEAVvvLUFo0=
=nC3f
-----END PGP SIGNATURE-----

--ShEBYf1wyxmP5cwZ--
