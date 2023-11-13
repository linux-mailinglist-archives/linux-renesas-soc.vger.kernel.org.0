Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD4D7E9E73
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Nov 2023 15:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjKMOTa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 09:19:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjKMOT3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 09:19:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3041D4C;
        Mon, 13 Nov 2023 06:19:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 251C929A;
        Mon, 13 Nov 2023 15:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699885139;
        bh=/JY16IJ8OpiqsxfQfsJhP0w+1K0WeJqAMz9luderXJA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kwQ1d5VKJnJTQC+Zfo5Ba0BJfAarf3u4MH2AzG9De2bIq4/BhD9hol7cmjz05Swns
         AcuoL/2RBpboBmaZtyhMF4RSFN7GTbPDf93H+ZJv49K6+mLH56hWjmylc7g3ovo0lV
         WDwQzFSBYkT0XH2LuEcadIi7ri8umUJlHXrBKqZg=
Date:   Mon, 13 Nov 2023 16:19:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Remove unbalanced .s_stream(0) calls
Message-ID: <20231113141930.GB12711@pendragon.ideasonboard.com>
References: <20231024142522.29658-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXfn__=z9RQgxo_Rnmm3x5CbNxvqp1+g+vcQZZQggO=Zg@mail.gmail.com>
 <CAMuHMdV-fMaT-H4m9twdb+Ow7tCM4GZNDD4b1vn7e2B8VQmS8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV-fMaT-H4m9twdb+Ow7tCM4GZNDD4b1vn7e2B8VQmS8g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Nov 13, 2023 at 03:05:07PM +0100, Geert Uytterhoeven wrote:
> On Tue, Oct 24, 2023 at 4:56 PM Geert Uytterhoeven wrote:
> > On Tue, Oct 24, 2023 at 4:25 PM Laurent Pinchart wrote:
> > > The VSP1 driver uses the subdev .s_stream() operation to stop WPF
> > > instances, without a corresponding call to start them. The V4L2 subdev
> > > core started warning about unbalanced .s_stream() calls in commit
> > > 009905ec5043 ("media: v4l2-subdev: Document and enforce .s_stream()
> > > requirements"), causing a regression with this driver.
> > >
> > > Fix the problem by replacing the .s_stream() operation with an explicit
> > > function call for WPF instances. This allows sharing an additional data
> > > structure between RPF and WPF instances.
> > >
> > > Fixes: 009905ec5043 ("media: v4l2-subdev: Document and enforce .s_stream() requirements")
> > > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Closes: https://lore.kernel.org/linux-media/2221395-6a9b-9527-d697-e76aebc6af@linux-m68k.org/
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> > The warning splat is gone, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> FTR, the warning splat is now in v6.7-rc1, but the fix is not
> (not even in linux-next).

I know. I've sent a pull request for it yesterday, it should get merged
in time for v6.7.

-- 
Regards,

Laurent Pinchart
