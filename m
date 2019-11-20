Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58B581040D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2019 17:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbfKTQdU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Nov 2019 11:33:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51050 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729036AbfKTQdT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Nov 2019 11:33:19 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48ED5559;
        Wed, 20 Nov 2019 17:33:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574267597;
        bh=vfgZDOKE4qnjzlxP7fvp9Dhnl8MS3WvYa4Ybwsk1K/U=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AFT8IDgndVs844PX6qyGRYdob+SBaTgjfBLuoRvE1vDE+4fLqiB75kgnQj+9DgT0R
         T/pjtiTzL2pbNmpj+cZKWeEvXf0Tw7+giXXceAqwtFN701iNsu38kXgZ4EtU/8RmC7
         m3gC7lYNPxDFefb+pDidusmC0+2Opo7H8rDNt3DA=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [RFT 0/4] GMSL Refresh (would be v6)
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <7d5f2a2e-3592-ab7b-2a0c-23373b2dbd2f@ideasonboard.com>
Date:   Wed, 20 Nov 2019 16:33:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for this refresh. The key part here is the refresh of the
V4L2-Mux series, which is what had previously blocked the GMSL series.

Will you post/publish the vl42-mux series on the linux-media mailinglist?

I know there are other interested parties who are looking at such topics
- so highlighting the latest version might be beneficial to promoting
discussions.


On 16/11/2019 16:50, Jacopo Mondi wrote:
> Hello this is refersh of our GMSL work.
> 
> Current situation is the following:
> - Kieran sent a full v4 with multiplexed stream support and has a v5 branch in
>   his repository with v4 review comment fixes on top
> 
> 	I rebased the multiplexed stream's series on latest media-master
> 	https://jmondi.org/cgit/linux/log/?h=v4l2-mux/media-master/v6
> 
> 	On top of that I took Kieran's v5 and re-applied on top:
> 	https://jmondi.org/cgit/linux/log/?h=jmondi/gmsl/kieran/v6
> 
> - Niklas sent a v1 (which sould have been a v5) which removes multiplexed
>   streams and only support one camera and was meant for inclusion but is still
>   floating around in linux-media, mostly because some of the comments on
>   Kieran's v4 still applied there, if I'm not mistaken.
> 
> 	I took Niklas' single stream max9286 and replaced the original
> 	bindings with a json-schema version
> 	https://jmondi.org/cgit/linux/log/?h=jmondi/gmsl/niklas/v6
> 
> I bumped all versions to v6 to avoid further confusion.
> 
> Not having a working GMSL setup I would ask to Kieran or Niklas to test this
> version so that we can try re-send the single stream max9286 version with new
> yaml bindings for inclusion.

Thanks, I can confirm that the rebase to current master was successful
(based on your branch with the version of patches based on my gmsl/v5)


As we now have two forks of the GMSL I'm going to rebase these such that
the separation between current topics is clear:

 - MAX9286 with support for a single camera (and only a single MAX9286)
	- This we could/should hope to get upstream
 - MAX9286 VC support
	- (requires the V4L2-Mux support of course)
 - MAX9286 dual device workaround (not suitable for upstream currently)
	- Required to function on the Salvator-XS GMSL board.

Once I've done (and tested this) I'll make a new posting (should we call
this v6? or v6.1?)


In the meantime, I will not be making changes to the RDACM20, so if you
wish to get started investigating the separation topic here - then I
don't think you are blocked on me.

--
Regards

Kieran




> (I kept linux-media e devicetree out as I would like to test the patches before
> expanding the receivers list)
> 
> Thanks
>    j
> 
> Jacopo Mondi (2):
>   arm64: dts: renesas: Add Maxim GMSL expansion board
>   arm64: dts: renesas: r8a7796=salvator-x: Include GMSL
> 
> Laurent Pinchart (1):
>   dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286
> 
> Niklas Söderlund (1):
>   max9286: Add MAX9286 driver
> 
>  .../bindings/media/i2c/maxim,max9286.yaml     |  286 +++++
>  MAINTAINERS                                   |   10 +
>  .../boot/dts/renesas/r8a7795-salvator-x.dts   |    1 +
>  .../boot/dts/renesas/salvator-x-max9286.dtsi  |  394 ++++++
>  drivers/media/i2c/Kconfig                     |   11 +
>  drivers/media/i2c/Makefile                    |    1 +
>  drivers/media/i2c/max9286.c                   | 1081 +++++++++++++++++
>  7 files changed, 1784 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>  create mode 100644 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
>  create mode 100644 drivers/media/i2c/max9286.c
> 
> --
> 2.23.0
> 

