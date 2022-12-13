Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A99464B137
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 09:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbiLMIcJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 03:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbiLMIb0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 03:31:26 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8CD62FC;
        Tue, 13 Dec 2022 00:31:25 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id h16so11253961qtu.2;
        Tue, 13 Dec 2022 00:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cj2pogcz6ykS5YOcEmS32K1/by57SG2Oy1svNLCAASY=;
        b=tlvgRbMV5BoKbpTXv6V254Ys3ypNn2z04TPbss8tQCjSSatfSLWbWBN4VzYTK/tDC6
         L4Bm/h/DMvkdB9yE1R35HSambVZzzxxPpyRJ18YrzhOjb27yCROdUHGegv9LjaqRDVsK
         At0NCoQhcESdCm80NyyULe4azWpUkQUi4V6IX9ZTQ707iw4LdWBjNCqJhiHExk2NIFoW
         Th7xOJu/HJgKuab+4HnIPeLdS5Fujl/B/4739E8hqJ8aBFS16joGmK270mikwVRO8hiA
         AUBgoEEa7PUj3NyIGgNOhaCBJQ/j5aGHGbYH4UCxxK4w5U/QyTDIzUvpvw+TUV49lo79
         2kbQ==
X-Gm-Message-State: ANoB5pleZRcb0Zcc4GKFm1Oh2kOpN3pTbrSg+gfOr/8n0lrjhR2h8R3A
        F5CCuc6hnHkb6oOXHU2mOL6hgThkLW+DFg==
X-Google-Smtp-Source: AA0mqf6WAVY3T6WLCi0zlWVCvJSHSAXImjAact9+E9kq9txmMBn3RIceWIN1djRJMTUNr+hIMCZ3Zg==
X-Received: by 2002:a05:622a:4a0c:b0:3a6:2170:b089 with SMTP id fv12-20020a05622a4a0c00b003a62170b089mr4573191qtb.12.1670920283988;
        Tue, 13 Dec 2022 00:31:23 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id u2-20020a37ab02000000b006b615cd8c13sm7228286qke.106.2022.12.13.00.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 00:31:23 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-3e45d25de97so182183777b3.6;
        Tue, 13 Dec 2022 00:31:23 -0800 (PST)
X-Received: by 2002:a05:690c:f8a:b0:3b4:8af5:48e with SMTP id
 df10-20020a05690c0f8a00b003b48af5048emr1614196ywb.383.1670920283214; Tue, 13
 Dec 2022 00:31:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669980383.git.geert+renesas@glider.be> <3c0f5b935da4468fe04e2d85becafda0040e4d31.1669980383.git.geert+renesas@glider.be>
 <871qpcm4mu.wl-kuninori.morimoto.gx@renesas.com> <87mt7skwsk.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mt7skwsk.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Dec 2022 09:31:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgDF=wF3Q0_QMecpmmWe1NxyK4BGTNhEvcdS5698cNmg@mail.gmail.com>
Message-ID: <CAMuHMdVgDF=wF3Q0_QMecpmmWe1NxyK4BGTNhEvcdS5698cNmg@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/2] arm64: dts: renesas: ulcb-kf: Fix pcm3168a audio
 codec node
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Damien Horsley <Damien.Horsley@imgtec.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Dec 13, 2022 at 12:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> >    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports: 'mclk-fs' does not match any of the regexes: '^port@[0-9a-f]+$', 'pinctrl-[0-9]+'
> >           From schema: Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> >    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports:port@0:endpoint: Unevaluated properties are not allowed ('clocks' was unexpected)
> >           From schema: Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> >    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports:port@1:endpoint: Unevaluated properties are not allowed ('clocks' was unexpected)
> >           From schema: Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> (snip)
> > I'm not tested, but in my quick check,
> > we can use "mclk-fs" under "ports", and we need "clocks" under "endpoint".
> > So the issue is not dtsi side, but yaml side.
> >
> > I will check and fix it, but it will be next week or later.
>
> I have investigated about this patch, and it needs extra patch
> which I will post if -rc1 was released.
> I can merge this patch (with small fixup) into my patch-set.
> Of course I will keep your name. But is it OK for you ?

Thanks, fine for me!

♫ All I want for Christmas is ♫... an error-free "make dtbs_check" ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
