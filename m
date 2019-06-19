Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D207D4C24F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 22:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfFSUX0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 16:23:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:38248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbfFSUXZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 16:23:25 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ECD302082C;
        Wed, 19 Jun 2019 20:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560975804;
        bh=qgcuW/vpzcqzKWbZjJN8NyIykkFdIDlqS/LyBwbAD84=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=2QUpyZNpIs0fr4yIAAGZpJfOerU3kctEhFAVhrxVIpL2sZNFbbjH9MNecIR3iaS7/
         1+IVwdlC8UAm6yHU1q1s1CjEktjpPeu7Vqc+H+c8VDh0NHdSwh6YbJaBHnuoam38/T
         N2Fzf8pKY9U1vht0lC7lKRD3uGiONsQs/7P7/ehA=
Subject: Re: How to resolve an issue in swiotlb environment?
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Christoph Hellwig <hch@lst.de>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        shuah <shuah@kernel.org>
References: <Pine.LNX.4.44L0.1906141043530.24571-100000@netrider.rowland.org>
 <20684ef6-7da7-90ed-4cd6-3bc46202de6d@kernel.org>
From:   shuah <shuah@kernel.org>
Message-ID: <7a6450cd-7b68-778d-0124-3c21d4616069@kernel.org>
Date:   Wed, 19 Jun 2019 14:23:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20684ef6-7da7-90ed-4cd6-3bc46202de6d@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

On 6/18/19 9:28 AM, shuah wrote:
> On 6/14/19 8:44 AM, Alan Stern wrote:
>> On Thu, 13 Jun 2019, shuah wrote:
>>
>>>> Great!  So all we have to do is fix vhci-hcd.  Then we can remove all
>>>> the virt_boundary_mask stuff from usb-storage and uas entirely.
>>>>
>>>> (I'm assuming wireless USB isn't a genuine issue.  As far as I know, it
>>>> is pretty much abandoned at this point.)
>>>>
>>>> Valentina and Shua: Adding SG support to vhci-hcd shouldn't be too
>>>> hard.  It ought to be possible even without changing the network
>>>> protocol.
>>>>
>>>
>>> I will start taking a look at this. Is there a target release in plan
>>> to drop virt_boundary_mask stuff?
>>
>> Not yet.  But since it doesn't do what we want anyway, this should be
>> fixed quickly.
>>
> 

I missed a lot of the thread info. and went looking for it and found the
following summary of the problem:

==================
The issue which prompted the commit this thread is about arose in a
situation where the block layer set up a scatterlist containing buffer
sizes something like:

	4096 4096 1536 1024

and the maximum packet size was 1024.  The situation was a little
unusual, because it involved vhci-hcd (a virtual HCD).  This doesn't
matter much in normal practice because:

	Block devices normally have a block size of 512 bytes or more.
	Smaller values are very uncommon.  So scatterlist element sizes
	are always divisible by 512.

	xHCI is the only USB host controller type with a maximum packet
	size larger than 512, and xHCI hardware can do full
	scatter-gather so it doesn't care what the buffer sizes are.

So another approach would be to fix vhci-hcd and then trust that the
problem won't arise again, for the reasons above.  We would be okay so
long as nobody tried to use a USB-SCSI device with a block size of 256
bytes or less.
===================

Out of the summary, the following gives me pause:

"xHCI hardware can do full scatter-gather so it doesn't care what the
buffer sizes are."

vhci-hcd won't be able to count on hardware being able to do full
scatter-gather. It has to deal with a variety of hardware with
varying speeds.

"We would be okay so long as nobody tried to use a USB-SCSI device with
a block size of 256 bytes or less."

At least a USB Storage device, I test with says 512 block size. Can we
count on not seeing a device with block size <= 256 bytes?

In any case, I am looking into adding SG support vhci-hci at the moment.

Looks like the following is the repo, I should be working with?

git://git.infradead.org/users/hch/misc.git

thanks,
-- Shuah
