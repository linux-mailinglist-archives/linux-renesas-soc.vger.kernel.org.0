Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8FD2E4878
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 12:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407954AbfJYKUS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 06:20:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47014 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407901AbfJYKUS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 06:20:18 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 351DE33A;
        Fri, 25 Oct 2019 12:20:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571998815;
        bh=CZ1kjEvWoR7EfFvii7Hgk5UMP852bJTvCb6Z2n2Tdmg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NrDIHKURylRCdZ0pO+c4gHoJGNziQUt/r1DOVnLRTkYJB4e22fsKQA7klVphyCUB7
         SsGykYJ5sv1G/8f/TQKP02Z+xVXszWlC0fM6wI/efB5uklZZoKHrkNSdvvLYAusuif
         L75GRnft5wWPqi+DiUQFcQT6FozP43Ez4gHzrdFw=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: fdp1: Fix R-Car M3-N naming in debug message
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20191024130916.16444-1-geert+renesas@glider.be>
 <05a62983-5132-0fcb-2e8e-70b95d44730f@ideasonboard.com>
 <CAMuHMdX4xikRtojAWgWecEfqjrOw+aEGaW2HFvDkvJbwHxb1qA@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <0d8fb393-a1ad-e4d7-5cdb-1da72a7d3110@ideasonboard.com>
Date:   Fri, 25 Oct 2019 11:20:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX4xikRtojAWgWecEfqjrOw+aEGaW2HFvDkvJbwHxb1qA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 25/10/2019 09:46, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Thu, Oct 24, 2019 at 6:08 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> On 24/10/2019 14:09, Geert Uytterhoeven wrote:
>>> The official name is "R-Car M3-N", not "R-Car M3N".
>>>
>>> Fixes: 4e8c120de9268fc2 ("media: fdp1: Support M3N and E3 platforms")
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>>  drivers/media/platform/rcar_fdp1.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
>>> index cb93a13e1777a53e..97bed45360f088d0 100644
>>> --- a/drivers/media/platform/rcar_fdp1.c
>>> +++ b/drivers/media/platform/rcar_fdp1.c
>>> @@ -2369,7 +2369,7 @@ static int fdp1_probe(struct platform_device *pdev)
>>>               dprintk(fdp1, "FDP1 Version R-Car H3\n");
>>>               break;
>>>       case FD1_IP_M3N:
>>
>> Should the FD1_IP_M3N naming also be updated accordingly?
>> I guess that's not so important.
>>
>> Either way, up to you.
> 
> Na, you can't use hyphens in preprocessor definitions ;-)> FD1_IP_M3N is consistent with FD1_IP_M3W, and not user-visible.

Hahaha - of course :-D , I meant with M3_N but as we already have IP_M3W
I think we're fine.


>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Thanks!

No worries

--
KB

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

