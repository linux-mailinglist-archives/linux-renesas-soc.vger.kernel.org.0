Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D9A6A0B35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Feb 2023 14:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbjBWNvs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Feb 2023 08:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234403AbjBWNvs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Feb 2023 08:51:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4537EC0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Feb 2023 05:51:46 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AD852E4;
        Thu, 23 Feb 2023 14:51:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677160304;
        bh=IekzGIFeIjN+4AsEg5LXhutO94Os1zLesiMqLQ/A4GI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Y3CcwI99NUv/UTrLCJmWwzXuZpEmbR6BJT1oJag99ny/j/051Le2wC9dExeQvbLkX
         Q31BqBhKYMb8yoMiwSHh2l8/CO2OZBoVGoTLXduXQmUb/DpqSKb3LvzdwzHBB/SJpr
         +FMovKFTC1x3kdai9sCPE6cB7QjUdXnYEDqW9uto=
Message-ID: <8b32b8da-31c4-e3e8-9777-d72f069cf133@ideasonboard.com>
Date:   Thu, 23 Feb 2023 15:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] drm: rcar-du: Rename DORCR fields to make them
 0-based
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20230222234212.5461-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230222234212.5461-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230222234212.5461-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23/02/2023 01:42, Laurent Pinchart wrote:
> The DORCR fields were documented in the R-Car H1 datasheet with 1-based
> named, and then got renamed to 0-based in Gen2. The 0-based names are
> used for Gen3 and Gen4, making H1 an outlier. Rename the field macros to
> make them 0-based, in order to increase readability of the code when
> comparing it with the documentation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_group.c |  8 ++++----
>   drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 26 ++++++++++++-------------
>   2 files changed, 17 insertions(+), 17 deletions(-)

I thought I already did this... And I see I did, but never sent the 
patch as I couldn't figure the part 2 =).

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

