Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6907369EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jun 2023 12:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbjFTKwC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jun 2023 06:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbjFTKwB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2023 06:52:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA4D6E41
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jun 2023 03:51:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2899E611E2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jun 2023 10:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C26C433C0;
        Tue, 20 Jun 2023 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687258318;
        bh=V9MJUCVMWI9KfhKjx8mSvYw2pf1xjGedQM3kQSvLgGM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OCv4HWAtYRwDDL4w75BYLov4HtUzw//tycij0AU63h9r8gj6xID+tOvOIk7VQyl8n
         w50Oa9scAAPxXzx0bCYCAVSaSLwP5Pc+m861ajyrs3T8AVsTaL59FgNOVRbwySC6MO
         L1IKvLICjaTdPDLe6tLk7CFBOrRK3ehFOzjgqWZAqfabRKUAZuVvTHAligZGK5E6iW
         cTVXpM3dzyrZshj72n/dWh2mnaFNRKXDM85xG4og/4MXgZ3s5UAyutoWr+YAyeQoLi
         rlyZQB03KRNUUfLDXfW2NOcK1yklLqT2/9kXmv8ezz4Q5RAcPeBrmUX3G78nhGcSIe
         ZTFEv8ueA3qIA==
Date:   Tue, 20 Jun 2023 12:51:55 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge_connector: Handle
 drm_connector_init_with_ddc() failures
Message-ID: <z3p6hqaf5yz24fe6g2pfw3saksu2iqu5gycyfij7rgfojx2ii5@ibrnokvqcucc>
References: <53b00f9812deddf90297e42aa45a4a9988c70076.1687243706.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="meh2x7on6izf7tab"
Content-Disposition: inline
In-Reply-To: <53b00f9812deddf90297e42aa45a4a9988c70076.1687243706.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--meh2x7on6izf7tab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 08:50:44AM +0200, Geert Uytterhoeven wrote:
> drm_connector_init_with_ddc() can fail, but the call in
> drm_bridge_connector_init() does not check that.  Fix this by adding
> the missing error handling.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--meh2x7on6izf7tab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJGEywAKCRDj7w1vZxhR
xeJkAQCMntGxRYuYehLRiKEl5oWCZDQlZACd7j35XBBUT+CuhAD/RGvK96tX90ZV
SZhI4pm1cKpx3pxPOlLSAx0D1btrTQs=
=rGmg
-----END PGP SIGNATURE-----

--meh2x7on6izf7tab--
