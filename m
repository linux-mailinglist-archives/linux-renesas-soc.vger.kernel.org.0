Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02BFF7848B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 19:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjHVRwa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 13:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjHVRwa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 13:52:30 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF968196;
        Tue, 22 Aug 2023 10:52:27 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-58d41109351so79474997b3.1;
        Tue, 22 Aug 2023 10:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692726747; x=1693331547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgOhepqTpbPTYkAPFCS3+lIdslbNiQ9mWYDOLTBrpXQ=;
        b=A+O6RgLrsT7DGFW57+z899eF+qoyJuFn2leRbwDId6k1lsyIcCVPbIIJ36Kv10FyBd
         PytF3vEKEjUo29dvKxjtn4EarqxEFaV3bWTCiC9vX/1sjBKyBCqHfHap+CJXi73Tov/l
         ksIuNADLR0zt78L2GdNvrDc5CuO5ktPhjQjtEUd2DDtkDVTEtuNIsoeQMLweKBF1R+4o
         N9Liyne8s6Vj0pSTeSwdO87cMogZ8cijE5T2ol3edEA80zOWVOFKzNsU1TyY5jHNYE/4
         ZdsTa+Jebh/GkQ32oBjhzuWHe5bCi7G2F0QHCNuQPjiFh0n8zX1IjEwa+LEzmUKkGh59
         KA8w==
X-Gm-Message-State: AOJu0Yz/o31dJ68+pQzZx4ZzcGJRs071IudvF5O8gmn7swI39ZMgKoOk
        UV7S0PjbfB5I7mwolPM7BSZmsE+kFsFhaA==
X-Google-Smtp-Source: AGHT+IG4UNAWyn40zZWufw0NY6PZQ7lvMpBjCziOy3Sm9n/JhqveJeOsWbks4MwjCE6LmK8aCEx5qw==
X-Received: by 2002:a81:4e17:0:b0:58c:fc64:c834 with SMTP id c23-20020a814e17000000b0058cfc64c834mr8276411ywb.11.1692726746844;
        Tue, 22 Aug 2023 10:52:26 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id h1-20020a81b401000000b00589e68edac6sm2899822ywi.39.2023.08.22.10.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 10:52:26 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d748d8cf074so4038207276.0;
        Tue, 22 Aug 2023 10:52:26 -0700 (PDT)
X-Received: by 2002:a25:ae53:0:b0:d1d:19f6:f544 with SMTP id
 g19-20020a25ae53000000b00d1d19f6f544mr8116627ybe.22.1692726746419; Tue, 22
 Aug 2023 10:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <a9fb4eb560c58d11a7f167bc78a137b46e76cf15.1692699743.git.geert+renesas@glider.be>
 <20230822153230.GA219888-robh@kernel.org>
In-Reply-To: <20230822153230.GA219888-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Aug 2023 19:52:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLuATOi_5eUtqDPLn3W80H-c+_2CpSV2fV46Kv9i0MqA@mail.gmail.com>
Message-ID: <CAMuHMdWLuATOi_5eUtqDPLn3W80H-c+_2CpSV2fV46Kv9i0MqA@mail.gmail.com>
Subject: Re: [PATCH] of: unittest: Run overlay apply/revert sequence three times
To:     Rob Herring <robh@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Tue, Aug 22, 2023 at 5:32 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, Aug 22, 2023 at 12:22:34PM +0200, Geert Uytterhoeven wrote:
> > Run the test for the overlay apply/revert sequence three times, to
> > test if there are unbalanced of_node_put() calls causing reference
> > counts to become negative.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This is a reproducer for the issue fixed by commit 7882541ca06d51a6
> > ("of/platform: increase refcount of fwnode") in dt/linus.
>
> Is this necessary? There were WARN backtraces without that fix.

Did you see them?
Peng saw them with the out-of-tree jailhouse hypervisor enable/disable
test, and I saw them with the out-of-tree overlay configfs patches.
I am not aware of any in-tree kernel code triggering them.  If we
would have had this in the unittests, I would have noticed this
regression earlier...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
