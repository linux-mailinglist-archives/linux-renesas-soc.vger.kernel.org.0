Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9A569AD54
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 15:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjBQOGp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 09:06:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjBQOGo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 09:06:44 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE9866645;
        Fri, 17 Feb 2023 06:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676642803; x=1708178803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OznaG+4GUgwyA5Ir7OeiolFoJz1yB4/GcJ5FyFUG/2E=;
  b=Mspiv9xoEd0aLqEhQO/KlWTSKehicmIF4vjiBGoFxn8zYHWcwI4HxeFX
   e8WKyts4Up2NbIMS7sdwG2RsFHtvVrJUb3wZ1x4ANfZx56obrI5IflXpK
   1OZUhiIGxa3bzoaVmFXz/Px9EpivPlLONxBRbOFebisa2dFfwUP01HsvG
   x8043nmHW46UbbICtOPDCYZts25FBZh/Dk9Rt0aQXkJPWPutFEH47uHDZ
   qeb15R4mschTRnFyx1PU6ZCSnn2L6x1vxshnHputafdl5QEbggunzc/fm
   lUN4ox5DC1Tzr8HbIAMVBR7iUPWnMCrgtD8pqh/ZZdniU9T0hbB/+UHTl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396667477"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="396667477"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 06:06:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672594522"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="672594522"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 17 Feb 2023 06:06:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pT1Nm-008El6-2z;
        Fri, 17 Feb 2023 16:06:38 +0200
Date:   Fri, 17 Feb 2023 16:06:38 +0200
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
Subject: Re: [PATCH v4 4/6] serial: 8250_em: Update port type as PORT_16750
Message-ID: <Y++J7u5SY5Z5Z857@smile.fi.intel.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217114255.226517-5-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 17, 2023 at 11:42:53AM +0000, Biju Das wrote:
> The UART IP found on {RZ/V2M, EMMA mobile} SoC is Register-compatible
> with the general-purpose 16750 UART chip. This patch updates port type
> from 16550A->16750 and also enables 64-bytes fifo support.

...

> +	up.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP | UPF_FIXED_TYPE;

Do you still need UPF_BOOT_AUTOCONF?

-- 
With Best Regards,
Andy Shevchenko


