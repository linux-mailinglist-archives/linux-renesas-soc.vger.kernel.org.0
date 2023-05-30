Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1DC3715A92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 11:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbjE3JrC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 05:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbjE3Jq7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 05:46:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8119C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:46:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08EC97EC;
        Tue, 30 May 2023 11:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685439996;
        bh=hB8bI2OI4BfKf+ifsUhNkvV6Hff+MOc38Z2//iApy5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pSE7LNLNf8bm0AEHw7/lSnsCU8oN/gXzirxmFkJRHbUu1c9gY8xFYpDXNFOWtW/Ow
         IasrGWnfqPN6XmmdlMAcb3j+bIYLrMJ2TFPNojBZugAQAugwTFMNqws976UVermofH
         POyL+PYLNMqlqIe7Blcav2u7WVchKXWrbFzvCk8s=
Date:   Tue, 30 May 2023 12:46:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe()
Message-ID: <20230530094656.GA19436@pendragon.ideasonboard.com>
References: <20230530092629.18329-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUQ+WS=DS3n-7Kb=DFkqFD=gX0zpy85XZJ1TaMuSoZzqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUQ+WS=DS3n-7Kb=DFkqFD=gX0zpy85XZJ1TaMuSoZzqQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, May 30, 2023 at 11:38:44AM +0200, Geert Uytterhoeven wrote:
> On Tue, May 30, 2023 at 11:34 AM Laurent Pinchart wrote:
> > Replace manual handling of EPROBE_DEFER with dev_err_probe() to simplify
> > the code.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> I sent a similar patch before:
> https://lore.kernel.org/linux-renesas-soc/62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be
> leading to your comment that the deeper paths should be fixed instead.

Thanks for your help dealing with my goldfish memory :-)

I'll try to fix the deeper paths.

-- 
Regards,

Laurent Pinchart
