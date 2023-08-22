Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A413A78459F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 17:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237148AbjHVPcj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 11:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237159AbjHVPcf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 11:32:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8647CDA;
        Tue, 22 Aug 2023 08:32:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8306A65AA5;
        Tue, 22 Aug 2023 15:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70029C433C9;
        Tue, 22 Aug 2023 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692718351;
        bh=SWVLPp//r8bRe/uxka3xZHJjU1aXJ+0Azy0QQ7iFZA4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G7bZc6Gh94fBJNL6m/7UC9ifNYvXpcOP4fpp0sAHmgAMBZPRgIJQvcYCRJJa8jgmi
         /cylvRSgL728Ok8/UEcGJElE59xhYwISGZFiNtZa+ArYc3iO7AocptZukLxXNvmW7k
         BU6m76uMoDhuNfjC5qOKzzLd+uorqbckTw4yuf6PVZWR1k2GXrA5KVFih79zWFOE+z
         acvBzxDmmeQBBVVSb6usz7OsYuHTcCV79x6cYf3iJD2HAGdmRFb4CzvS6nYW6aPdzJ
         F+ONg0pgffBpR9Mp59c8Pai29qYE7U5CbIklbE6tOpI7WNtzEfwjIZXcx2BdLdrJY1
         2T1pcNVlKTciA==
Received: (nullmailer pid 221574 invoked by uid 1000);
        Tue, 22 Aug 2023 15:32:30 -0000
Date:   Tue, 22 Aug 2023 10:32:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Frank Rowand <frowand.list@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] of: unittest: Run overlay apply/revert sequence three
 times
Message-ID: <20230822153230.GA219888-robh@kernel.org>
References: <a9fb4eb560c58d11a7f167bc78a137b46e76cf15.1692699743.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9fb4eb560c58d11a7f167bc78a137b46e76cf15.1692699743.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 22, 2023 at 12:22:34PM +0200, Geert Uytterhoeven wrote:
> Run the test for the overlay apply/revert sequence three times, to
> test if there are unbalanced of_node_put() calls causing reference
> counts to become negative.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is a reproducer for the issue fixed by commit 7882541ca06d51a6
> ("of/platform: increase refcount of fwnode") in dt/linus.

Is this necessary? There were WARN backtraces without that fix.

Rob
