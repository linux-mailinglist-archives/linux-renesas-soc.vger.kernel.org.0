Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 481C75D12F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2019 16:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfGBOG5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jul 2019 10:06:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:48712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbfGBOG4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jul 2019 10:06:56 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DFEAD2146F;
        Tue,  2 Jul 2019 14:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562076416;
        bh=Pp41hrAu9wXnZxi/7HdWsd75+f3tr/sxDdwBrvGpo/w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=0e1+IcL+52YIG2InIfrXr/t1LDhBQ7hZkXx5qVHh/DddSkEiWl6CMC2u9ZwikGY/P
         lpnhiqDCzsscqoi3CUAry1sYkPLD7Kb/vhQDLKydxY6754DNLr0qypI+6z83FQU/n3
         FfZfmG6zU/0V77vUNRxo1z97Gc7wwoI8+u2DDjVU=
Subject: Re: [PATCH v2] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
To:     Suwan Kim <suwan.kim027@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>, shuah <shuah@kernel.org>
References: <20190613171112.GA22155@lst.de>
 <Pine.LNX.4.44L0.1906131317210.1307-100000@iolanthe.rowland.org>
 <OSBPR01MB359051D6F83101432E0F2549D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20190617062222.GA5069@lst.de>
 <TYAPR01MB454412603157D6DDCB512092D8F80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <20190702134952.GA2414@localhost.localdomain>
From:   shuah <shuah@kernel.org>
Message-ID: <eceb266f-618d-f27c-b103-da15d6001be1@kernel.org>
Date:   Tue, 2 Jul 2019 08:06:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702134952.GA2414@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 7/2/19 7:49 AM, Suwan Kim wrote:
> On Tue, Jul 02, 2019 at 10:07:42AM +0000, Yoshihiro Shimoda wrote:
>> Hi Alan, shuah, Suwan,
>>
>>> From: Christoph Hellwig, Sent: Monday, June 17, 2019 3:22 PM
>>>
>>> On Mon, Jun 17, 2019 at 04:17:43AM +0000, Yoshihiro Shimoda wrote:
>>>> Thank you for the comments. So, should I wait for getting rid of the
>>>> virt_boundary_mask stuff? If I revise the commit log of this patch,
>>>> is it acceptable for v5.2-stable as a workaround? In other words,
>>>> I worry about this issue exists on v5.2-stable.
>>>
>>> It does exist on 5.2-stable and we should fix it.  I'll plan to resend
>>> my series to fix the virt_boundary issues for the other SCSI driver
>>> soon, but we'll still need to sort out usb-storage.
>>
>> I guess that getting rid of the virt_boundary_mask stuff [1] needs more time.
>> So, for v5.2-stable, would you accept my patch as a workaround?
>> JFYI, v5.2-rc7 still has this "swiotlb buffer is full" issue.
> 
> Hi, Yoshihiro,
> 
> I have been implementing v2 of this patch according to Alan's comment
> (allocate small buffers and urbs instead of one big buffer) and it
> takes some time. The implementation is almost done but I think it
> will take a few days or more because of the test and bug fix...
> 
> Regards
> 
> Suwan Kim
> 

Hi Yoshihiro,

Suwan's patch series will definitely won't make it before 5.2 comes
out. There is not enough time for that. Please send you work-around.


Suwan,

I figured you have been working on Alan's feedback on your patch series.
Thanks for working on the fixing the problem.

thanks,
-- Shuah
