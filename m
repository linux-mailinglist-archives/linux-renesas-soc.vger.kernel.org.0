Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9937F1898A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 14:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfEIMS4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 08:18:56 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49594 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfEIMS4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 08:18:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E7B8A25AD66;
        Thu,  9 May 2019 22:18:53 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EC25A9403F2; Thu,  9 May 2019 14:18:51 +0200 (CEST)
Date:   Thu, 9 May 2019 14:18:51 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Nishad Kamdar <nishadkamdar@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: Use the correct style for SPDX License
 Identifier
Message-ID: <20190509121851.rbku45mcfaslhyna@verge.net.au>
References: <20190501092359.GA8152@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501092359.GA8152@nishad>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 01, 2019 at 02:54:07PM +0530, Nishad Kamdar wrote:
> This patch corrects the SPDX License Identifier style
> in header files related to Clock Drivers for Renesas Socs.
> For C header files Documentation/process/license-rules.rst
> mandates C-like comments (opposed to C source files where
> C++ style should be used)
> 
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
