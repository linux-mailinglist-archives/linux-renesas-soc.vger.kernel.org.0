Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A9552AB66
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 21:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352471AbiEQTCU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 15:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352468AbiEQTCT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 15:02:19 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082514ECC3;
        Tue, 17 May 2022 12:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652814138; x=1684350138;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yEaVc81MOy5X/kSae+wqdeMCXD3tlK4JBj7Cvx13aao=;
  b=mAd/cy7SAub2WAV4rVmhEIgzA2RRV9sc3SAG/JsDbgnS0S/vCMQyETPc
   0bunqRd2Gls04iZ9Rhg35B/zZenf0qTyb9AjoSm6t/CS1kBskHBxFtZ4v
   W9C9dQnBzSn9dAdE6fxzitLw9YdhEfjpCHh+Jh24122ywaJTIErcMAvvk
   sQTanp1uQJy7/qmwexdG/Vpx+PT0WoS7rBDEOwSf/GbGyP6XVqkI7w2AK
   /dFpBNn1AqWWLCFQ0Dd7aYjcIt4LND6pF4uGH4YGG0JSzdxgL3Kmlv1Ml
   bYEjhqsMVovpB/A+vsrE4nnSZrG2N10qL4dZXTSnIfcfQWwVaedFXOWTh
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="253338949"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="253338949"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 12:02:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="605496002"
Received: from abhuwalk-mobl1.amr.corp.intel.com (HELO spandruv-desk1.amr.corp.intel.com) ([10.212.246.60])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 12:02:16 -0700
Message-ID: <afcc7b08ebe2578d32e6595d258afeec3e73512e.camel@linux.intel.com>
Subject: Re: [PATCH v2 01/14] thermal/core: Change thermal_zone_ops to
 thermal_sensor_ops
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linexp.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Alexandre Bailon <abailon@baylibre.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
        Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Ido Schimmel <idosch@nvidia.com>,
        Petr Machata <petrm@nvidia.com>,
        Luca Coelho <luciano.coelho@intel.com>,
        Kalle Valo <kvalo@kernel.org>, Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Chuansheng Liu <chuansheng.liu@intel.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antoine Tenart <atenart@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:ACPI THERMAL DRIVER" <linux-acpi@vger.kernel.org>,
        "open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>,
        "open list:INTEL WIRELESS WIFI LINK (iwlwifi)" 
        <linux-wireless@vger.kernel.org>,
        "open list:ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER" 
        <platform-driver-x86@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:RENESAS R-CAR THERMAL DRIVERS" 
        <linux-renesas-soc@vger.kernel.org>
Date:   Tue, 17 May 2022 12:02:13 -0700
In-Reply-To: <CAJZ5v0hqN-zKZvWTNPzW2P22Dirmyh99qyycf+US4Z9Yxw9mhA@mail.gmail.com>
References: <20220507125443.2766939-1-daniel.lezcano@linexp.org>
         <20220507125443.2766939-2-daniel.lezcano@linexp.org>
         <CAJZ5v0ik_JQ4Awtw7iR68W4-9ZL8FRDsDd-kWmL-n09fgg3reg@mail.gmail.com>
         <7b1a9f3b5b5087f47bf4839858c7bfebdb60aa2f.camel@linux.intel.com>
         <CAJZ5v0hqN-zKZvWTNPzW2P22Dirmyh99qyycf+US4Z9Yxw9mhA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 2022-05-17 at 20:53 +0200, Rafael J. Wysocki wrote:
> On Tue, May 17, 2022 at 6:51 PM srinivas pandruvada
> <srinivas.pandruvada@linux.intel.com> wrote:
> > 
> > On Tue, 2022-05-17 at 17:42 +0200, Rafael J. Wysocki wrote:
> > > On Sat, May 7, 2022 at 2:55 PM Daniel Lezcano
> > > <daniel.lezcano@linexp.org> wrote:
> > > > 
> > > > A thermal zone is software abstraction of a sensor associated
> > > > with
> > > > properties and cooling devices if any.
> > > > 
> > > > The fact that we have thermal_zone and thermal_zone_ops mixed
> > > > is
> > > > confusing and does not clearly identify the different
> > > > components
> > > > entering in the thermal management process. A thermal zone
> > > > appears
> > > > to
> > > > be a sensor while it is not.
> > > 
> > > Well, the majority of the operations in thermal_zone_ops don't
> > > apply
> > > to thermal sensors.  For example, ->set_trips(), -
> > > >get_trip_type(),
> > > ->get_trip_temp().
> > > 
> > In past we discussed adding thermal sensor sysfs with threshold to
> > notify temperature.
> > 
> > So sensor can have set/get_threshold() functions instead of the
> > set/get_trip for zones.
> > 
> > Like we have /sys/class/thermal_zone* we can have
> > /sys/class/thermal_sensor*.
> 
> Exactly, so renaming thermal_zone_ops as thermal_sensor_ops isn't
> quite helpful in this respect.
> 
> IMO there should be operations for sensors and there should be
> operations for thermal zones and those two sets of operations should
> be different.
> 
> > Thermal sensor(s) are bound to  thermal zones.
> 
> So I think that this binding should be analogous to the binding
> between thermal zones and cooling devices.
> 
> > This can also include multiple sensors in a zone and can create a
> > virtual sensor also.
> 
> It can.
> 
> However, what's the difference between a thermal zone with multiple
> sensors and a thermal zone with one virtual sensor being an aggregate
> of multiple physical sensors?
> 
Either way is fine. A thermal sensor can be aggregate of other sensors.

> Both involve some type of aggregation of temperature values measured
> by the physical sensors.
> 
> > > > In order to set the scene for multiple thermal sensors
> > > > aggregated
> > > > into
> > > > a single thermal zone. Rename the thermal_zone_ops to
> > > > thermal_sensor_ops, that will appear clearyl the thermal zone
> > > > is
> > > > not a
> > > > sensor but an abstraction of one [or multiple] sensor(s).
> > > 
> > > So I'm not convinced that the renaming mentioned above is
> > > particularly
> > > clean either.
> > > 
> > > IMV the way to go would be to split the thermal sensor
> > > operations,
> > > like ->get_temp(), out of thermal_zone_ops.
> > > 
> > > But then it is not clear what a thermal zone with multiple
> > > sensors in
> > > it really means.  I guess it would require an aggregation
> > > function to
> > > combine the thermal sensors in it that would produce an effective
> > > temperature to check against the trip points.
> > > 
> > > Honestly, I don't think that setting a separate set of trips for
> > > each
> > > sensor in a thermal zone would make a lot of sense.
> > 

