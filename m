Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A6E3AB644
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 16:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbhFQOph (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 10:45:37 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27644 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230137AbhFQOpf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 10:45:35 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HEbqKL002390;
        Thu, 17 Jun 2021 14:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=wAcbJnx1x71iJuQU0HLdHw5W4AppwtpoquFw06EnwxU=;
 b=zbDAjfQB3l7kmFRZOmC8FL1pNvUnEQX7AdCnFnUermBedr1x/6pS8D8vzmBi0W233tRC
 xXNs/W669HKVWn3Nb+hE08cnvXzZ1xU7R1EiFNAPaytMGnGy180BsQtE58S2b/Zkv4m/
 f4sXSaC5lzZNYrDBNa1BzzeWMt6Od6GuxxOv9Z9lha2KeRxeGs55r3TWVJL0UsDpOXE+
 Rj6T0Xo/ZrqVNAYR7f/0iOD4my1kzqLV9BBheX4mvw5JJD4NUudMD+llcv09EmG3sc+T
 IVMqm4w8pj+A41X2t7tFY/bg7ualNY36FeMWVIm/K+z4Z7kmMyC6CLOfv6MT3ZX90aCO Yw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 397w1y18af-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:43:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HEataO074970;
        Thu, 17 Jun 2021 14:43:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 396waq7w4u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:43:21 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HEhKh8093902;
        Thu, 17 Jun 2021 14:43:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 396waq7w3w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:43:20 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15HEhIbd021506;
        Thu, 17 Jun 2021 14:43:18 GMT
Received: from kadam (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Jun 2021 07:43:18 -0700
Date:   Thu, 17 Jun 2021 17:43:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [bug report] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
Message-ID: <20210617144312.GQ1901@kadam>
References: <YMtP/QHWljGcv3JX@mwanda>
 <OSZPR01MB7019B7DD71AB6E3FE04AE51CAA0E9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSZPR01MB7019B7DD71AB6E3FE04AE51CAA0E9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: gP1pfO13Ph73QMGN-QIQbzFTxgzQxInJ
X-Proofpoint-GUID: gP1pfO13Ph73QMGN-QIQbzFTxgzQxInJ
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 17, 2021 at 02:14:06PM +0000, Prabhakar Mahadev Lad wrote:
> >    223                          dev_err(dev, "Invalid %s clock index %u\n", type, clkidx);
> >    224                          return ERR_PTR(-EINVAL);
> >    225                  }
> >    226                  clk = priv->clks[clkidx];
> >    227                  break;
> >    228
> >    229          case CPG_MOD:
> >    230                  type = "module";
> >    231                  if (clkidx > priv->num_mod_clks) {
> >                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > Smatch did not catch it, but this condition is definitely off by one. ;)
> > 
> Good catch this definitely needs to be if (clkidx > (priv->num_mod_clks - 1)

The size - 1 format is riskier because there is a potential for
underflow.

Imagine that in the future priv->num_mod_clks is zero.
"priv->num_mod_clks - 1" is now UINT_MAX and any value of "clkidx" is
accepted.  In this case, you know that the value of num_mod_clks if 57
but it took me some time to figure that out and ensure that it couldn't
be zero.

regards,
dan carpenter


