Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C08DA70FE76
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 May 2023 21:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235479AbjEXTV6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 May 2023 15:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjEXTVy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 May 2023 15:21:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFAE198;
        Wed, 24 May 2023 12:21:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F070F61993;
        Wed, 24 May 2023 19:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FB2C4339B;
        Wed, 24 May 2023 19:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684956099;
        bh=Sd1Ura2M9buJQSOCvciUHD2sqlFtpG56/2/gPbm9J28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qok6UoeSp3jwvMlC7HfMf2T3bU/c9zak6yUZL8CGMvuQ7/qSRGAgchHhGYUnyXlpp
         xTj3foph1OeS7CC+H+W6Bdu6AAE9adZArZ8y7q3KOD1hcbSdZFZP9xHG/IYrIBgbo7
         c/x7++wsglFYVGCF3wtUw8l/DjCmA6FAikwWnMe/pJhW5+7ayOnC5ImDJd88RE02R/
         3TRQd9kdynkgbUq4KVSL+ruUKb6GajJX3WYzIdHcxTh8PCeTZgqw8uB9QBDY4CANX7
         M5gODvF+r9M8b9I9WHSRQf1lQMrin8Gh/IcbNhI2X3qVgDAZo/1+qMbdTLi9DPkibu
         ZaWIzBUmgq7QQ==
Date:   Wed, 24 May 2023 20:21:34 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel-simple: Add Ampire
 AM-800480L1TMQW-T00H
Message-ID: <20230524-posing-pouncing-f197846768ac@spud>
References: <cover.1684931026.git.geert+renesas@glider.be>
 <422adef8c4941fa56fdadacb3d362a9fb387455e.1684931026.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NKQCStFFZ1gwgZRL"
Content-Disposition: inline
In-Reply-To: <422adef8c4941fa56fdadacb3d362a9fb387455e.1684931026.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--NKQCStFFZ1gwgZRL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 02:32:10PM +0200, Geert Uytterhoeven wrote:
> Document support for the Ampire AM-800480L1TMQW-T00H 5" WVGA TFT LCD
> panel.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--NKQCStFFZ1gwgZRL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG5jvgAKCRB4tDGHoIJi
0oO/AQDeTcFWWpQENvchjFkwbz1TuanTTaaJI3Nk9bUVe0a0HwD+O53CJKVeO+hr
x/Cbf/39qxSEbaY36E6RZ371qVEk5wU=
=6wyM
-----END PGP SIGNATURE-----

--NKQCStFFZ1gwgZRL--
