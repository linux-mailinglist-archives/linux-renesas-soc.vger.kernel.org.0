Return-Path: <linux-renesas-soc+bounces-12190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5464A136CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 10:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAA40188A363
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 09:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FD31DC99E;
	Thu, 16 Jan 2025 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n0BH+gjP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1479C1DC184;
	Thu, 16 Jan 2025 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737020343; cv=none; b=DkjfGONulCX3yLRqb0mBNEzyhZ4BDMTcv7LZpLFzVsicuMQTW8kvKeBV14unKuyRa9nk8m4WkQZctuAigA7kHd2BszWczz0R2TG7Uz7Rnsepjg0CSnZWFvdpOwh5hWtxWw8Xjn4Dn0KbCntDXCcroELZdZNVLvD/CgD8SL6WlbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737020343; c=relaxed/simple;
	bh=Sz7XGsB0jJiCVcgAYNC5ZZi+VkFA4hXqTcdj3HBGvi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHRhENrp2ZqQczxWLuq+ty9xQB2BXiDpyYTu6FPi/0NCJfwfXBfA3E6o83hZ5HjpbHPVS4HDtNAIt3aE68mkjpvBtEC02mEkNd/4qrpBPn5dKkXG3eNrtnGWRtheNckw0P3g7HHXHEgFJ07NI7tlSUidW6sD1YWWNvNwNlK4qFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n0BH+gjP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12F276B5;
	Thu, 16 Jan 2025 10:38:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737020281;
	bh=Sz7XGsB0jJiCVcgAYNC5ZZi+VkFA4hXqTcdj3HBGvi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0BH+gjPklcJM4K7npyiN+OizL+So166OYOAFCGwmyI31sasdC0hnhksHO/5bLnfw
	 HMc/eoseS5N2gVokQXXsjM5itCkOuGjpNUxwyWy3Ek6SdEbjqi0yC6yW0imGRrqVj1
	 1fRnvPVpWPsdUJLy5MKa4eyuKZRKjUpaQVwa4Knc=
Date: Thu, 16 Jan 2025 11:38:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
	Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <20250116093854.GG6754@pendragon.ideasonboard.com>
References: <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
 <20250116084340.GF6754@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250116084340.GF6754@pendragon.ideasonboard.com>

On Thu, Jan 16, 2025 at 10:43:40AM +0200, Laurent Pinchart wrote:
> On Wed, Jan 15, 2025 at 02:34:26PM +0000, Daniel Stone wrote:
> > On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen wrote:
> > > No disagreement there, we need CREATE_DUMB2.
> > >
> > > My point is that we have the current UAPI, and we have userspace using
> > > it, but we don't have clear rules what the ioctl does with specific
> > > parameters, and we don't document how it has to be used.
> > >
> > > Perhaps the situation is bad, and all we can really say is that
> > > CREATE_DUMB only works for use with simple RGB formats, and the behavior
> > > for all other formats is platform specific. But I think even that would
> > > be valuable in the UAPI docs.
> > 
> > Yeah, CREATE_DUMB only works for use with simple RGB formats in a
> > linear layout. Not monochrome or YUV or tiled or displayed rotated or
> > whatever.
> > 
> > If it happens to accidentally work for other uses, that's fine, but
> > it's not generically reliable for anything other than simple linear
> > RGB. It's intended to let you do splash screens, consoles, recovery
> > password entries, and software-rendered compositors if you really
> > want. Anything more than that isn't 'dumb'.
> 
> We have lots of software out there that rely on CREATE_DUMB supporting
> YUV linear formats, and lots of drivers (mostly on Arm I suppose) that
> implement YUV support in CREATE_DUMB. I'm fine replacing it with
> something better, but I think we need a standard ioctl that can create
> linear YUV buffers. I've been told many times that DRM doesn't want to
> standardize buffer allocation further than what CREATE_DUMB is made for.
> Can we reconsider this rule then ?

Actually... Instead of adding a CREATE_DUMB2, it would be best on trying
to leverage DMA heaps and deprecate allocating from the KMS device.

-- 
Regards,

Laurent Pinchart

