Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFB43AE494
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 10:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhFUINo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 04:13:44 -0400
Received: from www.zeus03.de ([194.117.254.33]:48670 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229618AbhFUINn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 04:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=6P9+vWbqpK4Rrc+xE41QtU8PsCye
        vid6g3Ps1Xsxl3w=; b=EAsr5edO6ko2eeXYrDlF1fqJdY9o/v5oRHS5Ffrjs/FX
        yY3eACzyHDPitCf+2AJQ2O3O6UfqBmv9vkJmZHm8sqPbdfzilxlUpGS0OVI9Sau2
        DDOIFMDfGdBU8mDETOudPRN6o/pQKTpVVsE1qlqged6L+702uFA6Pje9rVK7umU=
Received: (qmail 1677946 invoked from network); 21 Jun 2021 10:11:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2021 10:11:24 +0200
X-UD-Smtp-Session: l3s3148p1@vDAiOELF1qEgAwDPXw0TAFEaPzFK4KbN
Date:   Mon, 21 Jun 2021 10:11:23 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     Ulrich Hecht <uli@fpond.eu>, Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: disable tuning when checking card presence
Message-ID: <YNBJq7Lrtlc/qExN@ninjato>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nzX32ayOEVmc3Wjk"
Content-Disposition: inline
In-Reply-To: <5adc8601-23c7-4378-94e2-cb3641d9039c@intel.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--nzX32ayOEVmc3Wjk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +			pr_err("%s: tuning execution failed: %d (this is normal if card removed)\n",
> +			       mmc_hostname(host), err);

Hmm, an error message saying "this is normal" doesn't look like a good
option to me. Can't we surpress the message somehow or even avoid tuning
somehow if the card is removed? Sorry, I can't look this up myself right
now, working on another task today.


--nzX32ayOEVmc3Wjk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDQSacACgkQFA3kzBSg
KbbTCRAAkt8hmOhk5jAIg2gP+fbXHyL3dq+ylTr0TZCa6p1a48YDgw7j8vjGfohA
ZdEacyhDJajo6ao8DAplxfMJ5BN+TH3dwXJGCA7hcXBQct8Y6MflYuttTau1PSVo
PWjzvf3WfmU6879rzlellQ3ARdnLcEe9YBcbNMWy7nbNvCrPR6D9wLM2vnNA+dO6
z/8dYw4iWAs6CU6ODIBDTez1jmeFexH3FPRvDyDD30Hevgz4VfXi1sISqNTAFRpl
bFnkOdcEPm2xkR1A9OAkPZDenHf5uZ4fhugL5zpUy1o4GyzVDA/fYVXyM0dnTWzE
0rJ1S0K1MR0ais2OyCtehYB8qIzcWX2tyyvoIAugy2+nOYVtmynENxFMv8W52kZ5
nlW5P16lD36Wdfyp6qJqHlPOMAQNv2nAX1abyuvBlZHU8pjE0mFJdQ6HjZkiHsTi
efRy5mkC7CMYas4qtblkUo37PxHAnRNKKp/JFZ7LN+vgrY+HZXXOkFm3KPm7heGm
Z78A0PfqX8leCzBWz6UoFq4uMwNQ14aAMz8wqCDb+WrjJfduyy1XwwYpWkgI8r1S
zLYQE1AxjZYpDTAAmK+elwWtQGydvI9yDKWth/HCENQpt63p3pdzSSaLjCKLgK/d
THr7lQMpVuLKB4SAzBojZmpV9pEHw2nQifbf5C/sOogwfR7uiZ0=
=EPNz
-----END PGP SIGNATURE-----

--nzX32ayOEVmc3Wjk--
