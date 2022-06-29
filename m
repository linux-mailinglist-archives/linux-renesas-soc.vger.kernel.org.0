Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 717EF5608C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 20:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbiF2SNz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 14:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiF2SNz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 14:13:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1E1205EA
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 11:13:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5AD93D7;
        Wed, 29 Jun 2022 20:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656526433;
        bh=uEQa6CKRBhCqqJV1dSqvdIvyNUhUoIzq52c3/Ha7x3E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nCfj7yjXd6Fndda1Jofq8Fm5Fx9NtBXtHwlRu75QHP6ISALDiCSiPWmmR/HDslQOw
         cNDi9t9dkhnRsEzbFTb3926CvKlKQRNow6eslO7sj2ozvMqODOy2JywtwVIfyt6261
         UgA+9MuG9+w7LcAJJbDM3+TJAc/m5L7eoROiTN0Y=
Date:   Wed, 29 Jun 2022 21:13:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [kms-test] [PATCH 04/10] kmstest: Move props value formatting to
 AtomicRequest
Message-ID: <YryWTNohK7ejgh6K@pendragon.ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
 <20220609234031.14803-5-laurent.pinchart@ideasonboard.com>
 <165651700917.2049236.8177612268777322664@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <165651700917.2049236.8177612268777322664@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 29, 2022 at 04:36:49PM +0100, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2022-06-10 00:40:25)
> > Centralize props value formatting in the AtomicRequest.add() function to
> > avoid having to call it manually through the code base.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  tests/kmstest.py | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> > 
> > diff --git a/tests/kmstest.py b/tests/kmstest.py
> > index 14e28cd47fbd..2afaa513aa4d 100755
> > --- a/tests/kmstest.py
> > +++ b/tests/kmstest.py
> > @@ -258,15 +258,20 @@ class AtomicRequest(pykms.AtomicReq):
> >          self.__test = test
> >          self.__props = {}
> >  
> > +    def __format_props(self, props):
> 
> This is only validating the value arguements right, to ensure they are
> limited to 64 bit...

That's right, and it's mostly for negative values, that Python would
otherwise handle incorrectly (if I recall correctly that's due to the
bindings for the add() method mapping to the uint64_t, without automatic
conversion for negative values).

> > +        return {k: v & ((1 << 64) - 1) for k, v in props.items()}
> > +
> 
> Not this patch, but seems like 'add()' would benefit from some
> documentation here to show how to use it, what to pass etc.

Good point.

> It's complex to read from just this context, but I can just about see
> that this patch is cleaning things up.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> >      def add(self, obj, *kwargs):
> >          if obj.id not in self.__props:
> >              self.__props[obj.id] = {}
> > -        props = self.__props[obj.id]
> > +        obj_props = self.__props[obj.id]
> >  
> >          if len(kwargs) == 1 and isinstance(kwargs[0], collections.abc.Mapping):
> > -            props.update(kwargs[0])
> > +            props = self.__format_props(kwargs[0])
> >          elif len(kwargs) == 2:
> > -            props[kwargs[0]] = kwargs[1]
> > +            props = self.__format_props({ kwargs[0]: = kwargs[1] })
> > +
> > +        obj_props.update(props)
> >  
> >          super().add(obj, *kwargs)
> >  
> > @@ -309,9 +314,6 @@ class KMSTest(object):
> >      def __del__(self):
> >          self.logger.close()
> >  
> > -    def __format_props(self, props):
> > -        return {k: v & ((1 << 64) - 1) for k, v in props.items()}
> > -
> >      def atomic_crtc_disable(self, crtc, sync=True):
> >          req = AtomicRequest(self)
> >          req.add(crtc, {'ACTIVE': 0, 'MODE_ID': 0})
> > @@ -368,7 +370,7 @@ class KMSTest(object):
> >  
> >      def atomic_plane_set(self, plane, crtc, source, destination, fb, sync=False):
> >          req = AtomicRequest(self)
> > -        req.add(plane, self.__format_props({
> > +        req.add(plane, {
> >                      'FB_ID': fb.id,
> >                      'CRTC_ID': crtc.id,
> >                      'SRC_X': int(source.left * 65536),
> > @@ -379,7 +381,7 @@ class KMSTest(object):
> >                      'CRTC_Y': destination.top,
> >                      'CRTC_W': destination.width,
> >                      'CRTC_H': destination.height,
> > -        }))
> > +        })
> >          if sync:
> >              return req.commit_sync()
> >          else:

-- 
Regards,

Laurent Pinchart
