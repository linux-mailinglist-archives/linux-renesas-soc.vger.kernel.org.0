Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6595608B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 20:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbiF2SHf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 14:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbiF2SHO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 14:07:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D781A3EA95
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 11:07:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA8153D7;
        Wed, 29 Jun 2022 20:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656526030;
        bh=ZeCuqOjT4CHHQFsuR5z7IR5X/K2bIyWoNhXcptKYI7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CrTG5OjkJeZTJawOmdo+Wm0DsGulSkW0+zkTMY5oCR2YhqMzfj7Vj/YpBhkRFeHBA
         4emDo4b2g0mN9kDMlSLNhjW7fw0G9U1LfY0uezsAmLHbhBX2/LdWTX3NY6KMzmZaqN
         MKLcMd/y6y8C6zu5u3so54hRiDXNnuJ4oD0JWNFE=
Date:   Wed, 29 Jun 2022 21:06:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [kms-test] [PATCH 03/10] tests: allplanes: Log the plane IDs
Message-ID: <YryUuVW1QAhDS3QM@pendragon.ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
 <20220609234031.14803-4-laurent.pinchart@ideasonboard.com>
 <165651662610.2049236.998658351377800963@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <165651662610.2049236.998658351377800963@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 29, 2022 at 04:30:26PM +0100, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2022-06-10 00:40:24)
> > Plane IDs are useful for debugging, log them.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  tests/kms-test-allplanes.py | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
> > index 0fe6cfab0a2d..96ac4f19f538 100755
> > --- a/tests/kms-test-allplanes.py
> > +++ b/tests/kms-test-allplanes.py
> > @@ -46,7 +46,8 @@ class AllPlanesTest(kmstest.KMSTest):
> >                  continue
> >  
> >              self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
> > -                            f'mode {mode.name} with {len(planes)} planes')
> > +                            f'mode {mode.name} with {len(planes)} planes '
> > +                            f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
> 
> Is P plane / Primary ? And O ... Other ?

It's Primary and Overlay.

> either way, it's debug info that's helpful (and I hope more obvious) to
> the reader at runtime.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> >  
> >              # Create a frame buffer
> >              fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')

-- 
Regards,

Laurent Pinchart
