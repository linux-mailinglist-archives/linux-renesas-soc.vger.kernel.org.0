Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696FF336F63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 10:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhCKJ7W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 04:59:22 -0500
Received: from mail-vs1-f53.google.com ([209.85.217.53]:36354 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbhCKJ7O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 04:59:14 -0500
Received: by mail-vs1-f53.google.com with SMTP id a12so10381956vsd.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Mar 2021 01:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q9Hmk4Q41xlS3fCvju9vFWHe3RBtssM59cDFgusniP0=;
        b=fwNc/dsGKa23p5iB6Ce+rdmdILln/ddP0AF1s2BLDJE8pIE22QWTvMqPC0x3+n52xt
         HS4Fm66KJLO3CB2MgeQzE6Lo2XKz9VhhQyfWvI1NrdH4oxDUsLz/vWrtCZ8YX/YENiSO
         LsRbX10lFiO3va+mlqmSfif7Ms9E0wW8zFA6NIqvDBKXXZym5fvwNicQuGRAGewk1xCN
         /OXd/FCjEcTVzPSnfESC8EvLlC/QzAmjfGo3+9N/iCrrpYaUOUSLJYnfySfRg4Xhs1g+
         pyAFTNYoaoaQsWlhgBnGKHNTMzD/wPWcvX+7w9CfgW1Ya/mz3FU+oxvx85qSCkJHq31T
         QOgg==
X-Gm-Message-State: AOAM532nE+j67uuNoMooB1H1rcZ2sq3SaNKsKQCnyX8A5ZnKawRCA7HH
        7AC2WvURR39XI1nC4Tm6GPf5PbknwicWg33vaTLRtrNa
X-Google-Smtp-Source: ABdhPJw0Q0TAAQM0jvNo9kLrJT0lGAb6OnscHyiyWo1c8zyu12KSZgvyuZjldaNN5aRD0N9cHMchGR80E9lpTJJm7p0=
X-Received: by 2002:a67:8883:: with SMTP id k125mr4947818vsd.18.1615456754022;
 Thu, 11 Mar 2021 01:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20210311092939.3129-1-wsa+renesas@sang-engineering.com> <20210311092939.3129-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210311092939.3129-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 Mar 2021 10:59:02 +0100
Message-ID: <CAMuHMdVV-D3j=kUZA+StJXGcShuFeYqa1gj_CGQKDCVpSEXUEg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a779a0: Add CMT support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 11, 2021 at 10:29 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Phong Hoang <phong.hoang.wz@renesas.com>
>
> This patch adds CMT{0|1|2|3} device nodes for R-Car V3U (r8a779a0) SoC.
>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> [wsa: rebased, double checked values, corrected sorting]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
