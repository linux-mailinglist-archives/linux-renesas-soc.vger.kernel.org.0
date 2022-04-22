Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45AD650B978
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 16:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448091AbiDVOH4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 10:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448336AbiDVOHg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 10:07:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E4A5A164;
        Fri, 22 Apr 2022 07:04:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 62719B82DEB;
        Fri, 22 Apr 2022 14:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81815C385A4;
        Fri, 22 Apr 2022 14:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650636279;
        bh=iNiTjY8tqQiZjM+4jn/Umkb2svH+aw2wxOSfsL3npZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v+FgCT66ActzZVXxId/XfSe4ug8qTpyHSO6GsG3K7+Gw7rvzn78j13R7EDEpiWlRU
         k/FNgfY3mgJKNImDdKcU+sJnJg1MWP2HFHpg24jWIIrAWMKrz5u6XkriiVgQfQ3u5t
         cNj21t/oR6SfrlF65NdnP679W7GQgAHkdLq81cw0=
Date:   Fri, 22 Apr 2022 16:04:36 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v6 11/12] bestla: Enable DMA, UART3 and UART4
Message-ID: <YmK19DPzjJxBZHHm@kroah.com>
References: <20220421095323.101811-1-miquel.raynal@bootlin.com>
 <20220421095323.101811-12-miquel.raynal@bootlin.com>
 <20220421122143.7526d676@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421122143.7526d676@xps13>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 21, 2022 at 12:21:43PM +0200, Miquel Raynal wrote:
> Hello,
> 
> miquel.raynal@bootlin.com wrote on Thu, 21 Apr 2022 11:53:22 +0200:
> 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> Please ignore these two dts patches, they were meant for testing
> purposes only, sorry for the noise.

I can't do that, please resend a new version of the series as our tools
take all of the patches in a series.

thanks,

greg k-h
