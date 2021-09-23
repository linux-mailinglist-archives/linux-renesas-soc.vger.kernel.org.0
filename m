Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCC3415A65
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 10:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240019AbhIWI44 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 04:56:56 -0400
Received: from mail-vk1-f170.google.com ([209.85.221.170]:34566 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239986AbhIWI4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 04:56:55 -0400
Received: by mail-vk1-f170.google.com with SMTP id z202so2313822vkd.1;
        Thu, 23 Sep 2021 01:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pn3d8p5WEmjlwHUyeMcb4ZqHn6KLoL3cOsy+Hfcg6Hc=;
        b=GxAC4hGm3cLdncpa7QsByQ7D/kPBK1fEROLDdktoc5R0MqzVU3QtPwiLOZ9Xy7DCEw
         CP0GLIB3r8wrdNfwGY92f2weHVMM5dAyiv4zUXVBBNCBks2pNXPCDHSJKGctvT3kB88J
         7Wx50bLr67tVEHiMOKEU9WXfKHBWXC5deXRCJ5wUtXCUHMcFz8F4FFUyZ2ZqGyoWJVGI
         VYoEC230MgjmCJfdlQDJrQZ0KoGedFz9D/da0zAKqTuOXpBX8xqdL2tsNbwAIOJJCuhi
         4K3Xl5JCuaEYrK3Ck5KuX2QbkaBvr2N6C0r0qI3Ur59Cz7mcgwwqkiwFKOY4S0kdQZ8a
         14Mw==
X-Gm-Message-State: AOAM532oqrS5hrUXs9fi3y5kE3yCHXvQHucX0qpTT6RsULnZ+KmE9mgn
        r0ot3S8Kfon8f6J5ZqHJ8ljrbMYENqXJlFkTlzM=
X-Google-Smtp-Source: ABdhPJy6mWvufMatGi7BXpFlQVW0DHT6LYg0vfeDZyBjF9wvKy+uQsuOXJohw5MaXtg+csS8iEsDZ1sf21Dw0BhoRu0=
X-Received: by 2002:a1f:9187:: with SMTP id t129mr2450912vkd.15.1632387323519;
 Thu, 23 Sep 2021 01:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210922085831.5375-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210922085831.5375-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 10:55:12 +0200
Message-ID: <CAMuHMdWACcp8qzcDfQrUQLOYaE+M_6J7LC8vR-yrKKJCrXDf1A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rpc: renesas-rpc-if: Add support for the
 R8A779A0 RPC-IF
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 22, 2021 at 10:59 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
