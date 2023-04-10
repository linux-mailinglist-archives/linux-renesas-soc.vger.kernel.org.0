Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B846DCD70
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Apr 2023 00:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjDJWYP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Apr 2023 18:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjDJWYO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 18:24:14 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E621FC9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 15:24:13 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-54f64b29207so17060097b3.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 15:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681165452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThdAnIciHvUr0rDq3CSc+W1GbbOTtNiPbB/jWYZ9Vfw=;
        b=LOY0UzSL+ooCsWgVqWBfr0LbWLrIxIngUh0bUz11GPofUQjuuSTSYmAMeW4SJli0gF
         iuq9R+MddS0OOyzhOotCLu+0RVkyw8c+n9TlNEYWbWecgfx7rNYjzspEuDkMtqiE1gnt
         a92CksVBDykymbvakGfE0IjM4qwQ7bjnRiJGiJ5n2HedVDtFo07xLJto0a4NKSeFJJBY
         pa/S6wN8LR4JKLdgqREg9KDqekqD/AwzTv2ka/CxbW3xGCr0n2ckg0UDqlsyol4Eoxw+
         cOq8iiEmEjGzdkFkOLM+3s4byAJjYOcN5XndP/CCQAGqfoOJ/1e5L/sytfBpYG/m9qU8
         v3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681165452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThdAnIciHvUr0rDq3CSc+W1GbbOTtNiPbB/jWYZ9Vfw=;
        b=4vBynQhiJUpWf8Zh4OZT/HJ3Hqw4mx40w+FqMw7X8AAsCnGO1Vw2H2Vrskd0JyjOOC
         EmPuI759su1QinI/QfdncMlHA987fPKXu2wpzVdCgr7OqhajSWTSlfSVaX8xshtfUSXz
         ynD+XmcWdL5Zw5tqlzODJyugv2vwaoSZSNGdnVQlcpzbi8yhIDIiypzPjMshGhWuB06A
         cV3yJlgsWs7kEx4fYXB0G+20bQ8M9vaKqP5zH7AEC23ID+joPfBciRTiCmZiA787cwmc
         yimRzRNagSIAP6aHrvUpAUGCVndAtZtW3c53YmAAJ4S/dEktSdKP3XvzPfQAUvp3cmO7
         RnMA==
X-Gm-Message-State: AAQBX9dScczZ3fue/R44qbxWePuYUub4iXnr6gAbHVGZV/AA3aiKVwlz
        +OqLGG6+KqvaIBQR65j0KrHjQ+AHGPL71cgO59cIS4wbKBsEMeQ9
X-Google-Smtp-Source: AKy350ZjhC5MJW8RjuOkVpSMEnnhWwwnodjjXqMFcD9v+Tj3FkwLpVqxCZm4M5SUTnqPWIMdTNH+pvOUxQDwi+WcQ9Y=
X-Received: by 2002:a81:ae5b:0:b0:541:693f:cdd1 with SMTP id
 g27-20020a81ae5b000000b00541693fcdd1mr6562333ywk.9.1681165452317; Mon, 10 Apr
 2023 15:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681113471.git.geert+renesas@glider.be>
In-Reply-To: <cover.1681113471.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 11 Apr 2023 00:24:01 +0200
Message-ID: <CACRpkdaDBZNvfZqeJoE=RYfCTW6w5+RTLQ=Lc0AR0T6LynMjfA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.4 (take two)
To:     geert+renesas@glider.be
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 10, 2023 at 10:01=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 9d7558ed8372c51cbed011cb1dc3eb1beee212=
cf:
>
>   pinctrl: renesas: Drop support for Renesas-specific properties (2023-03=
-16 16:55:27 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.4-tag2
>
> for you to fetch changes up to 45e6cc8ef1cd8576707506a4eeffef858e4a1a83:
>
>   pinctrl: renesas: core: Drop unneeded #ifdef CONFIG_OF (2023-03-30 15:4=
1:14 +0200)

Pulled into my devel branch for v6.4!

Thanks Geert!

Yours,
Linus Walleij
