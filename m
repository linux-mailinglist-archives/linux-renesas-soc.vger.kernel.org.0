Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD336785BEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 17:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235920AbjHWPWX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 11:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234657AbjHWPWX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 11:22:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5CF61716;
        Wed, 23 Aug 2023 08:22:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D7C2964798;
        Wed, 23 Aug 2023 15:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DD0C433C7;
        Wed, 23 Aug 2023 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1692804055;
        bh=ZbuFpZHKJ34DZHImXuZ1HmMpbxu5FtNSIBSqQ3kg7Bc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mqv+jKE4zl9LIugIm+GseOTlaDZokEttmROlvTEJIRotkDa7uyP4BuJkZPq5J8GFk
         UzX511GFAWfsC4YcuHGCG8I3B1FNYO3ZehhbP9ZpusNb3T4USz/Ozlq0rCigaEBe0M
         Z/cqyw3hOw96VWFouvbqObSpBW0YK5V+iU4ecsDE=
Date:   Wed, 23 Aug 2023 17:20:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Message-ID: <2023082354-pledge-salary-0d6f@gregkh>
References: <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
 <ZOOBw/3fqdinIwCh@smile.fi.intel.com>
 <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
 <ZOOaFioDSpasda82@smile.fi.intel.com>
 <CAMuHMdU_4Mg==Jh14K0ecVXfLCDt-RbNia5gCwLPjPj3tBQbsA@mail.gmail.com>
 <ZOSfrHUDpaax1FS4@smile.fi.intel.com>
 <CAMuHMdVwy72utSLBFro7emgG5Hx6xzD8MHwXczAyJJvBpVDgYg@mail.gmail.com>
 <ZOSlRhLiYoZmcDfT@smile.fi.intel.com>
 <20230823144905.mep6w6fctwcxxrhz@intel.intel>
 <CAMuHMdWW_3Wmq-XFd6HCmHhE2RScWMEUas7O7XuSniXPb3k4Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWW_3Wmq-XFd6HCmHhE2RScWMEUas7O7XuSniXPb3k4Dg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 23, 2023 at 05:10:22PM +0200, Geert Uytterhoeven wrote:
> Hi Andi,
> 
> On Wed, Aug 23, 2023 at 4:49 PM Andi Shyti <andi.shyti@kernel.org> wrote:
> > I would rather prefer to store pointers in u64 variables rather
> > than integers in a pointer.
> 
> "u64" is overkill, as it is too large on 32-bit platforms.
> "uintptr_t" (or ("unsigned long") in legacy code) is the correct integer type.

"unsigned long" in kernel code is the guaranteed size of a pointer.

unitptr_t is for userspace code, it should not be used here in the
kernel as that's the wrong variable namespace.

thanks,

greg k-h
