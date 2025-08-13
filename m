Return-Path: <linux-renesas-soc+bounces-20457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C48B24903
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 14:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF8F23AD020
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 12:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EAA2FDC4C;
	Wed, 13 Aug 2025 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rOg9wUHI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526C92FAC1D;
	Wed, 13 Aug 2025 12:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755086451; cv=none; b=HkE8L/eJMZpZSVpRfn2lYWa46hDqRZ/5hAs75wkq2/K/PwNmpG+iH2ai9OuKG3pubXaT3MErvYVMOTjH33kKYjmQtWEj0vYK7tTlRv0rY1vtApDcS8FRqoOFXbfTrHRDFZvUsCRgvp/d4uY5w3DzFkdQ8DpJTQK2S5ut1q3ptpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755086451; c=relaxed/simple;
	bh=Z0Wd8Ul5IDIWW8lxpyrGHrFqOEXZiZV2mDebB4u5iE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+rJInLHndCbyizAP8Fmt9+EwB/eWWh9BnSS5HUFsbSSbxCRW4lukDd5Vy63Ls6q9gmfvam3PHbw3dxw4S78ud9dQEYi66R7GvqXKywU9Xbk6LzixLMbwn5+XyzayjAaopBNiU3k5KtVLLvMCSa50cGYzjhFSL3FyRTTDUuRZFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rOg9wUHI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5AE853D5;
	Wed, 13 Aug 2025 13:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755086394;
	bh=Z0Wd8Ul5IDIWW8lxpyrGHrFqOEXZiZV2mDebB4u5iE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rOg9wUHIbPEf8oD+S/HQgLiT+Ai8eRs5plN7KfY2BBIY0wfkrzEz3ag5dCeEf2/i3
	 RF6xNPKTXbUbsF/QoBV6L8GEne60I13yX3l803DuYWioasayslSxglfN+k9p0fzG/W
	 FevitONufT6X9SIEpJrGUMhPwvU+lq60Z0MZc1tI=
Date: Wed, 13 Aug 2025 15:00:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
	"Murthy, Arun R" <arun.r.murthy@intel.com>,
	"Shankar, Uma" <uma.shankar@intel.com>,
	"Nikula, Jani" <jani.nikula@intel.com>,
	"harry.wentland@amd.com" <harry.wentland@amd.com>,
	"siqueira@igalia.com" <siqueira@igalia.com>,
	"alexander.deucher@amd.com" <alexander.deucher@amd.com>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"liviu.dudau@arm.com" <liviu.dudau@arm.com>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
	"abhinav.kumar@linux.dev" <abhinav.kumar@linux.dev>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
	"sean@poorly.run" <sean@poorly.run>,
	"marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
	"mcanal@igalia.com" <mcanal@igalia.com>,
	"dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
	"tomi.valkeinen+renesas@ideasonboard.com" <tomi.valkeinen+renesas@ideasonboard.com>,
	"kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>,
	"louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <20250813120029.GE20174@pendragon.ideasonboard.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
 <20250811111546.GA30760@pendragon.ideasonboard.com>
 <2ah3pau7p7brgw7huoxznvej3djct76vgfwtc72n6uub7sjojd@zzaebjdcpdwf>
 <DM3PPF208195D8D0E55A761A3C16B87BAEEE32AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D0E55A761A3C16B87BAEEE32AA@DM3PPF208195D8D.namprd11.prod.outlook.com>

On Wed, Aug 13, 2025 at 10:04:22AM +0000, Kandpal, Suraj wrote:
> > > > };
> > >
> > > I still don't like that. This really doesn't belong here. If anything,
> > > the drm_connector for writeback belongs to drm_crtc.
> > 
> > Why? We already have generic HDMI field inside drm_connector. I am really
> > hoping to be able to land DP parts next to it. In theory we can have a DVI-
> > specific entry there (e.g. with the subconnector type).
> > The idea is not to limit how the drivers subclass those structures.
> > 
> > I don't see a good case why WB should deviate from that design.
> > 
> > > If the issue is that some drivers need a custom drm_connector
> > > subclass, then I'd rather turn the connector field of
> > > drm_writeback_connector into a pointer.
> > 
> > Having a pointer requires additional ops in order to get drm_connector from
> > WB code and vice versa. Having drm_connector_wb inside drm_connector
> > saves us from those ops (which don't manifest for any other kind of structure).
> > Nor will it take any more space since union will reuse space already taken up by
> > HDMI part.
> 
> Seems like this thread has died. We need to get a conclusion on the design.
> Laurent do you have any issue with the design given Dmitry's explanation as to why this
> Design is good for drm_writeback_connector.

I'm busy, I'll try to reply in the next few days.

> > > > I plan to add drm_connector_dp in a similar way, covering DP needs
> > > > (currently WIP).

-- 
Regards,

Laurent Pinchart

