Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E1D3B15D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 10:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhFWIa4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 04:30:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34632 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbhFWIa4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 04:30:56 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC4499B1;
        Wed, 23 Jun 2021 10:28:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624436918;
        bh=nApNo5hcf8BQh5BVUFafE+xcZysYzEQx+MRVHfn8ISY=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=nx1LkOwluS9fVtYANJTTuvbmtFKz3aOMNC9vDO6T0/zdKl0i+R1AYxnbtDFP0ac8O
         cjHsT2DFQW7SVeW/hNxMoARdkd+XoF92GJh5q+AisBXF0DuCgo+jl2/Vd2RlRlZf72
         U+fsDfZ6+gmiRsJphoBdgWLayIo7GkAQQKxXb6DI=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 0/3] drm: rcar-du: V3U support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
 <YNKX8qN4YtjFlW6T@pendragon.ideasonboard.com>
Message-ID: <dba479d7-eab8-dbc0-ec70-0c898c5783df@ideasonboard.com>
Date:   Wed, 23 Jun 2021 09:28:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNKX8qN4YtjFlW6T@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 23/06/2021 03:09, Laurent Pinchart wrote:
> Hi Kieran,
> 
> It seems that the cover letter didn't include the mailing lists on CC,
> fixing this.

Argh, I should have remembered this. I used --cc-cmd
./scripts/get_maintainer... but it doesn't match anything for the cover
letters, when really the cover letter should cc all recipients of all
patches.

Anyone got a workaround for that, so that the cover-letter actually
makes it to the right places as well?


> On Wed, Jun 23, 2021 at 12:20:21AM +0100, Kieran Bingham wrote:
>> Extend support for the V3U Display Unit, making use of the {recently,
>> soon to be} posted DSI encoder from Laurent.
>>
>> Patch 1 just cleans up in preparation for patch 3, and patch 2 is
>> required for operation on the V3U, however it is functional and should
>> be correct for the D3 and E3 as well, as they also lack external sync.
>>
>> Patch 3 enables the V3U and connects it to the MIPI DSI encoder, of
>> which I'm in a race between me and laurent for posting these patches ;-)
> 
> You won the race :-)

Ah well, as long as the dependency is clear ;D

--
Kieran


> 
>> Tests have been run and produce images - but there are artifacts visible
>> and some modes are unavailable, which will need further investigations,
>> but can be done on top of this integration.
>>
>> Kieran Bingham (3):
>>   drm: rcar-du: Sort the DU outputs
>>   drm: rcar-du: Only initialise TVM_TVSYNC mode when supported
>>   drm: rcar-du: Add r8a779a0 device support
>>
>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 25 ++++++++++++++++++++++-
>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h    |  6 ++++--
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.c     | 21 +++++++++++++++++++
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  6 ++++++
>>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++++
>>  drivers/gpu/drm/rcar-du/rcar_du_group.c   |  2 ++
>>  6 files changed, 61 insertions(+), 3 deletions(-)
>>
> 
