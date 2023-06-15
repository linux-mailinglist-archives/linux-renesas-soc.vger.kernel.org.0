Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98DC0731ADA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jun 2023 16:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239937AbjFOOK3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jun 2023 10:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344964AbjFOOKS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2023 10:10:18 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D98171C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jun 2023 07:10:17 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f8d0d684f3so18569135e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jun 2023 07:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686838216; x=1689430216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5NqUkIllwT3TkBrcSjwi5z3iZ8de/LKwW/6oLRtNVgs=;
        b=ktcXoLdMZXUAPxPf0f3riw/AgUMq4Dso789DHdXxxJasu8VvrPNCNrHi0mkxfZY3oM
         H5qKvTf/yOsWkSWksVb/ffI0CcYAmI7yiiiv0JXNEqZq+Kf0M7e5GVIlHnKfD/HUX2lK
         VClCjRMqFvxzSE95e/2OiH2IsRiRLvh7CgVJSrUc3kxxzMd798ZRaE6fpBKYjKnb/5t7
         X4PIpjdPgELOHFLhN6wS8qJIwnD+jRrpRyGqFR7OoVqmf70vHi8j+EGzqVv7RPKyyoBt
         6/1W6bbCtVNzB9LokhHwBrkoK2k7lfutRjetwLbkN2iW3hv0e/xVKG3pe0EHAwo5B9H5
         43nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686838216; x=1689430216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NqUkIllwT3TkBrcSjwi5z3iZ8de/LKwW/6oLRtNVgs=;
        b=YGFxv8Jrrhl5QRLRwTdw3l4xAb3jh788+ylDQ8ayaUNB40a0GeMIn+mfAtDRhAawL6
         pMbZ5WHerzRe1ySb+5cP2Ub5plt04gq2CtWC/bBfc8RLSgNYbDLjOrPxDON4P/GtK0x0
         9RvQwHHh1WdLYnV3GTQj7C/dELf9KNbaa9NdoAmZT5DUTDt4yVudNuEVTvKQvDLQIlIz
         Q7GPj52MtkQHLoa7IzUuDyiCNWfgM6aeVRcG1LdG3CrBrfzSnPFPgjj3VLiMcf3WVgKl
         tHHOYblFYFwSW8hEkhlNe3+vucEreG7H02Ags45+pdhsJ2P2Yv7ZuyRbnOcTJI0rD2gf
         fh5A==
X-Gm-Message-State: AC+VfDzEBLJxEjiH/T9sKa1ORsjIspA4fLfT2WbgXzOnCcns5WRbV0T3
        25USZCJWHH/Axe1Wo4JiD+qwGj/IPeoB/xNXt2c=
X-Google-Smtp-Source: ACHHUZ5sUItV1MTA/1nDflQGWQSnllqRsDjkC/UmZaYRNMmOCWbi/vijMoTXMrojj89maMq0e2GcJw==
X-Received: by 2002:a7b:cd97:0:b0:3f7:678a:cf24 with SMTP id y23-20020a7bcd97000000b003f7678acf24mr12029958wmj.39.1686838215988;
        Thu, 15 Jun 2023 07:10:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t11-20020a7bc3cb000000b003f60eb72cf5sm20780099wmj.2.2023.06.15.07.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:10:14 -0700 (PDT)
Date:   Thu, 15 Jun 2023 17:10:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
Message-ID: <01ca17f6-562c-422a-916b-9b03e71d3d4a@kadam.mountain>
References: <05ac5099-b1f6-4f83-950a-ae02fc47eda1@moroto.mountain>
 <OS0PR01MB59229EB7C14790662AA225F1865BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230615123749.GH741@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615123749.GH741@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 15, 2023 at 03:37:49PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> On Thu, Jun 15, 2023 at 06:22:45AM +0000, Biju Das wrote:
> > Hi Dan Carpenter,
> > 
> > Thanks for the feedback.
> > 
> > + Laurent.
> > 
> > It is already validated in [1]
> > 
> > [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c#L619
> > 
> > So we won't get wrong formats in rzg2l_mipi_dsi_set_display_timing().
> > 
> > Laurent, Please correct me if I am wrong.
> 
> The issue is that static checkers can't know that. You should add a
> default statement to the switch, possibly with a comment to explain why.
> 

Yeah.  Smatch is bad at tracking things which happen in separate system
calls.  I hope eventually to be able to silence this warning in Smatch
but that's still some time away.

I don't have strong feelings that we need to silence every static
checker warning.  Generally the rule of thumb is that we should always
fix the checker instead.

regards,
dan carpenter

