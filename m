Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B921C78AF39
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjH1Lol (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbjH1LoL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:44:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0ED4120
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693223038; x=1724759038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=whheSNXHsQG1orTxTzSh/6KRRp7u8Vqdkbn3UmPa6Os=;
  b=Pkij9CiDtVGFCVvxh8RaFiRGxsjBsvJpj1DK+P25uisi2bOLjiemxero
   ElHQ0bY58t9iTdp47YsRF5QHu09N1R2a3vP/dygFpX8aspSQtC9qWmkts
   RbTsnmzwa3n0HHNBlD9OlOQPwnRyE5P8iztGXEkHfSFpWig23HawOwOJW
   lEj60GKvJAIKj9NjSfMb4lrqv3aQFeVPiT/Dch0Ti8yuQhtfJUydXKRg0
   smEaXUx+pzJfCXVaLPlZS458yLnFk1GSHLIF5sfo7QqU+AkGwrYvQg0Iv
   /U+42NLf9ZrCehwkWXh1e0LA01Ai3cZExYhZASY8ks+QCDJoCaz9pCZXQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="375048879"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="375048879"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="741355579"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="741355579"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 28 Aug 2023 04:43:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaex-00GgHx-1B;
        Mon, 28 Aug 2023 14:43:55 +0300
Date:   Mon, 28 Aug 2023 14:43:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mfd: max77541: Simplify probe()
Message-ID: <ZOyIe4ZxBFSh6/Ro@smile.fi.intel.com>
References: <20230826091020.45621-1-biju.das.jz@bp.renesas.com>
 <ZOyC++vjeg4TGCpx@smile.fi.intel.com>
 <OS0PR01MB592265EAF67FDF987675630A86E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592265EAF67FDF987675630A86E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 28, 2023 at 11:36:54AM +0000, Biju Das wrote:
> > On Sat, Aug 26, 2023 at 10:10:20AM +0100, Biju Das wrote:

...

> > > -		return -EINVAL;
> > > +		return -ENODEV;
> > 
> > Why?
> 
> If I remember correctly, previously you mentioned to return -ENODEV
> for non-match. I will return -EINVAL.

Maybe I was unclear, I meant to return -ENODEV, if this is a _new_ code.
For the existing one, please preserve the error code.

-- 
With Best Regards,
Andy Shevchenko


