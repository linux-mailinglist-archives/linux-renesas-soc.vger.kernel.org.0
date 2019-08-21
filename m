Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA56297579
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 10:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfHUI54 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 04:57:56 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38445 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfHUI54 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 04:57:56 -0400
Received: by mail-oi1-f194.google.com with SMTP id q8so748693oij.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2019 01:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BcgOugiEfu/sl/GJ2HeNJnHlOVsMexHqTjarEG68Ugc=;
        b=N8V8lq/2I/37CR4xoOlRVFmbBkQgyldi6KU0gytSC3GeKWhp+EivXNRG95Xswno2CN
         DaZCz8tmtb7xqwUplQLWpT9cqahBUxKMxF1Su2T70BaUEU/7cX7n0MbedQ4ps+VDpKx2
         NNBwVime4HW9iLfvW2FTTV5a+cmgvu/Q/CdAzcvE8MCym1AU8zq5TLLrTFE1oQwaQ8ix
         QRswY9Oxt2L3IEOLsnY8rae/khrmT5G/CfWl4tw6b1dOPw2iSGT9J9azAgyH1CHOe+Ey
         4IKzriWzd+nol17dCPzT8ra33YE7ruQnylu42hcreF0TlbxE1rSGiRikF5zlUZ44iVVn
         qcYA==
X-Gm-Message-State: APjAAAWFyidFANMgoW9D2D5jMR+zH3/On4vm8AtoozDEKFWCSnqHyTQH
        ptuMTbdGZ8C1RgOisBI3CRZRo6gzw0PfCZ1y3fu2ScX5
X-Google-Smtp-Source: APXvYqxy6y8+5J1tomQwt6QbAg4WUtYsCs6uH22hUxo1eXXdcOai/ieQ9TtFJITM+FVtdUmrWNQN8vajebdRIle+en4=
X-Received: by 2002:aca:f4ca:: with SMTP id s193mr2823128oih.131.1566377875587;
 Wed, 21 Aug 2019 01:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <1566219361-23088-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1566219361-23088-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 10:57:44 +0200
Message-ID: <CAMuHMdX_v4d_H6K6acr0C-BR8tecHj7egT2jHh97nxu0aPiFKQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 19, 2019 at 2:56 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
