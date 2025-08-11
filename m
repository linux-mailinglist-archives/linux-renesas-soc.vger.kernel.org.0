Return-Path: <linux-renesas-soc+bounces-20228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8685CB20743
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 13:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 592C83AA4FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 11:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18293242D78;
	Mon, 11 Aug 2025 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wLTFxJ4l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14A722154B;
	Mon, 11 Aug 2025 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754910969; cv=none; b=IC2HNCrFSc81gxMRXktqzek0H9HLAGSWm2yWnCOZdvyS7ScyI9fNlRslsjdcl3WumH4P2zxeVuhdK4uPvZr5J3Uk4UByYYcZz3cQVbTDL3Gskc83+SYDOaeVs840kdWj/P25cTF3LB7N4BqdtVvxvpqELGLcQCUGXPJdx8OwgVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754910969; c=relaxed/simple;
	bh=qZKSfx7lKS5o8A/i/O0jJ194e5b90E76li/qjrSBjwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tO2dZRLpFuUDhufyENLLpkBxFCXWbUNuLIWcc6zz6Ii5f3QCOY6sV5h9MKjurgwOg5ZAAmSiH5Zs5JChx/Dnhxku9OChhsh5x//dLxj6SSgvuJKiVwodPDXNdUm+ePXe3XA5exXCBaBObq6rVLcs/NnQiicsdW3TW/MlGuU4/mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wLTFxJ4l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 503A882A;
	Mon, 11 Aug 2025 13:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754910911;
	bh=qZKSfx7lKS5o8A/i/O0jJ194e5b90E76li/qjrSBjwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wLTFxJ4l4/be02dukk9caxg38DsmT1fJe9X69ePV0pEMOsiwwZf8wvsVD2r7u8bRf
	 r40fkfnyO322t0/phGW1K6mbN8weXPAI5+R8JibrzG3rt8ClsGhv81a7gJPprc31Kw
	 FgTe+VBl1jyq23wOp9iGn0pmr3QC1Vh1TX2AcyGQ=
Date: Mon, 11 Aug 2025 14:15:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, kernel-list@raspberrypi.com,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
	uma.shankar@intel.com, jani.nikula@intel.com,
	harry.wentland@amd.com, siqueira@igalia.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	airlied@gmail.com, simona@ffwll.ch, liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	robin.clark@oss.qualcomm.com, abhinav.kumar@linux.dev,
	tzimmermann@suse.de, jessica.zhang@oss.qualcomm.com,
	sean@poorly.run, marijn.suijten@somainline.org, mcanal@igalia.com,
	dave.stevenson@raspberrypi.com,
	tomi.valkeinen+renesas@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <20250811111546.GA30760@pendragon.ideasonboard.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>

On Mon, Aug 11, 2025 at 01:22:30PM +0300, Dmitry Baryshkov wrote:
> On Mon, Aug 11, 2025 at 12:44:29PM +0300, Laurent Pinchart wrote:
> > On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> > > Some drivers cannot work with the current design where the connector
> > > is embedded within the drm_writeback_connector such as intel and
> > > some drivers that can get it working end up adding a lot of checks
> > > all around the code to check if it's a writeback conenctor or not.
> > > To solve this we move the drm_writeback_connector within the
> > > drm_connector and remove the drm_connector base which was in
> > > drm_writeback_connector. We do all other required
> > > modifications that come with these changes along with addition
> > > of new function which returns the drm_connector when
> > > drm_writeback_connector is present.
> > > All drivers will be expected to allocate the drm_connector.
> > > 
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
> > >  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
> > >  include/drm/drm_writeback.h     | 68 ++++-----------------------------
> > >  3 files changed, 89 insertions(+), 72 deletions(-)
> > > 
> > > @@ -2305,6 +2360,11 @@ struct drm_connector {
> > >  	 * @cec: CEC-related data.
> > >  	 */
> > >  	struct drm_connector_cec cec;
> > > +
> > > +	/**
> > > +	 * @writeback: Writeback related valriables.
> > > +	 */
> > > +	struct drm_writeback_connector writeback;
> > 
> > No, sorry, that's a bad idea. Most connectors have nothing to do with
> > writeback, you shouldn't introduce writeback-specific fields here.
> > drm_writeback_connector happens to be a drm_connector because of
> > historical reasons (it was decided to reuse the connector API exposed to
> > userspace instead of exposing a completely separate API in order to
> > simplify the implementation), but that does not mean that every
> > connector is related to writeback.
> > 
> > I don't know what issues the Intel driver(s) have with
> > drm_writeback_connector, but you shouldn't make things worse for
> > everybody due to a driver problem.
> 
> Suraj is trying to solve a problem that in Intel code every drm_connector
> must be an intel_connector too. His previous attempt resulted in a loose
> abstraction where drm_writeback_connector.base wasn't initialized in
> some cases (which is a bad idea IMO).
> 
> I know the historical reasons for drm_writeback_connector, but I think
> we can do better now.
> 
> So, I think, a proper approach would be:
> 
> struct drm_connector {
>     // other fields
> 
>     union {
>         struct drm_connector_hdmi hdmi; // we already have it
>         struct drm_connector_wb wb;  // this is new
>     };
> 
>     // rest of the fields.
> };

I still don't like that. This really doesn't belong here. If anything,
the drm_connector for writeback belongs to drm_crtc.

If the issue is that some drivers need a custom drm_connector subclass,
then I'd rather turn the connector field of drm_writeback_connector into
a pointer.

> I plan to add drm_connector_dp in a similar way, covering DP needs
> (currently WIP).

-- 
Regards,

Laurent Pinchart

