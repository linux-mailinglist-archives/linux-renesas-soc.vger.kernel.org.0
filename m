Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6F169AF3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 16:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbjBQPOG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 10:14:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjBQPOF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 10:14:05 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E903564B1B;
        Fri, 17 Feb 2023 07:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676646844; x=1708182844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XlMq6NKjU2Uo43k4tPFf20YfpaOGLR9vo00TDrVrk2U=;
  b=djdZ2PDH/bC4yWUWr2VXjlTjTH05CY7bWnkFO0NTtpvFG3+qCX+1xSjF
   h+FXgfBNlQqavwe9NkV3U7Bq5opP+l6bFn4QPdY9OoJMRZCQYlcquDFO0
   afIrfp2/+BQrvvp0Z4D2j0zyNNLNdQ/vdI94fUA45lsMCKpFaY7SbPjSL
   42+sls3j4kVwakip7In79jVA0y/DAnF4UXqA2q/1uOss6u8xDfWFWzvFr
   OYANfcDyHwt5A2GfEH25QLIK/K5GWeCfAnmligdOfvuJjqvieLLDqzkij
   DmPzRYgKLRKIYw/FEv6u9bRqZto7aHWoj7H4RYDsnLyod/cJZMX6pPMMB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="329724997"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="329724997"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 07:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="700926771"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="700926771"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 17 Feb 2023 07:14:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pT2Qy-008GQl-0H;
        Fri, 17 Feb 2023 17:14:00 +0200
Date:   Fri, 17 Feb 2023 17:13:59 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 2/6] serial: 8250_em: Drop slab.h
Message-ID: <Y++Zt6hpNqJgvAHw@smile.fi.intel.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-3-biju.das.jz@bp.renesas.com>
 <Y++JnBc0NaGZI5YP@smile.fi.intel.com>
 <OS0PR01MB59223E65450F4EBE7F94E0E986A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59223E65450F4EBE7F94E0E986A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 17, 2023 at 02:30:34PM +0000, Biju Das wrote:
> > On Fri, Feb 17, 2023 at 11:42:51AM +0000, Biju Das wrote:
> > > This patch removes the unused header file slab.h.
> > 
> > Please, read Submitting Patches on how to make your commit messages better.
> 
> Thanks for the link.
> 
> I rechecked slab.h [1] and 8250_em driver is not using
> any of api's or macros provided by that header file.

Yes, that's not what I'm talking about.

> Please correct me if that is not the case.

The following text is okay

---8<----8<----

serial: 8250_em: Drop unused header file

Drop unused header file slab.h from the driver.

-- 
With Best Regards,
Andy Shevchenko


