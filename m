Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214622D75D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 13:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395431AbgLKMmp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 07:42:45 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41237 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395441AbgLKMml (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:42:41 -0500
Received: by mail-oi1-f195.google.com with SMTP id 15so9648130oix.8;
        Fri, 11 Dec 2020 04:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+7WIW3A3Bm+5WOcwiEqhFWKmpAT1qedk7oxUv0gmmvI=;
        b=FV+OTET7ILLYdAm+UwMhdUhg2ts/qMYaFUcFf//+6wctZLRX+HPhxpmFZLECWG7NKh
         DETqZZ9/R/DQ/kCmvnda0kAw/DkYZ9EZZjMFTWY8vTq2V7634WbDeSr5ZBqWCS7f7Pco
         JFOw77v1LmsD9p2UqfHwRDAl6mVTQG2VclsstrLFt0hpiUQriePoj78ko9SiBWYnbjF/
         j4x3UgoD26jV5lPmzNlSFRVGDhqixEAHPKhRTlpeNq55Mm/63ZEMkQXsBBET9moDNTH/
         14fLEKC2NKz5QEtMZfa2R1kRPuF2cfReSwxhR1ef+GFlNgft+QUFCTMMwQZijce73esR
         d9fA==
X-Gm-Message-State: AOAM532vYIYaOYMNRDkxsoYlnVL5kucInwVhPdrl2VZlHn6buCi5pyV+
        eBc7q1l34/iW3robCu4LvWSSs3xerbY78FUQFKA=
X-Google-Smtp-Source: ABdhPJyHa/dGMenO/XzRMD7Ee4J8Wy+qrkA7ooLLGa0XBz64+9Hae/dkFEZCgdJb+rPN7Nxn30RxH3cvkTYLsK5BIoI=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr9017005oih.153.1607690520321;
 Fri, 11 Dec 2020 04:42:00 -0800 (PST)
MIME-Version: 1.0
References: <20201210152705.1535156-1-niklas.soderlund+renesas@ragnatech.se> <20201210152705.1535156-6-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201210152705.1535156-6-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:41:49 +0100
Message-ID: <CAMuHMdWGqePbKgY3RNBL4nkXCYTd4XrjbDbHa6ESctQSjCE0Qw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: renesas: r8a77990: Add TMU nodes
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
> Add device nodes for the Timer Unit (TMU) on the Renesas R-Car E3
> (r8a77990) SoC.
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
