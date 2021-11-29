Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA24F46118B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 11:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232348AbhK2KDt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 05:03:49 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:33895 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241227AbhK2KBW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 05:01:22 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 34A1032004AE;
        Mon, 29 Nov 2021 04:58:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 29 Nov 2021 04:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=YGDOru+fLo4URaaRVwaY1cVu3GA
        yJhrRCwbCt5tSUo0=; b=gs2REK49PGgbKDKI4kraA3XZ/5XmLEVO2O17LsTMIbB
        8t0FcGYUmoadtbJNcP4vBJnX8XDdSL9aXeCU+Q3MnTpLSzlNxYXjpsRVHtIUGb/I
        CfNnJUIbf5HZJfuBI/G34wVJzo+i63PdRaZrXiEXjEyMKEhWFWnqQXbkj15FpOuI
        zUE/kdIrvvsxIeX5xqm6E1jS81qF1cLnr93b5cUMisB59CutKLGLwBE8+nwuY4Rb
        WVz38pVWzuSPIWjKEsqvztppHrr5smokzi2OlNP1iAYseP3vpZexKTc41ZuzFtZX
        TcxiMyPYDNw27/igaxhhPidnsgy27Q1SiMvJBfoyT/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=YGDOru
        +fLo4URaaRVwaY1cVu3GAyJhrRCwbCt5tSUo0=; b=HMyv6gCrolwS/SI5jQDxAK
        3+qW+ogLz7trVmqaSCHOdKpBcqgiNqTxYs01VDDSKm3ieyZCFJWlgatcSuZjSPJb
        Z9nNo5I7ocL4syrBkb3dLjOR6AZl9Hum0gA0cnIN4/sSw9aa/e0BA3N2m8TLehFN
        QlsTrwM0J+889jjnwebQukg4ldt0uWpFlxOmjnN93zvDZkTwyOwk1KDEaYDD+fVZ
        xQVApNmdrFhVLUe48r7YtZKwGMKT/GNrIA/haNLGpW7N0Xfd5endDbEcLzGKlRcO
        /azctq8GWF7EQY6jnsYQZjO+++3Uz+y3nlGfF2VA6kKRdajoiY7sL/1zugJMBjmA
        ==
X-ME-Sender: <xms:K6SkYV8jW49ARI_ztCKOhjpWcsXBAdC5kpJ8ySDpiJYJjxHjQg65WA>
    <xme:K6SkYZuFHzECG9xTZUC_IIMallQOYdrfk33MAyw5YYaXnIaU6KdtkoOHv3Ap6hqIR
    dnzQ7qeUCw3W1336lM>
X-ME-Received: <xmr:K6SkYTB9ucjMrhAlB3eVii0YmT3sKAC3oRFSmgGjWlrIcbmkzI6atrbzj35Iscc3KjmSKZ65mZfWprmDEafWc6xdQwdWDk9TrcI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:K6SkYZfZlmos6uQyg1mQJGtHwMJJTsri2NE_izN2Qx2Pwpsr9XcqnQ>
    <xmx:K6SkYaMTMK_IcSr_lntlG5v00hhrfQxf1OrfDWD70uUbFuChujj_Wg>
    <xmx:K6SkYblqR76Tsr6IMS8M56smC0E-0wSCpXDfGJoKBTwxR5VTvW-42w>
    <xmx:K6SkYZessVSZGEm1nhHz3ktOWR2j3FL0crK7_vqHqSjAL65lgDlNxg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 04:58:03 -0500 (EST)
Date:   Mon, 29 Nov 2021 10:58:01 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, emma@anholt.net,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/cma-helper: Move driver and file ops to the end
 of header
Message-ID: <20211129095801.yracpyxrjn6cbmg2@houat>
References: <20211115120148.21766-1-tzimmermann@suse.de>
 <20211115120148.21766-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="233t6o3ct5vq3vnq"
Content-Disposition: inline
In-Reply-To: <20211115120148.21766-2-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--233t6o3ct5vq3vnq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 01:01:46PM +0100, Thomas Zimmermann wrote:
> Restructure the header file for CMA helpers by moving declarations
> for driver and file operations to the end of the file. No functional
> changes.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--233t6o3ct5vq3vnq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaSkKQAKCRDj7w1vZxhR
xTjbAP9KblVEOR1i0ynoqIdfgYxEuE6yf/oKNJTmqJTnBHeWBQD/SYYs4ijYFGwf
vobSALohLNxHAyaPr1GDXQUod+kOvwo=
=b5GE
-----END PGP SIGNATURE-----

--233t6o3ct5vq3vnq--
