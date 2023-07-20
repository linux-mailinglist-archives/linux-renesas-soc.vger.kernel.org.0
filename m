Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CF575B98E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jul 2023 23:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjGTVag (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jul 2023 17:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjGTVaf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2023 17:30:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926D52713;
        Thu, 20 Jul 2023 14:30:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30E7861C67;
        Thu, 20 Jul 2023 21:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA6BC433C7;
        Thu, 20 Jul 2023 21:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689888633;
        bh=U7WEf1K3Q/Sc+LGXXBrAr25HeboapnbL8Dk9PdUU71w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WptnBbX8sjHLz2Jwwn29Y8dEtwhoXmGcubQftNd/gnjB11d3gmgBBRW9rDHzR38MY
         /qmCkbwj5v3yGPXXplryYeNkhEM4ffgqv/agz7SUpP5nE2yEnX+AuApsWUhuYQywfO
         JSxdds4HaKvttNbESGomtC6Cxnq32qm59Xfn1oWZAaOlBT71huBRux5bqtWEzmZGGW
         MQ3XGDfRQ6vgjvksd9kN8wqoI2RdNVC77HqQu6/SlYWqs2dcfl871hgKk7S/NESpP3
         tLlBU1TDjIWYIwBKv6EoFgklUrCOIX1XVdo4ttzNHIXv9xtq71cM8Tokxv3GCKdeiv
         vuQOpzj6QnVXw==
Received: (nullmailer pid 3267625 invoked by uid 1000);
        Thu, 20 Jul 2023 21:30:31 -0000
Date:   Thu, 20 Jul 2023 15:30:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/13] of: dynamic: Do not use "%pOF" while holding
 devtree_lock
Message-ID: <20230720213031.GC2939849-robh@kernel.org>
References: <cover.1689776064.git.geert+renesas@glider.be>
 <416d1ea056bb2d7ec6f21d8919b96a3d48099344.1689776064.git.geert+renesas@glider.be>
 <20230719230256.GA900970-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719230256.GA900970-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+Sakari

On Wed, Jul 19, 2023 at 05:02:56PM -0600, Rob Herring wrote:
> On Wed, Jul 19, 2023 at 05:00:01PM +0200, Geert Uytterhoeven wrote:
> > Formatting strings using "%pOF" while holding devtree_lock causes a
> > deadlock.  Lockdep reports:
> > 
> >     of_get_parent from of_fwnode_get_parent+0x18/0x24
> >     ^^^^^^^^^^^^^
> 
> I'm wondering if we really need the lock in there. We never unset or 
> change the parent. It gets detached, but we're not checking for that. 
> The node could get freed, but the lock is not for that, refcounts are.

The lock existed since 2.6.12 for powerpc. It's not clear to me whether 
it was really ever needed. There's lots of places we just access 
'parent' without a lock. Not to say that's right.

The lock doesn't even help in this case because we release the lock on 
each count and between counting and getting the names. If the tree 
changes, the lock isn't going to help.

> >     of_fwnode_get_parent from fwnode_count_parents+0xc/0x28
> 
> count parents? Huh? Isn't it always 1? 
> 
> >     fwnode_count_parents from fwnode_full_name_string+0x18/0xac
> >     fwnode_full_name_string from device_node_string+0x1a0/0x404
> >     device_node_string from pointer+0x3c0/0x534
> >     pointer from vsnprintf+0x248/0x36c
> >     vsnprintf from vprintk_store+0x130/0x3b4
> > 
> > Fix this by making the locking cover only the parts that really need it.
> > 
> > Fixes: 0d638a07d3a1e98a ("of: Convert to using %pOF instead of full_name")

That's the wrong commit. My implementation in vsprintf.c worked with 
this. It's commit a92eb7621b9f ("lib/vsprintf: Make use of fwnode API to 
obtain node names and separators") which broke it. It came 2 years 
later.

The fwnode based implementation looks like the wrong level of 
abstraction to me. Why not just push 'give me the full name' down to the 
fwnode backends? The functions defined are *only* used by vsprintf.c.

I don't really understand the "let's change everything to use fwnode" 
even for things which will never be anything but DT. %pOF is DT 
only. </rant>

Rob
