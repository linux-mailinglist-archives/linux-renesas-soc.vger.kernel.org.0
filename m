Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269852D5AC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 13:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbgLJMpC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 07:45:02 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40370 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgLJMo5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 07:44:57 -0500
Received: by mail-ot1-f66.google.com with SMTP id j12so4700221ota.7;
        Thu, 10 Dec 2020 04:44:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FPboMu+VTnaE7RaGS2GLxEoRVAtRqULfU0L65yc1PQc=;
        b=AHpgqtHviU06sdJDfvX0uB799B52loORNLUpmRxU2Aj2TsLan2Ks/nB9E7CbRO+QND
         lStzKO8ATwpPFw0vTHXAF+9kFKwu0fIRPu5dFboHYuA6hgGinHntyn00CcGQKutpW+ni
         EFezSFUfApbE/BruO7Pjc+v/TBoazrCVqiInHhQ8xy92qZc5+LYMoDsqqHpVN81s940/
         KDN2rhrzwDTeLAvOlAvu0NpE/v7DflnDRrty8oSN8T5lc/nLDMSm1Mm+Ag1HgLl5UE+d
         TWTVeVT+1Lq3rwU8c2kvsuP1sHDJyr2k5TR8T0s/hez4K81d6IdbKoJ8jzpCHdaFBial
         BBWw==
X-Gm-Message-State: AOAM531og7fWO2QTPrEUGHGIJcWELOFTpHcd/Befw4b6MTDjvluhW4+I
        Kh9caGAMrcL19A7f6R7FFnaoWjhJFJ4kpwW3FHY=
X-Google-Smtp-Source: ABdhPJzu25NUIQwvwEhi4rxCWBrcCW4DYh4orSG6njm0I68zKXOr5Nl6ARHn+c+LOxYVjApX3lR7v38Sxg1WLoqU7kw=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr5625323oth.250.1607604256362;
 Thu, 10 Dec 2020 04:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20201209195624.804759-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201209195624.804759-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 13:44:05 +0100
Message-ID: <CAMuHMdUgo+4LyxBX-N+L5wWb9AGyOkVuAdm5RkTeQN5oCukF6A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: Document missing Gen3 SoCs
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

On Wed, Dec 9, 2020 at 8:56 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add missing bindings for Gen3 SoCs.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
