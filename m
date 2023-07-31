Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE9B4769CD3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Jul 2023 18:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbjGaQgf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 12:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233068AbjGaQgO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 12:36:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3110268E;
        Mon, 31 Jul 2023 09:35:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 04CE76120E;
        Mon, 31 Jul 2023 16:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F7AC433C8;
        Mon, 31 Jul 2023 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690821345;
        bh=NLwzaPI9NQwgbKD5ib2siRC35j3gpnfJuga7hl+lnng=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=efh3+ALrdbCRmVbtHfiaAfacf3hnHWsLecaPhP8h1JbiPn2MSQebN9q+h7+Ljk+pN
         7SAgdio7qKAZAxX4zv3AiicQ0lpm3h2fC9PrVofs5bg2n5+UQE2i8txndxK6UzRIY1
         mAmXx6qCZn4EQzSM6Qp+By+bJmmHqhse1108SOG6rCMsycxWDNUX9Iq1rW61jH1PvS
         I4wTAMvt+8uU5ZjTRXJfJxVTa42cd/S+8CNiBLa9zWm4McY1tkXT0tCvE6H1T/Rf+X
         /djrMQSYsQN8zNa5+N4lXj/5OHoXgMQ6FdmOMUWroh3g0BOtnx6+TBm4A8SmHy3tZK
         NeswRow20LJyA==
Received: (nullmailer pid 3247705 invoked by uid 1000);
        Mon, 31 Jul 2023 16:35:43 -0000
Date:   Mon, 31 Jul 2023 10:35:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/13] of: overlay/unittest: Miscellaneous fixes and
 improvements
Message-ID: <20230731163543.GA3246401-robh@kernel.org>
References: <cover.1690533838.git.geert+renesas@glider.be>
 <20230731161425.GA3165720-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731161425.GA3165720-robh@kernel.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 31, 2023 at 10:14:25AM -0600, Rob Herring wrote:
> On Fri, Jul 28, 2023 at 10:50:26AM +0200, Geert Uytterhoeven wrote:
> > 	Hi all,
> > 
> > This patch series contains miscellaneous fixes and improvements for
> > dynamic DT overlays and the related unit tests.
> > 
> > The first two patches are fixes for a lock-up and a crash.
> > The remaining patches are smaller fixes, enhancements and cleanups for
> > the overlay tests, including one new test.
> > 
> > I ran into the crash when accidentally loading the wrong overlay (using
> > the out-of-tree DT overlay configfs[1]), and removing it afterwards.
> > As this case was not yet covered by the unittests, I added a test.
> > I enhanced the tests to clean up partial state after a failed
> > overlay apply attempt, which triggered the lock-up.
> > 
> > Changes compared to v1[2]:
> >   - Correct fixes tag and update description.
> >   - Merge differently, as requested by Rob.
> > 
> > Thanks for your comments!
> > 
> > [1] https://elinux.org/R-Car/DT-Overlays
> > [2] https://lore.kernel.org/r/cover.1689776064.git.geert+renesas@glider.be
> > 
> > Geert Uytterhoeven (13):
> >   of: dynamic: Do not use "%pOF" while holding devtree_lock
> >   of: overlay: Call of_changeset_init() early
> >   of: unittest: Fix overlay type in apply/revert check
> >   of: unittest: Restore indentation in overlay_bad_add_dup_prop test
> >   of: unittest: Improve messages and comments in apply/revert checks
> >   of: unittest: Merge of_unittest_apply{,_revert}_overlay_check()
> >   of: unittest: Cleanup partially-applied overlays
> >   of: unittest: Add separators to of_unittest_overlay_high_level()
> >   of: overlay: unittest: Add test for unresolved symbol
> >   of: unittest-data: Convert remaining overlay DTS files to sugar syntax
> >   of: unittest-data: Fix whitespace - blank lines
> >   of: unittest-data: Fix whitespace - indentation
> >   of: unittest-data: Fix whitespace - angular brackets
> 
> I've applied patches 2-13. For patch 1, I sent an alternative[1].

I guess there's a dependency on patch 1 because I hang here:

[    1.341292] OF: overlay: ERROR: multiple fragments add and/or delete node /testcase-data-2/substation@100/motor-1/controller
[    1.343222] OF: overlay: ERROR: multiple fragments add, update, and/or delete property /testcase-data-2/substation@100/motor-1/controller/name

Rob
