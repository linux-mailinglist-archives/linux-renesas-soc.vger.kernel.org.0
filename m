Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636809753E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 10:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfHUIqN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 04:46:13 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40870 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfHUIqM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 04:46:12 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D184825B7C3;
        Wed, 21 Aug 2019 18:46:10 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C4AB29405AE; Wed, 21 Aug 2019 10:46:08 +0200 (CEST)
Date:   Wed, 21 Aug 2019 10:46:08 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: sort nodes
Message-ID: <20190821084607.ltwlersjxksdwiar@verge.net.au>
References: <1566219361-23088-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566219361-23088-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 19, 2019 at 09:56:01PM +0900, Yoshihiro Kaneko wrote:
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

