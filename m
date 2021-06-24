Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84BD83B2708
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 07:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhFXF4X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 01:56:23 -0400
Received: from www.zeus03.de ([194.117.254.33]:45498 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230283AbhFXF4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 01:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=n67uatpfXLyIHHV1EPlcxgPblzft
        RI+gNuElRxsC2yU=; b=cUwHMPxg75kA9h22EEqUvjhfYHFHAN9lH87J/RH5YL26
        3+4YrGUc+tk+LbpQT3KJcd+OgLxjZKve51qCycNj0lcSdbesFQFwKPWlseLgR5D0
        6CJbhRGWPFl9lvlN8GuZzPv9YvXNj3blwiybH4IrXv+xcQBhp1V7+K5mh2m0kfo=
Received: (qmail 2848297 invoked from network); 24 Jun 2021 07:54:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jun 2021 07:54:02 +0200
X-UD-Smtp-Session: l3s3148p1@WDY7pnzFns4gAwDPXwgVAAQm652OYQ07
Date:   Thu, 24 Jun 2021 07:53:58 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC] usb: renesas_usbhs: fifo: : use proper DMAENGINE API
 for termination
Message-ID: <YNQd9hS+hqPYvLNp@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210623100304.3697-1-wsa+renesas@sang-engineering.com>
 <TY2PR01MB3692C7B6E0FD027B5C3E05B5D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gb/GYRUtYYZSy6bC"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB3692C7B6E0FD027B5C3E05B5D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gb/GYRUtYYZSy6bC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

> In backporting point of view, I guess it's better to apply my fixed patch at first,
> and then apply this DMAENGINE patch. But, what do you think?

Yes, I agree. Could you kindly notify me when your patch is accepted
upstream? Or CC me on your patch?

Thank you and kind regards,

   Wolfram


--gb/GYRUtYYZSy6bC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDUHfEACgkQFA3kzBSg
KbYHZA/8DALuavEWfJkui0rm56H2wrwUwiegsSfvfGZrlpRuW36i71US4mr0GZKn
NbeekEeDpygQK0n5zZwZFzg8gNMaHOvCaaWy+BFxvY90l2PlnXiDLgpFd7e93DPe
ZfpxzM4uohYPzLjeQNy+hsDp/Kj8BJV3ZXCzaBHL0qnCcTrBb/EbKfo0pcCVR6aG
y0MiD9WZpk+gwbKpGWja5HcAF9M39e+9yRgv1TZIZ/K/oXDcELm4MXRqT54vNFE4
s5Exg1OXEi7JlMVj8LYRGU/aZwD6dCXKD/OjefD90olP513pTKLS/q9UayyUVApO
FBDPQn8QqurgDg+qPBo9q4Yx4h0uXI/RLVgdOwvnJTHEunR2TWV9EyO7sxMnIFH+
m7XnJbVwGwIrwCCk39bGcyaPHahoBVNif/FWDfkuN/EJ013CLDnvtyUkdd9Pl8/1
CXAFoFnYD3EaEjODq6DMjnGJv962faHjs9W/HWzcauYG44Q95tdki7Hu6N4AMYJV
JfV42nw92+IHEkCnjusI0r274FjEf01oYWwOza+qwHfVuJ2n2HThKsF445OXDCMa
WXqpyAOimXPRjzfEotc4yeG1c2sxyVKfaUVEt02fTzOgGCdPSxNWqHVrGm8Bc22A
NczoQmr5rL2UF59LEdXYAaotglS7wFhFrTcOUj07XveE6e4hYuY=
=0bFP
-----END PGP SIGNATURE-----

--gb/GYRUtYYZSy6bC--
