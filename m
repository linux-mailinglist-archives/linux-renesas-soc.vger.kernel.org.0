Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3B73AB32E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 14:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbhFQMEk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 08:04:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48592 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232649AbhFQMEk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 08:04:40 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HBknCE023494;
        Thu, 17 Jun 2021 12:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=G2ejst0Dpj4OYIJEbsbz85eGjNbP5dzBBiXAVvpiMJQ=;
 b=zkczuNZjESxL5DPGFG4PONzCOPK6P14i1xdkAPPr5A9hMh1W0JuShmJRkbl4Jqb31qOR
 7kc6p05YRKvNAFM2UTe6XiRhZRyTgJcj19Mvf+gF3egeDgKLj7X7BFz3ozTE9rbSFwWO
 dOZJeq6HwL5JzymBmO7zxCXTKA4v/B1eLBJWZ7bW7+wFxxL9636/xlWVdE/rgl8a6o1p
 vxpt5BczO09Ij2YxID/gRb7/99KHcENOyYLAY7cYYQEsZtjo4q5aOjm99sm/Pbm81Vag
 JoqXPVsaiV9aOLprT913jM8nVoLoO3S8OQP4tosWoGhuhXaCV9NiMOAVbmZxu0vZgeJX AA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 397mpthnv3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 12:02:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HBis9e039136;
        Thu, 17 Jun 2021 12:02:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 396waq3e6p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 12:02:28 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HBtKBa059834;
        Thu, 17 Jun 2021 12:02:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 396waq3e64-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 12:02:27 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15HC2QZO018366;
        Thu, 17 Jun 2021 12:02:26 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Jun 2021 12:02:25 +0000
Date:   Thu, 17 Jun 2021 15:02:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     prabhakar.mahadev-lad.rj@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [bug report] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
Message-ID: <YMs5yy57Jl7iRTo+@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: dCMkN2GAxaEB06WN1FENgVf6znur28Mk
X-Proofpoint-ORIG-GUID: dCMkN2GAxaEB06WN1FENgVf6znur28Mk
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Lad Prabhakar,

The patch ef3c613ccd68: "clk: renesas: Add CPG core wrapper for
RZ/G2L SoC" from Jun 9, 2021, leads to the following static checker
warning:

	drivers/clk/renesas/renesas-rzg2l-cpg.c:204 rzg2l_cpg_pll_clk_register()
	warn: passing devm_ allocated variable to kfree. 'pll_clk'

drivers/clk/renesas/renesas-rzg2l-cpg.c
   166  static struct clk * __init
   167  rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
   168                             struct clk **clks,
   169                             void __iomem *base,
   170                             struct rzg2l_cpg_priv *priv)
   171  {
   172          struct device *dev = priv->dev;
   173          const struct clk *parent;
   174          struct clk_init_data init;
   175          const char *parent_name;
   176          struct pll_clk *pll_clk;
   177          struct clk *clk;
   178  
   179          parent = clks[core->parent & 0xffff];
   180          if (IS_ERR(parent))
   181                  return ERR_CAST(parent);
   182  
   183          pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
   184          if (!pll_clk) {
   185                  clk = ERR_PTR(-ENOMEM);
   186                  return NULL;

Obviously, "return PTR_ERR(-ENOMEM); is intended.  But I looked at the
caller and it has a check for NULL as a kind of work around for this
bug.

When a function returns only NULL and valid pointers, the NULL is an
error.  But when a function returns *BOTH* NULL and error pointers the
NULL means that the feature is deliberately disabled by the user.  It's
not an error.  The caller should not print an error, but instead the
code needs to have NULL checks to avoid the NULL dereference.

For example, maybe the user has disabled blinking lights.

	lights = get_blinking_lights();

If get_blinking_lights() fails then we print an error message and return
to the user.  We don't try to continue.  The user can fix their problem
and try again.

But if the get_blinking_lights() returns NULL that means we have to add
NULL checks:

	if (lights)
		lights->blink();

   187          }
   188  
   189          parent_name = __clk_get_name(parent);
   190          init.name = core->name;
   191          init.ops = &rzg2l_cpg_pll_ops;
   192          init.flags = 0;
   193          init.parent_names = &parent_name;
   194          init.num_parents = 1;
   195  
   196          pll_clk->hw.init = &init;
   197          pll_clk->conf = core->conf;
   198          pll_clk->base = base;
   199          pll_clk->priv = priv;
   200          pll_clk->type = core->type;
   201  
   202          clk = clk_register(NULL, &pll_clk->hw);
   203          if (IS_ERR(clk))
   204                  kfree(pll_clk);

Delete this line.

   205  
   206          return clk;
   207  }

regards,
dan carpenter
