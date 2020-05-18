Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2A81D72C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2020 10:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgERIRb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 May 2020 04:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgERIR3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 May 2020 04:17:29 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDF6C05BD0B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2020 01:17:29 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k5so2244242lji.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2020 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KgB5iCRiDY1xUpzvcmt2qA5qOxhIvxFlroLwQSWXKVk=;
        b=cEeYQ8sMtfIcnqhDnaBX58ozf3oJI5XHFUC7g3rtIUDyqFXqr/s6o9QnE2+uFP1k/J
         LILQgdSPbgh22hGw180ItVeDUD7AU7RWmUS7tnKBpMk9U4t2JKNxq2pw8DY0Dr0glxoc
         9h935pnTmgCgvB8iSgullSwo71ZCKnR3oJERR89JnjUG0THbBdRQXx1WxsyFErA0JpzB
         b4NIVLEPTvVtsFQqcbTuJ4CrynyFpmf8ZXHARe3MZX3xlqHCX9g+ZlZpXgYibNMcuvu5
         SuKbidv7OF9jh3VrmN4uc7XV48TL9pRc4TJevPeF2eMsNSiYx4LoZTRVZTp2C4Vyh1/N
         SVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KgB5iCRiDY1xUpzvcmt2qA5qOxhIvxFlroLwQSWXKVk=;
        b=H/zFXnjf0a45q9Z/XUq1q3hGZe1nmY3UQcVoBDdWy20JJ0P64TpeJTk4MAOeHB5A7l
         9qamY5qTtrnA8Byu4M8IctFkzZmVnkdcQBteFTA/35EqkeXBsLdNicJEdD2Yqgjs4kcc
         nb2+5GR9BPDUKn1lsgk4Bg0ImphRjD7SmWNDAzjTh39D3tlkEIuZPvV6Uh4YRNCeEBQu
         P6r5VigKY9Ds85JQOWR21+KRqZiRtxVe5gJUtZTYVK1WP8JL1Siw2RkhmiTrgowcqBmR
         a1Mb0gI36Klw2VBfSy1B+1bELe5nfBysNpi5UK00S/zC1IY2KE8LCNmywp+tIpzmtK3B
         pbtw==
X-Gm-Message-State: AOAM532P/x2j3hnxibDu2+bi2T0MmsA7F2xOz0JLEDMcXWWIRAyDbjxW
        TFXipObktW7oa4o1TQVh9lek7XzDr8Ido20xPxk4lg==
X-Google-Smtp-Source: ABdhPJwh1h7WOq2+DVADM4reEeAZtZ0+Bi37spSD7MX9/2PvrGxVJ5a7SXExxc9Et8QUQoYjFbtIPHqiLPfc0Ni3lug=
X-Received: by 2002:a2e:b609:: with SMTP id r9mr9513452ljn.125.1589789846527;
 Mon, 18 May 2020 01:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200511145257.22970-1-geert+renesas@glider.be>
In-Reply-To: <20200511145257.22970-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 10:17:15 +0200
Message-ID: <CACRpkdaz34Bc_EzcXKMEVCCCUt82_c2+t4X6YSLW2b59oi+9gA@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] gpio: Add GPIO Aggregator
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

I have queued this v7 patch set in an immutable branch for testing and also
merged to my "devel" branch for testing.

If all goes well it also hits linux-next soon.

Yours,
Linus Walleij
