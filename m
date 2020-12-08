Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB132D1F34
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Dec 2020 01:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbgLHAnm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Dec 2020 19:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728824AbgLHAnm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 19:43:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB13FC061794
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Dec 2020 16:43:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C5ADDD;
        Tue,  8 Dec 2020 01:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607388180;
        bh=sXJJQ3Ales9snSM+M951qVfwVZH4bo1xYMrGw8Lpq9Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FQSetC4HXvcy/ljFLmrhL7T9XbUuMZSSBPTz78w2qxhWVLqXotEyYaZBLTVy3I7IP
         fLS+PoCfAbo9W1c63ChXr1sqWBzUZlDh6t7XlRvXXXY17KWXb1eks/VBu03Zy5a4D0
         Euw6t6DVm6SBO4Hg3qSmbNm6q1M8c8V1qqxZpbiU=
Date:   Tue, 8 Dec 2020 02:42:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 1/9] drm: rcar-du: Fix crash when using LVDS1 clock for
 CRTC
Message-ID: <X87MEVMhOgcFxKwj@pendragon.ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXrEpnQNT=QZRrgQ-jzBvRumUHgqfBrgCHcELpxg7VnQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXrEpnQNT=QZRrgQ-jzBvRumUHgqfBrgCHcELpxg7VnQA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Geert,

On Mon, Dec 07, 2020 at 09:15:11AM +0100, Geert Uytterhoeven wrote:
> On Fri, Dec 4, 2020 at 11:02 PM Laurent Pinchart wrote:
> > On D3 and E3 platforms, the LVDS encoder includes a PLL that can
> > generate a clock for the corresponding CRTC, used even when the CRTC
> > output to a non-LVDS port. This mechanism is supported by the driver,
> > but the implementation is broken in dual-link LVDS mode. In that case,
> > the LVDS1 drm_encoder is skipped, which causes a crash when trying to
> > access its bridge later on.
> >
> > Fix this by storing bridge pointers internally instead of retrieving
> > them from the encoder.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> I think this warrants a Fixes tag, to assist the stable team in backporting
> this fix.

I'll add one.

-- 
Regards,

Laurent Pinchart
