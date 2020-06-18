Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07AA1FEE19
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 10:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgFRIwf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 04:52:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46418 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728452AbgFRIwe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 04:52:34 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85FB528D;
        Thu, 18 Jun 2020 10:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592470350;
        bh=cQdDQYK5cYEmsz/Pb+jP6CxA60dH8BgafEV56iCSNs4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XY55hUJ8tmgdmJpQrZNZ3WYlijnFZ4pBgLtJvo3tYovpZYH+fR8s69ZVNxlE2POyl
         EGMoZU4VvyIsgXyP8Zb49khWHAaCDXdfafuUY974HYQHgVkBa7RNGt1KsMLWWEYSD0
         M73zf8IsJc+56ZuQjksdu8z+795y3biTYjt0oRww=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 07/17] drivers: usb: Fix trivial spelling
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Jiri Kosina <trivial@kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
 <20200609124610.3445662-8-kieran.bingham+renesas@ideasonboard.com>
 <20200618082147.GA1050104@kroah.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <0d1fb492-7503-895c-82d3-b7f4611ef1f2@ideasonboard.com>
Date:   Thu, 18 Jun 2020 09:52:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618082147.GA1050104@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

On 18/06/2020 09:21, Greg Kroah-Hartman wrote:
> On Tue, Jun 09, 2020 at 01:46:00PM +0100, Kieran Bingham wrote:
>> The word 'descriptor' is misspelled throughout the tree.
>>
>> Fix it up accordingly:
>>     decriptors -> descriptors
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/usb/core/of.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
>> index 651708d8c908..617e92569b2c 100644
>> --- a/drivers/usb/core/of.c
>> +++ b/drivers/usb/core/of.c
>> @@ -45,7 +45,7 @@ EXPORT_SYMBOL_GPL(usb_of_get_device_node);
>>   *
>>   * Determine whether a USB device has a so called combined node which is
>>   * shared with its sole interface. This is the case if and only if the device
>> - * has a node and its decriptors report the following:
>> + * has a node and its descriptors report the following:
>>   *
>>   *	1) bDeviceClass is 0 or 9, and
>>   *	2) bNumConfigurations is 1, and
>> -- 
>> 2.25.1
>>
> 
> Already fixed in Linus's tree :(

Don't be sad - that makes me happy ;-) This was just a global fixup
while I added the correction to scripts/spelling.txt...

But wait, are you sure? I've just rebased this series on top of
1b5044021070 ("Merge tag 'dma-mapping-5.8-3' of
git://git.infradead.org/users/hch/dma-mapping"), and this still applies
for me ... Am I failing to pick up the latest branch from Linus?
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
looks like I'm on the latest, so I don't think so).

I see a bot-notification from you saying it's been added to your
usb-testing tree, so I'll assume this is all fine. No need to worry
though It's only a trivial and can get picked up by the trivial bot I
think if I resend when the dust settles.

Thanks

Kieran
