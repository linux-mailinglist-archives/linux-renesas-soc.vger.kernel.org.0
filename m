Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 113A044FB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 01:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfFMXBH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 19:01:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:42192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbfFMXBH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 19:01:07 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C71622147A;
        Thu, 13 Jun 2019 23:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560466866;
        bh=ijAoTvben3xHdJwjFjc2JVq20l3k6CT0SJjNIni16EE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=l7CW3kEbIEfMPyQKq84ka0PeuSuwdqPEd/rBwzyb+r1FqLLqyErPP9Iw42L52TmB5
         2Uy1rIkSbsHxHYYCWBq3FZuNZTXRsZ2QRyHKWJRpBXggeBKNkX5qMpxYhhmmT5vXeb
         r3sXe5wfp6Fftm3kLieDRdFmX+o6d0kmUyHdR3fc=
Subject: Re: How to resolve an issue in swiotlb environment?
To:     Alan Stern <stern@rowland.harvard.edu>,
        Christoph Hellwig <hch@lst.de>,
        Valentina Manea <valentina.manea.m@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        shuah <shuah@kernel.org>
References: <Pine.LNX.4.44L0.1906131306580.1307-100000@iolanthe.rowland.org>
From:   shuah <shuah@kernel.org>
Message-ID: <41caad16-3fa1-413b-0d49-594d48b88de4@kernel.org>
Date:   Thu, 13 Jun 2019 17:01:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1906131306580.1307-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 6/13/19 11:16 AM, Alan Stern wrote:
> On Thu, 13 Jun 2019, Christoph Hellwig wrote:
> 
>> On Wed, Jun 12, 2019 at 10:43:11AM -0400, Alan Stern wrote:
>>> Would it be okay to rely on the assumption that USB block devices never
>>> have block size < 512?  (We could even add code to the driver to
>>> enforce this, although refusing to handle such devices at all might be
>>> worse than getting an occasional error.)
>>
>> sd.c only supports a few specific sector size, and none of them is
>> < 512 bytes:
>>
>> 	if (sector_size != 512 &&
>> 	    sector_size != 1024 &&
>> 	    sector_size != 2048 &&
>> 	    sector_size != 4096) {
>> 	    	...
>> 		sdkp->capacity = 0;
> 
> Great!  So all we have to do is fix vhci-hcd.  Then we can remove all
> the virt_boundary_mask stuff from usb-storage and uas entirely.
> 
> (I'm assuming wireless USB isn't a genuine issue.  As far as I know, it
> is pretty much abandoned at this point.)
> 
> Valentina and Shua: Adding SG support to vhci-hcd shouldn't be too
> hard.  It ought to be possible even without changing the network
> protocol.
> 

I will start taking a look at this. Is there a target release in plan
to drop virt_boundary_mask stuff?

thanks,
-- Shuah

