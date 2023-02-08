Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7518768EC74
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Feb 2023 11:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjBHKMJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Feb 2023 05:12:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbjBHKMH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 05:12:07 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09C82F785
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Feb 2023 02:12:06 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id m1so7468222ejx.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Feb 2023 02:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWXzFIt6S14ZPdmfvxQubu9GKMh6riqkpn+hGlzUfnA=;
        b=CfgtjZaFzlVGG7XYDI1RhpDsisN1mtIOgPhertoQRtWyZmwAvK/2HSiKvgbmsAhpD7
         ToCI9ZgmbpctpEhB7AbpV2mWyA9hY88i3shWuItcgiwHRmxeZ1G/brtvCJJfgJNplTZR
         RuYJ9zqVklu7C96+S5vJVz2XxV439+wDJr3897Ew3xXB/avsbFyVb9/CqJFFPlwfG7ZK
         uOPuzoahv/fZnmtXiGnoqALGI52bvrPufQYxoyUpBj29jo+Z704YGyAaeQbWsmRev5FB
         S9lWqnB4N5dgtYSoB358HF2mdE2HLcGPrJVS4eoIBuvXjnPdW6PYkBL+Te1QLFJt649N
         UrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mWXzFIt6S14ZPdmfvxQubu9GKMh6riqkpn+hGlzUfnA=;
        b=kYoNnZHSAglkWLPLwrAY9pJmqrBPPXmiGgJfOCbefNY5doNpgDiUMEjc2CNtztVQmA
         jtrDZX0mcTeu+uvo4P/bbn+5VV0sUr0BIvXqxiiRpc+8O3d8WdrRgKHn47uxLPcL9dl1
         s7rdwivVfZnVpSen8uDj6zCWymOALTlwyeE0CqxJt4D5DRKISyFT0UahZZxqvuwG+fIK
         UijgEBdMVwCqk9fWlITkD4oynCd6ooZnNrHPk/Wmh31zo9vwD1z8J/oibCcaSO/wwtND
         qlHY2N685ZHKX8t9rXPckbgCLxySQtsFcf0YGJ3Tuh2qXgOKWkn6cEK8SwoDloQ+U1YX
         vDfg==
X-Gm-Message-State: AO0yUKUm99OyW1E+U0U3++i87Aqh4w53ioHUOrzaIXfXaDBDW4OM/JBT
        V78MF5hXQWsU7PV73cn2gBIJTQ==
X-Google-Smtp-Source: AK7set8kcwqDhrRNDTIQLhGVK//VRViX0jyOmyA4oRifjAQj4mDQf9ILIK/ix2fFhsvkackKlbg2fw==
X-Received: by 2002:a17:906:48da:b0:88d:ba89:1854 with SMTP id d26-20020a17090648da00b0088dba891854mr2241634ejt.37.1675851125377;
        Wed, 08 Feb 2023 02:12:05 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id ks14-20020a170906f84e00b008a5cbd8f7d1sm3437364ejb.127.2023.02.08.02.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:12:04 -0800 (PST)
Date:   Wed, 8 Feb 2023 11:12:04 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Wolfram Sang <wsa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] drivers/thermal/rcar_gen3_thermal: Fix device
 initialization
Message-ID: <Y+N1dDVKqUTnHLQj@oden.dyn.berto.se>
References: <20230207171011.1596127-1-niklas.soderlund+renesas@ragnatech.se>
 <20230207171011.1596127-3-niklas.soderlund+renesas@ragnatech.se>
 <Y+NWKZuQm6uLMkTD@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+NWKZuQm6uLMkTD@ninjato>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your review.

On 2023-02-08 08:58:33 +0100, Wolfram Sang wrote:
> On Tue, Feb 07, 2023 at 06:10:11PM +0100, Niklas S�derlund wrote:
> > The thermal zone is registered before the device is register and the
> > thermal coefficients are calculated, providing a window for very
> > incorrect readings.
> 
> While I could never actually be in this race window, the patch makes a
> lot of sense to me.
> 
> > The reason why the zone was register before the device was fully
> > initialized was that the presence of the set_trips() callback is used to
> > determine if the driver supports interrupt or not, as it is not defined
> > if the device is incapable of interrupts.
> > 
> > Fix this by using the operations structure in the private data instead
> > of the zone to determine if interrupts are available or not, and
> > initialize the device before registering the zone.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> One minor question:
> 
> > -		if (status)
> > +		if (status && priv->tscs[i]->zone)
> >  			thermal_zone_device_update(priv->tscs[i]->zone,
> >  						   THERMAL_EVENT_UNSPECIFIED);
> 
> Isn't this a seperate change?

Not really.

This patch changes the driver to enable interrupts just before the zone 
is created. So this just guards from the very small window where an 
interrupt could be fired and the zone is created, which if it would 
happen would cause a null pointer dereference.

While not updating a not yet created zone is fine. But this should never 
happen (tm) as the trip points have not been set when this window 
exists, but better safe then sorry.

-- 
Kind Regards,
Niklas S�derlund
