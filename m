Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 566B37848E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 19:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjHVR74 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 13:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjHVR74 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 13:59:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC7B196;
        Tue, 22 Aug 2023 10:59:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E85E36588A;
        Tue, 22 Aug 2023 17:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53476C433C8;
        Tue, 22 Aug 2023 17:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692727193;
        bh=iMtbssLmtMA2cVqKBZhjPZSJoloY8PZ7LyWtw/qhrKk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GxlMOlwUI1nMgkGupPitzrdyBP5JYmJBh06+kegHSixHZtzLuYNMYadHGjVg3HOBj
         gwxb98EiEFF1cqxW+LBADmaLFwLHQDNwlBLrQTXE+e4dFWr09RzkI7AmlGbOd+E51S
         pgxUABcl0+qmMWCRs7/i8+cHsYZu9FdQLjgDcxAYOAxAhyaoySDsdHB3N74ee3Q40y
         mV9ORTVua3vIofHtwdDpmYDz7UXP5F7nv4PAV9Je/kTgLYvwz5ZRm/TXcKaOpbra/1
         Tmx8KHR6kQnwAP9oMxYqqwueax+SzaZHn3K2wVqP0Lg4W9l+i/weoCVtp0bMYElBts
         mmcLsRr7lKthg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2bb99fbaebdso74793721fa.0;
        Tue, 22 Aug 2023 10:59:53 -0700 (PDT)
X-Gm-Message-State: AOJu0YxX4QiFnJrpOUgV/n4gEcTYfCNJiQfR+y+yDsPnK3Mcw6a+cv1x
        yPSEN32NKGkr1BFQLzJPbCb8Ne4+psRTGd5Urw==
X-Google-Smtp-Source: AGHT+IGf688pvY3S+692lXUqjLkN/n0uWEqBsP+w+oNvV9czGXzaGLV2/kDBM43YshrP35gSbIWYwSSMrZdkz6YnNB4=
X-Received: by 2002:a2e:6e0c:0:b0:2b6:eb5a:6504 with SMTP id
 j12-20020a2e6e0c000000b002b6eb5a6504mr7807932ljc.18.1692727191358; Tue, 22
 Aug 2023 10:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <a9fb4eb560c58d11a7f167bc78a137b46e76cf15.1692699743.git.geert+renesas@glider.be>
 <20230822153230.GA219888-robh@kernel.org> <CAMuHMdWLuATOi_5eUtqDPLn3W80H-c+_2CpSV2fV46Kv9i0MqA@mail.gmail.com>
In-Reply-To: <CAMuHMdWLuATOi_5eUtqDPLn3W80H-c+_2CpSV2fV46Kv9i0MqA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 22 Aug 2023 12:59:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJWyQNxWLTbFSVNOMO0aC9Cg74dyNZJ7A4oK87VJL0VTw@mail.gmail.com>
Message-ID: <CAL_JsqJWyQNxWLTbFSVNOMO0aC9Cg74dyNZJ7A4oK87VJL0VTw@mail.gmail.com>
Subject: Re: [PATCH] of: unittest: Run overlay apply/revert sequence three times
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Frank Rowand <frowand.list@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 22, 2023 at 12:52=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Tue, Aug 22, 2023 at 5:32=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > On Tue, Aug 22, 2023 at 12:22:34PM +0200, Geert Uytterhoeven wrote:
> > > Run the test for the overlay apply/revert sequence three times, to
> > > test if there are unbalanced of_node_put() calls causing reference
> > > counts to become negative.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > This is a reproducer for the issue fixed by commit 7882541ca06d51a6
> > > ("of/platform: increase refcount of fwnode") in dt/linus.
> >
> > Is this necessary? There were WARN backtraces without that fix.
>
> Did you see them?

Yes, but that was also with your series applied. When I tested the
fix, I had dropped that, so maybe your series triggered it too.

Rob
