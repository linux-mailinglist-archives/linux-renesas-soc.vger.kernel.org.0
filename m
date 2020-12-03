Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E952CD3E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 11:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728664AbgLCKnH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 05:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbgLCKnH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 05:43:07 -0500
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AF6C061A4E;
        Thu,  3 Dec 2020 02:42:21 -0800 (PST)
Received: by mail-yb1-xb43.google.com with SMTP id s8so1551314yba.13;
        Thu, 03 Dec 2020 02:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hfm3YC+N0lPHZ6ksRkiUm92xWhUJaA74Y3jMuhyWfs8=;
        b=L0zaM4a4o64DBsbJDO7dYT1Q9pkzr/Fymx8GIKWeaachDCrOYD4z2/uon0uaT6U73A
         bdsFCCgzaRuYDNUk9FDbS8NnerYatLK4qdYUwteNbqmKzOTihoYs3SEA2L1Hbgyl8DuW
         isa0fKwBWtTnG4jftCPOvrx7PTGYrEZzQToQpMkzXc5CyNf3hvvGTzkdwKkrNF4QooeQ
         zQDfz9KfiBDtrJpHTxwEipJDKlXNubFvSCZfK2Yu8GLP/RZbLx2nJ70JKjK5ideuK17g
         /tkrKUaLbD6TQHt5JV2ky/xsXfpTOT1aG0ZanUw953OKxDvXm7HvSvYQH2gjRg1pGAUW
         1L5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hfm3YC+N0lPHZ6ksRkiUm92xWhUJaA74Y3jMuhyWfs8=;
        b=fL6F54DXl6QeEIv+SsNlP4FFApVWUHDrpGNrOK8//wwBNHeaT2taqKzTma/UOiicWd
         m6HQQJ9IXQKIw43stMh2Lq2CP4BKeNSxLEz8r23Hii3oYvhrKeXmbhCdeHly98QI7Hup
         VGV9ZUfKXPgAJMTvOvTcy0P9jUmncIHpIJhi4hPZC6vtZVf4vmNgQA0JNQ4l+2hb26As
         dJC3MNVTRndE1vOe4Ir/oDTfoe7wC4k8DLMxtoIh7QowsQEZOE6G7ogXheJKWYXSPCUN
         nZ9Nc5coC2VfQSrjWGRHD4xBoxz19PXyccIeuAFlOnNzUJX2WNrLLh312fqEGvztMZPE
         DDVQ==
X-Gm-Message-State: AOAM531TKhH4zTuhdTcIMwsk+MiV6wJEUfUFT+3SALabkhqLwha/x3Re
        i3w4WKX/1Tcgq5+zN082TfhygiGqMqEacyP52bs=
X-Google-Smtp-Source: ABdhPJxVKrqsLes0pmj5XcNDHVPGuT72dSLFKSlykNNMhvPLVewk1WzacGkS8+DQLZTtQSGSihapk8/vyqOogGQq2QY=
X-Received: by 2002:a25:209:: with SMTP id 9mr3780458ybc.127.1606992140812;
 Thu, 03 Dec 2020 02:42:20 -0800 (PST)
MIME-Version: 1.0
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 3 Dec 2020 10:41:54 +0000
Message-ID: <CA+V-a8vjTQv7wrdJFe6TS3saUE=Sj6ty0JSz0VZUd=TyDVfp4Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] memory: renesas-rpc-if: Trivial fixes
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof,

On Thu, Nov 26, 2020 at 7:11 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi All,
>
> This patch series fixes trivial issues in RPC-IF driver.
>
> Changes for v2:
> * Balanced PM in rpcif_disable_rpm
> * Fixed typo in patch 4/5
> * Dropped C++ style fixes patch
> * Included RB tags from Sergei
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (5):
>   memory: renesas-rpc-if: Return correct value to the caller of
>     rpcif_manual_xfer()
>   memory: renesas-rpc-if: Fix unbalanced pm_runtime_enable in
>     rpcif_{enable,disable}_rpm
>   memory: renesas-rpc-if: Fix a reference leak in rpcif_probe()
>   memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static
>     inline
>   memory: renesas-rpc-if: Export symbols as GPL
>
As these are fixes to the existing driver will these be part of v5.10 release ?

Cheers,
Prabhakar

>  drivers/memory/renesas-rpc-if.c | 28 +++++++++-------------------
>  include/memory/renesas-rpc-if.h | 13 +++++++++++--
>  2 files changed, 20 insertions(+), 21 deletions(-)
>
> --
> 2.25.1
>
