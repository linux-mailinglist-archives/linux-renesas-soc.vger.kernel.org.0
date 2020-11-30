Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFE42C85DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 14:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgK3NuF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 08:50:05 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33514 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgK3NuE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 08:50:04 -0500
Received: by mail-oi1-f196.google.com with SMTP id k26so14207105oiw.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 05:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VJR8SR1AVTqC/HcTT55QIh/fVY0Hi1xRVc/hROmrWvU=;
        b=Is9SiRX/MZ3geS5VBWPlk5fZiSbIKDa1SabXL/VX4e32qNc8Haxon84xdV0hn5Wf7w
         wIal2hZRotdzkoV37zHiB8KhHzzskoP9oiC3BK+0mLcLUtmS8SPJu7zEDCnn0jNy/R5y
         2syd0Ribao49gPoYABMtBl0bfY2od3+gfpPjRYs9m0cOR/n5j1uTR8azC88Ep3XrR553
         4IOt09CvGkK4DwQDjWYkTIb51ieV+aw4786uIfO2MZXRAvfWp5Oxy1zWtfxhD+RB1xIE
         H4uKTLHWuuij1ZbQvHbiRGdBhrLKsxoPgQQH11+y2gyYM11pga+jpaFovSHnoWWhcW08
         AJfA==
X-Gm-Message-State: AOAM533GuK/gX1mDyDGeebgUUrBEgli4TFkm7Fj0hMiCxNTMT7fZe+3n
        T7TnD7WdwK7qrFOWFpAJsrDSMQxuRTIvZhY5pgPQC5vi
X-Google-Smtp-Source: ABdhPJwiIQqyH5C4KNh4qTsz//7f7xHl10cfslZOug/UKkks3ae1IYd+6i6B+y1hOMRZD/WBeByNKni2+RwIVc7q1DA=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr14603265oic.54.1606744157619;
 Mon, 30 Nov 2020 05:49:17 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <20201126172154.25625-10-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-10-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 14:49:06 +0100
Message-ID: <CAMuHMdXsrU8Z+CoeqbNmATBwrSO2=7VeT4nVkU0AZLDEQQUTxg@mail.gmail.com>
Subject: Re: [PATCH 09/11] pinctrl: renesas: r8a779a0: Add QSPI pins, groups,
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Add the QSPI0-1 pins, groups and functions to the R8A779A0 (V3U) PFC
> driver.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
