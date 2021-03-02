Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCC732B517
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Mar 2021 07:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238296AbhCCGF3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Mar 2021 01:05:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46252 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378901AbhCBVZT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Mar 2021 16:25:19 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76915ED;
        Tue,  2 Mar 2021 22:24:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614720252;
        bh=qXQ4aWK8r2cIrs6bKobZUdP2h+7hplwrpL5umlYJRRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cj0BQ54pYUSUcpDkAtO18nBsDfAJnd/kLmCvpxZtcDHnbI3WoWpPgx1DMvrmkX3ym
         FTrUZpdrBnyCmfZ0N0ND0pIrDy9iEMtFbDV2lE/3q0t/4lxnGoZb9akNSz5k7ffTrc
         x8MigyMjoi7l+sJzrDwWwlVN0zHs3E2tRlpr49pQ=
Date:   Tue, 2 Mar 2021 23:23:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] drm: rcar-du: Use drmm_encoder_alloc() to manage encoder
Message-ID: <YD6s4O75fTB7zSJh@pendragon.ideasonboard.com>
References: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdVwjWwcWR45BTAjL5Lp66s5coc_Jp1EcBF1ad7MJpY0Og@mail.gmail.com>
 <CAMuHMdV0fEsDWUok=MaxnTXxngMWa5PCEHHCUoBYrqurUEf=1Q@mail.gmail.com>
 <5252aceb-75f9-52d9-cba2-9ecc017698d8@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5252aceb-75f9-52d9-cba2-9ecc017698d8@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Mon, Mar 01, 2021 at 11:52:26AM +0000, Kieran Bingham wrote:
> On 01/03/2021 10:30, Geert Uytterhoeven wrote:
> > On Thu, Jan 14, 2021 at 11:00 AM Geert Uytterhoeven wrote:
> >> On Wed, Jan 13, 2021 at 6:02 PM Kieran Bingham wrote:
> >>> The encoder allocation was converted to a DRM managed resource at the
> >>> same time as the addition of a new helper drmm_encoder_alloc() which
> >>> simplifies the same process.
> >>>
> >>> Convert the custom drm managed resource allocation of the encoder
> >>> with the helper to simplify the implementation, and prevent hitting a
> >>> WARN_ON() due to the handling the drm_encoder_init() call directly
> >>> without registering a .destroy() function op.
> >>>
> >>> Fixes: f5f16725edbc ("drm: rcar-du: Use DRM-managed allocation for encoders")
> >>> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>
> >> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> As in "the WARNING from drm_encoder_init() is gone".
> > 
> > JFYI, the WARNING is now in v5.12-rc1, the fix isn't.
> 
> Does this patch go through you to get into the DRM tree? Or do I need to
> re-send it to someone else?

I can send a pull request with this for the -fixes branch, but as
there's a single patch, maybe David or Daniel could pick it up ?

-- 
Regards,

Laurent Pinchart
