Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA689709B25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 17:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbjESPVB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 11:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjESPVA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 11:21:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C220106;
        Fri, 19 May 2023 08:20:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ADF3C6589C;
        Fri, 19 May 2023 15:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8010EC433D2;
        Fri, 19 May 2023 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684509658;
        bh=+sp/ndddAwmlf9DWqKIi7xyEcvpuzEhQ/izOrZupQBk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tI85oLMhhqyZ+sHiiL2LjTi9fn3cFnL3J+G6CQZIQR6SuNaqeoeRRvopjVt8WXmYn
         LxE2Ih/PvNp1ALUNz53I8YOpxP8bWTZPlYd3F/taektr9gjROyCKT9W2YjUUnobeq+
         nPMt42UM+adRpqdSPZY2muN53SN3px2X2VNfdWYrE2d31rO/RYeqpclcd8n1aWsXiZ
         TAHfnRSx4MfYBSnnf3YtVYcIspWdtn8p4weHHRg545Ss9YBiiNNC7Sqk/xB6CVugYY
         x9NWIcexVZGYOS7D1/ttKvIpzFIdKnE1BgWmZH0ESTAf7fhUNSZVW2yV9i8APmw0U6
         /Q3zefZWdICTg==
Date:   Fri, 19 May 2023 16:20:53 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
Message-ID: <20230519-giving-proven-1133875db395@spud>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-10-biju.das.jz@bp.renesas.com>
 <20230518-prompter-helium-91d0139a61e2@spud>
 <OS0PR01MB59226BDCD4D67430EC7377C6867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230519-civic-idiocy-5ac6d95675f0@wendy>
 <OS0PR01MB5922F379C4DF20124CBDEED3867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXQFQB7e7Pd1-CCerkwb4RDq7jJ_rv_kwf_Od+oGjMfUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2EvJa2hO2K2Spwku"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXQFQB7e7Pd1-CCerkwb4RDq7jJ_rv_kwf_Od+oGjMfUA@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2EvJa2hO2K2Spwku
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 04:49:44PM +0200, Geert Uytterhoeven wrote:
> On Fri, May 19, 2023 at 4:39=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > -----Original Message-----
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > On Fri, May 19, 2023 at 06:53:03AM +0000, Biju Das wrote:
> > > > > Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas

> > > > > > +required:
> > > > > > +  - compatible
> > > > > > +  - reg
> > > > > > +  - reg-names
> > > > >
> > > > > Out of curiosity as much as anything else, why do you need reg-na=
mes
> > > > > if the two registers are always required?

> > OK, will drop reg-names from required property.
>=20
> Please don't, as i2c_new_ancillary_device() does rely on the name
> to set the address when overriding from the default.

That looks like my answer! Thanks Geert & sorry for the noise here.
Modulo Geert's requested change, I think I owe you a
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Biju.

Thanks,
Conor.


--2EvJa2hO2K2Spwku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGeT1AAKCRB4tDGHoIJi
0iv1APwKw8DY6iGSq0dYCscL2F8wST//cz74mUwJrtHU9IXEGAEA0T+TAKWNc03n
cN5TfV6iKpIw+NOw+EEKLNPktYSAGgU=
=u/bs
-----END PGP SIGNATURE-----

--2EvJa2hO2K2Spwku--
