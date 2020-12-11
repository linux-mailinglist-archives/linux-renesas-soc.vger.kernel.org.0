Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5562D75CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 13:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395415AbgLKMlJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 07:41:09 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39516 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391766AbgLKMkS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:40:18 -0500
Received: by mail-ot1-f68.google.com with SMTP id d8so8057776otq.6;
        Fri, 11 Dec 2020 04:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sZC6YVFP85PKnOZHFsWuvPlPvuphh5kfYfzNbUUSwEo=;
        b=IlOZP0I9IIH9qo5hbDWlSgCNJvYwStEkXbl/DdYmGAv5BcDKPwpwdnfKrDwILH6qRK
         tXzrfTlAxh1oVkS+JUt7ytCtm70mtmmr9fiSza+Y/Cx6bOdqEdkP8Islr95CBAao4Tay
         q6+d0qiV5S8Mi/yxXNp70Ag/Auc1Va2InL7hAaYYU16kjRKo8Ofdf6Q9vZ7C42lOEPyR
         h6mS6loksAabb1h3jzY1XaduHqcKAyQtDoTWMu3DzaOXz7+0ZnfFT/dn+ChNN+HiHnNp
         NPZGCZeWJGCpZI3EMdKURT4K7Wlco+WDZPlRrtOI1dwClvx2fxQ/4SXGMaYONblsyRPh
         fLEA==
X-Gm-Message-State: AOAM533BRNTLaWGG6ZeVZMOG7bJP7MXzj002bnjNgepJXFsDWdd83oVT
        DB2XAa42WeDqWJzQPUaIpcpJ4o6bO+4Ucko+5T6P3YaL
X-Google-Smtp-Source: ABdhPJzUrcoHo9bCn4961JD8r9MHPv4laWc/KugzBvuO6Acj62MAqMF5VmQF0+nNxtYnFXK+9W2NRoPZVqIUHmPkQlQ=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr9673259ota.107.1607690377886;
 Fri, 11 Dec 2020 04:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20201210152705.1535156-1-niklas.soderlund+renesas@ragnatech.se> <20201210152705.1535156-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201210152705.1535156-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:39:26 +0100
Message-ID: <CAMuHMdXbzdJ-SqWUnTaqBfELgTObtvX+XDrdVi2-TfipfqUE+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: renesas: r8a77951: Add TMU nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 4:27 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device nodes for the Timer Unit (TMU) on the Renesas R-Car H3
> (r8a77951) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
