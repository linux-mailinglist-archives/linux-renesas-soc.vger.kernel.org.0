Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4DB7BC0DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Oct 2023 23:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbjJFVDk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Oct 2023 17:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbjJFVDj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 17:03:39 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB16BF
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Oct 2023 14:03:38 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59f6e6b206fso31484487b3.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Oct 2023 14:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696626217; x=1697231017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZtjai8HBeCzrqWX0FnRVebJMoag+hyC+PqgXKIGxKw=;
        b=YTi4ktUEW9kKle3F+nj+f3A/m/zhUTUoM1+L8KBkyMrH7oY8QOUBo0GS6qaf35D1tV
         DEKM8NO3W0HAaLw5PJiJmpXIw5gPB+C/ZXOn1JV2KW5nurQz/Y00PXQ6We5zpjWzwgwV
         dsg1b5VdQGdzjTqD8I3Xr2AnmJCuTYHtll2HhgeLlE+Lc/tLRORnYMIkcUL23WRqc0ch
         N4BmGpqohXMHsNx4yajzzDhe7a2DvcvMFJlOo2qcV3bICi/tu9Rih5962ajphOlGNcd8
         ww40V9UE1EJ3ECfaCDkXuBaHyPmZ0XAyLbamIh041NScnDrm0PF7UTSwqZWw46bJnbej
         5VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696626217; x=1697231017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZtjai8HBeCzrqWX0FnRVebJMoag+hyC+PqgXKIGxKw=;
        b=GUjyqpEghK+rTgcLMo3TsM+Sq9cFGMF5rDUs9jkbf0TRB1hA/ifZQnKuiRrOaA/nro
         6bwlGhN+1I9bnhCnvwnbLHKUpDKLyqhfRxYr5iGXZnRN3ssaXhyHuzcz77EnD+a3gRvD
         sKH8t5CaNaNZdA0fnYUC9xJz+qdIlcAS2kr9RlBo3c5LLu4dSR1DhRXA9mZKByQcWo8s
         lpkAt72v9Jv718A3fRI3oSF7GKRcgw8ZKj8xwNShR6vAnZ60fVK6Q46DhJoXeaHrtlSr
         rgnNm5+s2A/RGh2oEhCtiPoz5mQK8Hg7vzW7eSymPalohnChVJZHFHS0vfQ+7XtvDVia
         85DQ==
X-Gm-Message-State: AOJu0Yws3wTJ/w9FitbYiKrDwhbYBuVx87NXXYHp8GWbN/Q+bl2UYAcq
        guy5uV5AR5nsf0K96ijCHbL/fw9ZxRaS4FXjmDFQbg==
X-Google-Smtp-Source: AGHT+IG9ye4+fmxd6vQXVxi/Joy3Iy0DHgAhMe1v/pWJvSaXF8ghuCacF/QQFUS6VkKnAEDvlULfgE+TPJAkdQZztFU=
X-Received: by 2002:a0d:d606:0:b0:586:b686:8234 with SMTP id
 y6-20020a0dd606000000b00586b6868234mr10321910ywd.8.1696626217493; Fri, 06 Oct
 2023 14:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696577527.git.geert+renesas@glider.be>
In-Reply-To: <cover.1696577527.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Oct 2023 23:03:26 +0200
Message-ID: <CACRpkdaOELGxGWUk_asChG71j8JP4uAUgq-8L-_NAkzmTeoUMQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Fixes for v6.6
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 6, 2023 at 9:36=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d=
1d:
>
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-fixes-for-v6.6-tag1
>
> for you to fetch changes up to 73394a1b2194694b66f7a0839a219ce0d16b64a3:
>
>   pinctrl: renesas: rzn1: Enable missing PINMUX (2023-10-05 11:42:43 +020=
0)

Pulled in, thanks Geert!

Yours,
Linus Walleij
