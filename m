Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14EA41F56FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 16:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgFJOpU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 10:45:20 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:40831 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgFJOpU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 10:45:20 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 88334C000A;
        Wed, 10 Jun 2020 14:45:17 +0000 (UTC)
Date:   Wed, 10 Jun 2020 16:48:40 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran@ksquared.org.uk>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v9.2 0/9] GMSL fixups ready for v10.
Message-ID: <20200610144840.mpqmbac5hrlvyy2k@uno.localdomain>
References: <20200610124623.51085-1-kieran@bingham.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610124623.51085-1-kieran@bingham.xyz>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Jun 10, 2020 at 01:46:14PM +0100, Kieran Bingham wrote:
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

I've replied with a patch that fixes the dt-schema validation warning we had.

The example in the schema was actually wrong.

If you agree with the patch, please squash it in forthcoming v10.

Thanks
  j

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
> --
> 2.25.1
>
