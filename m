Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC584A4DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 17:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbfFRPMu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 11:12:50 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34097 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728905AbfFRPMu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 11:12:50 -0400
Received: by mail-lf1-f68.google.com with SMTP id y198so9605108lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 08:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HJZSaIQZEESOzlQnT7c0m0Vv5dHfQvY3gWgCpEHmRmA=;
        b=MmoqN/Xbgw/kmFWzA3KHyU9XaAmX2vZ/GGMQuvKeFDVz4vDwRjJY2KansyUR1HGtQk
         gIQdHxw0LidCS0MRWmQUxtw3nixt9OI1qZr38WAs8E/KXsyRszkq25zyPenPiNAI7Oyn
         jMMJbbRNGQnsCbYW239HBlO94N9WMc41y0OjY5l+TY5qdXdF4vTmT7a8KodR6dreBeIH
         MZhvff2jWx4oIHfPMsJsiiz+Mfudui/OzEilQX/LkSqmnavRyp++UDfDgVKdiAMRecgi
         djM4qvcZxmQWwLKrxJZy2JEakRL91pTeXzIgyiVWU6CMCrN237rFk5vzbi6sKFQVMj4x
         kUYg==
X-Gm-Message-State: APjAAAVr7ZoALQwTJPhoLR9Gbf5wGnFMfIfmkWrXXkC9UEXJYxk0NvvD
        2Ov2a02H8KmQ41A0rNRaWk/PtLxVCDbC5MJs8ITP4w==
X-Google-Smtp-Source: APXvYqw49YU8ifQwrT+bGPRbkjKHjO2QApqK8cdCxWMXrR1w5OcTHGnTTiiH/hQr8qBKcVh8BE2BfzaBfQUC+WJlydg=
X-Received: by 2002:a19:4a49:: with SMTP id x70mr21012652lfa.151.1560870767645;
 Tue, 18 Jun 2019 08:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <156076300266.5827.16345352064689583105.sendpatchset@octo>
 <156076301133.5827.18087893489480810339.sendpatchset@octo>
 <CAMuHMdXrDMuhOSuFNYmAxX+vZWWL3GqKKsz6OiBkpeGrgg_ZTg@mail.gmail.com> <CANqRtoSGJsE-DqZK5_Tgb-awcUSDnRzyK-6CwS4DgtrRQ0AdVg@mail.gmail.com>
In-Reply-To: <CANqRtoSGJsE-DqZK5_Tgb-awcUSDnRzyK-6CwS4DgtrRQ0AdVg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 17:12:35 +0200
Message-ID: <CAMuHMdVrU7m9PWc-MgfsRxUBwKZOsvNjnXM3N08nTLu57U2GdQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: Update CMT1 DT compat strings on r8a7740
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Tue, Jun 18, 2019 at 5:06 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> On Tue, Jun 18, 2019 at 11:08 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, Jun 17, 2019 at 11:16 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> > > From: Magnus Damm <damm+renesas@opensource.se>
> > >
> > > Update the r8a7740 to use the CMT1 DT compat string documented in:
> > > [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
> > >
> > > The "renesas,cmt-48" portion is left as-is to avoid breakage until the CMT
> > > driver has been updated to make use of the new DT compat strings.
> >
> > Hence wouldn't it be better to update the driver first, and the DTS in
> > the next release, so you can remove the "renesas,cmt-48" portion with
> > the single DTS update?
>
> Changing the DTS once sounds nice indeed. I guess my current series
> are optimized for easy merge of DT Binding docs and DTS. The driver
> changes are considered slow path.
>
> Regarding the driver itself, I was under the impression that
> introducing new DT compat strings is often disconnected from removing
> old DT compat strings. Do you agree?

Yes, you have to add a safety period before removing them.

> This is how I understand your proposed order:
>
> Step 1:
> - Update DT binding document to include new compat strings, remove
> deprecated compat strings
> - Add new DT compat string matching code to the driver
> - Mark old DT compat strings in driver as deprecated
>
> Step 2: (Any time after step 1 is complete)
> - Convert DTS to use DT new compat strings
>
> Step 3: (After N releases or years)
> - Remove deprecated DT compat string matching code in driver

Exactly.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
