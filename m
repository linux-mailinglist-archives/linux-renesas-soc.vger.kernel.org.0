Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD66E5604E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 17:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbiF2Psm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 11:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbiF2Psm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 11:48:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700221DA6B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 08:48:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50DFB3D7;
        Wed, 29 Jun 2022 17:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656517719;
        bh=fMFgU3j7b+7fPxCV+eRmUxUgYqZSKK93kQSLCBdtCTU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FHWbjfpfq7PraB4Oe43jMUvZEQqK849DBxbR19eeAxElfnXnAKLI1y/9Rire1l4MI
         QKQd8mKyAtWGFcKvv1ZuY1PYX4p2dGl3lIihf3kic8r86v1ePCJWhcBksEkzotWRfJ
         2MK37fTanjhMokv0TSnFgOYpU3OAfNJEuuzHUQqM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220609234031.14803-9-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com> <20220609234031.14803-9-laurent.pinchart@ideasonboard.com>
Subject: Re: [kms-test] [PATCH 08/10] kmstest: Support specifying zpos value for planes
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Wed, 29 Jun 2022 16:48:36 +0100
Message-ID: <165651771654.2049236.2704474673573596078@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-06-10 00:40:29)
> Add an optional zpos argument to the atomic_plane_set() function to
> allow controlling the zpos of a plane.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/kmstest.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kmstest.py b/tests/kmstest.py
> index 1c2a1b46ebe7..11cc328b5b32 100755
> --- a/tests/kmstest.py
> +++ b/tests/kmstest.py
> @@ -385,7 +385,7 @@ class KMSTest(object):
>          else:
>              return req.commit(0, True)
> =20
> -    def atomic_plane_set(self, plane, crtc, source, destination, fb, alp=
ha=3DNone, sync=3DFalse):
> +    def atomic_plane_set(self, plane, crtc, source, destination, fb, alp=
ha=3DNone, zpos=3DNone, sync=3DFalse):
>          req =3D AtomicRequest(self)
>          req.add(plane, {
>                      'FB_ID': fb.id,
> @@ -401,6 +401,8 @@ class KMSTest(object):
>          })
>          if alpha is not None:
>              req.add(plane, 'alpha', alpha)
> +        if zpos is not None:
> +            req.add(plane, 'zpos', zpos)
>          if sync:
>              return req.commit_sync()
>          else:
> --=20
> Regards,
>=20
> Laurent Pinchart
>
