Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A26355B46A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jun 2022 01:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiFZXM6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 26 Jun 2022 19:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiFZXM5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Jun 2022 19:12:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB38BDDD
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Jun 2022 16:12:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CDA047C;
        Mon, 27 Jun 2022 01:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656285174;
        bh=Hv5AjOEyR78pg0Y+z/Kx5UCz2H4mLTAiPmz1ewvHciw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lk5djvyrmcYPdbymW9GNpVrm5D77Tz2Oi7y5UfwaA3dJf0PyjkSRW68rwXAC4BxXA
         /7WXgjAUdqNBvAuyuok2Osk9UjIR236QNn75wCwAJs6LBkdLuTA/WODmOX2+P1Gcx3
         6jgTKZL95ssxPe7Ajkmy4+/gE7SL/E4hit48M9G8=
Date:   Mon, 27 Jun 2022 02:12:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Harsha Manjula Mallikarjun 
        <Harsha.ManjulaMallikarjun@in.bosch.com>, kieran@ksquared.org.uk,
        kieran@ksquared.org.uk,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Friedrich Eugen <EFriedrich@de.adit-jv.com>,
        Rajendraprasad Karammel Jayakumar 
        <KarammelJayakumar.Rajendraprasad@in.bosch.com>,
        Nguyen Trong Vinh <Vinh.NguyenTrong@vn.bosch.com>
Subject: Re: RCAR CMM : features and improvements
Message-ID: <Yrjn5NEHR5DsKpMH@pendragon.ideasonboard.com>
References: <DU0PR10MB522025BD0BBDDC94CC87AA45DAB49@DU0PR10MB5220.EURPRD10.PROD.OUTLOOK.COM>
 <165607346815.1149771.3928519467340826398@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <165607346815.1149771.3928519467340826398@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Fri, Jun 24, 2022 at 01:24:28PM +0100, Kieran Bingham wrote:
> Quoting Harsha Manjula Mallikarjun (MS/ECF3-XC) (2022-06-24 10:18:14)
> > Hi Kieran, Hi Laurent,
> > 
> > We are planning to put some efforts to improve and add, on top of the
> > RCAR CMM patches[1] and upstream them.  Following are the
> > add-ons/improvements planned. If there are some activities with
> > respect RCAR CMM, are ongoing already in upstream, we are happy to be
> > involved in it and can spare efforts.
> > 
> > 1. Double buffering support for CLU, LUT tables.
> 
> > 2. Add worker thread in rcar_cmm to apply the table settings. To apply
> >    the CLU settings time taken is around ~7ms. This looks a bit high and
> >    more importantly it just blocks the compositor.
> 
> > 3. With the patches[1] I see that CLU settings are written to
> >    registers but, the display does not show any change. Also, I see a
> >    short freeze on the display. This needs to be resolved.
> > 
> > Also we have some patches for weston drm-backend which can set the
> > 3DLUT, but they could not be up-streamed because drm object properties
> > "CUBIC_LUT" and "CUBIC_LUT_SIZE" are not the standard ones yet.
> 
> Reading [2], I think one of the blockers to getting [1] merged was the
> lack of such an implementation to userspace. So I think if you were able
> to share/post that - it would help unblock the upstreaming.

Even if the patches can't be upstreamed in Weston yet, posting them as
RFC to show how the new DRM properties are used would be extremely
helpful to get the kernel side merged.

> Your results above warrant further investigation though, as indeed 7ms
> to set some registers sounds quite high, even if it is a large table,
> and even more so if they are not taking effect.
>  
> > [1]: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=404647
>   [2]: https://patchwork.kernel.org/project/linux-renesas-soc/patch/20201221015730.28333-4-laurent.pinchart+renesas@ideasonboard.com/

-- 
Regards,

Laurent Pinchart
