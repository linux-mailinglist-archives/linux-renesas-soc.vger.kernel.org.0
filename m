Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3C0D585FC2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 18:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237499AbiGaQSa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 12:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236993AbiGaQS3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 12:18:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0898DFF9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 09:18:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E505415;
        Sun, 31 Jul 2022 18:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659284307;
        bh=9hExLcFmQyp8mznkPiezuIfRFpKVbx5iSs1QCxrntBw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tnS4Fl6sxGQznPF/XUo7gNCwQfsWAI5GcnSD0JgA2qQWwjEz21Rt3xpkfVNYH51nF
         lfrlu9+2laZ5Genxj6Di1liHZmefytfpbAEYBMreo4bjWqfanTyUql82FmHpY/3FzL
         YEuzaMLukuypgOxKPQqcGFnuBsJbcOUcm2bnirME=
Date:   Sun, 31 Jul 2022 19:18:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Takanari Hayama <taki@igel.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 1/3] tests: Support enum property type
Message-ID: <YuarTkDWaYjvAl/h@pendragon.ideasonboard.com>
References: <20220704025632.3911253-1-taki@igel.co.jp>
 <20220704025632.3911253-2-taki@igel.co.jp>
 <YuanO6pgmtEvfwRj@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YuanO6pgmtEvfwRj@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

One more comment.

On Sun, Jul 31, 2022 at 07:01:00PM +0300, Laurent Pinchart wrote:
> Hi Hayama-san,
> 
> Thank you for the patch.
> 
> On Mon, Jul 04, 2022 at 11:56:30AM +0900, Takanari Hayama wrote:
> > Add a support for enum property type to AtomicRequest.
> > 
> > Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> > ---
> >  tests/kmstest.py | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/kmstest.py b/tests/kmstest.py
> > index 11cc328b5b32..224c160e32fa 100755
> > --- a/tests/kmstest.py
> > +++ b/tests/kmstest.py
> > @@ -269,8 +269,18 @@ class AtomicRequest(pykms.AtomicReq):
> >  
> >                      min, max = prop.values
> >                      v = min + int((max - min) * int(v[:-1]) / 100)
> > -                else:
> > +                elif v.isnumeric():
> >                      v = int(v)
> > +                else:
> > +                    prop = obj.get_prop(k)

I've run this test on a kernel that doesn't support the blend mode
property, and the prop.type access below raised an exception that isn't
very nice to read. If that's fine with you, I'll add

                    if not prop:
                        raise RuntimeError(f'Property {k} not supported by object {obj}')

here to make error messages more readable.

> > +                    if prop.type != pykms.PropertyType.Enum:
> > +                        raise RuntimeError(f'Unsupported property type {prop.type} for value {v}')
> > +                    for value, mode in prop.enums.items():
> 
> I'd replace "mode" with "name" here. Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I'll change this when applying the patch.
> 
> > +                        if mode == v:
> > +                            v = value
> > +                            break
> > +                    else:
> > +                        raise RuntimeError(f'Enum value with name "{v}" not found in property {k}')
> >  
> >              if not isinstance(v, int):
> >                  raise RuntimeError(f'Unsupported value type {type(v)} for property {k}')

-- 
Regards,

Laurent Pinchart
