Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E609B785935
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 15:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235374AbjHWN15 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 09:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235984AbjHWN1i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 09:27:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F40E6A;
        Wed, 23 Aug 2023 06:27:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 494CD6249A;
        Wed, 23 Aug 2023 13:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F0FC433C8;
        Wed, 23 Aug 2023 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692797219;
        bh=o0sg+HSgtc1t1FPAAWrCHcZYgvHkKUMPnoMkvMBlVJ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KUfDM3xYQvKgSIFrMEEm+urIv68S7zPmz7NhXv1uCpX6tw7aFsz3rTV+6YW45lg8X
         BVzW9ZJnfEvdh+Ml5s/BzJsiuIIw3BZm+dtGOX1duNfQix6d0/VEYJ5PsBQQlir2tL
         MJvXduFn9jZES7JZdZ6hcxlydbAIKJwWKuBA/Fg0xWFdN5aNL0XGrJtuEDF1r1bM1i
         Ob0KeoFsoy4+/T8SihJYnaSHz6H7SgPazDkHSr1GqYzpZZBh9DPdN0QFXJeVd3GuPa
         ZR9M10Lsm+DcaCTDxm0u8+OL0mrwJm0BPGVSSoFZ/Z0AWX/z2wShjvtd2wiCLjp930
         r1odOnXSvkoJQ==
Received: (nullmailer pid 2212047 invoked by uid 1000);
        Wed, 23 Aug 2023 13:26:57 -0000
Date:   Wed, 23 Aug 2023 08:26:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Frank Rowand <frowand.list@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] of: unittest: Run overlay apply/revert sequence three
 times
Message-ID: <20230823132657.GA2209836-robh@kernel.org>
References: <a9fb4eb560c58d11a7f167bc78a137b46e76cf15.1692699743.git.geert+renesas@glider.be>
 <20230822153230.GA219888-robh@kernel.org>
 <CAMuHMdWLuATOi_5eUtqDPLn3W80H-c+_2CpSV2fV46Kv9i0MqA@mail.gmail.com>
 <CAL_JsqJWyQNxWLTbFSVNOMO0aC9Cg74dyNZJ7A4oK87VJL0VTw@mail.gmail.com>
 <CAL_Jsq+oDjOA0p1S_=hFjR8gZWA_5qXhUEp5=_vZ46d6ZUAHxQ@mail.gmail.com>
 <CAMuHMdU_K5tJ+BAygfPD=GZNUCRKu1_SEaxg_YLbq0cZJS1fcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU_K5tJ+BAygfPD=GZNUCRKu1_SEaxg_YLbq0cZJS1fcQ@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 23, 2023 at 09:41:40AM +0200, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Tue, Aug 22, 2023 at 9:22 PM Rob Herring <robh@kernel.org> wrote:
