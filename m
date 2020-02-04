Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4390315211A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2020 20:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbgBDTav (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Feb 2020 14:30:51 -0500
Received: from mga11.intel.com ([192.55.52.93]:5808 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727331AbgBDTav (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Feb 2020 14:30:51 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 11:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; 
   d="scan'208";a="263956574"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2020 11:30:49 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iz3uM-000100-VD; Tue, 04 Feb 2020 21:30:50 +0200
Date:   Tue, 4 Feb 2020 21:30:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v1] drm: shmobile: Platform data shan't include kernel.h
Message-ID: <20200204193050.GN10400@smile.fi.intel.com>
References: <20200204161916.28744-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW8kgnw4k9-jpronxDMmeZ7NJkc4Anwmc5G247QyX80GQ@mail.gmail.com>
 <20200204182621.GE20396@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204182621.GE20396@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 04, 2020 at 08:26:21PM +0200, Laurent Pinchart wrote:
> On Tue, Feb 04, 2020 at 06:39:34PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Feb 4, 2020 at 5:20 PM Andy Shevchenko wrote:
> > > Replace with appropriate types.h.
> > 
> > Thanks for your patch!
> > 
> > I have only one very short question: why?
> 
> Likewise :-) The patch itself looks fine, but the commit message is a
> bit terse.

The kernel.h for a long time being a dump of a lot of things. I started
cleaning it up a bit. During this I notice that developers too far too lazy to
use appropriate headers. For platform data kernel.h by definition is not
appropriate.

Any suggestion what should I put to commit message?

-- 
With Best Regards,
Andy Shevchenko


