Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D415275656
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Sep 2020 12:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgIWK2o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Sep 2020 06:28:44 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:58858 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgIWK2n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 06:28:43 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08NAPj3r175201;
        Wed, 23 Sep 2020 10:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=W3kJESmWStoZ1/qcN3kLp6J7+/AYQxW/3+oWR15CPwE=;
 b=klLBic4t3Uy/UQ2s4L4/mJ9dCJUO2CxSz3sgJ50e8/941BZf9SH4KAWDgO4vP3Z8hgxH
 /qAwiYgQQmhWpfVOoi3wrVW4+GOotJQW7I1puH4G5u5ZtG6gNJC/UhNJVu2xCMtuYT1h
 aKsDRgqIdo28SX/nimHv2ejaACCyKq2g96I+7uYA+HolvFaiSyGDS+yC/2nX+KvyxRaB
 NjNGwixahiueaR2PjBtXlniFg2uNZj7dFjVqwJzxqGQBLJERQYyGFztFFfrTinwa6BuN
 TU2zOW36bdCr4S0NCbQP2hLfbFeXMyrCESpN/ttHRhY+X1hLt5TcLTr2nDtNRNDilxNR ag== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 33qcptxj9f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Sep 2020 10:28:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08NAQQrr129678;
        Wed, 23 Sep 2020 10:28:35 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 33nujpe9pk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Sep 2020 10:28:35 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08NASYVk032454;
        Wed, 23 Sep 2020 10:28:34 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 23 Sep 2020 03:28:34 -0700
Date:   Wed, 23 Sep 2020 13:28:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: Fix some leaks in
 rmobile_init_pm_domains()
Message-ID: <20200923102828.GH18329@kadam>
References: <20200923084458.GD1454948@mwanda>
 <CAMuHMdXyM1dUPJ7ZDAk6-cEjaG_bVBfsE=bqdpf7pA0ChdRLVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXyM1dUPJ7ZDAk6-cEjaG_bVBfsE=bqdpf7pA0ChdRLVw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009230082
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 23, 2020 at 11:10:17AM +0200, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Wed, Sep 23, 2020 at 10:47 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > This code needs to call iounmap() on the error paths.
> 
> Thanks for your patch!
> 
> > Fixes: 2ed29e15e4b2 ("ARM: shmobile: R-Mobile: Move pm-rmobile to drivers/soc/renesas/")
> 
> This is not the commit that introduced the issue.

Duh...  I don't know what I was thinking there.

> 
> Fixes: 2173fc7cb681c38b ("ARM: shmobile: R-Mobile: Add DT support for
> PM domains")
> 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> > --- a/drivers/soc/renesas/rmobile-sysc.c
> > +++ b/drivers/soc/renesas/rmobile-sysc.c
> > @@ -328,6 +328,7 @@ static int __init rmobile_init_pm_domains(void)
> >                 pmd = of_get_child_by_name(np, "pm-domains");
> >                 if (!pmd) {
> >                         pr_warn("%pOF lacks pm-domains node\n", np);
> > +                       iounmap(base);
> 
> This one I can agree with, although that case is a bug in the DTS.
> 
> >                         continue;
> >                 }
> >
> > @@ -341,6 +342,7 @@ static int __init rmobile_init_pm_domains(void)
> >                 of_node_put(pmd);
> >                 if (ret) {
> >                         of_node_put(np);
> > +                       iounmap(base);
> 
> This one I cannot: in the (unlikely, only if OOM) case
> rmobile_add_pm_domains() returns an error, one or more PM subdomains may
> have been registered already.  Hence if you call iounmap() here, the
> code will try to access unmapped registers later, leading to a crash.
> 

It's actually impossible for this rmobile_add_pm_domains() to fail on
current kernels because small allocations never fail...

I'll send a v2.  This is for a new static checker test that I added to
Smatch so I'm just sending a few of these out every day to collect
feedback for now.  So thanks for reviewing this, it's very helpful.

regards,
dan carpenter

