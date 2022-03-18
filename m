Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C622B4DDB15
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236922AbiCRN7b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiCRN7a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:59:30 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D385CE028;
        Fri, 18 Mar 2022 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647611891; x=1679147891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ByRSBx5rOqTJKGjcMy8SnrJwR0aJYwWvkSxjlR+cUgU=;
  b=azkdx54bE98+d/+WUA/LKl7YEdKQL9RYRjZZgmOonc0tXzaieuoDtDKd
   fuW/DgmHvXKQJZYhk+l3xLrKwo2zUHxOlTYJEqaDkaDJcobY/al6UYo7V
   ODXLyguYPqhbIGtnCFYV47ImA3XBSXf+USCnRekRUqVcq14ntwoZGGBTs
   nQutNo1N6VImYL96pkCr7JIzGnppu54n+SZhtOw3YbXhmJGqj0SMuGaLp
   VXl+7EUGd4B1/wvwxamHs6jBr5DxIiQlpPmHgNUopbNoju1PFxq5hsfmc
   GzA2IdnEkuLwEfhdmQfhytZoYlKdfHuhS2FVIyb0VpBvtUmXLuNBeUJZx
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254693998"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="254693998"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 06:58:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="635760707"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 06:58:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nVD6e-002GAH-FV;
        Fri, 18 Mar 2022 15:57:28 +0200
Date:   Fri, 18 Mar 2022 15:57:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org,
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
        linux-serial@vger.kernel.org,
        Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v2 03/10] serial: 8250: dw: Create a more generic
 platform data structure
Message-ID: <YjSPyB/3bXSmm6Pg@smile.fi.intel.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
 <20220317174627.360815-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317174627.360815-4-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 17, 2022 at 06:46:20PM +0100, Miquel Raynal wrote:
> Before adding more platform data information, let's turn the quirks
> information as being a member of a wider structure. More fields will be
> added later.

...

> +struct dw8250_platform_data {
> +	unsigned long quirks;

unsigned int would be better since it won't change the sizeof() depending on
the hardware / compilation options.

> +};

-- 
With Best Regards,
Andy Shevchenko


