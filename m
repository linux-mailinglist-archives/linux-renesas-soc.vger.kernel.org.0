Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF8F076EF76
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Aug 2023 18:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235052AbjHCQak (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Aug 2023 12:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232288AbjHCQaj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2023 12:30:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935FC3A87;
        Thu,  3 Aug 2023 09:30:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2867261E38;
        Thu,  3 Aug 2023 16:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E87C433CA;
        Thu,  3 Aug 2023 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691080237;
        bh=Yu01naVP3uvFO0DQ6SaOKMUMFQ+vF+JNWxBerlMqwBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jmU5w8YmZ98+1piB6sQgCAUlUZ9FjIWRAkfDZ5Lh0Qp0GdAOzgbx7SD6NuwJ04ebN
         XAAcUivAdwS41j8+MZfg9dyVoCkyivGRJyPaeBcL+ZXY6v4M/fEuN/QBK4+wC9BsOA
         eg2FkPQ4MR54kBLlcwjenw/1gP7/U5ZS5WCVKq1OO8kZ1rKgp0K+Z33JFCrXK0CvHJ
         xmwjXmCa6cMQE9gEiyT/ZibDeLWc3dIsdKTqpcRoGHftqWUcvv3KVvWEci6u0dBvsB
         xr/cAh3zU0suZp985wuWwIj+Jxft/HsO2Gs5AI94kseKGP/5TzyoZXUr/kfUlxCaZ3
         /BEOCRP1XdeOQ==
Date:   Thu, 3 Aug 2023 17:30:32 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: versaclock3: Document
 clock-output-names
Message-ID: <20230803-derived-patchwork-596f8864b589@spud>
References: <20230802122510.275420-1-biju.das.jz@bp.renesas.com>
 <20230802122510.275420-2-biju.das.jz@bp.renesas.com>
 <20230803-imminent-impound-559c483b75b9@spud>
 <OS0PR01MB5922B71C39F54441D0E8EDB38608A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Rgh9Bmz6dQVesLYZ"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922B71C39F54441D0E8EDB38608A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Rgh9Bmz6dQVesLYZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 04:25:40PM +0000, Biju Das wrote:
> > Subject: Re: [PATCH 1/3] dt-bindings: clock: versaclock3: Document
> > clock-output-names
> >=20
> > On Wed, Aug 02, 2023 at 01:25:08PM +0100, Biju Das wrote:
> > > Document clock-output-names property. Update the example according to
> > > Table 3. ("Output Source") in the 5P35023 datasheet.
> > >
> > > While at it, replace clocks phandle in the example from x1_x2->x1 as
> > > X2 is a different 32768 kHz crystal.
> > >
> > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Closes:
> > > https://lore.kernel.org/all/CAMuHMdUHD+bEco=3DWYTYWsTAyRt3dTQQt4Xpaej=
ss0
> > > Y2ZpLCMNg@mail.gmail.com/
> > > Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock
> > > generator bindings")
> >=20
> > Nothing in this commit message explains why this is a fix for this
> > binding addition :(
>=20
> Basically, it fixes "assigned-clock-rates" for each clock output in the e=
xample. Now it is based on Table 3. ("Output Source") in the 5P35023 datash=
eet(ie: 0=3D REF, 1=3DSE1, 2=3DSE2, 3=3DSE3, 4=3DDIFF1, 5=3DDIFF2).
>=20
> The newly added clock-output-names in the example are based on the above =
table.
>=20
> I have added fixes tag, because this patch fixes the clock mapping in the=
 example as per the HW manual.
>=20
> Please let me know should I drop fixes tag??

I'm just asking for an explanation in the commit message as to what was
actually wrong in the first place. The commit message says 3 things of
which it's hard to know what is actually a fix without opening & reading
the linked thread on lore.

Cheers,
Conor.

--Rgh9Bmz6dQVesLYZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMvWKAAKCRB4tDGHoIJi
0kVEAP943D2HgdBWYLT+ggUOPUNubwI59nKncwGIuyEW5NfPIgD+LxKcU9TDeFaY
o6EAKzDESB+MylaSOBhSBU0AOEMRLgQ=
=DVBF
-----END PGP SIGNATURE-----

--Rgh9Bmz6dQVesLYZ--
