Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7E25604BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 17:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233172AbiF2Pgz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 11:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiF2Pgy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 11:36:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486DE35DF1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 08:36:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E75303D7;
        Wed, 29 Jun 2022 17:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656517012;
        bh=2FnGxjp+J65WJxqi8EpdNhPSJYVgcaPlEoByYRxE3xY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Rjx4enHo4dmeSSBVM09xp3M7J0V8KgEx8VOmdVCcfcTUDntKYi7EPoMhrgFhNesza
         TpZwkbfc9tOAPzk6ZH4BiP/0g7xkl0QEy6WV3q073mJ+mn0Gn0V4H6UJC4UYtx4yim
         zPZX2vYCGe8Y6k0Loe5CbO0cvSkrJJJV+69RtaZI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220609234031.14803-5-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com> <20220609234031.14803-5-laurent.pinchart@ideasonboard.com>
Subject: Re: [kms-test] [PATCH 04/10] kmstest: Move props value formatting to AtomicRequest
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Wed, 29 Jun 2022 16:36:49 +0100
Message-ID: <165651700917.2049236.8177612268777322664@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-06-10 00:40:25)
> Centralize props value formatting in the AtomicRequest.add() function to
> avoid having to call it manually through the code base.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/kmstest.py | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/kmstest.py b/tests/kmstest.py
> index 14e28cd47fbd..2afaa513aa4d 100755
> --- a/tests/kmstest.py
> +++ b/tests/kmstest.py
> @@ -258,15 +258,20 @@ class AtomicRequest(pykms.AtomicReq):
>          self.__test =3D test
>          self.__props =3D {}
> =20
> +    def __format_props(self, props):

This is only validating the value arguements right, to ensure they are
limited to 64 bit...

> +        return {k: v & ((1 << 64) - 1) for k, v in props.items()}
> +

Not this patch, but seems like 'add()' would benefit from some
documentation here to show how to use it, what to pass etc.

It's complex to read from just this context, but I can just about see
that this patch is cleaning things up.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>      def add(self, obj, *kwargs):
>          if obj.id not in self.__props:
>              self.__props[obj.id] =3D {}
> -        props =3D self.__props[obj.id]
> +        obj_props =3D self.__props[obj.id]
> =20
>          if len(kwargs) =3D=3D 1 and isinstance(kwargs[0], collections.ab=
c.Mapping):
> -            props.update(kwargs[0])
> +            props =3D self.__format_props(kwargs[0])
>          elif len(kwargs) =3D=3D 2:
> -            props[kwargs[0]] =3D kwargs[1]
> +            props =3D self.__format_props({ kwargs[0]: =3D kwargs[1] })
> +
> +        obj_props.update(props)
> =20
>          super().add(obj, *kwargs)
> =20
> @@ -309,9 +314,6 @@ class KMSTest(object):
>      def __del__(self):
>          self.logger.close()
> =20
> -    def __format_props(self, props):
> -        return {k: v & ((1 << 64) - 1) for k, v in props.items()}
> -
>      def atomic_crtc_disable(self, crtc, sync=3DTrue):
>          req =3D AtomicRequest(self)
>          req.add(crtc, {'ACTIVE': 0, 'MODE_ID': 0})
> @@ -368,7 +370,7 @@ class KMSTest(object):
> =20
>      def atomic_plane_set(self, plane, crtc, source, destination, fb, syn=
c=3DFalse):
>          req =3D AtomicRequest(self)
> -        req.add(plane, self.__format_props({
> +        req.add(plane, {
>                      'FB_ID': fb.id,
>                      'CRTC_ID': crtc.id,
>                      'SRC_X': int(source.left * 65536),
> @@ -379,7 +381,7 @@ class KMSTest(object):
>                      'CRTC_Y': destination.top,
>                      'CRTC_W': destination.width,
>                      'CRTC_H': destination.height,
> -        }))
> +        })
>          if sync:
>              return req.commit_sync()
>          else:
> --=20
> Regards,
>=20
> Laurent Pinchart
>
