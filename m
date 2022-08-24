Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D10B59F678
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 11:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236487AbiHXJiB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 05:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236365AbiHXJh1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 05:37:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E838F95E7E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 02:37:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74EC02B3;
        Wed, 24 Aug 2022 11:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661333844;
        bh=b3NPdM3eN9nJGt3dS8tK6sAe7mMcC0vYb5zbD4Nwr/0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h2bhhpEHWHcvMJVPJA+0LOiRTATGCLrKkG+TohSy6ipLDejNjApkTeGbwkkUKXqf6
         StuLL6OyAm0nCxLivHMSXIdGd6D5vV2X0nEtNpZSa2Ntw0DVVPydoRKpt0nQktplNE
         b/4vJHQKGrsg2liOCArS1EV2ajfUQOZL9bLQvYIY=
Date:   Wed, 24 Aug 2022 12:37:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: fw_devlink.strict=1 breaks sound card probe ?
Message-ID: <YwXxT0Gr1KQQb71F@pendragon.ideasonboard.com>
References: <87sflmuyf4.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sflmuyf4.wl-kuninori.morimoto.gx@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Wed, Aug 24, 2022 at 03:13:04AM +0000, Kuninori Morimoto wrote:
> 
> Hi Renesas-ML
> Cc Saravana, Greg, Laurent, Geert
> 
> I'm now testing v6.0.0-rc2 kernel on ULCB-KF board, and I noticed
> it doesn't probe sound card.
> I git-bisected and noticed that this patch breaks sound probe.
> 
> 	commit 71066545b48e4259f89481199a0bbc7c35457738
> 	("driver core: Set fw_devlink.strict=1 by default")
> 
> I could re-probe sound card if I reverted it.
> (My .config is using Y for all drivers)
> 
> I'm not well understanding about this patch,
> but it seems it is related to deferred probe.
> 
> My sound card needs many drivers to probe.
> 
> 	HDMI
> 	Sound CPU
> 	Sound Codec x 2 (depends on I2C)
> 	Sound Card
> 
> To probe "Sound Card", it needs other necessary drivers.
> But it seems some necessary drivers are not probed by above patch.
> In my quick check, "HDMI" and 1 of "Sound Codec" drivers are not probed.
> 
> How can I solve this issue, or where I can check ?

Saravana is more familiar with devlink than I am, so he may be able to
diagnose that without further information, but otherwise it would be
helpful if you could provide some logs. Enabling the debug messages in
drivers/base/dd.c can provide some insight. The contents of the debugfs
devices_deferred file can also be useful, as well as the
consumer/supplier links in sysfs for all the devices involved with the
sound card.

-- 
Regards,

Laurent Pinchart
