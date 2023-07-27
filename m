Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E80A765545
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 15:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbjG0NnF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 09:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbjG0Nmz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 09:42:55 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D991C2D68;
        Thu, 27 Jul 2023 06:42:54 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-58451f0fefeso10050897b3.3;
        Thu, 27 Jul 2023 06:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690465374; x=1691070174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNtb7I+4srTe1xUCGqofqIyR9Tz648dkcHvSNDIPqP8=;
        b=mFgcMhufT78C8JBEypg5E0ch0BQSgtr0gPWlkGN7rJob4kbCNsZjKa0vDPEvcpz6y7
         2zka2jDN8lxlEsyqEX/iXZUzyiRzlZWpbeCkvakKDnJg5+EgoMaeiUDqgaTA/tkucFAE
         Ov0QJ11QX+OHk3NI+I/mtsB5KQaSJ6efV0DiEO1RU30QU90Cn8PhJ8+TZxt0wFKagwTc
         OVlLX1AId6cZLC38XPXVDQ+tfUGqjn2obeti9c2oFc9spa3Ji5bZ6XtyEmEDcenIc5l6
         bHWd55E/T1s0MJPWYmNH4qQmNmbZhBPky6E1pbdxSIM691X9+etZvxhGsditQW99SGx2
         IzUA==
X-Gm-Message-State: ABy/qLYN/yW6eFsSQy7fB5vi8v5YIwWQGUOtQMMG75DQ8pkH6urdoYGQ
        TBrcUDyzmZJFJWn8Px3kbijn1R8i2/PZzA==
X-Google-Smtp-Source: APBJJlGMGLDa30bcevQxrhWvrLjuN8wYyufLwyEyjRE3cdaSiuMVmm+2dzw0hfDC/o2S6YDsOgLpHQ==
X-Received: by 2002:a81:5346:0:b0:57a:250:27ec with SMTP id h67-20020a815346000000b0057a025027ecmr5581031ywb.32.1690465373969;
        Thu, 27 Jul 2023 06:42:53 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id h1-20020a0dde01000000b0058038e6609csm398864ywe.74.2023.07.27.06.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 06:42:53 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-583b3939521so10309007b3.0;
        Thu, 27 Jul 2023 06:42:53 -0700 (PDT)
X-Received: by 2002:a25:69c5:0:b0:d09:d04b:935d with SMTP id
 e188-20020a2569c5000000b00d09d04b935dmr4698027ybc.14.1690465372808; Thu, 27
 Jul 2023 06:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689776064.git.geert+renesas@glider.be> <416d1ea056bb2d7ec6f21d8919b96a3d48099344.1689776064.git.geert+renesas@glider.be>
 <20230719230256.GA900970-robh@kernel.org>
In-Reply-To: <20230719230256.GA900970-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jul 2023 15:42:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjDkVscBkueWpZkGUJB6vXXL6YFNq2kS=gKSQNX528QQ@mail.gmail.com>
Message-ID: <CAMuHMdUjDkVscBkueWpZkGUJB6vXXL6YFNq2kS=gKSQNX528QQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] of: dynamic: Do not use "%pOF" while holding devtree_lock
To:     Rob Herring <robh@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Thu, Jul 20, 2023 at 1:03 AM Rob Herring <robh@kernel.org> wrote:
> On Wed, Jul 19, 2023 at 05:00:01PM +0200, Geert Uytterhoeven wrote:
> > Formatting strings using "%pOF" while holding devtree_lock causes a
> > deadlock.  Lockdep reports:
> >
> >     of_get_parent from of_fwnode_get_parent+0x18/0x24
> >     ^^^^^^^^^^^^^
> >     of_fwnode_get_parent from fwnode_count_parents+0xc/0x28
> >     fwnode_count_parents from fwnode_full_name_string+0x18/0xac
> >     fwnode_full_name_string from device_node_string+0x1a0/0x404
> >     device_node_string from pointer+0x3c0/0x534
> >     pointer from vsnprintf+0x248/0x36c
> >     vsnprintf from vprintk_store+0x130/0x3b4
> >
> > Fix this by making the locking cover only the parts that really need it.
> >
> > Fixes: 0d638a07d3a1e98a ("of: Convert to using %pOF instead of full_name")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/of/dynamic.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > index e311d406b1705306..eae45a1c673ee05f 100644
> > --- a/drivers/of/dynamic.c
> > +++ b/drivers/of/dynamic.c
> > @@ -601,13 +601,16 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
> >
> >       __of_changeset_entry_dump(ce);
> >
> > -     raw_spin_lock_irqsave(&devtree_lock, flags);
> >       switch (ce->action) {
> >       case OF_RECONFIG_ATTACH_NODE:
> > +             raw_spin_lock_irqsave(&devtree_lock, flags);
> >               __of_attach_node(ce->np);
> > +             raw_spin_unlock_irqrestore(&devtree_lock, flags);
>
> I think you could just move the spinlock into __of_attach_node(). The
> only other caller looks like this.

I'd rather not do that, as the double underscore is typically used to
indicate that this function does not take the lock.
Cfr. of_find_property() vs. __of_find_property().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