> > On Tue, Aug 22, 2023 at 12:59 PM Rob Herring <robh@kernel.org> wrote:
> > > On Tue, Aug 22, 2023 at 12:52 PM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > >
> > > > Hi Rob,
> > > >
> > > > On Tue, Aug 22, 2023 at 5:32 PM Rob Herring <robh@kernel.org> wrote:
> > > > > On Tue, Aug 22, 2023 at 12:22:34PM +0200, Geert Uytterhoeven wrote:
> > > > > > Run the test for the overlay apply/revert sequence three times, to
> > > > > > test if there are unbalanced of_node_put() calls causing reference
> > > > > > counts to become negative.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > > This is a reproducer for the issue fixed by commit 7882541ca06d51a6
> > > > > > ("of/platform: increase refcount of fwnode") in dt/linus.
> > > > >
> > > > > Is this necessary? There were WARN backtraces without that fix.
> > > >
> > > > Did you see them?
> > >
> > > Yes, but that was also with your series applied. When I tested the
> > > fix, I had dropped that, so maybe your series triggered it too.
> >
> > With the fix reverted on my dt/linus branch, I get this:
> >
> > [ 1.269977] ### dt-test ### pass of_unittest_overlay_10():2507
> > [ 1.270123] ### dt-test ### pass of_unittest_overlay_10():2513
> > [ 1.270290] ### dt-test ### pass of_unittest_overlay_10():2519
> > [ 1.275673] ------------[ cut here ]------------
> > [ 1.275790] refcount_t: addition on 0; use-after-free.
> > [ 1.276118] WARNING: CPU: 1 PID: 1 at lib/refcount.c:25
> > refcount_warn_saturate+0x120/0x144
> > [ 1.276343] Modules linked in:
> > [ 1.276558] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G N
> > 6.5.0-rc1-00010-g8e081e8346d1 #84
> > [ 1.276791] Hardware name: linux,dummy-virt (DT)
> > [ 1.276973] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [ 1.277114] pc : refcount_warn_saturate+0x120/0x144
> > [ 1.277219] lr : refcount_warn_saturate+0x120/0x144
> > [ 1.277332] sp : ffff80008002b630
> > [ 1.277410] x29: ffff80008002b630 x28: ffff80008002b978 x27: ffff0a00ffffff05
> > [ 1.277585] x26: ffff80008002b9a9 x25: ffffd5ba808bec2f x24: ffff452a08002f18
> > [ 1.277738] x23: ffff0000ffffff00 x22: ffff80008002b978 x21: 0000000000000000
> > [ 1.277895] x20: ffff80008002b9dd x19: ffff452a08002f80 x18: 0000000000000006
> > [ 1.278052] x17: 73657474696e752d x16: 747365743a313174 x15: 0765076507720766
> > [ 1.278200] x14: 072d077207650774 x13: ffffd5b9814a0660 x12: 000000000000069c
> > [ 1.278357] x11: 0000000000000234 x10: ffffd5b9814f8660 x9 : ffffd5b9814a0660
> > [ 1.278529] x8 : 00000000ffffefff x7 : ffffd5b9814f8660 x6 : 80000000fffff000
> > [ 1.278680] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> > [ 1.278829] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff452a02cb8000
> > [ 1.279041] Call trace:
> > [ 1.279171] refcount_warn_saturate+0x120/0x144
> > [ 1.279322] kobject_get+0xb8/0xbc
> > [ 1.279416] of_node_get+0x20/0x34
> > [ 1.279497] of_fwnode_get+0x34/0x54
> > [ 1.279567] fwnode_get_nth_parent+0xf0/0x12c
> > [ 1.279666] fwnode_full_name_string+0x48/0xb8
> > [ 1.279764] device_node_string+0x380/0x5a4
> > [ 1.279841] pointer+0x38c/0x4ac
> > [ 1.279900] vsnprintf+0x14c/0x6d0
> > [ 1.279970] vprintk_store+0x168/0x47c
> > [ 1.280055] vprintk_emit+0x104/0x2b4
> > [ 1.280122] vprintk_default+0x38/0x44
> > [ 1.280189] vprintk+0xd4/0xf0
> > [ 1.280262] _printk+0x5c/0x84
> > [ 1.280332] of_node_release+0x1ac/0x1b4
> > [ 1.280413] kobject_put+0xb0/0x220
> > [ 1.280492] of_changeset_destroy+0x50/0xf4
> > [ 1.280584] free_overlay_changeset+0x24/0x104
> > [ 1.280680] of_overlay_remove+0x240/0x2b8
> > [ 1.280766] of_unittest_apply_revert_overlay_check.constprop.0+0xa8/0x310
> > [ 1.280904] of_unittest+0xbf4/0x2e64
> > [ 1.280986] do_one_initcall+0x7c/0x1c0
> > [ 1.281072] kernel_init_freeable+0x1c4/0x294
> > [ 1.281161] kernel_init+0x24/0x1dc
> > [ 1.281242] ret_from_fork+0x10/0x20
> >
> > Then later on:
> >
> > [ 1.459652] ### dt-test ### EXPECT \ : ------------[ cut here ]------------
> > [ 1.459877] ### dt-test ### EXPECT \ : WARNING: <<all>>
> > [ 1.460227] ### dt-test ### EXPECT \ : refcount_t: underflow; use-after-free.
> > [ 1.460508] ### dt-test ### EXPECT \ : ---[ end trace <<int>> ]---
> > [ 1.460860] ### dt-test ### pass of_unittest_lifecycle():3187
> > [ 1.461455] ### dt-test ### EXPECT / : ---[ end trace <<int>> ]---
> > [ 1.461463] ### dt-test ### EXPECT / : refcount_t: underflow; use-after-free.
> > [ 1.461789] ### dt-test ### EXPECT / : WARNING: <<all>>
> > [ 1.462137] ### dt-test ### EXPECT / : ------------[ cut here ]------------
> >
> > So it seems we were getting the warning, but at the wrong point.
> 
> Thanks (and confirmed), I had missed that.
> 
> Note that it did not cause any test failures, though:
> 
>     ### dt-test ### end of unittest - 302 passed, 0 failed
> 
> With this patch:
> 
>     ### dt-test ### end of unittest - 303 passed, 1 failed
> 
> Anyway, it's up to you to decide to apply or not...

I guess that is better than searching thru the log. Applied.

Rob
