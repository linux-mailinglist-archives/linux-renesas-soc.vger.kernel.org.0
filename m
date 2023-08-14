Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE7DC77B61B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Aug 2023 12:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235691AbjHNKKY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Aug 2023 06:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236121AbjHNKKB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 06:10:01 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD5B10E2;
        Mon, 14 Aug 2023 03:10:00 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3a7f4f7a8easo608289b6e.2;
        Mon, 14 Aug 2023 03:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007740; x=1692612540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKLiWGpbaE6FVanglXgpVrInbU3TZ/KI9tDTgP+5a60=;
        b=j822oBFVNykM/30q7GrYUVZyrX8dtv2V00e05cOX7xwvv5v2+3EfI4rvZ7TxsD1c/N
         FZw4ff4+WW7Wl0Z0plWoWfNOovI4skE7vPz+BEtq21T4ISYG1VXyiT8pRjAyoZgeq/TK
         YZJv0/sIHtG/nU/3wuRfnWWm8z58+DKILXQebnH7Z57+Pv3BH+latdoDS0ELNbKibz3j
         y4QaBItSnnGrnpcpCQ4nhaYp6sppaOcm3OaMuavKVxyHWq7bNJp2Ith1KCHNXVfbSn2Z
         GHieSfo/bBqaMN0vPNIcYW8qQi7Qk7Pj0OpdeqcgQISVXaJLrl0f9kxPCMKtT7JrqssK
         37gw==
X-Gm-Message-State: AOJu0YwGQkSTTJAFNdOW27iuSDeCCvqiQk5YRzuFpvzSAy9fxUt2AsKW
        2H3gZKnXctDfd/gUOMUeWb3VYY8JbTLd1Q==
X-Google-Smtp-Source: AGHT+IG9CAlQpw0D4CJ9aq6VwJVO5OBpKtTJObOR7nhkIjxVeHELj8hjjEk3kVR2tGSUHs3cEZJv0g==
X-Received: by 2002:a05:6808:489:b0:3a7:3a47:b137 with SMTP id z9-20020a056808048900b003a73a47b137mr8269283oid.54.1692007740119;
        Mon, 14 Aug 2023 03:09:00 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id t23-20020a0568080b3700b003a75739eac3sm4322604oij.13.2023.08.14.03.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 03:08:59 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a800814122so489032b6e.0;
        Mon, 14 Aug 2023 03:08:59 -0700 (PDT)
X-Received: by 2002:a05:6358:2621:b0:135:4003:7849 with SMTP id
 l33-20020a056358262100b0013540037849mr6526488rwc.4.1692007739437; Mon, 14 Aug
 2023 03:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690533838.git.geert+renesas@glider.be> <20230731161425.GA3165720-robh@kernel.org>
 <20230731163543.GA3246401-robh@kernel.org>
In-Reply-To: <20230731163543.GA3246401-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Aug 2023 12:08:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUb3u9_m1sPGp0GsV=dPGpt4rg3VnMsypqO702tB4aN-A@mail.gmail.com>
Message-ID: <CAMuHMdUb3u9_m1sPGp0GsV=dPGpt4rg3VnMsypqO702tB4aN-A@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] of: overlay/unittest: Miscellaneous fixes and improvements
To:     Rob Herring <robh@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Mon, Jul 31, 2023 at 6:35 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Jul 31, 2023 at 10:14:25AM -0600, Rob Herring wrote:
> > On Fri, Jul 28, 2023 at 10:50:26AM +0200, Geert Uytterhoeven wrote:
> > > This patch series contains miscellaneous fixes and improvements for
> > > dynamic DT overlays and the related unit tests.
> > >
> > > The first two patches are fixes for a lock-up and a crash.
> > > The remaining patches are smaller fixes, enhancements and cleanups for
> > > the overlay tests, including one new test.
> > >
> > > I ran into the crash when accidentally loading the wrong overlay (using
> > > the out-of-tree DT overlay configfs[1]), and removing it afterwards.
> > > As this case was not yet covered by the unittests, I added a test.
> > > I enhanced the tests to clean up partial state after a failed
> > > overlay apply attempt, which triggered the lock-up.
> > >
> > > Changes compared to v1[2]:
> > >   - Correct fixes tag and update description.
> > >   - Merge differently, as requested by Rob.
> > >
> > > Thanks for your comments!
> > >
> > > [1] https://elinux.org/R-Car/DT-Overlays
> > > [2] https://lore.kernel.org/r/cover.1689776064.git.geert+renesas@glider.be
> > >
> > > Geert Uytterhoeven (13):
> > >   of: dynamic: Do not use "%pOF" while holding devtree_lock
> > >   of: overlay: Call of_changeset_init() early
> > >   of: unittest: Fix overlay type in apply/revert check
> > >   of: unittest: Restore indentation in overlay_bad_add_dup_prop test
> > >   of: unittest: Improve messages and comments in apply/revert checks
> > >   of: unittest: Merge of_unittest_apply{,_revert}_overlay_check()
> > >   of: unittest: Cleanup partially-applied overlays
> > >   of: unittest: Add separators to of_unittest_overlay_high_level()
> > >   of: overlay: unittest: Add test for unresolved symbol
> > >   of: unittest-data: Convert remaining overlay DTS files to sugar syntax
> > >   of: unittest-data: Fix whitespace - blank lines
> > >   of: unittest-data: Fix whitespace - indentation
> > >   of: unittest-data: Fix whitespace - angular brackets
> >
> > I've applied patches 2-13. For patch 1, I sent an alternative[1].
>
> I guess there's a dependency on patch 1 because I hang here:
>
> [    1.341292] OF: overlay: ERROR: multiple fragments add and/or delete node /testcase-data-2/substation@100/motor-1/controller
> [    1.343222] OF: overlay: ERROR: multiple fragments add, update, and/or delete property /testcase-data-2/substation@100/motor-1/controller/name

Yes there is: during removal of a partially-applied overlay, some
errors are printed using %pOF, which must not be done while holding
devtree_lock.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
