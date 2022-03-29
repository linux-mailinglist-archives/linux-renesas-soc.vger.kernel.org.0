Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF1014EABFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 13:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235583AbiC2LNo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 07:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235242AbiC2LNm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 07:13:42 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0AE35DF0;
        Tue, 29 Mar 2022 04:12:00 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="241376675"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="241376675"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 04:11:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="618092593"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 04:11:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1nZ9kw-008hko-7Y;
        Tue, 29 Mar 2022 14:11:22 +0300
Date:   Tue, 29 Mar 2022 14:11:21 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v2 01/10] serial: 8250: dw: Move the per-device structure
Message-ID: <YkLpWexrf8RS5bfG@smile.fi.intel.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
 <20220317174627.360815-2-miquel.raynal@bootlin.com>
 <CAHp75Ve-PbTMBdb6Y0TYdaOMDwsJ_2JVoKCkwCFBG=iUd8baEA@mail.gmail.com>
 <20220329101049.069a0b1b@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329101049.069a0b1b@xps13>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 29, 2022 at 10:10:49AM +0200, Miquel Raynal wrote:
> andy.shevchenko@gmail.com wrote on Fri, 18 Mar 2022 12:51:29 +0200:
> > On Thu, Mar 17, 2022 at 9:56 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

...

> > > +#include <linux/clk.h>  
> > 
> > I have mentioned forward declarations.
> 
> Why do you want forward declarations more than includes?

Because they will speed up the kernel build and avoid dirtifying the namespace
(less possible collisions).

> > So, this can be simply replaced by
> > 
> > struct clk;
> > 
> > > +#include <linux/notifier.h>
> > > +#include <linux/workqueue.h>  
> 
> And why these two should remain but reset and clk be replaced?

Because these one are being used, clk and reset are not (the pointers
are opaque from the point of view of this header).

> > > +#include <linux/reset.h>  
> > 
> > Ditto.
> > 
> > struct reset_control;
> > 
> > On top of that, please keep them ordered.
> > 
> > Otherwise it looks good to me.

-- 
With Best Regards,
Andy Shevchenko


