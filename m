Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF59878AC16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 12:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjH1KhI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 06:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbjH1KhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 06:37:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9486FAB;
        Mon, 28 Aug 2023 03:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693219019; x=1724755019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Aq3/gK81Dgx0YuzZbiFuBZsQ3QfEivtZe/N8WMO0YCs=;
  b=B2TL5LX0CQNXUik2WMySmn3SgzYhJJT5WxEnwpoQaVxT36MwH1tlJ3Cf
   HZp8IF5JaKLVcZw3Ivf5ZUcY/aQSndczQ42st/0XHNDR3TUrJhizoekrv
   2i/Oxs97nNkIsgXNvY5u3U9BvuI7hcUcZOlPL2t4piZsc8d7Dyw9SWqiP
   /evw5e1LGEmJ2TwaenhNTh6C5tcwYVGL2zyrOe5T8J0iigvMA4b3q4dbm
   W7pfhaIBN+gesj12JLX1DlMyF+THAqsAiQYNi8uVKXNGM1rWLlh9mCinH
   heyKW6NiqXYHpcyrn6Q2kE56OFqJzwKCFcDKStwuonL17IEaqwfagIRR6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="360066393"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="360066393"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 03:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="731778213"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="731778213"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 28 Aug 2023 03:36:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaZc6-00EUoe-2e;
        Mon, 28 Aug 2023 13:36:54 +0300
Date:   Mon, 28 Aug 2023 13:36:54 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: tmp513: Simplify tmp51x_read_properties()
Message-ID: <ZOx4xlc8bFfXQbUx@smile.fi.intel.com>
References: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
 <20230825205345.632792-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdWESYVB2UXAHrKuBNway2zDzm-D-7rX8bz0OESAACK+OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWESYVB2UXAHrKuBNway2zDzm-D-7rX8bz0OESAACK+OA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 28, 2023 at 09:45:17AM +0200, Geert Uytterhoeven wrote:
> On Fri, Aug 25, 2023 at 10:54 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Simplify tmp51x_read_properties() by replacing 'nfactor' ->'data->nfactor'
> > in device_property_read_u32_array() and drop the local variable as it is
> > unused.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> > -       ret = device_property_read_u32_array(dev, "ti,nfactor", nfactor,
> > -                                           data->max_channels - 1);
> > -       if (ret >= 0)
> > -               memcpy(data->nfactor, nfactor, data->max_channels - 1);
> > +       device_property_read_u32_array(dev, "ti,nfactor", data->nfactor,
> > +                                      data->max_channels - 1);
> 
> My first thought was that this could cause a small change in behavior.
> However, the comments for of_property_read_u32_array() and
> of_property_read_variable_u32_array() state:

I don't know how the latter is relevant here (or even anything from of_*()
specific APIs). The device property APIs should give behaviour described
in their own docs (although it must be compatible with the existing OF one).

>  * The out_values is modified only if a valid u32 value can be decoded.
> 
> and the implementation behaves that way.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

-- 
With Best Regards,
Andy Shevchenko


