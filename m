Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13F93AB555
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 16:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbhFQOGt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 10:06:49 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:24182 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231379AbhFQOGt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 10:06:49 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HE47SJ030567;
        Thu, 17 Jun 2021 14:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=X122xVqcUXzpyLXHaZ8i9ilxts8FulAU1Z8QQaImU58=;
 b=Xhz6GITz+ynj1RL208H7Bhiu6pn7QhQkg1O+ZDZjW0TUKkm91aiKUbzwcfZEB2KL+gZY
 R04WOkRTx7kx4SDjvWot50eAJwi7ZSJE5i47oNut8VxP49J2ReJnOJYmjBsSRdmzOtbS
 fqvJ5fuBtn382fkZB7xDpXS0iynyoZ0ezDG6x+9YZsfWpU/tMQ/JuEqUbvJh1q10Bprz
 6dTL91KKqpxD3UOyKxXQPFb82FlPNLCPUOOtV42g4ghImUimmxwcKte0h5YCdQ3vNEQi
 Qtdc2EUyMxeO4KE8aPXjpfuMrEVM/Cf4588EjCmWndOty2Kk8cnz6dS4035bU/Lxv3qb /Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 397jnqt7k6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:04:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HE1O4T196154;
        Thu, 17 Jun 2021 14:04:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 396wavmnrq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:04:32 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HE4WND007146;
        Thu, 17 Jun 2021 14:04:32 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 396wavmnr2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:04:32 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15HE4T4O022210;
        Thu, 17 Jun 2021 14:04:30 GMT
Received: from kadam (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Jun 2021 07:04:28 -0700
Date:   Thu, 17 Jun 2021 17:04:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: fix a double free on error
Message-ID: <20210617140421.GP1901@kadam>
References: <YMtQN++uwH41TAg0@mwanda>
 <CAMuHMdUfMSPa2Oh1s+V=QR+XLv2tVYoJt2sjwdNZeobE76AZwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUfMSPa2Oh1s+V=QR+XLv2tVYoJt2sjwdNZeobE76AZwg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: oLEbfcptfZLpCFpU7wnwFYUbXgmm0TY0
X-Proofpoint-ORIG-GUID: oLEbfcptfZLpCFpU7wnwFYUbXgmm0TY0
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 17, 2021 at 03:45:50PM +0200, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Thu, Jun 17, 2021 at 3:38 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > The "clock" pointer is allocated with devm_kzalloc() so freeing it
> > here will lead to a double free.
> >
> > Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks for your patch!
> 
> While the double free is unlikely to happen (the error is not
> propagated upstream, and the driver cannot be unloaded), kernel
> test robot reported two of these errors.  The other one is at line 202.
> Care to fix that as well?

Yeah, sure.  I'll clean up the NULL vs error pointer mixing as well.

regards,
dan carpenter

