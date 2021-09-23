Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80594415A69
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 10:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240057AbhIWI6a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 04:58:30 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:44550 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239137AbhIWI63 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 04:58:29 -0400
Received: by mail-ua1-f52.google.com with SMTP id 42so3766308uak.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Sep 2021 01:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9T6jY7wugKCvr//9ZJg7Lj3ZjGX2cQAVIMWCgIFc9/I=;
        b=E3Yr7rPGtWTFGHWseYMGyCEloprJ+rjj+FsbPubJ2hpYLupqVnWZ2p+18uQ4qoGUZS
         /uTc2cPDE2gx7KRLQcpitpx/fZKkwluvtgrQt6EO4k+OTChovNnmRARjaSkXL0yDhZM5
         /1p5V/eV61+fBF7+bAbP8uD5osGUMYmZ/Bu6wrYSEV99RWWziPw/kbscMrtgYD8dn24b
         ETPE2VjT8i0CC3u+EGqcpzJWsy855orvdkK/PfHFzgCS/9y+kjPLmhd7bj3tzg6pc3JY
         FqiQV6Ro5HqZcVVkMmpuZ38i/EB/jSIt75ldvcFlu6uCNF2PGHL6kOqvdFG08EHxNDBO
         i3qA==
X-Gm-Message-State: AOAM530Pb1wsRhgXct1GXJyuTVBTEbpRMRjWYdT9GoBbuBu6QFsPcy+4
        B/n7i7seKEWfYCm9DRH4yYKotDtwwDJyFJOz02A=
X-Google-Smtp-Source: ABdhPJy96abaUWZ9Ga8sK2X5IxTlCfvKr6LpnR6DcliXgbhF54iBp6wEBIAepzLxJGW5dPD5w59HHD6zqGwXbfrFPHo=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr3155073ual.122.1632387418255;
 Thu, 23 Sep 2021 01:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210913065317.2297-1-wsa+renesas@sang-engineering.com> <20210913065317.2297-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210913065317.2297-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 10:56:47 +0200
Message-ID: <CAMuHMdUNPb0m-DrdPRdajhZ+Z_7meLUWe0F2Et8NMktQDOdjfQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] arm64: dts: renesas: r8a779a0: Add RPC node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 13, 2021 at 8:53 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Duc Nguyen <duc.nguyen.ub@renesas.com>
>
> Add device node for RPC on R8A779A0 SoC.
>
> Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
> [wsa: rebased]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
