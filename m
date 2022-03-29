Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85FB44EB0EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 17:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238840AbiC2PqU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 11:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235919AbiC2PqT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 11:46:19 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EEE12097;
        Tue, 29 Mar 2022 08:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648568676; x=1680104676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1eyN9S0VYCjwyCwpGV/EAhe6tNDLsqDHkUFt5FhErFc=;
  b=go6KHNnloIJi6TgK2WzbMJu19TtUXHGc40RHsTyDiE9JzL/intWg4kIx
   IUXk5tzO7UxpHB2uvg3SiRLCiSa9B581JR+GfFUztMXzmREsYNBKG2R5F
   XKZJx7NAfVvpcbJ7MbP34k1NdbKNPzuW3wki8I0CEAozxXvpzMHLZfBjX
   KOwzkb7SXQCGK+wTMl/U7uDUOOIHa/AmCz8Ykgb9A+p1fqtntl7BEZlJx
   E7FgIcLet3JnrQrKmttUm14WEQwr/ePgxTbshIwM8RvX8FTmAfQUvfY5/
   PeBIIGxoSNfeKDatgRkOe1Q6mLkCR+4X2UOeo1thBDdq/eqRaz3tJoQHm
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="258994634"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="258994634"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:44:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="649491727"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:44:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZE0l-008pwc-Jr;
        Tue, 29 Mar 2022 18:43:59 +0300
Date:   Tue, 29 Mar 2022 18:43:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
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
Subject: Re: [PATCH v3 03/10] serial: 8250: dw: Change the quirks type to
 unsigned int
Message-ID: <YkMpP3EjNh9O9ByI@smile.fi.intel.com>
References: <20220329152430.756947-1-miquel.raynal@bootlin.com>
 <20220329152430.756947-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329152430.756947-4-miquel.raynal@bootlin.com>
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

On Tue, Mar 29, 2022 at 05:24:23PM +0200, Miquel Raynal wrote:
> Unsigned int is better than unsigned long as its size does not change
> between setups and we don't really need this variable to be more than a
> few bits wide for now.
> 
> Suggested-by: Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

One tag is enough :-)

Looking into the following patch, I think you may squash this one into it,
just add an explanation in the commit message that you reduced variable for
quirks.

-- 
With Best Regards,
Andy Shevchenko


