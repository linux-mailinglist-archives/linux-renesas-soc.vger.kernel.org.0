Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1B51FF101
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 13:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgFRLu3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 07:50:29 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44230 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbgFRLu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 07:50:29 -0400
Received: by mail-ot1-f65.google.com with SMTP id e5so4255039ote.11;
        Thu, 18 Jun 2020 04:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MxRREJ3T6C8k8A7ENbpAiVgpADJaS0fb0gsm0biIfB4=;
        b=eg+K2Ecq65s36rBvpU7huFF8F+9vm20ZdPrqn5qfunBVYAqwbUq+muciLnwomwj7NE
         MFc95blYpQrcecdggJJURRrd5SPWtbfaeL7a+0VvZ+Vbnnj3lvPNjK/M9/QTnjIDaOxE
         psADgEDIfKwX9s6tdzV8UREaCYqNlUf88VX/L8XPSgs2C/9IJ7wUepvuxkj81xrd70bd
         WXtxwoJ8WmrnkAnzcqCGCEDOcnwsz5SStxE9hOPrIV3NSU2mETFQqOP6VtbAfUcANTuC
         y1CiVdkEE2MvsZGv3vkxYce9cL79VOUxgnat/JiVWqgVvyNC3K6YDK+Z30po5LScOJZ3
         iENg==
X-Gm-Message-State: AOAM533EzdferGlaabe5Lugqas53f5sxm6TOWByoVPJdcRcEOvmNNZ84
        37QelhuvbpkaVWsBwfuWvMnpBw1NM/6twVFNnGg=
X-Google-Smtp-Source: ABdhPJzNHzHb8WQhbGPvF6sd/uLkLii2WKQChIY0i4iLEsm6d4rmvRnvr4LoiJqfuRqm/cWoqcefJSyJgNxxbUObzmY=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr2967232otk.145.1592481028549;
 Thu, 18 Jun 2020 04:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200616162626.27944-1-uli+renesas@fpond.eu> <20200616162626.27944-4-uli+renesas@fpond.eu>
In-Reply-To: <20200616162626.27944-4-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Jun 2020 13:50:17 +0200
Message-ID: <CAMuHMdV4S4upH_CVnc7f78GR_K0J36Gp+04TwBc9CYw3yJr3rQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] clk: renesas: rzg2: mark RWDT clock as critical
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 16, 2020 at 6:26 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Ensures RWDT remains alert throughout the boot process if enabled.
>
> This patch applies the change to the following SoCs: r8a774a1,
> r8a774b1 and r8a774c0.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
