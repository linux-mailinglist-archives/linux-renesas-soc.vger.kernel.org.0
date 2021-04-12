Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208DD35C4F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Apr 2021 13:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240286AbhDLLWm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 07:22:42 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:46803 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238992AbhDLLWl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 07:22:41 -0400
Received: by mail-ua1-f51.google.com with SMTP id v23so4078584uaq.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Apr 2021 04:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BOw8Zb9w4xHJ1taZse28RR3kjNLN3a7583crYWk8gl8=;
        b=M/HuT5KkNIV3EcfxLiSbciOqLE4HKHk0lqc7/qg9ceWceaqDp5+1375Kx/fngcjts/
         VyGRcIKwqLOPiF964n/b/YUa2r5+4XjHw4LuDlX+dEsm/QwdSKrwhnV2+qh+6euW2mvh
         MdCadIKbC742xtW2oPR0E6nNwtoXy6VooSaHzUL/BsfvpaNU6PDBQkhy6HHV2XUIC6B0
         QsUFbMAe3tufdNYFJap17vL6zTpWe4HqAHVPifFcOrWHwfxQ8RQSXPmaRGUaw0jmMeT4
         w+ldDe5MtOGT62r70N1H3YH9wj+VSJeWXE1taP0Q6Inw3JIcdSvuAjEFNoMyH0lnM/XZ
         Hjvw==
X-Gm-Message-State: AOAM530bGhIsbNHdoe6MynNQHTJDkm34n8xPSI1diPfMGZ+f1ZpWJ0bh
        VRTsDZ2zJObvfTmh17lTaWT9rgRcl4WQcQ6Z/i8=
X-Google-Smtp-Source: ABdhPJzwN/8I7ekYFgRmXOMQCCikWGGErXYZWEqFSkw6dmIHbUWE7b+UrKtmzgjr8PMBQmvA10PER2FVIpwY9UFT5+E=
X-Received: by 2002:a9f:3852:: with SMTP id q18mr9655708uad.58.1618226543535;
 Mon, 12 Apr 2021 04:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617359678.git.geert+renesas@glider.be> <161789462010.1629934.8245364544434971043.b4-ty@arndb.de>
In-Reply-To: <161789462010.1629934.8245364544434971043.b4-ty@arndb.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Apr 2021 13:22:12 +0200
Message-ID: <CAMuHMdWHLnXgBSjP7VKUdx-YNr9rSKFkE5Ge5q_tarU6HP9Lhw@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM DT updates for v5.13 (take two)
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

On Thu, Apr 8, 2021 at 5:24 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Fri, 2 Apr 2021 12:37:15 +0200, Geert Uytterhoeven wrote:
> > The following changes since commit c8aebc1346522d3569690867ce3996642ad52e01:
> >
> >   arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding (2021-03-16 09:58:00 +0100)
> >
> > are available in the Git repository at:
> >
> > [...]
>
> Merged into arm/dt, thanks!

Thank you!

> There were a couple of added warnings from 'make dtbs_check W=1':
>
> renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: csi2@feaa0000: ports: 'port@0' is a required property

The same issue is present in several other pre-existing DTS files, too.
Commit 066a94e28a23e04c ("media: dt-bindings: media: Use graph and
video-interfaces schemas") in v5.12-rc1 made port@0 mandatory, but that
port is not present on boards were the interface isn't used (yet).
Probably we should add placeholder port@0 nodes to all SoC .dtsi files,
like we already have in display, audio, hdmi, and lvds nodes.

> renesas/r8a779a0-falcon.dt.yaml: thermal-zones: 'sensor-thermal1', 'sensor-thermal2', 'sensor-thermal3', 'sensor-thermal4', 'sensor-thermal5' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'

I don't see that one with the latest bindings in linux-next (i.e. commit
9468e7b031876935 ("dt-bindings: thermal: rcar-gen3-thermal: Support five
TSC nodes on r8a779a0")).

> renesas/r8a779a0-falcon.dt.yaml: timer@e61e0000: compatible:0: 'renesas,tmu-r8a779a0' is not one of ['renesas,tmu-r8a7740', 'renesas,tmu-r8a774a1', 'renesas,tmu-r8a774b1', 'renesas,tmu-r8a774c0', 'renesas,tmu-r8a774e1', 'renesas,tmu-r8a7778', 'renesas,tmu-r8a7779', 'renesas,tmu-r8a7795', 'renesas,tmu-r8a7796', 'renesas,tmu-r8a77961', 'renesas,tmu-r8a77965', 'renesas,tmu-r8a77970', 'renesas,tmu-r8a77980', 'renesas,tmu-r8a77990', 'renesas,tmu-r8a77995']

Trivial DT binding update posted (but not CCed to devicetree) in
https://lore.kernel.org/r/20210331124555.2150-1-wsa@kernel.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
