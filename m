Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A23B0D21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 12:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731113AbfILKpJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 06:45:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54010 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730470AbfILKpJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 06:45:09 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B51E933A;
        Thu, 12 Sep 2019 12:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568285107;
        bh=ySflx1ZVmELycv6C11MLgMeMJ8/ORIvARvZ8QTgVPzI=;
        h=Reply-To:Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=ZjXhY6+FaPpNwSKsQLuMQNYqMGefCghUZ/+IFQGcXkM7qHgYroKb3xpOTIBQ3kXVz
         VD7xPVUU78sc/gzLAO0hjdF8Ktg2AlAFazWCd5VyGuIZZ+kQBPaTbEi/pvpBtO9DTm
         tw8iuvL0S1pCmMLdBvsIVvhdY2n0/vthsX3LStE0=
Reply-To: kieran.bingham+renesas@ideasonboard.com,
          kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
Openpgp: preference=signencrypt
Organization: Ideas on Board
Message-ID: <ce3ba782-9658-a8fc-d161-10192002e508@ideasonboard.com>
Date:   Thu, 12 Sep 2019 11:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Sergei,

On 12/09/2019 11:26, Kieran Bingham wrote:
> Hi Sergei,
> 
> (pulling in +Geert for his opinion on compatible string usages)
> 
> On 12/09/2019 11:00, Sergei Shtylyov wrote:> Hello!
>>
>> On 11.09.2019 22:25, Kieran Bingham wrote:
>>
>>> Add direct support for the r8a77980 (V3H).
>>>
>>> The V3H shares a common, compatible configuration with the r8a77970
>>> (V3M) so that device info structure is reused.
>>
>>    Do we really need to add yet another compatible in this case?
>> I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
>> a patch like this one didn't get posted by me.

Also, the documentation at :
Documentation/devicetree/bindings/display/renesas,du.txt

already states the the "renesas,du-r8a77980" compatible string is
supported thanks to [0], so actually - this addition is a requirement to
make the driver match the documentation.


[0] 4ffe5aa53791 ("dt-bindings: display: renesas: du: document R8A77980
bindings")


>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> [...]
>>
>> MBR, Sergei
> 

