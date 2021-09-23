Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838214159DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 10:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239803AbhIWIPe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 04:15:34 -0400
Received: from www.zeus03.de ([194.117.254.33]:34586 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237996AbhIWIPe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 04:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=P1K4WFzqVBCfGfvG7ONdFZD8bOdv
        N2bmJ8xRPqUY1lc=; b=Ue+H5jx8fDZcN2sw88R1ct7BqXWKgwwk2816i8VoSuII
        5BR5QXQOczOmkBiLJKV7jr75EwDGb4TclW40MYjtqoP+bxXfpFGW1jB2kJ6WFfDp
        1t6OIHkrLZuo4YY9FMbAJ4GeNh6v51CVbY6xOCumZVY75SQOG757Y/o+abyCn88=
Received: (qmail 3544687 invoked from network); 23 Sep 2021 10:14:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2021 10:14:01 +0200
X-UD-Smtp-Session: l3s3148p1@ClUYNqXM3KIgAwDPXw+uAD4EFbbNt2H0
Date:   Thu, 23 Sep 2021 10:13:52 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/3] mmc: also abort tuning with CMD12 for SD
Message-ID: <YUw3QMa07jOTB4wO@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Avri Altman <Avri.Altman@wdc.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
 <DM6PR04MB65756FA165B1263AFCE45B2AFCDD9@DM6PR04MB6575.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mPxYo/fkNlC8Yls/"
Content-Disposition: inline
In-Reply-To: <DM6PR04MB65756FA165B1263AFCE45B2AFCDD9@DM6PR04MB6575.namprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--mPxYo/fkNlC8Yls/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avri,

first of all, thank you very much for asking your SD experts and
providing this valuable information! This is much appreciated. Sadly, I
have only indirect access to the SD specs and more advanced measurement
techniques.

> "We are ok with host sending CMD12 to abort data transfer when they
> discover failure with response / incoming data. In both SD/eMMC spec,
> stop transmission command is allowed during data transfer phase
> ('data' state).

Yes. The spec is clear about the data state.

> Sometimes, the CMD12 would have been received by card while in 'tran'
> state. As long host is able to handle the 'illegal command' error
> indication for this situation, we don't see any other problem.=20

Confirmed. The call to mmc_send_abort_tuning() returns -EILSEQ. But it
still makes the card work. Leaving out the call to
mmc_send_abort_tuning() gives:

	mmc1: error -5 whilst initialising SD card

> Per SD Spec, CMD12 is allowed in 'tran' state only for SDUC card. In
> non SDUC cards, CMD12 received while in 'tran' state will be treated
> as illegal command.

I didn't know about SDUC. The advantage of the approach Ulf suggested is
that we can distinguish the type of cards in the SD callback if needed.

> However we could not understand how aborting the data transfer is
> helping host to complete the tuning scheme and have successful read /
> write operations."

I also didn't know why. But read on, there is a pointer now.

> They also think that :
> " we believe this hack was added to avoid the data transfer after respons=
e crc error...
> Receiving CRC error with the tuning pattern would be normal as long as th=
e tuning was not complete."

Yes, I get CRC and CMD_IDX errors for CMD19.

> My 5 cents are, maybe you should try retries > 0 in sd_send_abort_tuning,
> If indeed it's a crc while tuning is not complete.

Interesting. If I do this, I get a timeout error from
mmc_send_abort_tuning(). And bingo! If I replace mmc_send_abort_tuning()
with mdelay(100) the card also probes fine. Also, if I skip this patch
series (so abort_tuning is only for MMC) and add the delay in my host
driver, then the card also comes up. I don't think, though, I should fix
it in the host driver.

Is there a delay defined somewhere which ones need to wait after a CRC
error in tuning? I couldn't find it in the simplified spec.

Thanks for the help again,

   Wolfram


--mPxYo/fkNlC8Yls/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFMNzwACgkQFA3kzBSg
KbZJjA/8DKMEtZ9snVtx0MTW4EDIEhPfQ6Am3h4vOxrz36F5GOCdBU28+OoOyFbt
otus8MnotOLID3bGk09gN0kZ3nB3AUEUM3fkKwo6sO7ojfsf2v2ETODu/yQBI3rC
0ZFofnhDaav2YYQroDXQrn8vI+a25sWlXYS8bjFz1asJspwVlbwW7xbNXCySXFHy
GGwHW9prDV5BvRUXXSfscWrPcI0D4J1c7irQB5Vm9MTnxxvkZXoDGwjJ8hyPW1rr
esldyYBsb2/gYvwn65DhgHyf7JKJNqPyxzg5VOAf5wGzY2yeCGLAYEA5ZSzUJNe3
quZlsZ/sf4+sPqLi0YVCoCDcr+bEKnii4WxirNlVqDKYyqEz+Q8Qp9MdrQkOQM+s
92f3X2l2frtfgITe0o5iQax9AMm31/inmtZbzBpsKAYyrm3K9PMXDpkcBc4ofvz2
769pzV80NJay9RIYf9acPowFN5pK551BhxH73N8ykyVzIEZ/HnK9bmzKUfEIeD81
u7ExKGDSdMk4x/qz4j3/PjexgaFVSJVgBoLfbIQbWdVWvWcqDqTnwxLkpRvhzO+1
wQXY5ZthGAYlsrV6G4udPlFi8GhEUNfe6BrKH3vnCv5qRcYqlC3xkHjkiof6mQ+7
jUis/5HhB2uX0zv4tI70DO8s27GdTfZ+yJ23rjetVO5I7LiSQYM=
=GjHc
-----END PGP SIGNATURE-----

--mPxYo/fkNlC8Yls/--
