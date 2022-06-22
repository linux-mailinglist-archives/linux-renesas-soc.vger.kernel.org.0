Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5EBD55496E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jun 2022 14:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357173AbiFVLQd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jun 2022 07:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357187AbiFVLQ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 07:16:26 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAAB3A72E;
        Wed, 22 Jun 2022 04:16:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id BB3CECE1EE0;
        Wed, 22 Jun 2022 11:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCCEC34114;
        Wed, 22 Jun 2022 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655896578;
        bh=tMTA9meN2czeIclIiOAgShr7yIKAOgnCpTndOYpqW5M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pUATFC9kpVwIRTdzsbji6glLE0TrGPunoayWozO3r2+04fGy49+1jX4EbPLczZvwx
         IrAo95I2n30GbTI/BW0MXtrJLVZEdj1sGl6ybAyRufHgYMhvfD1hl/hibhes3jYnW8
         RkpupOOmMIlceXGm0l7xDDLo2gdAuSwVulOqIl4YW4ANPJj+y8mwmUTXmWfVYSRCiS
         x9puLv+b+0K7dw8xV0zgypHrtCqjqFvf9N+uIC8qBdItC5iTYonNYbmgj0qQnEj9eD
         4H2mXvciaOm9kZlUL+kRxLGq4OreCsWRwKZx0OMw3IlYM8GI9AjSadFUg9KDNYQoFT
         30lUbSVZvXUiQ==
Date:   Wed, 22 Jun 2022 13:16:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
Message-ID: <YrL5/ZN5qU2w+uRK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
 <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
 <YrHgOptQ56woMAeO@shikoro>
 <DM6PR04MB6575D7C91E0925B5D498ABF3FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
 <YrLU6/jAZ5lGnL3p@shikoro>
 <DM6PR04MB6575FD5AEE828A184B3713D8FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
 <DM6PR04MB6575DA24CCF398A890129C78FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UMw3NYlBKlieYLVM"
Content-Disposition: inline
In-Reply-To: <DM6PR04MB6575DA24CCF398A890129C78FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--UMw3NYlBKlieYLVM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Avri,

> > > which leads me to this call in ufshpb_get_dev_info():
> > >
> > > 2622         ret = ufshcd_query_attr_retry(hba,
> > > UPIU_QUERY_OPCODE_READ_ATTR,
> > > 2623                 QUERY_ATTR_IDN_MAX_HPB_SINGLE_CMD, 0, 0,
> > > &max_single_cmd);
> > >
> > > And from here on, I miss the UFS experience to debug further. But I
> > > will happily provide more information if people give me pointers.
> > Ah ok.
> > That's cool - HPB is enable on your platform.
> > For some reason JEDEC didn't merge the HPB amendment into UFS4.0 - and I
> > forgot all about that attribute.
> And the source of this error is that your device does not support HPB2.0,
> Which is fine, because HPB2.0 support was removed a while ago.

As I understand, the UFS core needs an update then? If you CC me on
patches, I will test them right away.

Happy hacking,

   Wolfram


--UMw3NYlBKlieYLVM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKy+f0ACgkQFA3kzBSg
KbZC/BAAr5WOTjNVprF5QAvo3KROFxn0Rr0jwxY+lUUR0mGYSzzfYTCrxLAZ5NwW
dsgGT/wEQkYqEyQy7cQYyX338QnIV5rmEyXfWJG/VvYMJSXoxGyKk7eyuFHKdFlN
tSMBLsJUfMItpPLkvfGZl0gcLMAo94O1Ndxf68G6MUJkR2gvbUdVdjA8WBPWuJAk
QAObulCAHK8W2vKxERPkmvC6GE323+Af8DSF2rEXEIGCBCrmqFu7y5AKHvMEnjcc
9UcIUc1M+yuWZmtx40Mjw69Cc01KEf076cP2FxwO9R+h7l2ihjojAepUAabLFcjI
DbuKaXJ5aKILY6B5ngJsiOc8RVOlPK04c+fSQ9TDq4wG5S8gRejq8wP1prI9Twuq
tfPeyVw6DUZy0yvH4xO0UBlPn/C+ZOV+/qRwYbHMB90cXTsIeeckleFTdMiZBII2
B6Gx5D1ldEt4Sv8o4PDUMV8AWV2pRsqk0C8oQMuKf7s6NhrZpA2kVkK8mnNWNE+d
9abLFBir/Pjpcgz7QA8KCF0rcIyO22XOt4Ny9cyGQRG1QLR38lH8EP3ht/SRSsIY
GdGEZ9+Jtvjvk+y/7FkrP/wYF9/eQDzxEim9ypUN17yQ9ZCY3jnrJ/AKExIxsP+P
X1f28fEdLJmIv+FGSv6yXWKHh8m0WpdHv/NC5p38ZmDIKSeZt8c=
=drAy
-----END PGP SIGNATURE-----

--UMw3NYlBKlieYLVM--
