Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA003D9D8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jul 2021 08:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234243AbhG2GTi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Jul 2021 02:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234019AbhG2GTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Jul 2021 02:19:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7364C061757;
        Wed, 28 Jul 2021 23:19:35 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99FE33F2;
        Thu, 29 Jul 2021 08:19:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627539574;
        bh=0OeBgKosfg+8FwVNiwD4tBPEhozQ5dFm5HTESVBKp0Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EA2Y8H5WO8QAr1Qvn2akReryhly1GdqA/5b5pZ4wfd1EkaRQ6kqQLe46SCWfrLUox
         6cyhjnYlpjlVLQoFcUy937Vzr6em6Rwc+UmjnzyDmEjJdN7iNR2ZgyhQAPMBa850eZ
         7M1Dz6khBqwSKG3G/1fDUcXhc45boan6YyDfYUO4=
Subject: Re: [PATCH 0/7] drm: Extend COMPILE_TEST support to some ARM drivers
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <3b44d00b-62b5-8b68-c3f1-62d7c456b231@ideasonboard.com>
Date:   Thu, 29 Jul 2021 09:19:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 28/07/2021 18:37, Laurent Pinchart wrote:
> Hello,
> 
> This patch series stems from subsystem-wide changes I wanted to
> compile-test with an ARM64 cross-compiler. My laziness to fire a 32-bit
> ARM build probably resulted in more time being spent writing these
> patches, but hopefully they'll turn out to be useful for more people :-)
> 
> Patches 1/7 and 2/7 are fixes for compilation warnings on 64-bit
> platforms in the omapdrm and sti-drm drivers. They are a dependency for
> the Kconfig changes that follow to avoid introducing build warnings, but
> could also be merged before.
> 
> Patches 3/7 to 7/7 enable compilation of the imx-dcss, omapdrm, sti-drm,
> tegra-drm and tilcdc drivers on ARM64 with COMPILE_TEST. The patches are
> independent from each other, so they can be picked by their respective
> maintainers.
> 
> We could also extend test compilation to more architecture, but I didn't
> want to remove all dependencies on ARM or ARM64 at this point for fear
> or triggering build warnings that I wouldn't be able to catch locally.
> If there's a consensus that fully relaxing the platform requirement is
> better, I can submit a new version that does so and rely on the 0day bot
> to catch issues.

I would allow compilation for any architecture if COMPILE_TEST is 
enabled. I think git grep shows that is how COMPILE_TEST is usually used.

  Tomi
