Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECCBDA9DC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 11:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732979AbfIEJIj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 05:08:39 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:60280 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732160AbfIEJIj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 05:08:39 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 194BF25B753;
        Thu,  5 Sep 2019 19:08:37 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 092FE940AC6; Thu,  5 Sep 2019 11:08:34 +0200 (CEST)
Date:   Thu, 5 Sep 2019 11:08:34 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Fixes for v5.3
Message-ID: <20190905090834.7pnvnaqovqnwiuik@verge.net.au>
References: <cover.1565962268.git.horms+renesas@verge.net.au>
 <CAK8P3a0rQgEj9gQh-jyPOtoj+QVT2eeXz-vF0v5aKfnzWXP35g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0rQgEj9gQh-jyPOtoj+QVT2eeXz-vF0v5aKfnzWXP35g@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 04, 2019 at 02:40:36PM +0200, Arnd Bergmann wrote:
> On Fri, Aug 16, 2019 at 3:33 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> >
> > are available in the git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v5.3
> >
> > for you to fetch changes up to 45f5d5a9e34d3fe4140a9a3b5f7ebe86c252440a:
> >
> >   arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name (2019-08-09 11:58:17 -0700)
> >
> > ----------------------------------------------------------------
> > Renesas ARM Based SoC Fixes for v5.3
> >
> > * R-Car D3 (r8a77995) based Draak Board
> >   - Correct backlight regulator name in device tree
> 
> I just found this pull request in the arm@kernel.org inbox, sorry for missing
> it earlier. The 5.4 pull requests that Geert sent in the meantime are all
> merged as they went to the new soc@kernel.org address.
> 
> Pulled this now into arm/fixes.

Thanks, and sorry for using the old email address.

I do have one more fix which I plan to post later today.
