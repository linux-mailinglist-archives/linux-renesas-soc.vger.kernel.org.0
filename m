Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 132353E902A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 14:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237576AbhHKMII (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 08:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237592AbhHKMIH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 08:08:07 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F56C0613D5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 05:07:43 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id m18so4196920ljo.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ObQ5OAEUd0+X1eMi1qcnnAwRcSYfFxDtxdcEgN6ufWM=;
        b=OMRmvbDwPkn8fEqA2OPAXWB6I+etzg1ysA5y8KNf4rT5LZO3Wpb0CgwaWeFQuvXgmd
         4F0zctL9WdpflzYh9lDHUKC76WIE12Cny8oKlyB9tHB5HqTaKylIYEm1adesWNVGZBIG
         JU5JGbz5cUrkgeHli4AKOSJBeyoqid4nfOFRCRHT0JQnnFjTq/NIhcQZL50CkoIAtuyy
         hsTVeI0+nh5h0NLmHh5q1IQQsK+YYsJyrkx5kGMv8CtLZIlnS8VG6Tf5OlvbtFgtQs41
         hcW0vlYj1PO6GDwdVCabM0+xze+vKZFVUJMIsR9diuC3pTtNqBBOeKia0ieLbqD/hSkV
         7q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ObQ5OAEUd0+X1eMi1qcnnAwRcSYfFxDtxdcEgN6ufWM=;
        b=V42iLt9tzGFsrppW8JG4TarD42CLejiyKAdn73pgXyPRicYCag6bhmH+dCmq81kFdF
         2VLItubIPC4apu0qpkfDXv8vwlvaAUwKbz9dgP5U3qGn/fETvrCutiKgAdt2XXKOn768
         ZuXGstC3gUz8XtwBX2dkQUxv4g0ErSkU31WsrxCQXxsdRVOHNkC15ByZdRs1bu0qp4eN
         CR1R6wBtPQxBcER4AWyu986Zs7cB0w5Mwvl/d95x59d64bcr8zUoqC1Tbyowgt5xeJeK
         Pv86IbSu1qXrXGVOrmFe9fg6myLHpEQuaagrbwWIye5M7oEneO5icKEnoqMXQjuPh2rh
         2AXw==
X-Gm-Message-State: AOAM531mwDHpT2M73wtX7rgJxJRnlTuqCYIy7itpa3FKOgeqSfpRfSRG
        qjdYYfSCpHwDArA8yHzKJhdHbxo7XW68Cyx/D5M3ng==
X-Google-Smtp-Source: ABdhPJzY2UMetNipVATu+xcWql5w7ucY3+3H1SvB5mkMuZDL9wTMQKa9NEl1S74qvlbCJIHPSpWeiReYNbTevn2LyM8=
X-Received: by 2002:a2e:a4ab:: with SMTP id g11mr526868ljm.273.1628683662147;
 Wed, 11 Aug 2021 05:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:07:31 +0200
Message-ID: <CACRpkdbEPsRUUxNTfFoAghFiRur6eG9BbXqzXdWWnSZGuOreKQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Renesas RZ/G2L IRQC support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 3, 2021 at 7:51 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> The RZ/G2L Interrupt Controller is a front-end for the GIC found on
> Renesas RZ/G2L SoC's with below pins:
> - IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts
> - GPIO pins used as external interrupt input pins out of GPIOINT0-122 a
>   maximum of only 32 can be mapped to 32 GIC SPI interrupts,

This looks good to me but I count on Geert to do final review, merge and
send pull requests for everything Renesas.

Yours,
Linus Walleij
