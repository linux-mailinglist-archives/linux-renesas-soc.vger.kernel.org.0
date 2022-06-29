Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C5B5604DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 17:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbiF2Pp0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 11:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbiF2Pp0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 11:45:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BE626560
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 08:45:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 057EB3D7;
        Wed, 29 Jun 2022 17:45:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656517524;
        bh=ppA1KkTA4R6oUj2TFXFuYTFgqpFSlqSY8p2c2RB3+/Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mQ5sPt4h+AoRAu8e4h55p81hg719pk6MOFK0SPCH8c6jXuVGBvjUJV7/gJp2y8b9C
         vXv21byhpiEzE7hPwpikYpAXs14P9H6iieQAjelndPJlU0BTFQs1/gnGaCr4aIlcL1
         pHpKN4WjPtE4UvsTY4vVU80Z7lA6mSPltm4kwLMM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220609234031.14803-7-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com> <20220609234031.14803-7-laurent.pinchart@ideasonboard.com>
Subject: Re: [kms-test] [PATCH 06/10] kmstest: Support specifying alpha value for planes
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Wed, 29 Jun 2022 16:45:21 +0100
Message-ID: <165651752165.2049236.10329406962078287473@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-06-10 00:40:27)
> Add an optional alpha argument to the atomic_plane_set() function to
> specify the alpha value for the plane.
>=20


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/kmstest.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kmstest.py b/tests/kmstest.py
> index a99bf3b89d34..1c2a1b46ebe7 100755
> --- a/tests/kmstest.py
> +++ b/tests/kmstest.py
> @@ -385,7 +385,7 @@ class KMSTest(object):
>          else:
>              return req.commit(0, True)
> =20
> -    def atomic_plane_set(self, plane, crtc, source, destination, fb, syn=
c=3DFalse):
> +    def atomic_plane_set(self, plane, crtc, source, destination, fb, alp=
ha=3DNone, sync=3DFalse):
>          req =3D AtomicRequest(self)
>          req.add(plane, {
>                      'FB_ID': fb.id,
> @@ -399,6 +399,8 @@ class KMSTest(object):
>                      'CRTC_W': destination.width,
>                      'CRTC_H': destination.height,
>          })
> +        if alpha is not None:
> +            req.add(plane, 'alpha', alpha)
>          if sync:
>              return req.commit_sync()
>          else:
> --=20
> Regards,
>=20
> Laurent Pinchart
>
