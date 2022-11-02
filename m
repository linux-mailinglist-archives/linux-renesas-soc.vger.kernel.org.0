Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69859616D45
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Nov 2022 19:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbiKBS6u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Nov 2022 14:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbiKBS6m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2022 14:58:42 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14A81054E
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Nov 2022 11:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=CVQfVYsusTV5YbUJ5tvTqTLZtBuv
        1EJx+Rrd8GG7anQ=; b=1xiFxe0w0wQTs0c8enDJAUONMjRN68BrLfGZ0Yafplq+
        6+MDrtD4H95V3mEcckyDQqZ6JmjKaCDfHguZmM5YxVetUufY9eizHRWAofcbB1/p
        XpFVEXCMBwkBq+2rCWWlmuHhfVsVySaeONBiyKpblbN/YDxpjIANc7dJFNDNHg0=
Received: (qmail 2321701 invoked from network); 2 Nov 2022 19:58:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Nov 2022 19:58:32 +0100
X-UD-Smtp-Session: l3s3148p1@IBUfbYHs6qAujns0
Date:   Wed, 2 Nov 2022 19:58:29 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] mmc: tmio: further cleanups after kmap_atomic
 removal
Message-ID: <Y2K91TZLLJhwsHfH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20221102125430.28466-1-wsa+renesas@sang-engineering.com>
 <5b882121-f129-4130-bd5c-507072463a41@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WUhn73sTmuvknFMo"
Content-Disposition: inline
In-Reply-To: <5b882121-f129-4130-bd5c-507072463a41@app.fastmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--WUhn73sTmuvknFMo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

> I haven't posted my PXA boardfile patches yet, but after that
> series, the separate tmio MFD devices (MFD_TMIO, MFD_ASIC3)
> will all be gone, and tmio-mmc will only be used by SuperH,
> Arm MACH_RENESAS and MACH_UNIPHIER. I hope this doesn't conflict
> too much with your work and instead opens up further cleanups.

Definately the latter. You didn't send the patches but you did send the
coverletter for the PXA work. Just skimming from that, I see potential
for more cleanups regarding the TMIO MMC/Renesas SDHI driver. Looking
really forward to it :)

Happy hacking,

   Wolfram


--WUhn73sTmuvknFMo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNivdEACgkQFA3kzBSg
KbZdrxAAlLEeSXQqKM9gJF41Hh/zqHFdLe3eCcmPDDAJaRnToutnTxfVFP1l0Ri6
tLNshAV22U3H97AJ/ejcVdyP6uacHE4ZuEWISwaF+vEiFrgsRYesyE1sYYF+btdj
Ygit1wPd8mymZFBmbQBFdWyGALvVI0HKlk2zASODz1d3T1d3qBibhUXxEDnMYCR0
HuJYiaER/zHv9xgoP4ufBHjImUBV/JuSHNbiqAVAKWoptCQ5tHph5HeT2ekIeKWh
aVbL4MUB3XqQVIvUJGP1uAu7M32M7OQtFVA6PkdYtzEzjAkxtU9R4e/y7G1UeE/n
/tcf/FmD2ko71x/clUUkfwGGRbI8/H9Oeu/1IMaxryniUn4I8UX9gwTqWWhDA+wq
dM7f27MoiM/HbCjtyGX0Js6Ba8UB0RJN80mkns02UONhs5U0jjv2W3eU9w6jEw5E
/DvayBZGEoL6rr106we4LwRHLK+qudOjDHY7j30d8TLeZNfHd/3/iWXMHmCsXzxe
JjCGgjaHZBFPRoqlj2WA3b9j4Z6MkeyimIYp2tHnzmWIK32f8NRVGu+oswGE/ys0
oCQO1YovubJAlm+0ZUDUyB5U3/T/1QXvTQNEBNpk2hQgW8zydZNqawrasnBLnpDi
t/chn8fkqJGDuRS8LZFlULXPdEPy0xsG422lYxKYvzskmA9BZuc=
=aYCi
-----END PGP SIGNATURE-----

--WUhn73sTmuvknFMo--
