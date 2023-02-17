Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1FF69AD4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 15:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjBQOEF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 09:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjBQOEE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 09:04:04 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF0166645;
        Fri, 17 Feb 2023 06:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676642643; x=1708178643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MGJGDjvtwtNmAkpFg5P7i1muN2Wcj50kvSKQQk758bE=;
  b=iDp1G29orCXfp6lDkId5qQDsAfyJrZMuW1o9AlTN7TtxPfreRO/ACw3A
   XPw+ellVSRrQ0vxcrwrD2Z10NzySeDgXaaFn1j64rLpe3+mCIg+RJ5xfY
   Z39upqKNcrSNieXTKcnsV1Tucr5bDLgqMCbLnEbhq1+bHgIBG+XAt7BeU
   bkGbs6+z451+T90/GI+sc7KU4W9Fce2vwhaGWhzLkVZIpqLC+9K+Qgtz7
   bAuJIlqxIYjdl8xQhGlcQDWrpKo4act6M65MqlurBkOPhk2/sMJHMwHX8
   0F9u8npGTgybw+65uLApyKbobyQRHIcB+J9WxL8rdQrSX5Vm/OSZn88e5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333349719"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="333349719"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 06:04:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="999446109"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="999446109"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 17 Feb 2023 06:03:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pT1LB-008Efy-0d;
        Fri, 17 Feb 2023 16:03:57 +0200
Date:   Fri, 17 Feb 2023 16:03:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/6] serial: 8250_em: Use dev_err_probe()
Message-ID: <Y++JTJwvWb5u3Wm8@smile.fi.intel.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217114255.226517-2-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 17, 2023 at 11:42:50AM +0000, Biju Das wrote:
> This patch simplifies probe() by using dev_err() instead
> of dev_err_probe()

The patch does the opposite AFAICS.

> and added a local variable 'dev' to
> replace '&pdev->dev'.

-- 
With Best Regards,
Andy Shevchenko


