Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1BCE461186
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 10:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbhK2KCt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 05:02:49 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:39929 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343854AbhK2KAt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 05:00:49 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 257763200F6F;
        Mon, 29 Nov 2021 04:57:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 29 Nov 2021 04:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=A0gn7uN1e0hJfqlwX6ttt/xoS8h
        yLycsqu3s1SNDYTk=; b=DSC3LhmVOpu/tpvZ5xmrP7KrcyMjOQJf/V3qJ0bR1yu
        3JoNbqeVg3Aa5+Ol5Zw+QVtmuYNCTSkEpQb9dolcEneJqitanZhsBSPuTC+W4aEl
        DWv1ksEkVkpVmp7ldnuYIq2tfWy8jU8dlVEraskshwdRjBKF8ypY4w6WIkAvPjiL
        DscTApz124RF7Ok2rFmnD7uPpsUSa5JSgGY8juZZXClfjUSmhnKhjcm29J0x8r9U
        HrTNIS+bxxbjd2BhusqyN0+uig5sodmIfP7+7Itq2f4l9axzRt49aOikTx8S8oBb
        RTFzwxOtsp3wtP+bBw9j/ixe7EHITePuAFSU4AwipXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=A0gn7u
        N1e0hJfqlwX6ttt/xoS8hyLycsqu3s1SNDYTk=; b=gyYZ+XlgbaiAiXzAqxmn6t
        1P2aecMltZapYWJ3DiiH+RreQiaPbC2aKrYYDhHi0rR61RLOsvMcUD1gBZIVBofw
        ayFP5gNmh/MD99SSFHp0asawxp0SotZhPoKHr6YZgBMWvsY6LpAVSCdouNkGi8Ab
        USfspQC6vUU4TIcaDaHo87JyMNUrT3Q4nrPR+EYdZcRioLjGOxggxvMhyHdXQiJU
        sx44stPDICXC3IA8TnZefA1bGkV/dMYKRVGBGf8zL5ICRlVKmEydXZmOPs1uTTa+
        lIlskpY05u/CN8W1t8yZK50uuBR3g+EiNGtOtrWFybiRZjKjfTRqutV8+pMk+FBA
        ==
X-ME-Sender: <xms:CqSkYTeUZxFXBFNJCVrKBB7zU83ABl4muePN0anyffCLVvaaJNy0Lg>
    <xme:CqSkYZOh7RSR_ZLUjQi9EgdmqPBg2nwvnBEimMMMLj4kCoDG34kBBZlIWng6r1Hlo
    CuerLdAtYx39ASSoA8>
X-ME-Received: <xmr:CqSkYcg1PM3fYmR6B0_nqk64Q66anH27iBXD_Exg1J_JgyFvOtwnlI7-BnWqiF436IpvMgA_-RPvNdy52aFVvxgig3vNlCoPnic>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CqSkYU8COMSo_bB-4cDLR62LFO3rYx1UK-bZoL4pae97ZACyqiJJMg>
    <xmx:CqSkYfu5A71shpA_qdSGohtYJY8FISwy9KlwZmNZU7TPTNzObe4jnA>
    <xmx:CqSkYTFO-HF7WACtRz_TlHSNCGQPJmkG2Z-NdeSXBpwBcFprrWE4pQ>
    <xmx:CqSkYY-2nnS4YLupifprFo7gspg_gC5ipF4GSwTYysdTAp_gtu3jYg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 04:57:29 -0500 (EST)
Date:   Mon, 29 Nov 2021 10:57:28 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, emma@anholt.net,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/cma-helper: Pass GEM CMA object in public
 interfaces
Message-ID: <20211129095728.doyt5xllwbvkawlk@houat>
References: <20211115120148.21766-1-tzimmermann@suse.de>
 <20211115120148.21766-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qsofvsq7xvr72mew"
Content-Disposition: inline
In-Reply-To: <20211115120148.21766-4-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--qsofvsq7xvr72mew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 01:01:48PM +0100, Thomas Zimmermann wrote:
> Change all GEM CMA object functions that receive a GEM object
> of type struct drm_gem_object to expect an object of type
> struct drm_gem_cma_object instead.
>=20
> This change reduces the number of upcasts from struct drm_gem_object
> by moving them into callers. The C compiler can now verify that the
> GEM CMA functions are called with the correct type.
>=20
> For consistency, the patch also renames drm_gem_cma_free_object to
> drm_gem_cma_free. It further updates documentation for a number of
> functions.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--qsofvsq7xvr72mew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaSkCAAKCRDj7w1vZxhR
xaSaAP9+rzAxXN7+Y5XlDnWGKfusisUpRVgNwE2A3h5jZb2VcAEA/UWtB39pWAbV
Caklo65jYBSTQiDVWQWK1B+ZiosBNwc=
=9e5s
-----END PGP SIGNATURE-----

--qsofvsq7xvr72mew--
