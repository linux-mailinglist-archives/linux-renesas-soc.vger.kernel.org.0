Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1354EE0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 19:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbfFURnu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 13:43:50 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39046 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfFURnu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 13:43:50 -0400
Received: by mail-pg1-f194.google.com with SMTP id 196so3718481pgc.6;
        Fri, 21 Jun 2019 10:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2pbfkZnNtwxho5vGdOe6FtdRxb/ZcWHyWe7FQ5e3h4Q=;
        b=sn4kS+bU7/Kbv9eioXyl3cDTTyeR09xPPdgQ0CullBFMQjKpQLyGZ3aGzfacXJ+ovQ
         xp7a1HBITcLhnqW6aXd0q2jIfiW1eP80lkuDq7g88/yCJnNC5jTa+yPEQunl55dM33Bl
         eg6B9WC+dyU62YT53Tbhh5vPuJSeUUslQ2cWRRwWVOYnUkxj9KBdnjpXWREeEHtwKTYC
         Z3YNX9pmKdDSpuz+OExOlxRH74j6f72cZPJbkUXt9demOlEfHPuSkeCeFHN4K7pvxO0n
         bXe60lYOuTriQ152ALRBk5C1qncD3uxJBowHBT4qn07u+WnvoMKGnzdHT+3m6Bh+AGng
         /Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2pbfkZnNtwxho5vGdOe6FtdRxb/ZcWHyWe7FQ5e3h4Q=;
        b=ou2N3iSTcFse+zUZr+87LcA0QjCdgEyqd/uReZwjK6gWc/t742m0cQnIQ04EAucqcs
         kcTzVJFxZ87cQGU9f9K1CQG6hzcSBqjtWjGT2ajUyZQsHJjsyTvhwMvKpPwF86VU81Hn
         Mx+PmXv2ZN755AiKtMgJZ92GJlXJ+ynr+zA9LHRpcFJMRSOrARlytHFULozcuWVNrpJA
         1U2kUY8rnQZN/Lj/E2xeYofRZkQAQxLa5Cdw+JH/WxTDqDJK00Q1KEoZsAqgvd/GIYHi
         lngkxx1uNhnoRWU4+UjhqabaEmbVryS5sb5fJaGXa+wfewr56E3oOtIkg2jTsjBI9D3q
         FfWg==
X-Gm-Message-State: APjAAAWhocvv9UZ3zZ2QQJD11PnpEGBKjR1eGD6+bFhsUluF4x036JJ6
        9fcPGX1vLTkLdt8oTt8/FaA=
X-Google-Smtp-Source: APXvYqysaLeyOSucPthfuXN5XsRYxePAZMQGO/ppCPMjOGa0B2SGss3rnVn9ijOUpcobbtg687DU3g==
X-Received: by 2002:a63:8341:: with SMTP id h62mr8739794pge.206.1561139029712;
        Fri, 21 Jun 2019 10:43:49 -0700 (PDT)
Received: from localhost.localdomain ([125.142.23.13])
        by smtp.gmail.com with ESMTPSA id r15sm6233971pfc.162.2019.06.21.10.43.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 10:43:49 -0700 (PDT)
Date:   Sat, 22 Jun 2019 02:43:43 +0900
From:   Suwan Kim <suwan.kim027@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     shuah <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190621174342.GA28335@localhost.localdomain>
References: <7a6450cd-7b68-778d-0124-3c21d4616069@kernel.org>
 <Pine.LNX.4.44L0.1906191649350.1596-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1906191649350.1596-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 19, 2019 at 05:05:49PM -0400, Alan Stern wrote:
> On Wed, 19 Jun 2019, shuah wrote:
> 
> > I missed a lot of the thread info. and went looking for it and found the
> > following summary of the problem:
> > 
> > ==================
> > The issue which prompted the commit this thread is about arose in a
> > situation where the block layer set up a scatterlist containing buffer
> > sizes something like:
> > 
> > 	4096 4096 1536 1024
> > 
> > and the maximum packet size was 1024.  The situation was a little
> > unusual, because it involved vhci-hcd (a virtual HCD).  This doesn't
> > matter much in normal practice because:
> > 
> > 	Block devices normally have a block size of 512 bytes or more.
> > 	Smaller values are very uncommon.  So scatterlist element sizes
> > 	are always divisible by 512.
> > 
> > 	xHCI is the only USB host controller type with a maximum packet
> > 	size larger than 512, and xHCI hardware can do full
> > 	scatter-gather so it doesn't care what the buffer sizes are.
> > 
> > So another approach would be to fix vhci-hcd and then trust that the
> > problem won't arise again, for the reasons above.  We would be okay so
> > long as nobody tried to use a USB-SCSI device with a block size of 256
> > bytes or less.
> > ===================
> > 
> > Out of the summary, the following gives me pause:
> > 
> > "xHCI hardware can do full scatter-gather so it doesn't care what the
> > buffer sizes are."
> > 
> > vhci-hcd won't be able to count on hardware being able to do full
> > scatter-gather. It has to deal with a variety of hardware with
> > varying speeds.
> 
> Sure.  But you can test whether the server's HCD is able to handle 
> scatter-gather transfers, and if it is then you can say that the 
> client-side vhci-hcd is able to handle them as well.  Then all you 
> would have to do is preserve the scatterlist information describing the 
> transfer when you go between the client and the server.
> 
> The point is to make sure that the client-side vhci-hcd doesn't claim
> to be _less_ capable than the server-side actual HCD.  That's what
> leads to the problem described above.
> 
> > "We would be okay so long as nobody tried to use a USB-SCSI device with
> > a block size of 256 bytes or less."
> > 
> > At least a USB Storage device, I test with says 512 block size. Can we
> > count on not seeing a device with block size <= 256 bytes?
> 
> Yes, we can.  In fact, the SCSI core doesn't handle devices with block 
> size < 512.
> 
> > In any case, I am looking into adding SG support vhci-hci at the moment.
> > 
> > Looks like the following is the repo, I should be working with?
> > 
> > git://git.infradead.org/users/hch/misc.git
> 
> It doesn't matter.  Your work should end up being independent of 
> Christoph's, so you can base it on any repo.

I implemented SG support of vhci. I will send it as a patch.
Please look at it and let me know if you have a feedback.

Regards

Suwan Kim
