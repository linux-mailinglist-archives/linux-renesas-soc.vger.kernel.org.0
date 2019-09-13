Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9557B2364
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2019 17:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729591AbfIMPaJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Sep 2019 11:30:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:52404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727452AbfIMPaJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Sep 2019 11:30:09 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A30F20693;
        Fri, 13 Sep 2019 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568388608;
        bh=vTXXCERj5EHh2Nw1YV+UWJhkpIE7vv0OgxkEVMaexeE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AZV9yT5JdBBFcOow27l2xFJXweHIlWEyk4bCGozjVrLBfkHt352ZDUUDXJ7MHpLOj
         DltV2a+IKAV6vtfQV4nYSU0nMkDo+bQ1a+cqpWq8xkSYy4m+Ohj0oiVr7b7FWLt1aa
         msFFprrNl8mt82L5ocWH87WHfLZTKMVri1kRMmes=
Received: by mail-qk1-f177.google.com with SMTP id w2so5700368qkf.2;
        Fri, 13 Sep 2019 08:30:08 -0700 (PDT)
X-Gm-Message-State: APjAAAUheaHzkwOGwKNPzjFoJBlNflbktdgsoAuzcRWmVHFy8MVy4TfD
        dz3qPQv3FRUMOr9tF3xaDXgKmfktbv0GjQvI9A==
X-Google-Smtp-Source: APXvYqyeVvSIFeZmtCG6AT/49KUMwZ0DqrPecx1DbAZNlodqn4Fe5C5DL2ahpfIziIkkBqrKNmLLVlw7a94poZxftB8=
X-Received: by 2002:a05:620a:549:: with SMTP id o9mr9153341qko.223.1568388607580;
 Fri, 13 Sep 2019 08:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190907161537.27258-1-marek.vasut@gmail.com>
In-Reply-To: <20190907161537.27258-1-marek.vasut@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 13 Sep 2019 16:29:55 +0100
X-Gmail-Original-Message-ID: <CAL_JsqKSWD5EOGdvGS7Z8pd6OALRsqxv2GmVLd+9ZoOyPgbr-w@mail.gmail.com>
Message-ID: <CAL_JsqKSWD5EOGdvGS7Z8pd6OALRsqxv2GmVLd+9ZoOyPgbr-w@mail.gmail.com>
Subject: Re: [PATCH V2] of: Fix of_empty_ranges_quirk()
To:     =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>
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

On Sat, Sep 7, 2019 at 5:15 PM <marek.vasut@gmail.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
> types, which cannot work well. Replace that with boolean only and fix
> usage logic in of_translate_one() -- the check should trigger when the
> ranges are NULL and the quirk is applicable on the hardware.

Just moving to boolean has seemed like weak justification for this
churn, but now that I've seen your work on PCI dma-ranges it makes a
bit more sense.

We do have a problem that unlike 'ranges', 'dma-ranges' being missing
probably needs to be treated as 1:1 translation. I can't really
picture a case where dma-ranges would be used with a non-translatable
address. Perhaps a module with optional DMA and the DMA is not hooked
up. That could be expressed with dma-ranges with a 0 size or a
different compatible. So your v1 patch was perhaps correct change in
behavior, but only for dma-ranges. (I've written one that works in
both cases).

Rob
