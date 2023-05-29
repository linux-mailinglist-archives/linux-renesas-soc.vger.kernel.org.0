Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5FB714700
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 May 2023 11:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjE2JXp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 May 2023 05:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbjE2JXo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 May 2023 05:23:44 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06C2B1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 May 2023 02:23:41 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-565d354b59fso23432307b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 May 2023 02:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685352221; x=1687944221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iv0vJxAYrRB/ixUtJ2WmCFHafcnIajJKsC/wh+gfLT8=;
        b=qbnpPReMH6YrFsnecdFlWzTXIqbFm1+rJFqLD/Dsy2IjC+ZZszy/ztVtScHdvOvbAz
         KB5rechfDG6FdMSPUjQVbVw53+7H6J8CoQPaPLstj0d6XZnl4q27M2rP8iBp2ZUU1p7+
         7AF2XEVS5uWNNwnrbLO3J44YIEXa7rbdbNMj8U54rosfHlwPHGfBZ2zwYIgs+NV6is6g
         2EzWJ1aQJuCdLiFdMB4i+/1w9gWG0cNJzA46y9h+MRPNsDqqDKNpdOJR7Kr7g+otIUNs
         lfg8dKjM7THNsuw0XSoBjHQH2FTznpc6Z8qxnZCkNXswUOMDeewrYF1sxoOV3+kIPeUg
         lHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685352221; x=1687944221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iv0vJxAYrRB/ixUtJ2WmCFHafcnIajJKsC/wh+gfLT8=;
        b=QDFqGPaPwMEFgrGpVb3nz8feAExvCHDl8uOCB2XioQOB4w/3zBW+RTgRep8zvCzs0n
         at/tKlVepmdQsureoUyCXf1ShyOuDnsJLbzvH565Pakk04nSmbuduhI3mDBmGay8STfK
         nW6hshrRdQbkqjWUtMno3cUJcCGPZ8Otj59dCPCrDI49/oVL66G1ONt1NodBf+8AjATI
         vuRAiKBFf2grOszaxCKI5N4LSI4ffAbcED2p4KpU0bQQrgOPcZ+Xvl16wCnACBwM1J51
         XqpAqMFttB3U2PHwTyfolxSI8xqb3kthneeEsULG9jFwFzCTwhMVpWJsdX8ddRA2f9tv
         sLAA==
X-Gm-Message-State: AC+VfDxxIrr/k3Ke7yf/yimJRnfly80g8XfyADOmkYeEuDQyGfhzRdQH
        gEJsYn31tF08MtN2owfnXRNlLsKpiOLbxrowO+qucg==
X-Google-Smtp-Source: ACHHUZ6INsukR9MrD5Xtl/M8h5Y5KtLfgMr9vM556JN8Ee70Aey/M8H2fJE613aIWC2OpOpR/7wrpZrg66g7Ss5Sl6w=
X-Received: by 2002:a0d:c0c1:0:b0:55a:18de:19dd with SMTP id
 b184-20020a0dc0c1000000b0055a18de19ddmr11406697ywd.36.1685352221225; Mon, 29
 May 2023 02:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685094670.git.geert+renesas@glider.be>
In-Reply-To: <cover.1685094670.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 May 2023 11:23:30 +0200
Message-ID: <CACRpkdbNUrhv_--r40prc+YrRo_RZ+MSCF4xi-N7CKVpk6WiOQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.5
To:     geert+renesas@glider.be
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 26, 2023 at 11:53=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit ac9a78681b921877518763ba0e89202254349d=
1b:
>
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.5-tag1
>
> for you to fetch changes up to 5d32cead772c3d074947cb7277dea7532133037b:
>
>   pinctrl: renesas: Fix spaces followed by tabs (2023-05-09 11:51:33 +020=
0)

Pulled into my "devel" branch for v6.5.

Excellent work, as always.

Yours,
Linus Walleij
