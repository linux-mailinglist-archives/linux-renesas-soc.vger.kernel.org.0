Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4446975B6ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jul 2023 20:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbjGTSiG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jul 2023 14:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbjGTShz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2023 14:37:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BBBE44;
        Thu, 20 Jul 2023 11:37:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A82AD61BF0;
        Thu, 20 Jul 2023 18:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938BDC433C7;
        Thu, 20 Jul 2023 18:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689878274;
        bh=AwVkGpN3JEpjpezLPZxHxaEHx3ugM2rw27yBeqN9Cpg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qlZdWOTxnnf9wR6gx8C3r0EV9qWcIf+wp4F+eaDI9qs1zhxx0tcp6JkPVrcKZhwaf
         4ezalB+TGAClQpKiAzb2makJuczVLU5+5SyIERAeT624/jFaoO0Cy0nlEFtMhdseKV
         kNVWVO4vMI/CNhVRbIxonUhzYxG68PWp/Q6ctp7CW27bhuwJ2t8UUENxtb0mrE/jol
         f46kyVNddAUzRynf7+g/VCjlWqmUlvHDp+xeqBSaU/L5nKCQPwU6Smj881m+OrU714
         u81vTX7GT3afYDmwJfL9olFJUCGGS/wsz1sEGIzE1k9T3RWn7YjNUxeAkt21YmL4SG
         cDfEMcIAqULnQ==
Received: (nullmailer pid 3071316 invoked by uid 1000);
        Thu, 20 Jul 2023 18:37:52 -0000
Date:   Thu, 20 Jul 2023 12:37:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/13] of: overlay/unittest: Miscellaneous fixes and
 improvements
Message-ID: <20230720183752.GB2939849-robh@kernel.org>
References: <cover.1689776064.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689776064.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 19, 2023 at 05:00:00PM +0200, Geert Uytterhoeven wrote:
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
> Thanks for your comments!

Other than my comments all looks good to me. Of course, I treat code 
deletions, documentation additions, and test additions the same: 
automatic acceptance. ;)

I'll give it a bit more time in case Frank has comments.

Rob
