Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDB9D19F124
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 09:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgDFHrY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Apr 2020 03:47:24 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:42021 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726475AbgDFHrY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Apr 2020 03:47:24 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id C1DB55C0121;
        Mon,  6 Apr 2020 03:47:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 06 Apr 2020 03:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=XboiK+6FmJB5qBi2l92jAN3BfU2
        aZlFn+x6k8TE+5rM=; b=TyBsEAINmzFw+n43tR+4HrXPiLywtXJz48/UaJbPhCz
        cEZqGbGsQ7jBnGToOgmT7po0MwHuWk8B2a+wsl8Z+y8OIyWHE3r8tLBLr/nwyGpp
        3pkEsPdoM416DDwopbbhD9BtNCTyuh6SxupX8mEPoqzjgnfpyVeJ4jEHlQT6F8dh
        9zwHOPeW/lDr3vGyElYMlsi0qqNYqmmURTa1wYk4JQKAPt/Ddd760bAVeZrK+Y12
        J5amPJTcs7QsKg3f3mrDpw9W9Jw1qcibWllwyhLFdJ/Na+BVvP5Lt4E+uIAyA+ti
        nLAVIXCz0K6sTskEHN5I5wQ9qIha6cqyR1D8Ej+6mgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XboiK+
        6FmJB5qBi2l92jAN3BfU2aZlFn+x6k8TE+5rM=; b=SCfz/SLDaaU7VIlsAlQC+R
        0hkkYxJ1LEARo67RvLO2dArzyah97PeE/YI1FuASK8otT+63pbRWvJ/2ZH/nympi
        sN1i0PptM3Gs1YpowEuaZcys5++yRV//4P7V+qWX5T96BqEUdwpzgus8HWMGe9E6
        m9VvLj0QUqL4U2kj0jgTtPiyJzjZqcfI5DfMgYhhonmLjVJWt29mzmJSzB6MLOpm
        T1kABxQsMD4Eylu3kh7D2zM7uQvtaTJDB+KmNDqFEemQ5KnUwdUE+e6oTswVzAxh
        fKRLTiyYd2EbR1erUTbe4ZqNs5uAp/HWY/POiClVg3johmK2YfQqXrN7J31/kl/g
        ==
X-ME-Sender: <xms:it6KXpbnGQiJgb4h1LvoScm2pYW5sWWw_b0swh8sPkK79jArDTiIFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgdduvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
    ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
    rhhnohdrthgvtghhqeenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
    thgvtghh
X-ME-Proxy: <xmx:it6KXmbWYiR7WOrte2yS_rOh0TfZj_f3B4v9hExY-PufuPOHsMVRqA>
    <xmx:it6KXmxWffif5WFyIzV5cOMtkwZ5p5LMeBRrgWAS57jr17z7X3DzCA>
    <xmx:it6KXqfkBH_s0gxg53tBsCIXmI-Kj309k1zirJ0ZzgZ5t0yaq9HcUg>
    <xmx:it6KXilPf5Bua4QErzfXXck3Mgm2nkXthjfBsbSLgPIaWvv7vcV-JA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 645CB306D391;
        Mon,  6 Apr 2020 03:47:22 -0400 (EDT)
Date:   Mon, 6 Apr 2020 09:47:21 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: display: bridge: Convert simple-bridge
 bindings to YAML
Message-ID: <20200406074721.nmau3mylvgtaehda@gilmour.lan>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ufu5rljho4ipq5le"
Content-Disposition: inline
In-Reply-To: <20200405232318.26833-3-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ufu5rljho4ipq5le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2020 at 02:23:16AM +0300, Laurent Pinchart wrote:
> The simple-bridge driver supports multiple simple or dumb bridges,
> covered by different compatible strings but otherwise identical DT
> bindings. Some of those bridges have undocumented bindings, while others
> are documented in text form in separate files. Group them all in a
> single binding and convert it to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ufu5rljho4ipq5le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXoreiQAKCRDj7w1vZxhR
xRfbAQC/W+jD8jSIfHjBkVlC9gddKw7RA50Qtw0VXENHBDH0xAD/en2fRPubrPDx
yANnQBniXv61l1k3I61H30XgJxwmmwo=
=MET7
-----END PGP SIGNATURE-----

--ufu5rljho4ipq5le--
