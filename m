Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBFA24A556
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 17:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729381AbfFRP2h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 11:28:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:55228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729247AbfFRP2h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 11:28:37 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 031B92085A;
        Tue, 18 Jun 2019 15:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560871716;
        bh=cBZbIGQ+cjyD2YCVRDOXcoe7z6QzrPpzbzN0znS/Ylg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=1637osodxbXA+dd8NcCz7z4PZoJd2L4ooz5xgXaHLyVoXzk6mzzxCFsnF70fvSYaj
         rxwiYsehj0Nwqj96sUhbw7/ewZ6peonITYgoV53cZ0Lc/Fz3dnxXt5nuaECF1D648A
         wRwkpNFXQQ0FTiqYqUEkbxk32ximtj+bSI7AepPk=
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
From:   shuah <shuah@kernel.org>
Message-ID: <20684ef6-7da7-90ed-4cd6-3bc46202de6d@kernel.org>
Date:   Tue, 18 Jun 2019 09:28:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1906141043530.24571-100000@netrider.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 6/14/19 8:44 AM, Alan Stern wrote:
> On Thu, 13 Jun 2019, shuah wrote:
> 
>>> Great!  So all we have to do is fix vhci-hcd.  Then we can remove all
>>> the virt_boundary_mask stuff from usb-storage and uas entirely.
>>>
>>> (I'm assuming wireless USB isn't a genuine issue.  As far as I know, it
>>> is pretty much abandoned at this point.)
>>>
>>> Valentina and Shua: Adding SG support to vhci-hcd shouldn't be too
>>> hard.  It ought to be possible even without changing the network
>>> protocol.
>>>
>>
>> I will start taking a look at this. Is there a target release in plan
>> to drop virt_boundary_mask stuff?
> 
> Not yet.  But since it doesn't do what we want anyway, this should be
> fixed quickly.
> 

Sounds good. I am working on it.

thanks,
-- Shuah
