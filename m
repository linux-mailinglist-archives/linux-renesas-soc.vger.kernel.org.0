Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05152746FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2019 08:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfGYGRB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jul 2019 02:17:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:54050 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfGYGRB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 02:17:01 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2194025AD7E;
        Thu, 25 Jul 2019 16:16:59 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 0FFA4E2209B; Thu, 25 Jul 2019 08:16:57 +0200 (CEST)
Date:   Thu, 25 Jul 2019 08:16:57 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: ulcb-kf: sort nodes
Message-ID: <20190725061655.ommhqsl624e4oobn@verge.net.au>
References: <1563905015-2911-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1563905015-2911-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 24, 2019 at 03:03:35AM +0900, Yoshihiro Kaneko wrote:
> Sort nodes.
> 
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
> 
> This should not have any run-time effect.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

