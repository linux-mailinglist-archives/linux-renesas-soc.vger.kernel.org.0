Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8914026349
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 13:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbfEVL4e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 07:56:34 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42368 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfEVL4e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 07:56:34 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9298125AD5F;
        Wed, 22 May 2019 21:56:32 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A2CE994053F; Wed, 22 May 2019 13:56:30 +0200 (CEST)
Date:   Wed, 22 May 2019 13:56:30 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Use ip=on for bootargs
Message-ID: <20190522115630.apo46dt6lcmhpncz@verge.net.au>
References: <155817382883.14383.9127828804463512592.sendpatchset@octo>
 <155817384629.14383.16827320626614039363.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155817384629.14383.16827320626614039363.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, May 18, 2019 at 07:04:06PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Convert bootargs from ip=dhcp to ip=on
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks Magnus,

applied for inclusion in v5.3.
