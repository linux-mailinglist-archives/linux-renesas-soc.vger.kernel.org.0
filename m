Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC2385604D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 17:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbiF2PkA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 11:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234115AbiF2Pj4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 11:39:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E44A2C67B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 08:39:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E75A63D7;
        Wed, 29 Jun 2022 17:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656517180;
        bh=K4j/M9rHQUAofa8u3YGfRVFZPLn64f+8YmWqHmRhbOM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kzatiQCH7GD2QEnhqiiOxQ/rzDn9+0VHOzJYSETJ7IzVljHfXzVazXwfmg/DkIWBW
         Ot6K80eEye1aPUh1vcH60IDgg2zJ12lu7QisWRpGFnjyFyacJc7W7tPUZZ4cy7VRfv
         4b5fKJiL3qtiZDwQKGB/LQckxQI1THIGoPKxIzQM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220609234031.14803-6-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com> <20220609234031.14803-6-laurent.pinchart@ideasonboard.com>
Subject: Re: [kms-test] [PATCH 05/10] kmstest: Support specifying property values in percents
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Wed, 29 Jun 2022 16:39:37 +0100
Message-ID: <165651717747.2049236.17912903448170949977@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-06-10 00:40:26)
> If the property is a string that ends with a '%' character, treat it as
> a percentage of the range reported by the property and convert it to the
> corresponding numerical value.
>=20

This seems neat, I'm guessing that following patches are about to show
me the use case, so I'll just throw this in now:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/kmstest.py | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kmstest.py b/tests/kmstest.py
> index 2afaa513aa4d..a99bf3b89d34 100755
> --- a/tests/kmstest.py
> +++ b/tests/kmstest.py
> @@ -258,8 +258,25 @@ class AtomicRequest(pykms.AtomicReq):
>          self.__test =3D test
>          self.__props =3D {}
> =20
> -    def __format_props(self, props):
> -        return {k: v & ((1 << 64) - 1) for k, v in props.items()}
> +    def __format_props(self, obj, props):
> +        out =3D {}
> +        for k, v in props.items():
> +            if isinstance(v, str):
> +                if v.endswith('%'):
> +                    prop =3D obj.get_prop(k)
> +                    if prop.type not in (pykms.PropertyType.Range, pykms=
.PropertyType.SignedRange):
> +                        raise RuntimeError(f'Unsupported property type {=
prop.type} for value {v}')
> +
> +                    min, max =3D prop.values
> +                    v =3D min + int((max - min) * int(v[:-1]) / 100)
> +                else:
> +                    v =3D int(v)
> +
> +            if not isinstance(v, int):
> +                raise RuntimeError(f'Unsupported value type {type(v)} fo=
r property {k}')
> +
> +            out[k] =3D v & ((1 << 64) - 1)
> +        return out
> =20
>      def add(self, obj, *kwargs):
>          if obj.id not in self.__props:
> @@ -267,13 +284,13 @@ class AtomicRequest(pykms.AtomicReq):
>          obj_props =3D self.__props[obj.id]
> =20
>          if len(kwargs) =3D=3D 1 and isinstance(kwargs[0], collections.ab=
c.Mapping):
> -            props =3D self.__format_props(kwargs[0])
> +            props =3D self.__format_props(obj, kwargs[0])
>          elif len(kwargs) =3D=3D 2:
> -            props =3D self.__format_props({ kwargs[0]: =3D kwargs[1] })
> +            props =3D self.__format_props(obj, { kwargs[0]: kwargs[1] })
> =20
>          obj_props.update(props)
> =20
> -        super().add(obj, *kwargs)
> +        super().add(obj, props)
> =20
>      def commit(self, data=3D0, allow_modeset=3DFalse):
>          ret =3D super().commit(data, allow_modeset)
> --=20
> Regards,
>=20
> Laurent Pinchart
>
