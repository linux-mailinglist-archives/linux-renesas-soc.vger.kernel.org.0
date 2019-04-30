Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8CCFB68
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 16:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfD3O0P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 10:26:15 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:35138 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbfD3O0P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 10:26:15 -0400
Received: by mail-ua1-f67.google.com with SMTP id g16so2136780uad.2;
        Tue, 30 Apr 2019 07:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LV60JUmsKe+xxcoFUAG+G1HpS+2dysQqcpC4hGzVydI=;
        b=h4iv07PUBfSGbgiIKqvC7u1cdqVzAiIhR/WGd1G9KJtFD0t1lZhtaALXCEahpYzO+Y
         41vWrsdk6rAW6Ew+WAmID36aGAII47WXCkBlw5750V41SyBFBMHsyHDNgkUsT9te+dZP
         vAidwCkNezK+gViQPkjxsHLrt2U/vOFvA5rBzzZ0fVrnXoHqC6QwkWiBQsmKp12CwN1Z
         vbCG72OlOVvosJFHoNjOXAcbe381CsixzXgbxFKmNtw3fEUQjWB0qgzfgy5bmBgQk+mD
         3XG8z2D3ZT4ziqwtDtXFU4uZOKWsSJvM2rWCv+3muBNQ86CzPMV8oWA+7a/pO0RynvQ6
         Ezew==
X-Gm-Message-State: APjAAAWauu7rsZfqX3ts7ThqcVyXtDegaO0upHIqnCepFb6qtZTx4jtZ
        zmY5x37Pd10/NifHufsP7vvKST3a4ZPmTIccjEE=
X-Google-Smtp-Source: APXvYqzPpLguB66nPZuVWyOt1UozFB4y9+eIElgvu0YoszNcJVHdgZBsBz4j03ptrMbskVYD1d+eUACSWqDTXeC1jtM=
X-Received: by 2002:ab0:1646:: with SMTP id l6mr34506865uae.75.1556634373973;
 Tue, 30 Apr 2019 07:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp> <1554443049-25127-4-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554443049-25127-4-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 16:26:01 +0200
Message-ID: <CAMuHMdW4sJK-3s87RTfCjt_ioRBnpp=O6FEO30uF1Fh7CMgG5g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a77990: Add CMT device nodes
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 5, 2019 at 7:44 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a77990 SoC.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
