Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB0526692C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 10:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbjAMJWL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Jan 2023 04:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238192AbjAMJVY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2023 04:21:24 -0500
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F28878EAD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jan 2023 01:15:06 -0800 (PST)
Received: by mail-qv1-f43.google.com with SMTP id y8so14434997qvn.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jan 2023 01:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjiyZC6QWk0emgn4YZqyq+Kl2nwhRRJrrcQmwc/UFAQ=;
        b=uL65kzM5rgdVD0Xm/wvKmCGit58CECCnZD2bOHMw1OUIGWh4K/S7hP/bpKbBAJAK1q
         taju3k6YlIoNIi+GFNbOrje5tkt0lUyA7j4JW+gHUVvNijYaRNLdMWLhQL5bkt7iMSxP
         qFnYnrrb8sjBak5p0OsddPv/g/tKxloMGDKTVdTmtCtYsappnVPppVSJhnCpQZVduhq+
         pUZnq/6NmYK4Y72x7JGhLxg8B52wEeQKkAbYchvPxrdFCMjZFmUUvDAY9lkX46jfU3f8
         t8rs7k8bHmW8PcyENl9gdDzVIJP87yQlRBtShDVw5hco+7DxOBhH4D64do/AP/nls1FC
         Ub8Q==
X-Gm-Message-State: AFqh2kpwe4I2ePN/Zn1QvUqOO0XMXSBc8WmaH3Zv2UAAUPHIhgWsCxVI
        yA4TciKvy5M3RlLKvb9bgYSwgVyl9Gcu1A==
X-Google-Smtp-Source: AMrXdXs3p7qnIohohMTTKEIX1EA9cFbDUT2AONUfZXQ9xC2HHKOiRN1Nt18LpAcakLe6FzlDc9ZsGA==
X-Received: by 2002:a05:6214:247:b0:4c6:a49e:c255 with SMTP id k7-20020a056214024700b004c6a49ec255mr103315556qvt.35.1673601302596;
        Fri, 13 Jan 2023 01:15:02 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id o5-20020a05620a2a0500b006fcc437c2e8sm12532776qkp.44.2023.01.13.01.15.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 01:15:02 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id l139so21638208ybl.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jan 2023 01:15:02 -0800 (PST)
X-Received: by 2002:a25:5189:0:b0:7bf:d201:60cb with SMTP id
 f131-20020a255189000000b007bfd20160cbmr1223170ybb.365.1673601301871; Fri, 13
 Jan 2023 01:15:01 -0800 (PST)
MIME-Version: 1.0
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
 <875yeepxfw.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdWzyj8hR9-GY5g3ZqVRD3FC4HxxtDEfLAxjiK=iFRpC9w@mail.gmail.com>
 <878ri7babi.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878ri7babi.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 Jan 2023 10:14:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWu3okFtkp91z1BW8YUCTzfa=JPogCb+PgLE6gFmggQUw@mail.gmail.com>
Message-ID: <CAMuHMdWu3okFtkp91z1BW8YUCTzfa=JPogCb+PgLE6gFmggQUw@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2
 dtsi MIX + TDM Split dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Jan 13, 2023 at 12:30 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > +               /*
> > > +                * (X) ak4613
> >
> > Perhaps add an arrow, and a target, like in the other patches?
> > (everywhere)
>
> It is difficult to explain via text, but on normal connection case,
> SoC <-> Codec are connected, thus the comment like
> "CPU0 <-> ak4613" is correct.
>
> But On MIX+Split case, it is using DPCM which connects
> "FE" and "BE" at runtime.
> So there are no connection between (FE)SoC <-> (BE)Codec
> at this time. So the above comment (= no arrow) is correct.

So this is software policy, not hardware description?
Does it belong in DTS?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
