Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63D2078AEB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjH1LXi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232462AbjH1LXW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:23:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D2FFF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221796; x=1724757796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PaQk6OirrhkKt09B+KAVZl4h0ucta+HpJVRq6IIutRM=;
  b=N9zcQlsfyCYVsAywkjTcUkDU4DfZ/Iiufsa62rr5XwMGqvlxmX/GOVJH
   FfrcXUcS1U/jfHxseXApZRLUFh6Bnx29PW9KVX9dTYS7y9J3i8/ITZAuE
   2MuMOLgnIhAItlCGCou+c2nBLgSIT6+kPN00GYmW14NUijZsupFQpny5x
   XU9BeviyXfg0cfFBrzCNgqx/U9pqPojWfakvqu694AnmxchgOlSbgm3Zp
   wCm0qmIkFvVa7O9lmLqc/IIMMxQ5/f7ZvFHZzwNo1EDsxeSz5IwrIiCmO
   Ack7GIeSDu2c2CE6dNLo7wLCJcgGFoen3eV6HtdDged2KAC3ZbV2MbvSl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="354599486"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="354599486"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="767630597"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="767630597"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 28 Aug 2023 04:23:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaKt-00G0XD-3D;
        Mon, 28 Aug 2023 14:23:12 +0300
Date:   Mon, 28 Aug 2023 14:23:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: fan53555: Simplify probe()
Message-ID: <ZOyDnyy3i8hk2FbS@smile.fi.intel.com>
References: <20230826172458.88078-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826172458.88078-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 06:24:58PM +0100, Biju Das wrote:
> Simplify probe() by replacing of_device_get_match_data() and ID lookup for
> retrieving match data by i2c_get_match_data().

...

> +	di->vendor = (unsigned long)i2c_get_match_data(client);

Use standard casting for this type of conversions.

...


> +	if (!client->dev.of_node) {

Why?

Note, we discourage dereference of of_node or fwnode from struct device. We
have APIs for this (in case it's even needed).

-- 
With Best Regards,
Andy Shevchenko


