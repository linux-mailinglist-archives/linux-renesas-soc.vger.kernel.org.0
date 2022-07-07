Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE26569ED6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jul 2022 11:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbiGGJv1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Jul 2022 05:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234294AbiGGJvZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 05:51:25 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3844D4EA
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Jul 2022 02:51:23 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d12so6857067lfq.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jul 2022 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=P9x03qv6izPBVJUd4KrSCLJsLiwyNQHTTgTk8svslok=;
        b=ngEiif8lOmiWt9Soe0K7DvDq1yz1W7rqrwZKgNzDfe/Q+Voaq9M9w/wWcdtwHynx6g
         PDzOYYs2OG8huiCuuhmAXB9AlHGWe2WGIP23MqeZ3H3mvpJZBZ6KODWfbw3bkw0I1Eoa
         KIiv4XVJTsPmZ3CYEyWOjlKqbnh6vjowlj9J9yEsrFL3okrGHkqBCOFkDc3mf3UCOFKn
         Kj+mQWca0Y8tqlYx8aq2zerXz17hq26OlW57KNP1ZBvxftWE1tYFyckfYd/IESUWyMDJ
         VfniMQZS5MaxSsAWo4MC/HxIclmTstVlTthnjpPrKMkeoCmkPcc5Jt7GeBeYgUu0g1yh
         pqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=P9x03qv6izPBVJUd4KrSCLJsLiwyNQHTTgTk8svslok=;
        b=4tEDIR/97eSv71BLHJYzMgmtPkkpJhFwee2tOVsXbBNt5iO27f6B07QsA7wGx31x6d
         fI3YVcX1ILLVjtuZVYd2Y3dsjzy+GFc0349AI30ull51vYeEreBBlxGWx2iXJHLHTWdp
         psLvt6BfZLMxJjg6ynoyCTxzuvc03V4upxmN84VF5QMOHjzzdrgotsVCt99Sup0kU5gP
         Hr2D7Z4yGdL+B4/ryXyLQzGP43eRu1z8gzfAr7L0culAcwBeh96iP9Jc/uv7Ludl2oUA
         qeD28S8qe5AvE/OEkeNfh0CUntx4VxgswjKNrEpVj26zQMvr6/+ldN1gPjjY96h3Y4Ug
         ZWpw==
X-Gm-Message-State: AJIora+n3em56XtGYJJGpHeRUPoXFmbPFT7Dl0dJ2UY6ha7iZabOSYaS
        yPdyLYvPPPBiNArxsD0DDhwb5A==
X-Google-Smtp-Source: AGRyM1vY0/eV1Q6S7Wf3PC62/AG2iTCEL5lhh1/JLfRMAoJKzUkYkvdfMhsOSEPFz8R6fcxVSALwzA==
X-Received: by 2002:a05:6512:3a8f:b0:486:6ccb:b36a with SMTP id q15-20020a0565123a8f00b004866ccbb36amr4841298lfu.327.1657187482312;
        Thu, 07 Jul 2022 02:51:22 -0700 (PDT)
Received: from localhost (h-46-59-88-103.A463.priv.bahnhof.se. [46.59.88.103])
        by smtp.gmail.com with ESMTPSA id a22-20020a05651c211600b0025a65b784b6sm6684189ljq.33.2022.07.07.02.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 02:51:21 -0700 (PDT)
Date:   Thu, 7 Jul 2022 11:51:21 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] thermal: rcar_gen3_thermal: Add support for
 hardware trip points
Message-ID: <YsasmbJotSd/aIu/@oden.dyn.berto.se>
References: <20210804091818.2196806-1-niklas.soderlund+renesas@ragnatech.se>
 <20210804091818.2196806-2-niklas.soderlund+renesas@ragnatech.se>
 <40b2b8d1-f86c-4788-767c-22e60283e458@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40b2b8d1-f86c-4788-767c-22e60283e458@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

On 2022-07-06 13:13:44 +0200, Daniel Lezcano wrote:
> 
> Hi Niklas,
> 
> 
> On 04/08/2021 11:18, Niklas Söderlund wrote:
> > All supported hardware except V3U is capable of generating interrupts
> > to the CPU when the temperature go below or above a set value. Use this
> > to implement support for the set_trip() feature of the thermal core on
> > supported hardware.
> > 
> > The V3U have its interrupts routed to the ECM module and therefore can
> > not be used to implement set_trip() as the driver can't be made aware of
> > when the interrupt triggers.
> > 
> > Each TSC is capable of tracking up-to three different temperatures while
> > only two are needed to implement the tracking of the thermal window.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v1
> > - Remove the 'have_irq' flag from the OF match data and auto-detect if
> >    interrupts are available using platform_get_irq_optional().
> > - Have a non-static thermal_zone_of_device_ops and clear the .set_trips
> >    if interrupts are unavailable.
> > ---
> 
> [ ... ]
> 
> > @@ -401,8 +492,12 @@ static int __maybe_unused rcar_gen3_thermal_resume(struct device *dev)
> >   	for (i = 0; i < priv->num_tscs; i++) {
> >   		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
> > +		struct thermal_zone_device *zone = tsc->zone;
> >   		priv->thermal_init(tsc);
> > +		if (zone->ops->set_trips)
> > +			rcar_gen3_thermal_set_trips(tsc, zone->prev_low_trip,
> > +						    zone->prev_high_trip);
> >   	}
> 
> While doing a cleanup I lately noticed this change and I've concerns about
> it:
> 
>  - it uses the thermal zone internals
> 
>  - is it really needed ?
> 
> At resume time we have:
> 
> thermal_pm_notify()
>   --> PM_POST_RESTORE
>     --> thermal_zone_device_update()
>       --> thermal_zone_set_trips()
> 
> In addition, I believe this later call is consistent as it sets the trip
> point based on the last temperature update, while the
> rcar_gen3_thermal_resume() does not.
> 
> Was this function added on purpose because some there is an issue when
> resuming the board or just put there assuming it is doing the right thing ?
> 
> I would be happy if we can remove this portion of code because it is the
> only users of prev_*_trip I would like to replace by prev_trip id.


This looks like something that should never have been submitted 
upstream. The usage for this was to restore the trip points in the 
hardware registers *after* the hardware have been initialized. However 
as far as I can tell from the code this is already done by the thermal 
core so no need for the driver to deal with this.

I did a test on a Gen3 board (M3-N) with this code removed and the core 
appears to do the right thing so this code in the driver can be removed.  
Will you write up a patch as part of your cleanup work or would you 
prefer I do it?

-- 
Kind Regards,
Niklas Söderlund
