Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3B750A43
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2019 13:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfFXL5N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jun 2019 07:57:13 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33447 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbfFXL5N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 07:57:13 -0400
Received: by mail-oi1-f194.google.com with SMTP id f80so9557502oib.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2019 04:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9MOphVmnDcCoY9bNa+B8yU8DMwKC7RiOMtXWqxIQ12I=;
        b=JOncloQPau64nPBvSzbWpPq/S34DohGvoRwQ1NjAERy9GXx+459rSct5hf/cPYdpIH
         VmqQG9+y692EPRG1UKD9U0QkHxV6PJZIBEwZMYPonOrmZDzUVJP3fA9yMF3zAJrKKbo7
         5CRRSAvoW6QFoxNo1Co4KJ7fBEoWmivmdZXINiLZsqp3OneuHREsLnW2j5yND60l8ch2
         jyN7gUxz7f4nBVfyohcaFKKHkgyYjhw9B2pXzdrR6dizt9Um+rNAip0CAAEtdFGj0IVP
         CW2V9c6Nj7pt5lCV07USiV+4RnCLsvd2wQOzdmLLXHHdgn8pQ8/bopYUU8YVq7mfk+KY
         M5HQ==
X-Gm-Message-State: APjAAAWmZjxa5qpPQx2o6/vJxWyGwYHSObtzdlPxcTwmYRvue246k69b
        ly2GpsIBWL35z1Qxat6bMATfafHzSQpxwyU02IY=
X-Google-Smtp-Source: APXvYqzZxQy7QPEmHD2I4++tL3gjeZrC/62gDtRd2Ss6n/tHVXVfpsTMoJQNLAGpLAP1iqxaWkFhsDLJqbgGIxqRHLU=
X-Received: by 2002:aca:3bc6:: with SMTP id i189mr10196765oia.153.1561377432658;
 Mon, 24 Jun 2019 04:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190624105224.23927-1-horms+renesas@verge.net.au> <20190624105224.23927-3-horms+renesas@verge.net.au>
In-Reply-To: <20190624105224.23927-3-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jun 2019 13:57:01 +0200
Message-ID: <CAMuHMdVFHR7x=+nhMh6y+pEQw1CFabgL9hpDSYXJeYY3Q1Ujrg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: r8a77995: Add cpg reset for DU
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 24, 2019 at 12:52 PM Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> Add CPG reset properties to DU node of D3 (r8a77995) SoC.
>
> According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
> level so specifying one reset entry per group is sufficient.
>
> This patch was inspired by a patch in the BSP by
> Takeshi Kihara <takeshi.kihara.df@renesas.com>.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
