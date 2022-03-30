Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 978E14EC645
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 16:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346654AbiC3OPk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 10:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346662AbiC3OPj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:15:39 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200FD29FC7A;
        Wed, 30 Mar 2022 07:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648649634; x=1680185634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B3q4mixhtDKtuE+0za5/E0mblZIs/KwSdt0EsqIzUz8=;
  b=e5bnfRwlWKmp6fRZg+6tzed5ZUSoqQsXDHyLFGvMreH4iGUMtlP9wx1w
   COjgz6VFpnZF9wRly0O0mFL5HW+7DH19gasLsrYZ30RvCRnS1N6R2ZLyT
   +ASviZDVKWl+J8/zDdhGidSbwSQ4a83cQFXgUJm5CupHQvEpwmdI/YUNK
   Xn02I0EXU/rkTrQDNtsllZhLxk0yrherb0d1VSij0sW3xSnk2hCzX8s3U
   T4hiPGHs0gSh4z+E62m1FzOIrTB3fZx83U4jbNPrSuHoYKw6gGjYIqusX
   /6/Vi1JMvJcNT8VOvhr40MbAJ7r2j05gHXb+sf7UBqmccwzcDoZPuDLc7
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259268209"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="259268209"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:13:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="605448125"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:13:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZZ4W-009Rbh-W9;
        Wed, 30 Mar 2022 17:13:16 +0300
Date:   Wed, 30 Mar 2022 17:13:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v4 0/9] serial: 8250: dw: RZN1 DMA support
Message-ID: <YkRlfGUM/lb1fKC6@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330132038.808679-1-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 30, 2022 at 03:20:29PM +0200, Miquel Raynal wrote:
> Hello,
> 
> Support for the RZN1 DMA engine allows us adapt a little bit the 8250 DW
> UART driver with to bring DMA support for this SoC.
> 
> This short series applies on top of the series bringing RZN1 DMA
> support, currently on its v5, see [1]. Technically speaking, only the DT
> patch needs to be applied after [1]. The other patches can come in at
> any moment, because if no "dmas" property is provided in the DT, DMA
> support will simply be ignored.
> 
> [1] https://lore.kernel.org/dmaengine/20220315191255.221473-1-miquel.raynal@bootlin.com/T/#m0ef3323abce3eec961e142bf2fb35e95b9045fc5

Couple of versions ago I have asked you to Cc the series to Ilpo (Cc'ed).
I hope you will not forget it in v5.

-- 
With Best Regards,
Andy Shevchenko


