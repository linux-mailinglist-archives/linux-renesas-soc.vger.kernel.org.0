Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0503445C507
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 14:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347498AbhKXNym (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 08:54:42 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60316 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352134AbhKXNwP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 08:52:15 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7694990E;
        Wed, 24 Nov 2021 14:49:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637761744;
        bh=RQLrsWnzsrDIoombZHS1b9wa6UWjU3b5sI/mylyuGiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dM64TiAx6OweN5yPg2HvOBAW08T8PvAWd5KHGQm/X9L29BvVKxqsmCTLUg5HjKB5e
         +WklaRV028WH5mLz9k65bxS2bVyR9MV2htpMWVr+QfzqpVSTXeb/UpuRcfx/GcEpMH
         KDCq6f4Lzy3kMZmRqTBVWp+2REycGOeWC68Tpk2o=
Date:   Wed, 24 Nov 2021 15:48:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI isn't probed on v5.15-rc1 on ULCB+KF
Message-ID: <YZ5CuiCyNDE7IyNm@pendragon.ideasonboard.com>
References: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com>
 <YV5vB4c8J0xu2mOd@pendragon.ideasonboard.com>
 <87v929moad.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUxXP86Z-2Tb8t4bK6aBfRT1Toj0jpruEEd8YbeDL+h=A@mail.gmail.com>
 <163585809096.275423.10804585086979279969@Monstersaurus>
 <87bl302598.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87bl302598.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Morimoto-san,

For some reason this mail hadn't made it to the list, nor to my inbox.

On Thu, Nov 04, 2021 at 08:23:15AM +0900, Kuninori Morimoto wrote:
> 
> Hi Kieran
> 
> > > > =>      [    1.485684] rcar-dw-hdmi fead0000.hdmi: Detected HDMI TX controller v2.01a with HDCP (DWC HDMI 2.0 TX PHY)
> > > > =>      [    1.496248] rcar-dw-hdmi fead0000.hdmi: registered DesignWare HDMI I2C bus driver
> > > >         [    1.535173] loop: module loaded
> > > >         ...
> > > >
> > > > This is NG case.
> > > > DAM failed. rcar-dw-hdmi is not probed.
> > 
> > Was something changed to make this happen between this and the above
> > test?
> 
> Only reverting the issue patch.
> 
> > > Note that in both cases feb00000.display failed to probe first
> > > Is this an fw_devlink issue, due to HDMI linking to DU in DT?
> > > Does it work with fw_devlink=permissive of fw_devlink=off?
> > 
> > The DT is all connected up with the ports as I would expect them on
> > ulcb+kf, but I saw the unanswered question from Geert above. Could you
> > check that please?
> 
> In my understanding, Laurent answered it at private meeting.
> He said it is not related, if my memory was correct.
> 
> > Is there anything else specific to replicating this issue? Is it only on
> > the ULCB+KF? Or does it occur on Salvator-XS too? (And does it need a
> > specific kernel config to reproduce?)
> 
> I could reproduce the same issue on Salvator-XS.
> I attached my .config on this mail.

[snip]

> # CONFIG_DRM_DISPLAY_CONNECTOR is not set

Enabling this option should help.

-- 
Regards,

Laurent Pinchart
