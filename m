Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E59C517B0B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2020 22:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgCEVdb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Mar 2020 16:33:31 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:40789 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgCEVdb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Mar 2020 16:33:31 -0500
Received: by mail-qk1-f195.google.com with SMTP id m2so333954qka.7;
        Thu, 05 Mar 2020 13:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1hqcOTK1dJgrJ1iFfuQIBp15f05oDajZgVRCIxl8Yg8=;
        b=GEmwi5CDQU3MHJdmzPep2GKKvpnZFemhz1UkqVBBcUhyksSiZzGc1vmCEtFeiH2mCZ
         Xbw4nfcQTQBId+JXSuvcMRczWyYKbMZLbylRBnBURWtETfoFlTr0PYGN5T210DuvXP/4
         vedNJEecGMHvUOW+hzytnQbpcg6j/BpFtazBbVn1iRs7ZzRzK5BctNwlJ9HT3otAwlUA
         l0F0b5px7Y+3lIzVBhApigPAMSSMMaYqnfn2tGSaafKeNjnQ8E9PTkDGxC2LeAJhehoB
         +oEkzpRfBrDlp5aHp/82611z8uGLW10kUTg3EzsRYafhbB9kvSch/JhT4TgeOeUuhX4f
         wJxA==
X-Gm-Message-State: ANhLgQ11V4rsC+UIu/YnxxRUTziq+4g3neiHkUDugKQxkrLFyWD67MvT
        Q5bRLm4RGCf5pvd+cu5Mh6b7eSMmLMIZ+A==
X-Google-Smtp-Source: ADFU+vsyXjn1vZXA8f6HdMoYTygQMmO8graEQEtQbxVme3Ctqcasz4Ib4j/OXMG/TgEudCyljFw6AQ==
X-Received: by 2002:a37:f518:: with SMTP id l24mr21381qkk.441.1583444010072;
        Thu, 05 Mar 2020 13:33:30 -0800 (PST)
Received: from dennisz-mbp.dhcp.thefacebook.com ([2620:10d:c091:500::b9df])
        by smtp.gmail.com with ESMTPSA id r40sm756817qtc.39.2020.03.05.13.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 13:33:29 -0800 (PST)
Date:   Thu, 5 Mar 2020 16:33:27 -0500
From:   Dennis Zhou <dennis@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Dennis Zhou <dennis@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] include/bitmap.h: add new functions to documentation
Message-ID: <20200305213327.GA79880@dennisz-mbp.dhcp.thefacebook.com>
References: <20200304140920.6109-1-wsa+renesas@sang-engineering.com>
 <20200304140920.6109-3-wsa+renesas@sang-engineering.com>
 <20200304204026.GA55400@dennisz-mbp>
 <20200305082415.GA1079@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305082415.GA1079@ninjato>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 05, 2020 at 09:24:15AM +0100, Wolfram Sang wrote:
> 
> > > I found these functions only by chance although I was looking exactly
> > > for something like them. So, add them to the list of functions to make
> > > them more visible.
> > > 
> > > Fixes: e837dfde15a4 ("bitmap: genericize percpu bitmap region iterators")
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Cc: Dennis Zhou <dennis@kernel.org>
> > 
> > Ah thanks. That was a miss not adding the documentation. I can pick
> > these up unless Andrew would rather run them through his tree. I have a
> > few other miscellaneous documentation cleanups for percpu I need to run
> > anyway.
> 
> That sounds like a good fit to me. Will you take both of the patches?
> 
> Thanks,
> 
>    Wolfram
> 

I've picked up both in percpu for-5.7.

Thanks,
Dennis
