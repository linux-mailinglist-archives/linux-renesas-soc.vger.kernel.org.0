Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32A6A5D0FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2019 15:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfGBNuA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jul 2019 09:50:00 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46330 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfGBNuA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jul 2019 09:50:00 -0400
Received: by mail-pl1-f193.google.com with SMTP id e5so400234pls.13;
        Tue, 02 Jul 2019 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q0bjQEkxGonB21AHtKl/d7V91XCD8lCBxRLvpB5sJik=;
        b=Lbh6hO5IL7QKC9q+yCoSeY3NlJqyBfGy7US/sQTfDimsz76JqiGJbcjm4QAvWKwmhm
         jBrEI5lymPfCUo7Bf+sL5ksUXwLnM+vGfiF0mykAsPOnLL+J9OtC+Lusq7l/pRohspBX
         0EudnwAlwgA9UGbW5nUoVB1dtNMy0lZkh2Z0gNSjBwpoxMqnhivq43Wx8o3RrNUtl3lP
         /ThNiDIKGRFh26jpAfZXNd7kJyT2sjzPhsShNK/4TujtG7Jhipd2RCNq5vztggFt0jSX
         rt6YFa/xfeod+1LvZ9NKtyREHLOgXnC3wi2V+EjyqA5MEgYJFg9H6GIZm3RNpH0ak1Ck
         F5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q0bjQEkxGonB21AHtKl/d7V91XCD8lCBxRLvpB5sJik=;
        b=d+tBsekDBzAHecqUdD2jrw8QOP0jBTHKTGYJvra8RbHcQ+yzm18i5MzjPktNw6lWtW
         XGYs2QL35Ikkt7MqZkdq0hYxTDWP9nwc7+sMMz/eT7dMDO4xHil8nQe+GqzkY5MYlOOW
         ehimfUbbIRoa94pkQ5vYahCAylmSMkZsdcLR7ktSj8m0nZAEOpn7MiEEpCv24vdkORRE
         GdM+F8J9wEZ3i288bu80MSIbcaBz2ziwjNnE0amhyp3aapOroal4r/8ptz/CudbOaAE5
         tZxSUXpT9peGNUtvYHgVBr8hlzvmEq3pYNSfA2yk1HL6nickWL/Xqr6rp2Yhzt5/NTBF
         jSrg==
X-Gm-Message-State: APjAAAWNPx/PeO0+743jiXvjkag0DLx8Eo4aVlEhv/TyBoLqROnE1Ldm
        AqIcFcwRTaTLb1AF04y708Q=
X-Google-Smtp-Source: APXvYqwNa/+84nu7HVsB1Taoo13BqPW24RInM1tde1MmS6waGpXVoXWYm2DZXEZo+w+bXuBTLK0CyA==
X-Received: by 2002:a17:902:be0a:: with SMTP id r10mr33577003pls.51.1562075399997;
        Tue, 02 Jul 2019 06:49:59 -0700 (PDT)
Received: from localhost.localdomain ([125.142.23.13])
        by smtp.gmail.com with ESMTPSA id b6sm14312137pgd.5.2019.07.02.06.49.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 06:49:59 -0700 (PDT)
Date:   Tue, 2 Jul 2019 22:49:54 +0900
From:   Suwan Kim <suwan.kim027@gmail.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        shuah <shuah@kernel.org>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Message-ID: <20190702134952.GA2414@localhost.localdomain>
References: <20190613171112.GA22155@lst.de>
 <Pine.LNX.4.44L0.1906131317210.1307-100000@iolanthe.rowland.org>
 <OSBPR01MB359051D6F83101432E0F2549D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20190617062222.GA5069@lst.de>
 <TYAPR01MB454412603157D6DDCB512092D8F80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB454412603157D6DDCB512092D8F80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jul 02, 2019 at 10:07:42AM +0000, Yoshihiro Shimoda wrote:
> Hi Alan, shuah, Suwan,
> 
> > From: Christoph Hellwig, Sent: Monday, June 17, 2019 3:22 PM
> > 
> > On Mon, Jun 17, 2019 at 04:17:43AM +0000, Yoshihiro Shimoda wrote:
> > > Thank you for the comments. So, should I wait for getting rid of the
> > > virt_boundary_mask stuff? If I revise the commit log of this patch,
> > > is it acceptable for v5.2-stable as a workaround? In other words,
> > > I worry about this issue exists on v5.2-stable.
> > 
> > It does exist on 5.2-stable and we should fix it.  I'll plan to resend
> > my series to fix the virt_boundary issues for the other SCSI driver
> > soon, but we'll still need to sort out usb-storage.
> 
> I guess that getting rid of the virt_boundary_mask stuff [1] needs more time.
> So, for v5.2-stable, would you accept my patch as a workaround?
> JFYI, v5.2-rc7 still has this "swiotlb buffer is full" issue.

Hi, Yoshihiro,

I have been implementing v2 of this patch according to Alan's comment
(allocate small buffers and urbs instead of one big buffer) and it
takes some time. The implementation is almost done but I think it
will take a few days or more because of the test and bug fix...

Regards

Suwan Kim
