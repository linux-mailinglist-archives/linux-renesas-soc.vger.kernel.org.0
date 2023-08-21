Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8314F782D38
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 17:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236334AbjHUP0Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 11:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbjHUP0Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 11:26:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84710E2;
        Mon, 21 Aug 2023 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692631583; x=1724167583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7P/vRBOcI1x6KILLPvN3GD3xqoK3aYeEciMIe35Nosw=;
  b=hCXzgIk2cfHY4BMNV6TT3xeOSPNW2ibQkOlpsuSJLEcYv1WIRCptyYPQ
   eA1OgAJ2uh2Ec/r7a8tmHlb0vtkuwLW+euVo18jQMv7Hs87JGS6JuJh5y
   pmoWP6YsAmq+ULzcXch7DU8BdJnNNqO37HxIDXl3Pm9jrJIR6p7CDOnM4
   160pF/ueBhcGKQ9UDBcWJng5zw9GR0Ugf7VnKK+zNaQcvdNoi7OyJcPlO
   oVnrcQQq0Sli3bcJ+61K0nFY9G/gDOFonTQbLDWE1NzpHUrwweAAvjXmo
   iAvngjVvxATFUZpEuDjR8dlTpVZcHc4Z4UbAxn2OWLvtdf6XIRIrXP7DI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358605378"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="358605378"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 08:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850229953"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="850229953"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2023 08:26:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qY6nJ-002Iyd-2r;
        Mon, 21 Aug 2023 18:26:17 +0300
Date:   Mon, 21 Aug 2023 18:26:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] usb: typec: tcpci_rt1711h: Add rxdz_sel variable to
 struct rt1711h_chip_info
Message-ID: <ZOOCGUrXUxy3yno/@smile.fi.intel.com>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-4-biju.das.jz@bp.renesas.com>
 <ZONhXitn/aX6smxv@smile.fi.intel.com>
 <CAMuHMdUiOfpx-cHx=P+eg11gbtCmynDxyezD12pnT3OYYm55og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUiOfpx-cHx=P+eg11gbtCmynDxyezD12pnT3OYYm55og@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 21, 2023 at 03:33:29PM +0200, Geert Uytterhoeven wrote:
> On Mon, Aug 21, 2023 at 3:06 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, Aug 20, 2023 at 07:44:01PM +0100, Biju Das wrote:
> > > The RT1715 needs 0.35V/0.75V rx threshold for rd/rp whereas it is 0.4V/0.7V
> > > for RT1711H. Add rxdz_sel variable to struct rt1711h_chip_info for
> > > handling this difference.

...

> > >  struct rt1711h_chip_info {
> > >       u16 did;
> > > +     u32 rxdz_sel;
> > >  };
> >
> > Again, run pahole. And see the difference, if any, depending on the place of a
> > new member. Note, some 64-bit architectures may require 8-byte alignment even
> > for 4-byte members.
> 
> Doesn't make a difference, the size and alignment of a structure are
> always multiples of the largest alignment of each of the members, so
> the structure size will be 8 bytes on both 32-bit and 64-bit (except
> on m68k, where it will be 6 bytes).
> 
> Either you have 2 bytes did, 2 bytes hole, and 4 bytes rxdz_sel, or
> 4 bytes rxdz, 2 bytes did, and 2 bytes hole (except on m68k, where
> there won't be any holes).

And I said "if any".
My suggestion is to check with pahole to be sure it's already good enough.

-- 
With Best Regards,
Andy Shevchenko


