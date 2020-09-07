Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A7625FD03
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 17:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730079AbgIGPVG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 11:21:06 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45390 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730110AbgIGPSM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 11:18:12 -0400
Received: by mail-ot1-f65.google.com with SMTP id g96so12474915otb.12;
        Mon, 07 Sep 2020 08:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gMIeplfOIYBeXg87OauSkaEFjHQu8iny75rFp+6XgYU=;
        b=KRyo3pvKPAiH5phfGpnu1n/NTdPVdoKLDVqZfEKiurv4sVTkTQsxh7zUe3fuS9kTe+
         O7OHQE9iz7FtIotIN2ow07HSWtgSrUNUrXnAgY3GQWoTSdpUJulx0of0Lc+pf8dwVFzW
         nOexLMbIg2R/tpfRHm3rse9F+VSGaQ/iHCZ8HYne4nVV8ONEMpD3u9V5zlz09I9Bl5QB
         iHA5UrtWxcPaVbDcqj+fBsdSWGZVca/R+UthBxMu/0CAQwh7bcIVV4edK09GRzmGofby
         wb0ixWWf9i4RGGOvJyZwPNt68sKUgE7jpyr6k4hNVr5I5njU3ImoLBnNn3U6RojBM3Co
         DluQ==
X-Gm-Message-State: AOAM53190KmjV9zOKd77vQC78uMfV2P4aqK0U6p7FCR9CME0yO48obhX
        0U3Su/D5QiKYshxWgpcpyLcA7wfcgZLox4cNrEU/nc/G
X-Google-Smtp-Source: ABdhPJwL+05hdkopa0MIF9W1CBL6HFgybeu9Ue4c2x0Be04LwhWuvb2GnT7UOxEe3ZGsazpwPHOPmCH2ltEbTRvSyOE=
X-Received: by 2002:a9d:162:: with SMTP id 89mr15214661otu.250.1599491891261;
 Mon, 07 Sep 2020 08:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 17:17:59 +0200
Message-ID: <CAMuHMdX9qr9Q0zAgNCS+iGtZf1J0DTg8DunX59j9YbC_g9VmWw@mail.gmail.com>
Subject: Re: [PATCH 01/14] dt-bindings: arm: renesas: Document R-Car V3U SoC
 DT bindings
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add device tree bindings documentation for Renesas R-Car V3U
> (r8a779a0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
