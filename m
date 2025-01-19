Return-Path: <linux-renesas-soc+bounces-12241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 835B9A16326
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Jan 2025 18:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B9221883EAA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Jan 2025 17:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E561DF964;
	Sun, 19 Jan 2025 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OBw1pvsH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA851DF254;
	Sun, 19 Jan 2025 17:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737306551; cv=none; b=XiRBEnlMTnpFjK4dLeoQf9Dj/L2ZnsQRp9JKbwwGqZWzeIi0nqmL+KYN1og1wkM388VyNhuKPzilmLGFHFXNuuqtTGNMnIhMcFCwJqNh6RlbCK9BQ/XWxVbiLctgRpRO5lVSKPFeZEbD/gw1bFfP/nJKkrG4BMFwnb+qfB+1CnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737306551; c=relaxed/simple;
	bh=aJRfXAoIvGiK3DbkqnVQeu1PiaXDKaiA9Gr69mpEeis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PO6pPt0HPhMleTaBgU0F9DDzgrgG8TLWSLGciPiWOc56EjKPEre44SsdnrmMUguRV5lmYmhyxDuLvkAz9ixKn5j9Kzw7wjLw43bLFG6dPjo7U5Zz5UJP5VryJqcNfsUhdkCLewYEaiOqHFSA3fYhQD8Ki6Ts8JB7sMMh70UrZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OBw1pvsH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89E37A44;
	Sun, 19 Jan 2025 18:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737306485;
	bh=aJRfXAoIvGiK3DbkqnVQeu1PiaXDKaiA9Gr69mpEeis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OBw1pvsHcR2BweZX/KU1szcB/w7FtiRtRW7yb+DznyFivWl1EatIqP+ePhHYSjEzj
	 woJcak3Nj+IU95kPpPRovUwkyjiuPwG5ekSoIX5uH93MQlfYfUlHPU6r5/ncEIxZV4
	 QiCXHGtqYYzymRcOpqSQO1hNMGBl60pFLxpvCuJY=
Date: Sun, 19 Jan 2025 19:08:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Daniel Stone <daniel@fooishbar.org>,
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
Message-ID: <20250119170859.GA2467@pendragon.ideasonboard.com>
References: <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
 <20250116084340.GF6754@pendragon.ideasonboard.com>
 <20250116093854.GG6754@pendragon.ideasonboard.com>
 <e8125edc-928a-47b4-80a3-224c945f6d68@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e8125edc-928a-47b4-80a3-224c945f6d68@ideasonboard.com>

On Thu, Jan 16, 2025 at 12:07:49PM +0200, Tomi Valkeinen wrote:
> On 16/01/2025 11:38, Laurent Pinchart wrote:
> > On Thu, Jan 16, 2025 at 10:43:40AM +0200, Laurent Pinchart wrote:
> >> On Wed, Jan 15, 2025 at 02:34:26PM +0000, Daniel Stone wrote:
> >>> On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen wrote:
> >>>> No disagreement there, we need CREATE_DUMB2.
> >>>>
> >>>> My point is that we have the current UAPI, and we have userspace using
> >>>> it, but we don't have clear rules what the ioctl does with specific
> >>>> parameters, and we don't document how it has to be used.
> >>>>
> >>>> Perhaps the situation is bad, and all we can really say is that
> >>>> CREATE_DUMB only works for use with simple RGB formats, and the behavior
> >>>> for all other formats is platform specific. But I think even that would
> >>>> be valuable in the UAPI docs.
> >>>
> >>> Yeah, CREATE_DUMB only works for use with simple RGB formats in a
> >>> linear layout. Not monochrome or YUV or tiled or displayed rotated or
> >>> whatever.
> >>>
> >>> If it happens to accidentally work for other uses, that's fine, but
> >>> it's not generically reliable for anything other than simple linear
> >>> RGB. It's intended to let you do splash screens, consoles, recovery
> >>> password entries, and software-rendered compositors if you really
> >>> want. Anything more than that isn't 'dumb'.
> >>
> >> We have lots of software out there that rely on CREATE_DUMB supporting
> >> YUV linear formats, and lots of drivers (mostly on Arm I suppose) that
> >> implement YUV support in CREATE_DUMB. I'm fine replacing it with
> >> something better, but I think we need a standard ioctl that can create
> >> linear YUV buffers. I've been told many times that DRM doesn't want to
> >> standardize buffer allocation further than what CREATE_DUMB is made for.
> >> Can we reconsider this rule then ?
> > 
> > Actually... Instead of adding a CREATE_DUMB2, it would be best on trying
> > to leverage DMA heaps and deprecate allocating from the KMS device.
> 
> If we allocate from DMA heaps, I think we then need a DRM ioctl which 
> will tell you how big buffer(s) you need, based on the size and format.

We will at least a kernel API to expose constraints to userspace.
Whether that should calculate the buffer size for a given format, or
expose information to userspace to enable that calculation, I'm not
sure. But regardless of which option we pick, I agree we likely need a
new API to enable usage of DMA heaps as allocators.

-- 
Regards,

Laurent Pinchart

