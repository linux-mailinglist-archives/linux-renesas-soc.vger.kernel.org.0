Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF1F42C3B6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 09:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgKYI4Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 03:56:24 -0500
Received: from www.zeus03.de ([194.117.254.33]:56168 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726651AbgKYI4Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 03:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=s9QzhPeX8dJgXEmhPuua0r1ugD1c
        jN1o4B8Qo9YdHKo=; b=JL2lejY6+mxPLqr+A1bw2lLxW7XWv2Gh6rgYwjZ+cNjb
        h3U5hn5/LDos7loG+hLf3mi4i1uoglcrTccDvQ10PSP2ESAk0GhPEVJ7oerA7niU
        V34N80KWTHZnL8U4edskkCbYcHyOxpWJHJwfA/EN8u6PulKyISpCTxA8GGbkA4o=
Received: (qmail 3224541 invoked from network); 25 Nov 2020 09:56:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2020 09:56:22 +0100
X-UD-Smtp-Session: l3s3148p1@iYz2meq0fMIgAwDPXwZjAFYQ5uAAs3hj
Date:   Wed, 25 Nov 2020 09:56:21 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH RFT v2 2/3] mmc: tmio: Add data timeout error detection
Message-ID: <20201125085621.GD1577@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
References: <20201120150647.123237-1-wsa+renesas@sang-engineering.com>
 <20201120150647.123237-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB3692D348DCAA67B40C589C50D8FB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB3692D348DCAA67B40C589C50D8FB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

> I talked Saito-san about this patch locally and we can drop these lines
> because this driver can detect data timeout in Access End interrupt
> and the driver didn't enable error related interrupts like CRCFAIL.

I see. I already wondered why the BSP patch
6f7519552fbed1474561ff423acb967eb03994e3 did not have these lines.

> The following commit [1] is a BSP local patch though,
> we need to set -EILSEQ to retune a card for R-Car Gen3 [2]
> by MMC core driver [3].

So, if there is a non-removable eMMC or a SD card inserted, then we need
to EILSEQ to enforce a retune. Otherwise it is a data timeout. Is my
understanding correct?

I wonder, though, if "Gen3" is a complete description? There are SDHI
instances on Gen2 which can also do SDR104. Won't they need the same
treatment? Then we could say that every SDHI which has an SCC will need
this treatment.

>  - The patch also change the tmio_mmc_cmd_irq() when CMDTIMEOUT happens for R-Car Gen3.
>    But, for upstream, we should make a separated patch for it.

I am sorry. I don't fully understand. Why does the change to
tmio_mmc_cmd_irq() need a seperate patch?

>  - These "for R-Car Gen3" means I'm thinking we need additional condition:
>     1) to set -EILSRQ or -ETIMEDOUT for R-Car Gen3
>     2) to set -ETIMEDOUT anyway for other SoCs.
>    # These are complex conditions a little though...

Well, from what I understood this sounds not too hard. Let's hope I just
got it correctly :)

However, there is something in this patch which makes mmc_test #15 work,
though. We still want this in this series, or do you think it is better
to move it to a seperate series?

Kind regards,

   Wolfram


--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl++HDEACgkQFA3kzBSg
KbY+9A/+K0Iw0KoAhSse6g1BPYOi2qykYWcFbj3Zit3x7EZWGho4BYxCvOvbbA4m
Zwi33RAjIvm1OTmV3Nj+Q9l4zenh0QTga3ZyguX0rEWfviR5qCou6Mxs3wXpcf3E
BP030M9XZphdy2eDkyGskGJNkiXn9Z7ua6/i1IItr+rlnZ/2W+bpPs+4ff/wXXzb
FiySh8lIvntdgsKW8JLTBIi9QfYlEQCezvuLfcSM436wI7/1uEEb1w/Jo2OlaHwM
o7ljdqlSvEI6oee1xBe2ICRnKY33f/CiaEndNIfhuAvmJcO5OyBTiLc+htJhp1P8
AUPGAYEbAjMuN6YfQEadjvdB7dNnzGnOCWuyzwhjdRjbCssoeDVSPbYIQDtYKq9s
FNEXh1Nf6pjVdZaapLa4dDhbHj7x/iNpapu2cwBGMPPOaY7c3aG2K+/kEuJkmv/l
2kuofss+htsP54C/JUHtHVkyjJEJKQOJ5bca+jmhNaW2gz8IfU8CTJFkUcazlLXX
yf4ytDaQUETWkzOljaK7KKmvI56Bz4blgGg6GMjsmfZPq3LJpQWcnXKWMJR0D9jg
ULDVLbVp2RJ6gAEIe7OeiNktdbKIOPj9vkE12hzCe93tpSbH1a8HQDek8QTNaa0v
h//hgJcPKpDdv+37mXHZ9kRhgPa2QoNfX/+MoxXO00gtzxJtLWk=
=XmaH
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
