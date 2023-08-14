Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB7C77B70A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Aug 2023 12:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbjHNKrG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Aug 2023 06:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235053AbjHNKqv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 06:46:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36EA4195
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 03:46:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25BA46BE;
        Mon, 14 Aug 2023 12:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692009936;
        bh=uHA4FT1/nsL3A0N9TlbLzJH1/kxGoyrCZ9+BctG1mLE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vc5FX9NhkogOz2FCX2qn25J16R17pP1ErZycxQqyQMU1ZsBon4Pd2iZomq933wRmz
         IPbp+hbDdpzbP3OBIA0dBVUQ2/A9/G3CfNBZZA05RQK1NwEjob2pkkrnOp4h9Q2g8P
         cvbf7PeWlAUgGxngU6/JsB4u/W49edN7IrjncvS4=
Date:   Mon, 14 Aug 2023 13:46:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Damian Hobson-Garcia <dhobsong@igel.co.jp>
Cc:     kieran.bingham+renesas@ideasonboard.com, taki@igel.co.jp,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 1/2] drm: rcar-du: Add more formats to
 DRM_MODE_BLEND_PIXEL_NONE support
Message-ID: <20230814104655.GB5723@pendragon.ideasonboard.com>
References: <20230728200714.2084223-1-dhobsong@igel.co.jp>
 <20230803234703.GJ9722@pendragon.ideasonboard.com>
 <20230803235315.GL9722@pendragon.ideasonboard.com>
 <20230804000615.GN9722@pendragon.ideasonboard.com>
 <bf2001af-00f2-3a1e-8b79-5747e6607a12@igel.co.jp>
 <20230804155249.GJ12951@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804155249.GJ12951@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 04, 2023 at 06:52:51PM +0300, Laurent Pinchart wrote:
> On Fri, Aug 04, 2023 at 11:49:32AM -0400, Damian Hobson-Garcia wrote:
> > On 2023/08/03 20:06, Laurent Pinchart wrote:
> > > On Fri, Aug 04, 2023 at 02:53:17AM +0300, Laurent Pinchart wrote:
> > >> On Fri, Aug 04, 2023 at 02:47:04AM +0300, Laurent Pinchart wrote:
> > >>> On Fri, Jul 28, 2023 at 04:07:13PM -0400, Damian Hobson-Garcia wrote:
> > >>>> Add additional pixel formats for which blending is disabling when
> > >>>
> > >>> Did you mean "disabled" instead of "disabling" ?
> > 
> > Oops.  Yes, that's exactly what I meant.

I'll fix this locally.

> > >>>> DRM_MODE_BLEND_PIXEL_NONE is set.
> > >>>>
> > >>>> Refactor the fourcc selection into a separate function to handle the
> > >>>> increased number of formats.
> > >>>>
> > >>>> Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
> > >>>> ---
> > >>>>   drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 49 ++++++++++++-------
> > >>>>   1 file changed, 32 insertions(+), 17 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > >>>> index 45c05d0ffc70..96241c03b60f 100644
> > >>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > >>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > >>>> @@ -176,6 +176,37 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
> > >>>>   	DRM_FORMAT_Y212,
> > >>>>   };
> > >>>>   
> > >>>> +static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
> > >>>> +{
> > >>>> +	u32 fourcc = state->format->fourcc;
> > >>>> +
> > >>>> +	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
> > >>>> +		switch (fourcc) {
> > >>>> +		case DRM_FORMAT_ARGB1555:
> > >>>> +			fourcc = DRM_FORMAT_XRGB1555;
> > >>>> +			break;
> > >>>> +
> > >>>> +		case DRM_FORMAT_ARGB4444:
> > >>>> +			fourcc = DRM_FORMAT_XRGB4444;
> > >>>> +			break;
> > >>>> +
> > >>>> +		case DRM_FORMAT_ARGB8888:
> > >>>> +			fourcc = DRM_FORMAT_XRGB8888;
> > >>>> +			break;
> > >>>> +
> > >>>> +		case DRM_FORMAT_BGRA8888:
> > >>>> +			fourcc = DRM_FORMAT_BGRX8888;
> > >>>> +			break;
> > >>>> +
> > >>>> +		case DRM_FORMAT_RGBA1010102:
> > >>>> +			fourcc = DRM_FORMAT_RGBX1010102;
> > >>>> +			break;
> > >>>
> > >>> Should DRM_FORMAT_ARGB2101010 be added as well, or did you leave it out
> > >>> intentionally ?
> > 
> > Yes, it was intentionally left out for the time being for the
> > reason that you noted (i.e. DRM_FORMAT_XRGB2101010 not
> > being handled by the DU driver).
> > 
> > >> It looks like DRM_FORMAT_ARGB2101010 will require a bit more work, as
> > >> DRM_FORMAT_XRGB2101010 is not handled by the DU driver at the moment.
> > >> Let's do so with a patch on top of this series.
> >
> > Yes, I was thinking the same thing.
> >
> > > Replying to myself again, the datasheet doesn't explicitly list
> > > DRM_FORMAT_XRGB2101010 as supported, but the generic mechanism to
> > > specify the location of the components should work fine for that format.
> > > Is this something you would be able to test ?
> > 
> > Unfortunately I don't have a Gen 4 system on hand to test the 2-10-10-10 
> > formats with.
> > I will double-check with the office in Japan, but I don't think that 
> > they have one either.
> 
> Tomi, is this something you could test ?

Replying to myself, this is something we could test, but let's not delay
this series, new formats can always be added on top.

> > >> There's no need to send
> > >> a v2, I can handle the simple change in the commit message if you let me
> > >> know whether my comment is right or wrong.

-- 
Regards,

Laurent Pinchart
