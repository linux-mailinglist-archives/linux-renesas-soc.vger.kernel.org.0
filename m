Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62DE0585FB2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 18:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236780AbiGaQDF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 12:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237503AbiGaQDF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 12:03:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BE1FD29
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 09:03:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FA21415;
        Sun, 31 Jul 2022 18:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659283381;
        bh=qiitu4MM1LK8vgADYTZe8xrTSps9gHUBgO8CsCUyDSQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sNMJekocfHFSB4lUhg6UKmeTlAIkfkIvetAXiK34NMkoXpM5ZIlzo90pue0k0bs1w
         h5dYInEHLqVvsBz6hznao5ALwzlofKMhFTTErVDIoBbDEibNvV+l6zlKtiLZK/ySTj
         EBe74r+4/hhSeRsG2IAjcYDoCY1MxAxXA9rW0aqc=
Date:   Sun, 31 Jul 2022 19:02:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Takanari Hayama <taki@igel.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/3] kmstest: Support specifying pixel blend mode for
 planes
Message-ID: <YuansVTsDcalyHJp@pendragon.ideasonboard.com>
References: <20220704025632.3911253-1-taki@igel.co.jp>
 <20220704025632.3911253-3-taki@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704025632.3911253-3-taki@igel.co.jp>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hayama-san,

Thank you for the patch.

On Mon, Jul 04, 2022 at 11:56:31AM +0900, Takanari Hayama wrote:
> Add an optional pixel blend mode argument to the atomic_plane_set()
> function to  specify the pixel blend mode for the plane.
> 
> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> ---
>  tests/kmstest.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kmstest.py b/tests/kmstest.py
> index 224c160e32fa..a39ceab3891b 100755
> --- a/tests/kmstest.py
> +++ b/tests/kmstest.py
> @@ -395,7 +395,7 @@ class KMSTest(object):
>          else:
>              return req.commit(0, True)
>  
> -    def atomic_plane_set(self, plane, crtc, source, destination, fb, alpha=None, zpos=None, sync=False):
> +    def atomic_plane_set(self, plane, crtc, source, destination, fb, alpha=None, zpos=None, blendmode=None, sync=False):

I'll add a line break while at it as the line is getting long.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>          req = AtomicRequest(self)
>          req.add(plane, {
>                      'FB_ID': fb.id,
> @@ -413,6 +413,8 @@ class KMSTest(object):
>              req.add(plane, 'alpha', alpha)
>          if zpos is not None:
>              req.add(plane, 'zpos', zpos)
> +        if blendmode is not None:
> +            req.add(plane, 'pixel blend mode', blendmode)
>          if sync:
>              return req.commit_sync()
>          else:

-- 
Regards,

Laurent Pinchart
