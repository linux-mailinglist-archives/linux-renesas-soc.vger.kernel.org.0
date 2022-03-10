Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055DD4D512E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 19:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbiCJSI0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 13:08:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239025AbiCJSI0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 13:08:26 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911161986E6;
        Thu, 10 Mar 2022 10:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646935644; x=1678471644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/kbb1YXy7OfDYhlyR3XmfrrpPxC9HJe93t37DtVyvWI=;
  b=nkxMPhMfU0C+Ot2+FAaOgRXZjdjSNlfeVb6FKnG+YwB3ZF5qpY3wxmTP
   dxSLC8Mb7tCK+Y1O6NjYHrHA93ZPgiCBmMdSIys9LXOfkCNMi8r8VSQMh
   sKhfIz76EEK7pwNVRCqQ43Fhmgwb5d6KBsR+Dc9waaTqkzS0EdUXbCqWk
   h6DFie0agkiZ2oqWhRB3gWN+vcToQyVx86iZfiQjhvixDd0SDOl7dJ22f
   jT0dV+e1rowF2/h4eFOV+Q+tvBjI0/UPXUtxtBwqic/QK4by9b9ek95Qo
   BbyuJR/hypJsBN6OwGEyqQOfONmgm0P4HhVH8cnF19xBx/RN5S6N6FEBR
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="242772371"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="242772371"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:07:12 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="511000801"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:07:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nSNBB-00ErUN-G7;
        Thu, 10 Mar 2022 20:06:25 +0200
Date:   Thu, 10 Mar 2022 20:06:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH 5/7] serial: 8250_dw: Add a dma_capable bit to the
 platform data
Message-ID: <Yio+IdeWn+G7xcNv@smile.fi.intel.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
 <20220310161650.289387-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310161650.289387-6-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 10, 2022 at 05:16:48PM +0100, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> The CPR register can give the information whether the IP is DMA capable
> or not. Let's extract this information and use it to discriminate when
> the DMA can be hooked up or not.

...

> +	/* If we have a valid fifosize and DMA support, try hooking up DMA */
> +	if (p->fifosize && data->dma_capable) {

> +	if (reg & DW_UART_CPR_DMA_EXTRA)
> +		data->dma_capable = 1;

How many designs will be broken by this change?

...

> +	unsigned int		dma_capable:1;

Note, we use up->dma == NULL for no-DMA, no additional flag is needed.
Just make sure that for your platform you enable DMA by filling that.

-- 
With Best Regards,
Andy Shevchenko


