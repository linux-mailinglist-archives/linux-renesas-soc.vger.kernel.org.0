Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5F62F3518
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 17:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392149AbhALQJh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 11:09:37 -0500
Received: from mga07.intel.com ([134.134.136.100]:5993 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389112AbhALQJh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 11:09:37 -0500
IronPort-SDR: WGhd0x03NylfSPbP57PSibDFKvJfeYScmVhhNGGffnJtRjkxQ6JKZPxuxbjArvPtQF/E6S5xrb
 VLWgobj7+isg==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="242132904"
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; 
   d="scan'208";a="242132904"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 08:06:49 -0800
IronPort-SDR: R31Bvkfo5m5MQvwwG+05FJgY54GpTPfxC2ws2S9DcABEu3p/XBN5OSk5k3gWYWZjoXL03y0TW8
 xgEaduuNQyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; 
   d="scan'208";a="381475296"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga008.jf.intel.com with SMTP; 12 Jan 2021 08:06:46 -0800
Received: by stinkbox (sSMTP sendmail emulation); Tue, 12 Jan 2021 18:06:45 +0200
Date:   Tue, 12 Jan 2021 18:06:45 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/4] drm: Extend color correction to support 3D-CLU
Message-ID: <X/3JFYg4Y7DVeh22@intel.com>
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201221015730.28333-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201221015730.28333-4-laurent.pinchart+renesas@ideasonboard.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 21, 2020 at 03:57:29AM +0200, Laurent Pinchart wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Extend the existing color management properties to support provision
> of a 3D cubic look up table, allowing for color specific adjustments.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

FYI I've got a WIP 3D LUT implementation for i915 here:
git://github.com/vsyrjala/linux.git 3dlut

I named the prop GAMMA_LUT_3D to indicate its position in the
pipeline (on our hw it's postioned after the normal gamma LUT).
Alas no userspace for it yet, so can't really do anything more 
with it for the time being.

Rudimentary tests also available here:
git://github.com/vsyrjala/intel-gpu-tools.git 3dlut

-- 
Ville Syrjälä
Intel
