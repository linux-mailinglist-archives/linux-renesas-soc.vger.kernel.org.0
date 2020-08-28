Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B882557CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 11:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgH1Jhw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 05:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728870AbgH1Jht (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 05:37:49 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC12C06121B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2020 02:37:48 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w25so551204ljo.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2020 02:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H61KW0cO/8vC8auZZfnwBx0eRjehicYI06KTiTAxhPE=;
        b=sGZldq27qtqQkS06o4Etfh2b3RBgWQ83/hREu2x5IPz+gxqzrUoI4b/0HYic8Ozd9o
         O+Vrh60X2q1O2YD6tsYIU57c3aXZPkIDfoB5x5JLpUwb4QLlXsbc7cMjuNEQoWY0MzGx
         swDdh83XnpzvM5vfFFlD3Xv7x4K3WwgzjiKb+yNQHjgxEQTEVCJ3vlDUlcsvFdaqpisu
         fvtCa0rKsQ9h2gaJebRBy65s7TKGqlXH2e5jw0DVSxEPHiGFi9i8qSQh87Do5K7jdkL8
         gF5nSuh8qIO5Mo9zCty+v4qqWH2d6GcvqoxvCi2vBvKuOAVpP1tOXnpVt0wcNmMvG27Q
         6ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H61KW0cO/8vC8auZZfnwBx0eRjehicYI06KTiTAxhPE=;
        b=Y/kBYOZZghPIlJ+ZkqT51oGTIra9X9rtQcLVWCiy0Uimt9j5txojz5y/03eNVGjtlF
         15dcCxxd87C5HAS7HHLOy+V0/iRovJ7tSnDZ5r92x/hJ4x4mP5MTqYjIzDP3eL5qJfPQ
         c6gkH2ona96as4tF2zR1bQeuR0yPGEvCGa7pVRin/l0taE+8iPrahwWENP0ntC/BXrsw
         ws7o9TeSTMKPcAdCeYe9L2xxpY1veHHpJ4s3REiYOhvlf1847jeY7dOkUSzQV4uD84b7
         RmXoPH8Y0tweIK5qiZPIKBK6u3HnzXpKpsBm3Oex9QqpkHgk0duUHXnxSKn5wMCYCc86
         QNNQ==
X-Gm-Message-State: AOAM532F2yEA8QCJf2BOf5XkLxHGE5oJR2dFd/tDwHTyAJISJB69nd6o
        2ntx2jEGG3Id0cVSXK6QR0QuiF2WRWx/iTBT4cODpA==
X-Google-Smtp-Source: ABdhPJwNru2VlFUiB5J5tlfq4WYCIDhWoJlbw/HjYQx7ozhe4gph5iyDtDKkBmQY1aerEngIdqRZ4yFpIAXJzTu4SbY=
X-Received: by 2002:a2e:b80b:: with SMTP id u11mr511080ljo.286.1598607467095;
 Fri, 28 Aug 2020 02:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200821111127.3771-1-geert+renesas@glider.be> <56474631-119b-d64b-3545-a14f800aaa61@gmail.com>
In-Reply-To: <56474631-119b-d64b-3545-a14f800aaa61@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 11:37:36 +0200
Message-ID: <CACRpkdb3ODnScRUkJYV8VswPfn6RhrSJK2YtoYLanS3MYjbJ2g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Fix pin
 controller node name
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 21, 2020 at 5:27 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 8/21/20 2:11 PM, Geert Uytterhoeven wrote:
>
> > According to Devicetree Specification v0.2 and later, Section "Generic
> > Names Recommendation", the node name for a pin controller device node
> > should be "pinctrl".
>
>    Ugh, what a lame name! :-(
>    And they say DT should be OS agnostic...

Ha ha. :D

The device tree standardization is driven with the bureaucratic ambition to
be generic, predictable and non-personal. Mimicing the characteristic of
the impersonal objects in life, such as the planets, or the plants.

This is just an ambition, in reality the people doing it are Linux-heads.

We (the DT community) try to be better people, we just fail regularly.
That is OK, the important thing is to know one can and should do better.

Yours,
Linus Walleij
