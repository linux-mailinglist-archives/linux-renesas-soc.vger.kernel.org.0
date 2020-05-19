Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2E41D97D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 15:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbgESNdO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 09:33:14 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35467 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728633AbgESNdN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 09:33:13 -0400
Received: by mail-ot1-f65.google.com with SMTP id 69so6498521otv.2;
        Tue, 19 May 2020 06:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tfjq0+2TvhTDPcTzKAYSuLPQPlCSitYKtY6JkPINn/o=;
        b=qG6ryGrfBQdruG+sTKNyKkNPeu/sm09q5fYg9LtMPsjPlT4IzXPiTvspHq9ueQ+5Ly
         SmxW5gj7DewFkBQbAVrIgP6dmEJTdm5RzQl9wq8WqrG3whV2GtyJuRaRjXIADs7mSq5I
         NseJvb/prj5PGkgVzTuWGlmGygGqZcwPz313gptSJOxma4NeyxD3UY4EQemDKq8XOqJI
         wj821t7jqkaYAZxkBnpe/pGXguR6Y+iMVK7u/u6VqTvCSLA5uFYdrJm4sHf2EiqRtGGU
         28lde/E7iuCxd4mo7IkY5CK+1xl9a72NPUvYYcVUOAGxLIA/Bt287blIQH2gN32J/nS8
         tUyQ==
X-Gm-Message-State: AOAM5313VPCifxGWZUEs70vpCT0qIPJUZzXYdR+hhPC1v33z7peZnqn5
        +nSm/Dx4u8YRPlubVnf6M51CHkyHC7UrlUK2tes=
X-Google-Smtp-Source: ABdhPJyAt8NmTZFbYZI4yPgmGZfB2oiwlkINlsEI5ZmOA2fK+9EJ+dJOLJ7AaVOzaxgpBhwWAcngv4M7f+TntDTKrRI=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr15739186otp.145.1589895192859;
 Tue, 19 May 2020 06:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200519075858.27869-1-geert+renesas@glider.be> <20200519124714.GA45550@sirena.org.uk>
In-Reply-To: <20200519124714.GA45550@sirena.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 May 2020 15:33:01 +0200
Message-ID: <CAMuHMdUHHzBNFHy07hgdryJEeHUDMOCP8XauCn7TmUK7uGZcFg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsi: Add missing properties to DT bindings
To:     Mark Brown <broonie@kernel.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

On Tue, May 19, 2020 at 2:47 PM Mark Brown <broonie@kernel.org> wrote:
> On Tue, May 19, 2020 at 09:58:58AM +0200, Geert Uytterhoeven wrote:
> > make dtbs_check:
> >
> >     arch/arm/boot/dts/r8a7740-armadillo800eva.dt.yaml: sound@fe1f0000: '#sound-dai-cells', 'clocks', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
>
> This doesn't apply against current code, please check and resend.

It indeed doesn't apply to your sound/for-next branch.
It does apply to robh/for-next, which has commit 9f60a65bc5e6cd88
("dt-bindings: Clean-up schema indentation formatting"), so I guess
Rob will have to take it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
