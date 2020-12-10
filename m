Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC352D5AC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 13:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgLJMmt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 07:42:49 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36832 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgLJMmr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 07:42:47 -0500
Received: by mail-ot1-f65.google.com with SMTP id y24so4700589otk.3;
        Thu, 10 Dec 2020 04:42:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SbywUHfxiOfCKevo8kgPT+2gmwbtXlw9HIdds9wF3Wg=;
        b=ZqVMQUn+CBntT23w1LwW5MhXxnjeCko9YF8RG3ROt68yXq8bJP+wXdOPePd6Ysp1gA
         siQc74deKqJGEZdi9SDIZpZKBwQNb7MA5fA+QgjHqLVqq6I4FSJsGWWQv2OGnpKxAGHv
         Il82L0yG6GXt7dzpcZPwAnSaTaf+js8XPgDdzBo7XEMhhrrs+B3flKVTqgqQEBqxTM4N
         se2PdgmJfnSre+69cv/BkC8xLxu0S0HHRBYNmrHg6vtuQczc2BWUPRHVBIGp57ZCJZ6Y
         exTDTXd1rH3IfffNUH2Z3F03JDdhWpDMh8chTGmnpWqhQAy+qPv6Jh3Q6i7mVszub3MM
         D8bQ==
X-Gm-Message-State: AOAM531NDPomM5xi++TOOwYkZEk0WMsUpWr6Wvh7QjFu6B4hBjFRHsbE
        1qupO2FvExnRG2iWnUgO/NBNsiBduxI0lcmUgSLZY0d4wSE=
X-Google-Smtp-Source: ABdhPJxPtr/2RI5TwNa0irGhVZSSxkqr+uZk2ThZW3Uwq9vyr9IFhe/qviIhaxNb3Ym2GtxVsSU8OJb/vspmVw7/q0Q=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr5620532oth.250.1607604126933;
 Thu, 10 Dec 2020 04:42:06 -0800 (PST)
MIME-Version: 1.0
References: <20201209195343.803120-1-niklas.soderlund+renesas@ragnatech.se> <20201209195343.803120-6-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201209195343.803120-6-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 13:41:56 +0100
Message-ID: <CAMuHMdWtR4KEFj9Xri9BoX2outEfDyd3neU+eT6xpHQpwgPYyA@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: renesas: r8a77995: Add TMU clocks
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 9, 2020 at 8:54 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This patch adds TMU{0,1,2,3,4} clocks.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
