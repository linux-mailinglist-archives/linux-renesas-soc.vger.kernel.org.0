Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4F02642CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 11:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgIJJtc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 05:49:32 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46547 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730082AbgIJJtR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 05:49:17 -0400
Received: by mail-oi1-f194.google.com with SMTP id u126so5303261oif.13;
        Thu, 10 Sep 2020 02:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n0TKrJTRREWx+qVe0GGlUx2oO/59rH6hytbSim7uux0=;
        b=hU1Z/dAxTepLENxIDBktiZb9Xbwr4BhQD17F7ND0nhfYmL1JSeYRfS/6q1TJz3LQjb
         Z78sFdi6gvE5+xps80kfSxcjtZd2FaHZBS5ucri8yAyU4P2ilHhq3Br9CRSo0c6rvY2P
         8H8vRNnonQPB2/dI00MEKHQpjgBGdTzv7BFqNM57x5GFnmBiZNCUSpvg6ub/ik1L/GiC
         lPR4MahQhgDSC2pfOGHc17wIg/lPmC5SdpOSJIEOLfxWiXgSA40cfBQF9B9d+yjY0KyA
         K5T5AjbHjxnNQtQA4MOLKqV6slF4fuKQj/ip/Nw5v3WsC3aTWX6TQEGCBPNurla5qQ66
         9ccw==
X-Gm-Message-State: AOAM533xPGQIof90G92CCjgC6wQTD2n9PRebVDdUv08MLfcK3JL62nSx
        ebeBhr8KwYfHeFgBXCY6h/OkD2TiQQQxl//nFBE=
X-Google-Smtp-Source: ABdhPJxnT/vf2N1+yWJeFysPFXQogN8o3KOR5Mj57Mv60k4+/TY54wI+qZZ63QC/ecT2fwnb/Qiei2Z6P8v4RQMyGM4=
X-Received: by 2002:aca:4441:: with SMTP id r62mr3026774oia.153.1599731355901;
 Thu, 10 Sep 2020 02:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com> <87eendrtv1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eendrtv1.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 11:49:04 +0200
Message-ID: <CAMuHMdUj2dPe5p4O6ApAs_RoB=DR3NEBENSd1ZxF+msN8GJ+_A@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] arm64: dts: renesas: r8a77961: Add DU device nodes
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 8, 2020 at 2:35 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds DU device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
