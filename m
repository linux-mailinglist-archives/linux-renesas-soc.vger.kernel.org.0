Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7404778AE9D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjH1LRs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232468AbjH1LRn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:17:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F235AB6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221461; x=1724757461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fgFK6LRKxwrhncdT/gqixBYiQ/SAodbCr/UI1yHjXSg=;
  b=AIEsasHbMHkxpkBb5IPDmuAsfB5GrX4MvZ3KP4RkTjm46kJNhZ4c4Hfn
   Q/VLgx3UqQo//iKPLv0W3ni0Kfhls0WYHvBTul/jwD3aRYw8FlZkIAyZk
   sbEGmtb/iqpG4kANiPS7K+rvMxtcPWF51Ruc4ls7ddlpgUsdxu/fDSMWG
   qyeirj53qi9bZ2QPkee9VMi8z27Q3lm6aq/7KSv7n/aTgyR+SI5UmgaiS
   3pHBUAfWFKhf2I+R3PE4MdrWm4beo4y7YQ5LQFRHvzwjExmdYlodEFwM/
   0m6O9Xu1sKmZJRlFRE9y/C2AWg6rVwCTe+Lbq4bm5gtKI7hIwmO+QIStD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="378852871"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="378852871"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="688070737"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="688070737"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 28 Aug 2023 04:17:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaFR-00FpKc-0s;
        Mon, 28 Aug 2023 14:17:33 +0300
Date:   Mon, 28 Aug 2023 14:17:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 1/2] drm/bridge/analogix/anx78xx: Drop ID table
Message-ID: <ZOyCTPJK9JuAYbB8@smile.fi.intel.com>
References: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
 <20230826071901.29420-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826071901.29420-2-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 08:19:00AM +0100, Biju Das wrote:
> The driver has an ID table, but it uses the wrong API for retrieving match
> data and that will lead to a crash, if it is instantiated by user space or
> using ID. From this, there is no user for the ID table and let's drop it
> from the driver as it saves some memory.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


