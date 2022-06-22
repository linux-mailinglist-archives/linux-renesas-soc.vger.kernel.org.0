Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD9E55479D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jun 2022 14:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354445AbiFVIjA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jun 2022 04:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355793AbiFVIig (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 04:38:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA5B2E9C5;
        Wed, 22 Jun 2022 01:38:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 61FD9618AC;
        Wed, 22 Jun 2022 08:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13F3C3411D;
        Wed, 22 Jun 2022 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655887089;
        bh=TBXnTYbMO1KcqUfe1FmCMCJGDaSopCCEE3/EmlShD/0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RNnDoacnz9Ii/s6yiGMYtckqQRrdtVhK9Z96AcjqYoVvQ5A86GsJLrXnN1eARyQr2
         QNgeBDT+H+mqSz3S6x5DygUGyxbhToBC+E0aiJYdCxl5hbas3TdbbTAuOnmQVukOaG
         KdCD2x2sBZi2tDwuPknXhryX8/WmeRKkV6QXX8m3Pvbu5sbgshWfoPkvBnBdCXEHsd
         wcvujVKDFm2WpwhC+zBfg4NQd/7dCW67i5K4YDw59MPux6Nj5ySEPNdkahfZAmoGVB
         0/pZUWq0ROAJbJ4VGrLx87iNTfB1RpDSNzVMl5LcAPobHouk1eEUSRgbp5VJq3NS6b
         pH3PLn3/hQxcg==
Date:   Wed, 22 Jun 2022 10:38:03 +0200
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
Message-ID: <YrLU6/jAZ5lGnL3p@shikoro>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CL2vYtuWr8EZvn7j"
Content-Disposition: inline
In-Reply-To: <DM6PR04MB6575D7C91E0925B5D498ABF3FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--CL2vYtuWr8EZvn7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Avri, all,

> > [    0.449917] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x03
> > for idn 1 failed, index 0, err = 253
> > [    0.452035] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x03
> > for idn 1 failed, index 0, err = 253
> > [    0.453859] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x03
> > for idn 1 failed, index 0, err = 253
> > [    0.453874] ufshcd-renesas e6860000.ufs: ufshcd_query_attr_retry: query
> > attribute, idn 1, failed with error 253 after 3 retires
> Should be interesting to find out who is trying to read an undefined (reserved) attribute in your system.

So, the call trace is:

[    0.455361] Call trace:
[    0.455521]  ufshcd_query_attr_retry+0x68/0xb0
[    0.455808]  ufshpb_get_dev_info+0x80/0x110
[    0.456083]  ufshcd_probe_hba+0xce0/0x10d0
[    0.456349]  ufshcd_async_scan+0x34/0x310
[    0.456609]  async_run_entry_fn+0x34/0x130
[    0.456873]  process_one_work+0x1e4/0x434
[    0.457136]  worker_thread+0x174/0x4dc
[    0.457379]  kthread+0xdc/0xe0
[    0.457580]  ret_from_fork+0x10/0x20

which leads me to this call in ufshpb_get_dev_info():

2622         ret = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_READ_ATTR,
2623                 QUERY_ATTR_IDN_MAX_HPB_SINGLE_CMD, 0, 0, &max_single_cmd);

And from here on, I miss the UFS experience to debug further. But I will
happily provide more information if people give me pointers.

All the best,

   Wolfram

--CL2vYtuWr8EZvn7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKy1OsACgkQFA3kzBSg
KbZgNg//dRpEnYmcKwjlUj0sg4K8t+AfpzTR9VvBoyHZjTJCHyaT1wLNc9lWaeJi
BSgblwaT3pgMdFV4dcO8g2PcFCCSNas6T43om1KLhpz51m190hnJRWhWCUFTQLpl
yh6GF1C6qG6zoqT+e8K6/PANBhyoQALk8aJJxhp1RD7fQiB/IdRPgzKMMajbhGBp
l3I0V3gneVyqBwFaUqQOBkZc9oxUu5HsvZKLgrulai9IYfwbOqoV9JtbM0inzmJ/
UkK5pmG7fhwu9qQFMj+efhAjcjlpJj5qDcheqYfddsTIcPpnQm0kEImd2DMmaiL3
w/yCVZs3XAfbACCyPOZ+3avkDZBmiKm5w+3oMbxipfSpnTewrQ6ujMaO8Pk72Hmz
StA25EgoW+ZQzIHZ4LbWvE3/Z8qWONmrGM3654gaMQXI/2ErrSjjKC9WZlMv/9N3
ACZ/W7OvFOH+IF21gHuldzXwiyBTRUqSVwlMMGHeJ99PNoHLw0yVy9n6fVit6Bvd
d0b5aV32q5mRzOUbtpyMpZhehsvwtpulVpBfE+qxj0LjUNQpGdQCFKUWyUxUsqCo
Fww7uDuVY6QapUUhTKIEb0bgH38C7vZ3dHcmOuM2UrD2vAJ+Tkl3c4vN7tr/k1sK
1qKukoK5bbmMenuOvZ+pz0j/tCQNebtDQD6+6TObr9XcDfjtLaU=
=Yie3
-----END PGP SIGNATURE-----

--CL2vYtuWr8EZvn7j--
