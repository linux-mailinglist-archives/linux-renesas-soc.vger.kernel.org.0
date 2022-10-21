Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55ED36081BC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Oct 2022 00:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiJUWem (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Oct 2022 18:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbiJUWel (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2022 18:34:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600D8E0D3;
        Fri, 21 Oct 2022 15:34:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B72CFB82CAD;
        Fri, 21 Oct 2022 22:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91434C433C1;
        Fri, 21 Oct 2022 22:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666391676;
        bh=prLeAf2ItsWJEmbqEjaM5pwP4sQzp/lQoV0fdaws78s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t5TtIhEjokM2OHeKhxVRvBDslLnI7wnxwv6+sYUv3MQaW+ZjTqUQ0f2FnxI3q9CyX
         Dnt39CIDHgJFtHSZIshbbblKksPyRPY5qIFFzPwCCDpsGD78nnyaXbRzBovAfNjwwV
         YkBD1oyAOLHsJmyqWMch8Dt6YYGhsKio/fNP/rcOdwrAwOawtmpYjsOT6W2G0TokIP
         YQqdoM7j6uMHpRA23rNTLnsYf+5UNbkevXw3GFBDeYdd8m97HscCh3eoUHXxjrd22d
         M/BKDUTJw/FQv0JHA0zkseLf3mNARSm1kb27q4/WXNe7O+cLzqobzi3mnrkug+HRJP
         NuJIQEpcOHlUw==
Date:   Sat, 22 Oct 2022 00:34:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: renesas,scif: Document r8a779g0
 support
Message-ID: <Y1MeeKRs+a4J+0zM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <8a2d04651f04a97d652395b4d933af5c3c8d5b5b.1666360789.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c1Ew6U8+PLXNDYdQ"
Content-Disposition: inline
In-Reply-To: <8a2d04651f04a97d652395b4d933af5c3c8d5b5b.1666360789.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--c1Ew6U8+PLXNDYdQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2022 at 04:02:16PM +0200, Geert Uytterhoeven wrote:
> Document support for the Serial Communication Interface with FIFO (SCIF)
> in the Renesas R-Car V4H (R8A779G0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--c1Ew6U8+PLXNDYdQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNTHngACgkQFA3kzBSg
KbbYHhAAljl8BJDNghhM24PiJHIK/iAltOMpntNOca1YnWDaemx72fGXMn0DLSTG
5sSktrXMxYVTopAEimP87lUwe4fKeTTfzQl98DqDTBxZ0Xzmbzb73U/KnoFd7bdj
PCnal18q6N1v8V/LH+EiDgbl7R4F26oFLwl8BTF1xKtx2GzfUUe+QAiEN3tn0VnR
fEkICnmBa5NGkXGSoOBRv7rW6lI6g0zzPlCv+Q98Y4tR9fGUw0EZWGv0ENg55sId
rTVacsC7QssPvK8GgLMtiCL1lG4JDxvZFh1kowR1Vs9c+w50PGEFM1iAeAvEe3X3
dypmy2BP7uXu23EHsoxnBCRnlVzACCOHpLPAJoch3txchS/4Gji3YVa9fHZmAdW3
DuhxOkYmBpAlCpkziVLILKY3NQggjrhNuNpwk8Y5FW/c4cGL7OV8W1N3NHdA/vbU
+J50tlARYwnPbLeLua8TxFQVbAXLokGTEBkRKZUDy/wJY9U0GG/SPzPfJn2nwRDL
0jO1Lp6L71PG+++E6OtO4oNy9N23N4jJ11ia07ovKyxqna7uco8OtSGqL/g2eIeX
DQEbc4SV3IPsOyre7c1fxZjCeyoOGhGn4fIGFegy8NQFap2HA+HMGeyQJXeB3y0+
snomh8MWnUpnEWxwwYwRye839fbgxSmj+/Fc7maSR8oFhtE3FqA=
=qDQr
-----END PGP SIGNATURE-----

--c1Ew6U8+PLXNDYdQ--
