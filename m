Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE9F1E3A25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 09:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbgE0HQK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 03:16:10 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:39294 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728611AbgE0HQJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 03:16:09 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id E73953C0579;
        Wed, 27 May 2020 09:16:05 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aUYj8-iqg8eh; Wed, 27 May 2020 09:16:00 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id B81673C0022;
        Wed, 27 May 2020 09:16:00 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.38) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 27 May
 2020 09:16:00 +0200
Date:   Wed, 27 May 2020 09:15:55 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
CC:     <laurent.pinchart@ideasonboard.com>,
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
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200527071555.GA23912@lxhi-065.adit-jv.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
X-Originating-IP: [10.72.94.38]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Tue, Oct 15, 2019 at 12:46:13PM +0200, Jacopo Mondi wrote:
 ----8<---

> * Testing
> I have tested by injecting a color inversion LUT table and enabling/disabling it
> every 50 displayed frames:
> https://jmondi.org/cgit/kmsxx/log/?h=gamma_lut

Could you kindly share the cross compilation steps for your kmsxx fork?

Just out of curiosity, have you ever tried to pull the display's HDMI
cable while reading from CM2_LUT_TBL?

At least with the out-of-tree CMM implementation [*], this sends the
R-Car3 reference targets into an unrecoverable freeze, with no lockup
reported by the kernel (i.e. looks like an serious HW issue).

> 
> CMM functionalities are retained between suspend/resume cycles (tested with
> suspend-to-idle) without requiring a re-programming of the LUT tables.

Hmm. Is this backed up by any statement in the HW User's manual?
This comes in contrast with the original Renesas CMM implementation [**]
which does make use of suspend (where the freeze actually happens).

Can we infer, based on your statement, that we could also get rid of
the suspend callback in [**]?

[*] https://github.com/renesas-rcar/du_cmm
[**] https://github.com/renesas-rcar/du_cmm/blob/c393ed49834bdbc/meta-rcar-gen3/recipes-kernel/linux/linux-renesas/0001-drm-rcar-du-Add-DU-CMM-support.patch#L1912

-- 
Best regards,
Eugeniu Rosca
