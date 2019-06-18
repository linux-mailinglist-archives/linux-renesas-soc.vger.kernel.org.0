Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA1A49EA5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 12:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbfFRKwr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 06:52:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52596 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfFRKwr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 06:52:47 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6982D25AF53;
        Tue, 18 Jun 2019 20:52:45 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6B3BE9408C4; Tue, 18 Jun 2019 12:52:43 +0200 (CEST)
Date:   Tue, 18 Jun 2019 12:52:43 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: renesas: cpg-mssr: Combine driver-private and
 clock array allocation
Message-ID: <20190618105243.aujg23juf4r6qp7w@verge.net.au>
References: <20190617123943.12990-1-geert+renesas@glider.be>
 <20190617123943.12990-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617123943.12990-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 02:39:41PM +0200, Geert Uytterhoeven wrote:
> Make cpg_mssr_priv.clks[] a flexible array member, and use the new
> struct_size() helper, to combine the allocation of the driver-private
> structure and array of available clocks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

