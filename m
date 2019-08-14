Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF9E8D300
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2019 14:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfHNMYj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Aug 2019 08:24:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:52096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725888AbfHNMYj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 08:24:39 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90EFB2084D;
        Wed, 14 Aug 2019 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565785479;
        bh=ksI/AlDOVITNJQjT7DMo+H2Yw3KjU59frpSXmb68Aw0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jBb3cXETjZGhGpg1EvHTUi/kwlRQR/AR9LUd4d1CLou4JeQRgmNoBge7u6Woj0ACI
         LHeidbZ+DI9voV7dvfT1PSWKLEjbacS/9L5Ot8YJvLTQFlLY3/OjgUrFr7EPRtDPQr
         jVjQjorRdxy5cYEBffrdzu2I7SUajFO2s782z+lg=
Date:   Wed, 14 Aug 2019 13:24:34 +0100
From:   Will Deacon <will@kernel.org>
To:     Bhupesh Sharma <bhsharma@redhat.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Steve Capper <steve.capper@arm.com>,
        Christoph von Recklinghausen <crecklin@redhat.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>, maz@kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        mark.rutland@arm.com
Subject: Re: [PATCH V5 00/12] 52-bit kernel + user VAs
Message-ID: <20190814122434.tmnh6twmfidpfni4@willie-the-truck>
References: <20190807155524.5112-1-steve.capper@arm.com>
 <20190809164716.qtt7zizfbqyjukwe@willie-the-truck>
 <CAMuHMdWvkWGoNC5HbWoZwtpg5VXxTZqRZqQy4BLPgQXZJtKnsQ@mail.gmail.com>
 <20190813131013.vpc5a2vlxwghizxa@willie-the-truck>
 <CAMuHMdXr+S2QeOSEXZoGGDOB_PrgENPbVXFjS=pEfbHfvN2zhw@mail.gmail.com>
 <CACi5LpNhh0a0ktLeDDCO4K3-mBx0D8QZ344juAzbHeP4QFtGDw@mail.gmail.com>
 <20190814082137.mnk242lp2vw5b4ot@willie-the-truck>
 <CACi5LpMNC2h-JAmT3gc8wt6rwPBzQaAUZq_P18D3Atjg9CNS5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACi5LpMNC2h-JAmT3gc8wt6rwPBzQaAUZq_P18D3Atjg9CNS5A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

[+Mark]

On Wed, Aug 14, 2019 at 05:29:09PM +0530, Bhupesh Sharma wrote:
> On Wed, Aug 14, 2019 at 1:51 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, Aug 14, 2019 at 01:34:49PM +0530, Bhupesh Sharma wrote:
> > > I still see the following issue on a 48-bit hardware (i.e. _non_
> > > ARMv8.2 hardware) with branch 'for-next/52-bit-kva' with commit
> > > d2d73d2fef421ca0d4 as the HEAD:
> >
> > Have you tried the patches I posted here:
> >
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2019-August/673315.html
> >
> > ?
> >
> > Whilst they're being reviewed, I've dropped the 52-bit branch from
> > linux-next (for-next/core) so that people don't keep running into this.
> 
> Thanks will try the above and get back with my results.
> 
> However just to make sure that the 52-bit changes are tested properly
> (before landing up linux-next) - as we had issues with the 52-bit User
> space VA + PA changes in the past (which broke userspace), I was
> wondering if we can have a dedicated branch to have the v5 patches
> from Steve + fixes, so that they can be easily tested and issues (if
> any) reported with easy reference.
> 
> Or, if such a branch already exists, kindly share the pointer to the
> same as well.

I've pushed the current round of fixes on top of:

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/52-bit-kva

Mark has spotted a couple of other issues, but they shoudn't hold up your
testing (although I'm going to hold off putting this back into -next until
we've got them resolved).

Mark -- please use the branch above as a basis for any additional fixes.
HEAD should be d0b3c32ed922.

Thanks,

Will
