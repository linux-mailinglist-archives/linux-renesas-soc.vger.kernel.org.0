Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF8EA26346
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 13:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbfEVLzP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 07:55:15 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42324 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfEVLzP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 07:55:15 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7AE2825AD5F;
        Wed, 22 May 2019 21:55:13 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3A2F194053F; Wed, 22 May 2019 13:55:11 +0200 (CEST)
Date:   Wed, 22 May 2019 13:55:11 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] arm: dts: Use ip=on for bootargs
Message-ID: <20190522115510.ad5ncsrc3yabp4mu@verge.net.au>
References: <155817382883.14383.9127828804463512592.sendpatchset@octo>
 <155817383762.14383.11863551376377895395.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155817383762.14383.11863551376377895395.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, May 18, 2019 at 07:03:57PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Convert bootargs from ip=dhcp to ip=on
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks Magnus,

applied for inclusion in v5.3 with the subject prefix updated to "ARM: ".
