Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2BC154297
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2020 12:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgBFLEo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Feb 2020 06:04:44 -0500
Received: from mga07.intel.com ([134.134.136.100]:44995 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727060AbgBFLEo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Feb 2020 06:04:44 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Feb 2020 03:04:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,409,1574150400"; 
   d="scan'208";a="344750862"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2020 03:04:42 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1izexg-0007Oc-13; Thu, 06 Feb 2020 13:04:44 +0200
Date:   Thu, 6 Feb 2020 13:04:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] drm: shmobile: Reduce include dependencies
Message-ID: <20200206110444.GU10400@smile.fi.intel.com>
References: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
 <20200205173322.GB4722@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205173322.GB4722@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 05, 2020 at 07:33:22PM +0200, Laurent Pinchart wrote:
> Hi Andy,
> 
> Thank you for the patch.
> 
> On Wed, Feb 05, 2020 at 11:32:26AM +0200, Andy Shevchenko wrote:
> > This file doesn't need everything provided by <linux/kernel.h>.
> > All it needs are some types, which are provided by <linux/types.h>.
> > 
> > Note, <drm/drm_mode.h> already includes <linux/types.h>, but
> > not relying on implicit includes is indeed a good thing.
> 
> Do we even need linux/types.h ? Apart from struct drm_mode_modeinfo,
> shmob_drm.h seems to only contain plain C without using any externally
> defined types.

Good point. It doesn't contain neither bool nor uXX or alike types.
Probably we may simple drop the inclusion. I'll send v3.

-- 
With Best Regards,
Andy Shevchenko


