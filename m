Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82BA72DCFA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 11:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbgLQKn4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 05:43:56 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:34761 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgLQKn4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 05:43:56 -0500
Received: by mail-ot1-f50.google.com with SMTP id a109so26781005otc.1;
        Thu, 17 Dec 2020 02:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=blbeuBqoR40MzGeKrBYrMKYeIiq7CQpLFY+gQSBqfCE=;
        b=UK7awK2erIXSs4Dlzh/IxRytlKSIIa4mwkqxWjHZZAkQoELerkUIWwDEa7He+WA2qQ
         5rKN+5aGb5r8RoyN1uJvd9rMPA2FNV7MEN4EsQAtQMfcUJMdRMbhr5WRMva8RHmiaOhJ
         CSYcRO6aM6Cr5m7W6u17CokTU5HA0pRc5Z+jMZBTteymsGeWO3tBI/E/bb+Qgo1E47Ha
         TvAy/c6YCewHMuiGnzmvhmo7tUdJSAFq0HaTyEnqjl7nON220mD/Y7+E8kaJqqEQ0vBJ
         PA0pMWMNL+dk/H3C6T1Cy5yeJZaCxYU7SLF3ZDO4HpMwxGBLSLuzSscgC8a+jXyS9ZUP
         UGzQ==
X-Gm-Message-State: AOAM530hQBecamRhtoKkV8j9DFPpmLG0wtgaD9BzPJdr2far7fdbSoz4
        0laEUa2ddlFq+ZRKWjZo9u2dRxisDeM8ZGlrJTePb/Dq
X-Google-Smtp-Source: ABdhPJw4QU3Ngc4hUpCTE1vaTE9q2XF3PzeeLfnVr4OaaRURG1lGNcSGYHaJR3E/WbVsa4VhG2P2mmonsWgxX+3MYXk=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr28919780ota.107.1608201795409;
 Thu, 17 Dec 2020 02:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-4-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-4-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 11:43:04 +0100
Message-ID: <CAMuHMdW+NuM86Xceh6p3Pt0DRt4qvzzp6gdU3j=q5Q6FEYSSQg@mail.gmail.com>
Subject: Re: [PATCH 03/18] arm64: dts: renesas: beacon kit: Remove unnecessary nodes
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> VSPI0 and VSPB are already enabled by default.  There is no need
> to add extra nodes to enable them.  Remove the redundant nodes.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
