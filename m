Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B251F552C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 14:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbgFJMuY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 08:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbgFJMuX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 08:50:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02C7C03E96B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2020 05:50:23 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2602129E;
        Wed, 10 Jun 2020 14:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591793422;
        bh=VAHvsE8RNQw2h4+H6C5qfvZeTEaWVbFB+4lAlDkXLtA=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=q9kOBbAR26JZRGk7WOtrSWBqZS0A9m8HlZSM7tSKqvS8Aak7DIuTTyyZdFJuDVyrG
         rb+JJTr3y8AeJUZao8oePCY/YLi/h6X99JJa9Cfcnk5fI3FHUIUVOoZtq3AR1BMOK1
         6Ef8sQUF4xko0OAYfWzraH4BaSAh0nmMrAGKvJqI=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v9.2 0/9] GMSL fixups ready for v10.
To:     Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20200610124623.51085-1-kieran@bingham.xyz>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <e43fc6cb-c2f2-9a0a-5467-469e4578c05c@ideasonboard.com>
Date:   Wed, 10 Jun 2020 13:50:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610124623.51085-1-kieran@bingham.xyz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

You forgot to mention that the previous 3 patches posted as v9.1 have
already been merged into your GMSL branch and these are based upon that...:

     - Use the same default mbus_fmt everywhere
     - Don't provide GPIO names
     - Fix dev->of_node refcnting

--
Kieran


On 10/06/2020 13:46, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Unfortunately we missed the 5.8 window with reviews that came in really
> late in the merge window, but hey  ... more time to do more fixups to
> GMSL....
> 
> Jacopo has done various updates to fix the DT Yaml validation, though
> there is probably some scope there that means we might need a
> meta-schema for I2C-Muxes ... but that gets more complicated and
> probably a bit out of scope for now.
> 
> I've taken more review comments into consideration and handled more
> fixes for the drivers, which we expect to get to a point that these can
> now be merged for the next release.
> 
> Sakari has at least provisionalyl given us his blessing - so lets hope
> v10 is the last - and we can finally see max9286/rdacm20 get upstream.
> 
> --
> Kieran
> 
> 
> Jacopo Mondi (1):
>   fixes! [max9286-dt]: Fix dt-validation
> 
> Kieran Bingham (8):
>   fixes! [max9286]: Fix whitespace indent
>   fixes! [max9286]: Validate link formats
>   fixes! [max9286]: Use single sample per pixel
>   fixes! [max9286]: Remove redundant DPHY check
>   fixes! [max9286]: Remove redundant call
>   fixes! [max9286-dt]: Add GPIO controller support
>   fixes! [max9286-dt]: Correctly match the hex camera node reg
>   fixes! [rdacm20]: Use usleep_range over mdelay(10)
> 
>  .../bindings/media/i2c/maxim,max9286.yaml     | 91 +++++++++++++++++--
>  drivers/media/i2c/max9286.c                   | 45 ++++-----
>  drivers/media/i2c/rdacm20.c                   |  4 +-
>  3 files changed, 107 insertions(+), 33 deletions(-)
> 

