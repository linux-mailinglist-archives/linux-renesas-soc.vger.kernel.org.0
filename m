Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C601D6192
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2020 16:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgEPOWG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 16 May 2020 10:22:06 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:59285 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbgEPOWF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 May 2020 10:22:05 -0400
X-Originating-IP: 82.54.229.221
Received: from uno.localdomain (host221-229-dynamic.54-82-r.retail.telecomitalia.it [82.54.229.221])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 95073C0003;
        Sat, 16 May 2020 14:22:01 +0000 (UTC)
Date:   Sat, 16 May 2020 16:25:18 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v9.1 0/3] MAX9286 fixups
Message-ID: <20200516142518.xm7q3ot54oeasuax@uno.localdomain>
References: <20200514140016.1445489-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200514140016.1445489-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, May 14, 2020 at 03:00:13PM +0100, Kieran Bingham wrote:
> Following the review comments on v9, max9286, here are the fixes I plan
> to apply to generate v10.

Please squash in v10

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j
>
> Kieran Bingham (3):
>   fixes! [max9286]: Use the same default mbus_fmt everywhere
>   fixes! [max9286]: Don't provide GPIO names
>   fixes! [max9286]: Fix dev->of_node refcnting
>
>  drivers/media/i2c/max9286.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> --
> 2.25.1
>
