Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035381F3E1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 16:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbgFIOaN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 10:30:13 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:44818 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgFIOaM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 10:30:12 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 737B73C0579;
        Tue,  9 Jun 2020 16:30:09 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KG_Oi9lxvAa8; Tue,  9 Jun 2020 16:30:04 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 6D0653C00BB;
        Tue,  9 Jun 2020 16:30:04 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.5) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 9 Jun 2020
 16:30:03 +0200
Date:   Tue, 9 Jun 2020 16:29:59 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Jacopo Mondi <jacopo@jmondi.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        <kieran.bingham+renesas@ideasonboard.com>, <geert@linux-m68k.org>,
        <horms@verge.net.au>, <uli+renesas@fpond.eu>,
        <VenkataRajesh.Kalakodima@in.bosch.com>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <koji.matsuoka.xm@renesas.com>,
        <muroya@ksk.co.jp>, <Harsha.ManjulaMallikarjun@in.bosch.com>,
        <ezequiel@collabora.com>, <seanpaul@chromium.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <michael.dege@renesas.com>, <gotthard.voellmeke@renesas.com>,
        <efriedrich@de.adit-jv.com>, <mrodin@de.adit-jv.com>,
        <ChaitanyaKumar.Borah@in.bosch.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200609142959.GA621@lxhi-065.adit-jv.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
 <20200605134124.GA28734@lxhi-065.adit-jv.com>
 <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
 <20200607024158.GD7339@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200607024158.GD7339@pendragon.ideasonboard.com>
X-Originating-IP: [10.72.94.5]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sun, Jun 07, 2020 at 05:41:58AM +0300, Laurent Pinchart wrote:
> Note that the CMM driver is controlled by the DU driver. As the DU
> driver will reenable the display during resume, it will call
> rcar_du_cmm_setup() at resume time, which will reprogram the CMM. There
> should thus be no need for manual suspend/resume handling in the CMM as
> far as I can tell, but we need to ensure that the CMM is suspended
> before and resumed after the DU. I believe this could be implemented
> using device links.

Based on below quote [*] from Jacopo's commit [**], isn't the device
link relationship already in place?

[*] Quote from commit [**]
   Enforce the probe and suspend/resume ordering of DU and CMM by
   creating a stateless device link between the two.

[**] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8de707aeb45241
    ("drm: rcar-du: kms: Initialize CMM instances")

-- 
Best regards,
Eugeniu Rosca
