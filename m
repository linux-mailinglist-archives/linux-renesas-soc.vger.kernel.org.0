Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC365BB2EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 13:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732225AbfIWLkD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 07:40:03 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59070 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfIWLkD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 07:40:03 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 391D325B706;
        Mon, 23 Sep 2019 21:40:02 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 38449940310; Mon, 23 Sep 2019 13:40:00 +0200 (CEST)
Date:   Mon, 23 Sep 2019 13:40:00 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Remove unneeded inclusion of
 <linux/bug.h>
Message-ID: <20190923113959.yhmk55dm5kx2x6cu@verge.net.au>
References: <20190920144705.27394-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920144705.27394-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 20, 2019 at 04:47:05PM +0200, Geert Uytterhoeven wrote:
> No R-Car or RZ/G SYSC driver uses any of the definitions provided by
> <linux/bug.h>, hence there is no need to include this header file.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

