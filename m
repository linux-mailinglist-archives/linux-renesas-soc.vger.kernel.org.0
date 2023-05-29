Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCE957150B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 May 2023 22:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjE2Uoq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 May 2023 16:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjE2Uop (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 May 2023 16:44:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C101EC9;
        Mon, 29 May 2023 13:44:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D7086287E;
        Mon, 29 May 2023 20:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE44C433D2;
        Mon, 29 May 2023 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685393073;
        bh=CxcZNzFtJ0OjwhQEzIXvr8CgGHHZsHpJhb4n+27D/dc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LH9JjXv1UM7H1Cgclyv5KyzfLjnEYyjj9D4UYftXNbytATxxQ8XGzl52CEo29e5rj
         zcugpB5ompIDbNgu4LnWZ00+wf6PX2MD8a4rE8LgBZ+In0O0CICkeVXc8geZEsnlWK
         nwWCbl/yirYJrT0hEdngr4Gb0LCmFJFVgUFvBWGJAO6eZnVh+dTjuEBVv9SqIMa1Bf
         27b5uMJ1lxFpncVIl18B/tyNSt75KOBjHTq5Fu0Z6EmLxstPLzKngr7NNQYR3j2gc4
         Oc5KiQbxaX+r7eJKH3CgLSn+ialr8eqrj+u4x8TSF/AtcKFn/EjMYDrgWDFx9YxmOG
         pn4WbrS09to0w==
Date:   Mon, 29 May 2023 21:44:28 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] dt-bindings: net: r8a779f0-ether-switch:
 Add ACLK
Message-ID: <20230529-ambiance-profile-d45c01caacc3@spud>
References: <20230529080840.1156458-1-yoshihiro.shimoda.uh@renesas.com>
 <20230529080840.1156458-2-yoshihiro.shimoda.uh@renesas.com>
 <20230529-cassette-carnivore-4109a31ccd11@spud>
 <15fece9d-a716-44d6-bd88-876979acedf1@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LyQJ+oosq6xedgH0"
Content-Disposition: inline
In-Reply-To: <15fece9d-a716-44d6-bd88-876979acedf1@lunn.ch>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--LyQJ+oosq6xedgH0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 10:11:12PM +0200, Andrew Lunn wrote:
> On Mon, May 29, 2023 at 07:36:03PM +0100, Conor Dooley wrote:
> > On Mon, May 29, 2023 at 05:08:36PM +0900, Yoshihiro Shimoda wrote:
> > > Add ACLK of GWCA which needs to calculate registers' values for
> > > rate limiter feature.
> > >=20
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > ---
> > >  .../bindings/net/renesas,r8a779f0-ether-switch.yaml    | 10 ++++++++=
--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/net/renesas,r8a779f0-e=
ther-switch.yaml b/Documentation/devicetree/bindings/net/renesas,r8a779f0-e=
ther-switch.yaml
> > > index e933a1e48d67..cbe05fdcadaf 100644
> > > --- a/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-sw=
itch.yaml
> > > +++ b/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-sw=
itch.yaml
> > > @@ -75,7 +75,12 @@ properties:
> > >        - const: rmac2_phy
> > > =20
> > >    clocks:
> > > -    maxItems: 1
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: fck
> > > +      - const: aclk
> >=20
> > Since having both clocks is now required, please add some detail in the
> > commit message about why that is the case. Reading it sounds like this
> > is an optional new feature & not something that is required.
>=20
> This is something i wondered about, backwards compatibility with old
> DT blobs. In the C code it is optional, and has a default clock rate
> if the clock is not present.

Yeah, I did the cursory check of the code to make sure that an old dtb
would still function, which is part of why I am asking for the
explanation of the enforcement here. I'm not clear on what the
consequences of getting the default rate is. Perhaps if I read the whole
series and understood the code I would be, but this commit should
explain the why anyway & save me the trouble ;)

> So the yaml should not enforce an aclk member.

This however I could go either way on. If the thing isn't going to
function properly with the fallback rate, but would just limp on on
in whatever broken way it has always done, I would agree with making
the second clock required so that no new devicetrees are written in a
way that would put the hardware into that broken state.
On the other hand, if it works perfectly fine for some use cases without
the second clock & just using the default rathe then I don't think the
presence of the second clock should be enforced.

Cheers,
Conor.

--LyQJ+oosq6xedgH0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHUOrAAKCRB4tDGHoIJi
0giwAP0SSbeFi966FE7XkVpoO7WWhUj/nhu0mvqp7cEjcwZGtQD/TYJ8J9KRo8x1
z9MY3uNX40ZiyQ+6IKwzr18/cRcEnQk=
=Hehz
-----END PGP SIGNATURE-----

--LyQJ+oosq6xedgH0--
