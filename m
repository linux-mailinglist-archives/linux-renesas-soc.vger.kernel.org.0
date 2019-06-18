Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A93249ED8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 13:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729650AbfFRLCj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 07:02:39 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:53088 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfFRLCj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 07:02:39 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 213FC25AED3;
        Tue, 18 Jun 2019 21:02:37 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2146E9408C4; Tue, 18 Jun 2019 13:02:35 +0200 (CEST)
Date:   Tue, 18 Jun 2019 13:02:35 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: renesas: div6: Combine clock-private and parent
 array allocation
Message-ID: <20190618110234.fmgwf7bq2anjc37c@verge.net.au>
References: <20190617123943.12990-1-geert+renesas@glider.be>
 <20190617123943.12990-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617123943.12990-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 02:39:42PM +0200, Geert Uytterhoeven wrote:
> Make div6_clock.parents[] a flexible array member, and use the new
> struct_size() helper, to combine the allocation of the clock-private
> structure and array of parent clocks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

