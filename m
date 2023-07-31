Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01D5B769C0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Jul 2023 18:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjGaQOa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 12:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbjGaQO3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 12:14:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4266E1B7;
        Mon, 31 Jul 2023 09:14:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3CFA611FA;
        Mon, 31 Jul 2023 16:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5366C433C7;
        Mon, 31 Jul 2023 16:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690820067;
        bh=/C0S88uTm530FSACqN8JCJwXKQTdZHmz3ckq6IDPf5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tYdFBW+53yTZCB6zMkueGZ1okmtYXxM4bC+26DoP9ArFCqE/TsGdo9UqNE46RFDlE
         ywzQnlpD7pdf9ipTVxR6C5j+HkFFiduM0cjTp61fV6unbVWrcqrDAvYbcsPwT9d3C9
         LWOk5YQQKOhHC8pKnqD1dLmtcahVNDpWnF6UgRX6ysjv55Z0mudkqJyP75k4r4q1ec
         Md/D0WISF79JWOtjJ9AR7TLgAuoyiToFg6EmXuq6fdAFeyUB55fdF3n8pl7pWIoslU
         osCmkZoosWgTlFOXRhYCCFFSHx28TF4WxVHyKyLKzxeSE0urLPI/HBHirusv6RkGrR
         93nfmRlW/626w==
Received: (nullmailer pid 3187476 invoked by uid 1000);
        Mon, 31 Jul 2023 16:14:25 -0000
Date:   Mon, 31 Jul 2023 10:14:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/13] of: overlay/unittest: Miscellaneous fixes and
 improvements
Message-ID: <20230731161425.GA3165720-robh@kernel.org>
References: <cover.1690533838.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690533838.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 28, 2023 at 10:50:26AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series contains miscellaneous fixes and improvements for
> dynamic DT overlays and the related unit tests.
> 
> The first two patches are fixes for a lock-up and a crash.
> The remaining patches are smaller fixes, enhancements and cleanups for
> the overlay tests, including one new test.
> 
> I ran into the crash when accidentally loading the wrong overlay (using
> the out-of-tree DT overlay configfs[1]), and removing it afterwards.
> As this case was not yet covered by the unittests, I added a test.
> I enhanced the tests to clean up partial state after a failed
> overlay apply attempt, which triggered the lock-up.
> 
> Changes compared to v1[2]:
>   - Correct fixes tag and update description.
>   - Merge differently, as requested by Rob.
> 
> Thanks for your comments!
> 
> [1] https://elinux.org/R-Car/DT-Overlays
> [2] https://lore.kernel.org/r/cover.1689776064.git.geert+renesas@glider.be
> 
> Geert Uytterhoeven (13):
>   of: dynamic: Do not use "%pOF" while holding devtree_lock
>   of: overlay: Call of_changeset_init() early
>   of: unittest: Fix overlay type in apply/revert check
>   of: unittest: Restore indentation in overlay_bad_add_dup_prop test
>   of: unittest: Improve messages and comments in apply/revert checks
>   of: unittest: Merge of_unittest_apply{,_revert}_overlay_check()
>   of: unittest: Cleanup partially-applied overlays
>   of: unittest: Add separators to of_unittest_overlay_high_level()
>   of: overlay: unittest: Add test for unresolved symbol
>   of: unittest-data: Convert remaining overlay DTS files to sugar syntax
>   of: unittest-data: Fix whitespace - blank lines
>   of: unittest-data: Fix whitespace - indentation
>   of: unittest-data: Fix whitespace - angular brackets

I've applied patches 2-13. For patch 1, I sent an alternative[1].

Rob

[1] https://lore.kernel.org/all/20230728231950.1619073-1-robh@kernel.org/
