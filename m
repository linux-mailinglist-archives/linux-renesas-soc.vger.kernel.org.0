Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D82C3AB4E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 15:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbhFQNjZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 09:39:25 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9734 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229783AbhFQNjW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 09:39:22 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HDWfPY017410;
        Thu, 17 Jun 2021 13:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=wOAZfmxwvAU17RcmxvnbgoNtCzxQoUAA1g23nXuQbdQ=;
 b=VW/XuZdjJ+wUbzv7t6lGP618PvyoiCvdzIY29KEfCsqBbAAcAv5yEO6MhV6aglDwjg34
 by0T3zK9GMU+4Wq43mjWRx6eykhbTKEKnAGVNmfQIyM+B1rZmdHMKRkDdXFzBUUW4cDY
 M1bK6UWSZBlSGTgdGtIRN6Ku5ZKgXx/rR/2byZmkryJmxdNmw2ltNzMnP/gMDbv9o83C
 1GZ4vfDOUwAqCRIHGyKxc8gxCMOieu48BOgKY0bcroqJDBdjHLBLzRVT0Ws/jJCKLpaF
 Af1lr8prIttf7eNHxQy4WJWhw1Fgz5Mp/F/Sqs7wy9kgA2KV6jdhGnam1WDzEBBG5c5g Aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 396tr0vjxj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:37:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HDVCAl148920;
        Thu, 17 Jun 2021 13:37:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 396wavk69e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:37:10 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HDW7tG154125;
        Thu, 17 Jun 2021 13:37:09 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 396wavk68t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:37:09 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15HDb8Fd002111;
        Thu, 17 Jun 2021 13:37:08 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Jun 2021 06:37:07 -0700
Date:   Thu, 17 Jun 2021 16:37:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     prabhakar.mahadev-lad.rj@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [bug report] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
Message-ID: <YMtP/QHWljGcv3JX@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: hLdgYerU2VtM8Jy0dx6fLE1F5stWDmcK
X-Proofpoint-ORIG-GUID: hLdgYerU2VtM8Jy0dx6fLE1F5stWDmcK
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Lad Prabhakar,

The patch ef3c613ccd68: "clk: renesas: Add CPG core wrapper for
RZ/G2L SoC" from Jun 9, 2021, leads to the following static checker
warning:

	drivers/clk/renesas/renesas-rzg2l-cpg.c:226 rzg2l_cpg_clk_src_twocell_get()
	warn: array off by one? 'priv->clks[clkidx]'

drivers/clk/renesas/renesas-rzg2l-cpg.c
   209  static struct clk
   210  *rzg2l_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
   211                                 void *data)
   212  {
   213          unsigned int clkidx = clkspec->args[1];
   214          struct rzg2l_cpg_priv *priv = data;
   215          struct device *dev = priv->dev;
   216          const char *type;
   217          struct clk *clk;
   218  
   219          switch (clkspec->args[0]) {
   220          case CPG_CORE:
   221                  type = "core";
   222                  if (clkidx > priv->last_dt_core_clk) {

The ->last_dt_core_clk value comes from the device tree and I hate that
we have to trust it.  I haven't looked at the device tree and I only
look at the code but based on the name "last_", I assume that
in the device tree data this is set to either:

	last_dt_core_clk = priv->num_core_clks + priv->num_mod_clks - 1;

Or maybe it's set so that:

	last_dt_core_clk = priv->num_core_clks - 1;

So I think that it is not off by one (based on the naming scheme).  But
I would prefer that this code just used:

	if (clkidx >= priv->num_core_clks)

Or:
	if (clkidx >= priv->num_core_clks + priv->num_mod_clks)

   223                          dev_err(dev, "Invalid %s clock index %u\n", type, clkidx);
   224                          return ERR_PTR(-EINVAL);
   225                  }
   226                  clk = priv->clks[clkidx];
   227                  break;
   228  
   229          case CPG_MOD:
   230                  type = "module";
   231                  if (clkidx > priv->num_mod_clks) {
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^

Smatch did not catch it, but this condition is definitely off by one. ;)

   232                          dev_err(dev, "Invalid %s clock index %u\n", type,
   233                                  clkidx);
   234                          return ERR_PTR(-EINVAL);
   235                  }
   236                  clk = priv->clks[priv->num_core_clks + clkidx];
   237                  break;
   238  
   239          default:
   240                  dev_err(dev, "Invalid CPG clock type %u\n", clkspec->args[0]);
   241                  return ERR_PTR(-EINVAL);
   242          }
   243  
   244          if (IS_ERR(clk))
   245                  dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
   246                          PTR_ERR(clk));
   247          else
   248                  dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
   249                          clkspec->args[0], clkspec->args[1], clk,
   250                          clk_get_rate(clk));
   251          return clk;
   252  }

regards,
dan carpenter
