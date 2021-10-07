Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC701424C4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 05:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbhJGDyn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Oct 2021 23:54:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57532 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbhJGDym (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 23:54:42 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE6CE9DC;
        Thu,  7 Oct 2021 05:52:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633578768;
        bh=X0kPBwfUOEa3APADrfwbRDM1MyJnwG31+3I7bn713ek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YWwYTNhFP+461g6RTPaAdcpzUEpIfNhs3YSFRoij/WXQVMcPBNJuLVpCkZGSakN4C
         z08ZC9VCufr5qLDg4HyJbSK6/zeliwJ7FHm1AkJ6At1SAZvAsIDaEoB3PSEF2ZyuIb
         EY5cVblJERSVaZvgh8S0J8GwqhgsWxc1B9Eso24I=
Date:   Thu, 7 Oct 2021 06:52:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI isn't probed on v5.15-rc1 on ULCB+KF
Message-ID: <YV5vB4c8J0xu2mOd@pendragon.ideasonboard.com>
References: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Wed, Oct 06, 2021 at 12:05:15PM +0900, Kuninori Morimoto wrote:
> 
> Hi Laurent
> 
> I noticed that ULCB+KF board on v5.15-rc1 doesn't probe HDMI.

Is that the M3 or H3 ULCB ?

Is there any useful information in the kernel log ?

> I git-bisect:ed and found the first issue.
> It re-start works for me if I reverted this commit.
> Could you please check it ?
> 
> commit d0f44e0dac29aca3f85d238dfbcd2e52450b38dc
> Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Date:   Mon May 25 07:05:26 2020 +0300
> 
>     drm: rcar-du: dw-hdmi: Set output port number
>     
>     Report the DT output port number in dw_hdmi_plat_data to connect to the
>     next bridge in the dw-hdmi driver.
>     
>     Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>     Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com> # On V3U
>     Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

I've tested v5.15-rc1 on a M3-N Salvator-XS, and can't reproduce the
issue. If your kernel log doesn't show anything useful, I'll test it on
my ULCB.

-- 
Regards,

Laurent Pinchart
