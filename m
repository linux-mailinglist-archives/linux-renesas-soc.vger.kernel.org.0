Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEFA65D09E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jan 2023 11:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234790AbjADK1H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Jan 2023 05:27:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbjADK1F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2023 05:27:05 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C4FFAD9;
        Wed,  4 Jan 2023 02:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672828024; x=1704364024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vG8oAo7sN5yIKn7EExJUDy9QBn5sKrDpKcI3G4sxyqw=;
  b=aQVT4OfwTzE9pvIfrzu7k0QLOcmbSP73fArrvfBAM0jYdGQrTK+y/sKs
   hU1CXdY4iRkZONKcJosuCnUrFK7ByxLgmDxrmCMIZ7BvpMTPhnaI+GLdv
   58y7USSz6pelfeuw8gJS0WS6oyLegq0M/kcLP9P57YZK5mow+/BirOYoU
   SBD9zWnIoSkvX4V8Lw1Lrzb461F7KeTRL4SrWVwttNkNi9iDAdDxQoils
   Pl1nBeFmS2oAI6E6oDCUxmis55Zfbg9n/ofw3BArEj1lkW0U1+XzOHQfD
   5aoECs1+52sQseCB+CMFnL5QRLBZx9WkhslQtQfDQMsphSKEeakCFzkQC
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,299,1665439200"; 
   d="scan'208";a="28238209"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 04 Jan 2023 11:27:01 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 04 Jan 2023 11:27:01 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 04 Jan 2023 11:27:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672828021; x=1704364021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vG8oAo7sN5yIKn7EExJUDy9QBn5sKrDpKcI3G4sxyqw=;
  b=alpjEprWIMDfB67MBA2pVXpBfkwuwCwnwZqnJUYtJglsq2qVYZCWF5ib
   ypkvTzcPXToHqG5kO+jDEkDAWG09sx9TLNMROHF5I31tCNuwjJTDMuIv6
   4JTxY0A5K+/LkKqQti2H2FYjKWyVSAVU6BjGk8go4ORJrJuoX/f/Dm8TR
   uI2jj7mFKOKx0rf1l9ch+c/rDbmXJ4Ib1r5EK1g9jnZdTPeaIGxPaDdMh
   He9i2BDeVrQ7nFIRszz89ivKQDJaTJ4vdU+NEfSWkRy++M7zLOZZrl4pB
   82b0wbft89rWZg2hLI6FJB75q1SkDMmOsJqR0jKiHiK4XkXE8Zq2Hb6On
   A==;
X-IronPort-AV: E=Sophos;i="5.96,299,1665439200"; 
   d="scan'208";a="28238208"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Jan 2023 11:27:01 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7C9CF280056;
        Wed,  4 Jan 2023 11:27:01 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Marek Vasut <marex@denx.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: rs9: Check for vendor/device ID
Date:   Wed, 04 Jan 2023 11:26:59 +0100
Message-ID: <47810610.MN2xkq1pzW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAMuHMdWmypkjeowpsQ0-7z7Kfa5NjPeGYr0vujrfdVia5qjevw@mail.gmail.com>
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com> <2ba4e002-9f27-2e36-2bd2-8753c455b21f@denx.de> <CAMuHMdWmypkjeowpsQ0-7z7Kfa5NjPeGYr0vujrfdVia5qjevw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Am Dienstag, 3. Januar 2023, 17:08:36 CET schrieb Geert Uytterhoeven:
> Hi Marek,
> 
> On Tue, Jan 3, 2023 at 4:45 PM Marek Vasut <marex@denx.de> wrote:
> > On 1/3/23 13:31, Alexander Stein wrote:
> > > This is in preparation to support additional devices which have
> > > different
> > > IDs as well as a slightly different register layout.
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > 
> > >   drivers/clk/clk-renesas-pcie.c | 24 ++++++++++++++++++++++++
> > >   1 file changed, 24 insertions(+)
> > > 
> > > diff --git a/drivers/clk/clk-renesas-pcie.c
> > > b/drivers/clk/clk-renesas-pcie.c index e6247141d0c0..0076ed8f11b0
> > > 100644
> > > --- a/drivers/clk/clk-renesas-pcie.c
> > > +++ b/drivers/clk/clk-renesas-pcie.c
> > > @@ -45,6 +45,13 @@
> > > 
> > >   #define RS9_REG_DID                         0x6
> > >   #define RS9_REG_BCP                         0x7
> > > 
> > > +#define RS9_REG_VID_IDT                              0x01
> > > +
> > > +#define RS9_REG_DID_TYPE_FGV                 (0x0 <<
> > > RS9_REG_DID_TYPE_SHIFT) +#define RS9_REG_DID_TYPE_DBV                
> > > (0x1 << RS9_REG_DID_TYPE_SHIFT) +#define RS9_REG_DID_TYPE_DMV          
> > >       (0x2 << RS9_REG_DID_TYPE_SHIFT)> 
> > I'm not entirely sure whether this shouldn't be using the BIT() macro,
> > what do you think ?
> 
> They're not one-bit values (which bit does RS9_REG_DID_TYPE_FGV set? ;-),
> but values in a bitfield.
> 
> So using FIELD_PREP() and friends would make more sense to me.

FIELD_PREP() seems pretty nice, but unless I miss something it can't be used 
for initializing struct members. See renesas_9fgv0241_info.

Best regards,
Alexander

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like
> that. -- Linus Torvalds




