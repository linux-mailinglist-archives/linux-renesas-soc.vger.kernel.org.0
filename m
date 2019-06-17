Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA9E447D5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 10:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbfFQIlU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 04:41:20 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35344 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFQIlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 04:41:20 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AE0A325AED3;
        Mon, 17 Jun 2019 18:41:17 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B60C194024A; Mon, 17 Jun 2019 10:41:15 +0200 (CEST)
Date:   Mon, 17 Jun 2019 10:41:15 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Cao Van Dong <cv-dong@jinso.co.jp>
Subject: Re: [PATCH repost] dt-bindings: timer: renesas, cmt: Document
 r8a779{5|65|90} CMT support
Message-ID: <20190617084115.5wbys67m5ueyu2hp@verge.net.au>
References: <20190509122949.23256-1-horms+renesas@verge.net.au>
 <20190613101219.vx4ht6dixxu7fioi@verge.net.au>
 <7171405c-4647-173f-2883-c7a281e998ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7171405c-4647-173f-2883-c7a281e998ea@linaro.org>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 13, 2019 at 01:09:08PM +0200, Daniel Lezcano wrote:
> On 13/06/2019 12:12, Simon Horman wrote:
> > On Thu, May 09, 2019 at 02:29:49PM +0200, Simon Horman wrote:
> >> From: Cao Van Dong <cv-dong@jinso.co.jp>
> >>
> >> Document SoC specific bindings for R-Car H3/M3-N/E3 SoCs.
> > 
> > Hi Daniel and Thomas,
> > 
> > would you object to me taking this patch through the renesas tree.
> > It has been outstanding for some time now.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Thanks,

applied to the renesas tree for inclusion in v5.3.
