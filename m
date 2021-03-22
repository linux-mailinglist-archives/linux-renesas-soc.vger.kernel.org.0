Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B693440AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 13:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhCVMSG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 08:18:06 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:44697 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhCVMRo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 08:17:44 -0400
Received: by mail-vs1-f49.google.com with SMTP id v2so7317816vsq.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 05:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QPgEpzU1+EhZmQwMgoUtTQpTOrmK2g2nAYsCnP+ZK2w=;
        b=EhDGZDf+evVtAiLvbyqRf2yg9KReeMmg127CeTDQSKN0AJoN72hsnO99w8nSCUlf1Z
         yRCgAXZ6egm6w2YHCy6E3yO8sALULJUwDya+mcDdGnIMznSYuDKccpjccYksQLXSpko7
         /3V07+lhDdMTuPd8eslQ+c7jsm1Fi8LkP7pOPxqG3ID5+TUfxxknh9njWyIf62yDmA1W
         20uBuuNXvHLTVfxLyKddYiqutHqW6AzZ5M3FofdyjmYMOz8a0BcVvw4KxvQzsry9zzPv
         iAEnaSFMwibH2pETCmjVYlXe08VOdteuSpbGTBILnSsE1gj05Io/he8dBSRR3ULSXWnw
         I+Mg==
X-Gm-Message-State: AOAM530pwwVxgUin9urdcYGswOOEF3ohmp1S/fIWxjLWNLACnf0bRRu6
        6C5VXbsVPcCt+i+7Ae5L4z+ygTZcVM12SyeGp2U=
X-Google-Smtp-Source: ABdhPJwVpWGzwO18L28qFPoAsIXhxBH6cwNId9V4e47Iag3AKYxFvIfKgJVUUZMsFRnCrLQwRjfrVXfpCs5zgCYtcVg=
X-Received: by 2002:a67:8883:: with SMTP id k125mr8816445vsd.18.1616415463497;
 Mon, 22 Mar 2021 05:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210319085146.2709844-1-geert+renesas@glider.be>
In-Reply-To: <20210319085146.2709844-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Mar 2021 13:17:31 +0100
Message-ID: <CAMuHMdXEhw2ZWBk0mw+dENs0TAurHnvt35s6bMX19oQJMhHdXg@mail.gmail.com>
Subject: Re: [GIT PULL 0/3] Renesas ARM SoC updates for v5.13
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 19, 2021 at 9:51 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.13.
>
> It consists of 2 parts:

Oops, 3 parts.  Sorry for that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
