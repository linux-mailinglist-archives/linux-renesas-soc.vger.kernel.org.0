Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD714B76A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 13:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfFSLvr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 07:51:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56974 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfFSLvp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 07:51:45 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5F7BE25B262;
        Wed, 19 Jun 2019 21:51:43 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5F64D9409FF; Wed, 19 Jun 2019 13:51:41 +0200 (CEST)
Date:   Wed, 19 Jun 2019 13:51:41 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: defconfig: Refresh for v5.2-rc1
Message-ID: <20190619115141.wwze45px5qinll2j@verge.net.au>
References: <20190618124714.15120-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618124714.15120-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 02:47:14PM +0200, Geert Uytterhoeven wrote:
> Update the defconfig for Renesas ARM boards:
>   - Drop CONFIG_GENERIC_PHY=y (selected by PHY_RCAR_GEN3_USB2).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Hi Geert,

I believe this duplicates the following patch which is present
in renesas-next.

b995421faef5 ("ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig")
