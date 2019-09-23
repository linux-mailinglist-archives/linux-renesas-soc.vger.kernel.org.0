Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14575BB2E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 13:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732202AbfIWLjn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 07:39:43 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59044 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfIWLjm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 07:39:42 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6EBCB25B706;
        Mon, 23 Sep 2019 21:39:40 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 72A90940310; Mon, 23 Sep 2019 13:39:38 +0200 (CEST)
Date:   Mon, 23 Sep 2019 13:39:38 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: r8a774c0-sysc: Fix power request conflicts
Message-ID: <20190923113938.taatpvrbkiwiv3yu@verge.net.au>
References: <20190920143523.23125-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920143523.23125-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 20, 2019 at 04:35:23PM +0200, Geert Uytterhoeven wrote:
> Describe the location and contents of the SYSCEXTMASK register on
> RZ/G2E, to prevent conflicts between internal and external power
> requests.
> 
> Based on a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

