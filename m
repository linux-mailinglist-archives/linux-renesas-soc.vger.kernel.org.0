Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9765D41D26
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 09:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407863AbfFLHC0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 03:02:26 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33424 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404851AbfFLHC0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 03:02:26 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so11208694lfe.0;
        Wed, 12 Jun 2019 00:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t1FrAl3lFUrxKHR8AVD4+IWp4cQFjhvWNrbECcTI0qY=;
        b=EwwIiGD1rx1UXUfjunjs4VHq5IhIywk4zicuMKNTNKYfflWFlR/Syho+XtFGFKlKr2
         OudEAZ7uKEyRRjsu7pRCsECs0Ldf3W+uLO0HwZTHgIWNhdf6tkCQjU0/E4t+NRIbTmJ7
         AMuyj4TYK4tcYjspUUfkH43WV0N89KuaLkyk1KlDeV7urqiigEOVBazbq5CjjDltxmV1
         5qV7Sfjw/oozfxPMFrlc0/9AlWiScocZoaqQlc/EPk2H5+Zoj/9jAnZkYe9U6YSAhk8/
         EVBoccp0ZDc04R4VbmSoq+trH3jpUqPd4HjdzS5vNuQL3soXqvUW9FIqrcdClfc/Ek1H
         T5cA==
X-Gm-Message-State: APjAAAXLlpCRfB1khMOr/hASZUoYYiW5mkaROGgucBZzB3Fb/1a/08Az
        aebxPKJsov+5/wbATggsu4q1JZKehhbiwP928Ck=
X-Google-Smtp-Source: APXvYqzLlB1DqokPSATZqkjDEztbL120FBpZCZQklCniylIHDwuYZbt8KDDMDb1pC1zUe/Ym7X1Dt7/PCB6jj309XnI=
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr40360821lfm.87.1560322943784;
 Wed, 12 Jun 2019 00:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com> <1560258401-9517-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560258401-9517-4-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 09:02:11 +0200
Message-ID: <CAMuHMdWx6opBuDeLv35E2dK3BDLrqd=3D_9PaK8FbpBEHvRFDQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r8a774a1: Add CMT device nodes
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 11, 2019 at 3:07 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds the CMT[0123] device tree nodes to the
> r8a774a1 SoC specific DT.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
