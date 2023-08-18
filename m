Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3704A781144
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 19:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378904AbjHRRJj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 13:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378906AbjHRRJS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 13:09:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBB430D8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 10:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692378557; x=1723914557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mzs+5M+GNbK7z97k5Ovdlc5RxEaxEPydxc/obNqVPIE=;
  b=UYFc/vo30dCqKiUejH8BHCNpstlporcdC8vg0qsG9wGu5d+w848ox3qQ
   3JVgCmt0Dd4vlZlkdYQaO5ugGDIB++Xt/67xMpyV12vGOJVjAysOoHO/g
   Bhw1FcuXj8w49FeOSIzqTKIaBTZUNWDmwGobOg9+kwX53kN4XU6ZMBzpf
   jAnM7ccEBMYRH2xTzgVRR1l9U6M9UBPA68RAH3ggP9RDbtQA+PEggFGm2
   l66AZOv6XK7InVE/iPnAIWzFBB6OSAV5JdAQ7HPouk5V/Q5hOki/iqucl
   cLBEk30G+ubJ9aBRPlSI37ibmR253Nnp/5WRepYqclDJMw6gcoQ9X6T7v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="358121781"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="358121781"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 10:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="738175433"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="738175433"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 18 Aug 2023 10:09:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qX2yD-00HEXa-0k;
        Fri, 18 Aug 2023 20:09:09 +0300
Date:   Fri, 18 Aug 2023 20:09:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Phong LE <ple@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Match data improvements for it66121 driver
Message-ID: <ZN+ltEl3zLN9pkKG@smile.fi.intel.com>
References: <20230818165452.320984-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818165452.320984-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 18, 2023 at 05:54:50PM +0100, Biju Das wrote:
> This patch series aims to add match data improvements for it66121 driver.

With the Fixes removed, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


