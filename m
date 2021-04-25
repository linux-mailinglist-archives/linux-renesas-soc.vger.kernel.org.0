Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF1A36A8E5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Apr 2021 20:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhDYStf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Apr 2021 14:49:35 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:43827 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbhDYSte (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Apr 2021 14:49:34 -0400
Received: by mail-vk1-f180.google.com with SMTP id p9so6581312vkf.10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Apr 2021 11:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0WNR/Iiyd1BSfLxt6ZIbtFEtZGfuM8o0SF4qUW0BhDA=;
        b=mnEncxnu59dQMQw0zcjyB4IxaAg9P0Uxuv/JrAW9+5RyClKEOZgxRjTrQlAfvSuSNx
         3vNRzpnrMqGsL3FyY8ntnwxcPhi4THl8+iD9TRPOcnNPo3JgXoFocY/pYNLeMaXbE3Ty
         FdxFAwEnq0f6Tety+4kHjrKbknfneG+lsOOFSmDIQfXZ/Gnmsxz2mjaDS/VnhQs0BSEJ
         F5oepKyBK8Jx589XguZs67H8EA4RXej/Oc63tIpoBR/SNqRX1DJ0cQlNC1wYECQELWvG
         OJoCWecojkygYEr7VUiss3N0AlJdCgxRUbp9KXYCFSd826AKvvHj1ROe+lbuvbfZiluT
         7cKg==
X-Gm-Message-State: AOAM531+IxGvc8OlCUjIuZeXUAKdsBh92lXqYy9fsQFHsRrY2SSoLKxB
        txo7AF97J0HeOwkEn8l+F6hzKS7vGlRYlW8wPeMX5U2o
X-Google-Smtp-Source: ABdhPJx1Q01Uhg7HUVXa+PElsQVS3aM0OC/O7OUa7pPKpNXq8DN68fodd9KFfYnq8OwTimtnNkZpgEU2aS1cgByJK/w=
X-Received: by 2002:a1f:a388:: with SMTP id m130mr10174064vke.1.1619376532830;
 Sun, 25 Apr 2021 11:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210421150221.3202955-1-niklas.soderlund+renesas@ragnatech.se> <20210421150221.3202955-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210421150221.3202955-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 25 Apr 2021 20:48:41 +0200
Message-ID: <CAMuHMdU36hRyyk0HrMurdbY5fyiTgdy+fJQYb2mTV1gXKshYHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Add port@0 node for all CSI-2
 nodes to dtsi
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 21, 2021 at 5:02 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The port@0 is a mandatory port, add or move the declaration to the CSI-2
> nodes top declared in dtsi files instead of depending on dts files
> adding them when describing the external connection.
>
> This fixes validation warnings for DTB outputs that does not connect all
> CSI-2 receivers to transmitters and thus declaring all port@0 nodes in
> dts files.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
