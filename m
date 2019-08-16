Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17140904C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 17:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfHPPhN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 11:37:13 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57756 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbfHPPhN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 11:37:13 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3C70425BDF3;
        Sat, 17 Aug 2019 01:37:12 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 345BC94057D; Fri, 16 Aug 2019 17:37:10 +0200 (CEST)
Date:   Fri, 16 Aug 2019 17:37:10 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Eliminate local variable gov
Message-ID: <20190816153706.k3ot6u3dtcivpmcr@verge.net.au>
References: <20190816123919.15140-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816123919.15140-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 16, 2019 at 02:39:19PM +0200, Geert Uytterhoeven wrote:
> As of commit 980532a5dda319ee ("soc: renesas: rcar-sysc: Use
> GENPD_FLAG_ALWAYS_ON"), the local variable "gov" is assigned just once,
> so it can be eliminated.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v5.4.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

