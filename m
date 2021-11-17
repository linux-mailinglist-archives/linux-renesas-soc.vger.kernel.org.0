Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36673454845
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 15:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238253AbhKQOPe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 09:15:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbhKQOPd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 09:15:33 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0E4C061570
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Nov 2021 06:12:35 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id c32so9216236lfv.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Nov 2021 06:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=C4YGUlwLG0vxNxoZ/6cOQQ7ZWbyq9pizYdfLXLgdeRk=;
        b=qrgf6bLbL7VSwbVKRe6ju6RbJDSKYwCWYDpej5EJkCBNCrs6MWvmz8WVeP/QHL1kW1
         poj1cPhJVBBR3prAi79IkPxf5bry+1A+XMQp4DUIgJoaDI5+0IzsdrAH/F/wh9Insvyj
         MQ+rTRYFQHCUKFJUH/qABcG7r1LRcxRu8wYKY8GUxlO4wy/NrU4iGzSylOOqpplkn4mR
         qDjunyty8jaALh25zdSuuTgIjsI1DoUn1LTop82f6+r7l99KczncZSfDIlOIyX4XetyD
         +gxohessDHmk6RPN0Dl4m71PsRuGq5aKxk/OlGaVSaL2KtTF5QtsiHWc98Iyl5CPkdV1
         9DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=C4YGUlwLG0vxNxoZ/6cOQQ7ZWbyq9pizYdfLXLgdeRk=;
        b=U92hb32gkdAMF9Gj+/J3m6GTZ6z1jWj3Su8HSL1kEqle1TvORporpwQL4VMoyGUbVY
         DqXpwuqYH/DA6pY7xUm+6krUUYFTdChmO/hSUXlkh1+bHdHn/rVLxa1avBEelfLOvLpo
         R+o6AxBjJSs67ABPdhEaJI9BuL4rwFYTtoe3s8avQlwydAKdzQ2yw6/pqdtwFyqGZZ9t
         rBpcVWsVFf8zq12Yj56bgpPXSwNUz5vG1E/VQ/aZDjIRo7T38l221DrTHab8nQYjT7Bi
         nF2Fx2mIjsFQ61IRyH+0bBI2u8zUQI6brcXYcI3eo7ofzspKhZ9gC7EbLQxh+8ZRNfBt
         9B8g==
X-Gm-Message-State: AOAM531EdpI/o9/THtWDOtduibyxKzUkznD6AM8YQOpdpWUleHv8N4Ki
        7oocH3k9nXQbeVM9Jl802foEGQ==
X-Google-Smtp-Source: ABdhPJyxYPnr9d1y5Jj1gQLSHzWmQxLpFtRkNMQNSQ9Ls0anrVIMDIgNh8p4xQKuDGetpFBqNO8amQ==
X-Received: by 2002:ac2:5f0d:: with SMTP id 13mr16129210lfq.334.1637158353404;
        Wed, 17 Nov 2021 06:12:33 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id j2sm2138029lfr.109.2021.11.17.06.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:12:33 -0800 (PST)
Date:   Wed, 17 Nov 2021 15:12:32 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/5] thermal/drivers: Add TSU driver for RZ/G2L
Message-ID: <YZUN0L/emoeCLQnW@oden.dyn.berto.se>
References: <20211116151750.24857-1-biju.das.jz@bp.renesas.com>
 <20211116151750.24857-4-biju.das.jz@bp.renesas.com>
 <YZTAEIv2AcURBA1Q@oden.dyn.berto.se>
 <OS0PR01MB5922E694037C0A488BF6F5D3869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS0PR01MB5922E694037C0A488BF6F5D3869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On 2021-11-17 08:55:15 +0000, Biju Das wrote:
> Another separate question, I have in my mind is how do we test trip 
> points
> for negative temperature? 

I think this is two different questions.

> This TSU doesn't have any interrupts and
> we need to use polling, The range is -40 to 125 degrees.

For tripping a trip-point polling or interrupt works. The only 
difference is in the worst case polling will detect that i past the 
trop-point <pollig-delay> later. For testing triggering of trippoints 
(high or low) I don't think we need to care about this.

To actually test it we have two options.

1. Put the SoC in a good freezer and, alternately open an office branch 
   in the arctics :-)

2. Use the thermal emulation framework.

    echo $temprature_in_mcelcius > /sys/class/thermal/$zone/emul_temp

  If the temperature set using this is above/below a trippoint the 
  associated action will happen. A good demo of this is to try on Gen3 
  where you can observe the cooling device state changes as the 
  different trip points are triggerd in:

      /sys/class/thermal/$cool/cur_state

  And of course if you set a temperature that trips the critical point 
  the system will shutdown.

> If it goes below -40, I guess we need to shutdown the system.
> On device tree we normally specify only positive temperature.
> How do we handle this?

I have not tested it but would it not be as simple as adding a second 
critical trippoint at -40 ?

-- 
Kind Regards,
Niklas S�derlund
