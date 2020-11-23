Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20F92C0FD8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Nov 2020 17:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730934AbgKWQKN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Nov 2020 11:10:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47242 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731760AbgKWQKM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Nov 2020 11:10:12 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 845C871;
        Mon, 23 Nov 2020 17:10:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606147810;
        bh=4NQ1cSAYVJfYcd5LiRfwMr++N6YqrCcNRBQrry0GaBU=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=qTQvBoxf+xQhE0ho4BfN5UQTYXjc77Cl+FmUdcP/arjJtqXR8VPO5Qd2p2c+BHYPW
         HaHWHIIpl+j5+YKjJFMwvA8bYCEbvQSielTMUgfEPZY9fRpSxJm6Jjme22jMvti2jA
         dn5ZP9kNL73179epPvsEnL4+CaaK1U7G83qopx3c=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2] scripts: boards: Support alternative H3 variant
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20201123120150.117735-1-kieran@bingham.xyz>
 <0d682991-9140-f1a9-7b44-98c303b5d37b@gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <e78b696e-222d-13cf-a5cd-0a678e391c84@ideasonboard.com>
Date:   Mon, 23 Nov 2020 16:10:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0d682991-9140-f1a9-7b44-98c303b5d37b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On 23/11/2020 15:51, Sergei Shtylyov wrote:
> On 11/23/20 3:01 PM, Kieran Bingham wrote:
> 
>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> The Salvator-X H3 has had a rename of it's model information.
> 
>    It's actually "its". :-)

Indeed, I can never get out of the habit of this. "it's" has become
built into my muscle memory some how, and always ends up slipping out
where it shouldn't.

Sounds like I'm expecting comments from Niklas too, so seems I'll need a
v3 anyway. :S

--
Thanks.

Kieran.

> 
>> Support the new naming, and add the extra variants now available.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> [...]
> 
> MBR, Sergei
> 

