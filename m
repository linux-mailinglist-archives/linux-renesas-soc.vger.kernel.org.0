Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6230188EB8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2019 01:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfHJXGf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 10 Aug 2019 19:06:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:41714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbfHJXGf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Aug 2019 19:06:35 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E905B208C4;
        Sat, 10 Aug 2019 23:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565478394;
        bh=SI2d4Y4hZcsrt7ve7CrzNd1JjWMC3yyXOT2RxwbjXqE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qojn2EIuU0YQdoMtEZa0fsyEnVUqcQtKuMbGD7jqJUsatW8elNX+GjFPGrY/MTLLQ
         ReD1q5nafCpn0ZJl0SSx2G11jm+nQvtiIXSPuI3hsZ6QGrqF7PrMi496Xmm00XSz7o
         ozHQ64LKOaSrsy5wYU9cV5+1vFkGFiKD/oTPKNjs=
Received: by mail-qk1-f180.google.com with SMTP id g17so3787759qkk.8;
        Sat, 10 Aug 2019 16:06:33 -0700 (PDT)
X-Gm-Message-State: APjAAAXBHQvZgfiayn9V/neIeNV5ZeAksWAZehsc4aKSgtwo8cHvUiho
        t+yMcpowYsr/WN28LqXLLoFNzJ+UpXgdlsFpwg==
X-Google-Smtp-Source: APXvYqzMoxSMzmfJnWNfgvCIgM0nuiBjcGotb8rUssRzaeUgirt9md2wJ5YyJkMUroVAciLVRbrAOptmfLb33d7v8Vs=
X-Received: by 2002:a37:a44a:: with SMTP id n71mr24174784qke.393.1565478393051;
 Sat, 10 Aug 2019 16:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190809173321.19944-1-marek.vasut@gmail.com> <CAL_JsqJyYQ99ENOkNd6yzn1eYwLTGLNihFxtovSPJajtF9SVvg@mail.gmail.com>
 <10818888-6476-f4b1-1a2e-e10c3159327f@gmail.com>
In-Reply-To: <10818888-6476-f4b1-1a2e-e10c3159327f@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Sat, 10 Aug 2019 17:06:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJMQtvrQac6F6vy+0uWOMVi-4_7_1ooYWiB8gekrt9Jqg@mail.gmail.com>
Message-ID: <CAL_JsqJMQtvrQac6F6vy+0uWOMVi-4_7_1ooYWiB8gekrt9Jqg@mail.gmail.com>
Subject: Re: [PATCH] of: Fix of_empty_ranges_quirk()
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 10, 2019 at 7:39 AM Marek Vasut <marek.vasut@gmail.com> wrote:
>
> On 8/10/19 12:34 AM, Rob Herring wrote:
> > On Fri, Aug 9, 2019 at 11:33 AM <marek.vasut@gmail.com> wrote:
> >>
> >> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>
> >> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
> >> types, which cannot work well.
> >
> > It never returns a negative. The negative is used as an uninitialized
> > flag. Note quirk_state is static.
>
> It's still mixing boolean and signed int types though, which isn't right.

I'm really only interested in touching this code if it is too remove
it. But some reason people still run 1990s Macs.

> >> Replace that with boolean only and fix
> >> usage logic in of_translate_one() -- the check should trigger when the
> >> ranges are NULL and the quirk is applicable on the hardware.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Frank Rowand <frowand.list@gmail.com>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> To: devicetree@vger.kernel.org
> >> ---
> >>  drivers/of/address.c | 9 +++++----
> >>  1 file changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/of/address.c b/drivers/of/address.c
> >> index b492176c0572..ae2819e148b8 100644
> >> --- a/drivers/of/address.c
> >> +++ b/drivers/of/address.c
> >> @@ -616,7 +616,7 @@ static struct of_bus *of_match_bus(struct device_node *np)
> >>         return NULL;
> >>  }
> >>
> >> -static int of_empty_ranges_quirk(struct device_node *np)
> >> +static bool of_empty_ranges_quirk(struct device_node *np)
> >>  {
> >>         if (IS_ENABLED(CONFIG_PPC)) {
> >>                 /* To save cycles, we cache the result for global "Mac" setting */
> >> @@ -631,7 +631,8 @@ static int of_empty_ranges_quirk(struct device_node *np)
> >>                         quirk_state =
> >>                                 of_machine_is_compatible("Power Macintosh") ||
> >>                                 of_machine_is_compatible("MacRISC");
> >> -               return quirk_state;
> >> +               if (quirk_state > 0)
> >> +                       return true;
> >>         }
> >>         return false;
> >>  }
> >> @@ -662,8 +663,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
> >>          * This code is only enabled on powerpc. --gcl
> >>          */
> >>         ranges = of_get_property(parent, rprop, &rlen);
> >> -       if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
> >> -               pr_debug("no ranges; cannot translate\n");
> >> +       if (ranges == NULL && of_empty_ranges_quirk(parent)) {
> >> +               pr_err("no ranges; cannot translate\n");
> >
> > This is wrong. If you have NULL ranges and not the quirk, then no
> > ranges is an error. IOW, if you are getting an error here, you have an
> > error in your DT (because I assume you are not working on a PASemi or
> > Apple system).
>
> The way I understand the code is that
> if (you have no ranges in the DT) AND (the quirk is applicable) then
> print the message. Which is what this patch does.

Your understanding is wrong.

> Am I missing something ?

The normal case is you must have ranges to translate addresses. If you
don't have ranges (say for I2C addresses), then you shouldn't be in
this code. The quirk is for when there is not a ranges property but
should be. IOW, if the quirk is true, then pretend there is an empty
ranges (1:1 translation) property and continue to translate the
address.

Rob
