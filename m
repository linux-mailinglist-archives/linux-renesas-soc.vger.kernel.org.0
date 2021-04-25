Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A127B36A8E4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Apr 2021 20:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhDYStY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Apr 2021 14:49:24 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:45844 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbhDYStY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Apr 2021 14:49:24 -0400
Received: by mail-ua1-f53.google.com with SMTP id z34so413618uac.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Apr 2021 11:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TtuZsZu9uyjYLDBMykB5ADZ5WnbJukvMrcP4dv7ZbEo=;
        b=Hra8kGYQwzfv4XKjZDDISXI9/rJ0Ww1/Q1zyIRAEi7oXFr/HRDZ81oQGAWSomRyQUN
         BhrfkvO6eyldU8qUgdn4oz/Im89oZOXKjsRm3dDQZBTnnytkp7i1JpIbIgUfq51dbdu0
         u1aXXvLcesHiWkZh1PX4a6cevp0DMVsKmbT27fNxdAIWEOP5jDiIazRcWlPxtgyruNo9
         XyufbhOmp8Kx6+ybgkzr4qPeQKXrp56h9KMoDFDJKDZ/BIznsD9JGDOigOWGzw7w+rUk
         Vr5lbJTsGRjV8PqsKABFbZJeAVo/9ookzUDXStcV497blqeztpqHkcjTb6C3uY94/26k
         TSXg==
X-Gm-Message-State: AOAM5325udxe/P+66R/fjQ96mjJIWfjtFSi/HQjxppgqpYIw+TK8bvJk
        y+x0CscNZgUwA14ZO0BvvKc5d7ZJzqFXomN0Dewu63ng
X-Google-Smtp-Source: ABdhPJwicsKpJRZUqGzImW1SBgdTpdji4ihbcwCgFyndJTtysQR5CIskqs+rCflUq2qd5TJ0S9j8iIaUKKxW0Epl4tQ=
X-Received: by 2002:a9f:3852:: with SMTP id q18mr9643652uad.58.1619376523502;
 Sun, 25 Apr 2021 11:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210421150221.3202955-1-niklas.soderlund+renesas@ragnatech.se> <20210421150221.3202955-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210421150221.3202955-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 25 Apr 2021 20:48:32 +0200
Message-ID: <CAMuHMdX1RdJNrDkx+QhM6cE6nRNyUMWS3o_u0fn_NBT=nqiS2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: aistarvision-mipi-adapter-2.1:
 Fix CSI40 ports
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
> Fix the DTS schema by explicitly stating that the input is port@0. This
> fixes a schema validation error but have no runtime effect as the
> default port number is 0 if not specified.
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
