Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9574F22431
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 May 2019 19:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbfERRL4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 May 2019 13:11:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53210 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728037AbfERRL4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 May 2019 13:11:56 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33A34D5;
        Sat, 18 May 2019 19:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558199514;
        bh=YASLlYaoRZMlOBjxaNZY8+vdFHleDHp1QavyehIFddc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rB9siV/LwO7KQBvZQrmGQG76KsI44UZMSHe2yXJvwm226TqVaxHY8dIhFPL1uQWiB
         VcWPmV21XVCHT97OlCTGiHZuMllZWY8nKf17AU647T7sqsjPmnvyzYvj89iCZuM88u
         FVT5PT2TiuAGB0w94X11QT7lxOw4YKwNzDgOjrb0=
Date:   Sat, 18 May 2019 20:11:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: rcar-du: writeback: include interface header
Message-ID: <20190518171129.GA4995@pendragon.ideasonboard.com>
References: <20190517212050.3561-1-kieran.bingham+renesas@ideasonboard.com>
 <a61ab53c-4e05-991c-f74f-802bd6222d8a@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a61ab53c-4e05-991c-f74f-802bd6222d8a@cogentembedded.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Sat, May 18, 2019 at 11:42:28AM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 18.05.2019 0:20, Kieran Bingham wrote:
> 
> > The new writeback feature is exports functions so that they can
>                              ^^ not needed?

Good catch. I'll fix it in my branch.

> > integrate into the rcar_du_kms module.
> > 
> > The interface functions are defined in the rcar_du_writeback header, but
> > it is not included in the object file itself leading to compiler
> > warnings for missing prototypes.
> > 
> > Include the header as appropriate.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> [...]
> 
> MBR, Sergei

-- 
Regards,

Laurent Pinchart
