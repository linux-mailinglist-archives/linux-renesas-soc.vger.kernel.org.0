Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7193169AD4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 15:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjBQOFW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 09:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjBQOFW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 09:05:22 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F796607E;
        Fri, 17 Feb 2023 06:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676642721; x=1708178721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xAaRuMhhYG2z1ewxdapPzLqYMUQ63b3+h5Hxyb/7SOA=;
  b=NHP/5+aNElpJhXxZPlXx5nGU0uqdCzJ97zLaRxp+9lhtXKz1hLUt+Ds3
   hjCGv8XxoTellQKqOlINW403oBFW4RpJkItdGiUXj+Ll5zX/4FqYKFMll
   +HARddWKVwF7lFZsmX8UUyA6Jt5Oyd9b62U3I+6N7GoQmJvJ1woTWPyQx
   IOLUBVak7AC6cLrhEsnpqANef8z2Md4n6kQz4iDaIL2jfB5dLGPg1Oc9J
   AjD3pOjA3nHtzjO70VYKF0aMRF1k/KvpWdbk89FX595rlxVkJuB4cnddk
   dBqqIp+TOQB23MyM4vavDNctX8StXux2KQW8WKjGQ286tgy+AkTRg8Mub
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333349988"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="333349988"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 06:05:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="779798948"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="779798948"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 17 Feb 2023 06:05:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pT1MT-008Eix-05;
        Fri, 17 Feb 2023 16:05:17 +0200
Date:   Fri, 17 Feb 2023 16:05:16 +0200
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
Subject: Re: [PATCH v4 2/6] serial: 8250_em: Drop slab.h
Message-ID: <Y++JnBc0NaGZI5YP@smile.fi.intel.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217114255.226517-3-biju.das.jz@bp.renesas.com>
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

On Fri, Feb 17, 2023 at 11:42:51AM +0000, Biju Das wrote:
> This patch removes the unused header file slab.h.

Please, read Submitting Patches on how to make your commit messages better.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

-- 
With Best Regards,
Andy Shevchenko


