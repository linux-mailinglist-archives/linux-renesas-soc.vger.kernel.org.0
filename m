Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF15A20496
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 13:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbfEPLWr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 07:22:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56546 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727168AbfEPLWr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 07:22:47 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7E44025AD69;
        Thu, 16 May 2019 21:22:45 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 69517E21EEB; Thu, 16 May 2019 13:22:43 +0200 (CEST)
Date:   Thu, 16 May 2019 13:22:43 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH] mmc: tmio: fix SCC error handling to avoid false
 positive CRC error
Message-ID: <20190516112243.7uxw7ykh73dva3u2@verge.net.au>
References: <20190515182346.5292-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515182346.5292-1-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 15, 2019 at 08:23:46PM +0200, Wolfram Sang wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
> 
> If an SCC error occurs during a read/write command execution, a false
> positive CRC error message is output.
> 
> mmcblk0: response CRC error sending r/w cmd command, card status 0x900
> 
> check_scc_error() checks SCC_RVSREQ.RVSERR bit. RVSERR detects a
> correction error in the next (up or down) delay tap position. However,
> since the command is successful, only retuning needs to be executed.
> This has been confirmed by HW engineers.
> 
> Thus, on SCC error, set retuning flag instead of setting an error code.
> 
> Fixes: b85fb0a1c8ae ("mmc: tmio: Fix SCC error detection")
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: updated comment and commit message, removed some braces]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

