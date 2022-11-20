Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E3C6316DF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Nov 2022 23:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiKTWfg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Nov 2022 17:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiKTWfe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Nov 2022 17:35:34 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503F2222B5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Nov 2022 14:35:34 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id p81so3983809yba.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Nov 2022 14:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EczHpYbqWycw0zLiK9vhWozb2TOliE2KSZvZj/cDmg4=;
        b=N1JT0yPjNrhzm71LIjhZC+P0pVcuxdvt2xMPJtVZoX3qs4QK3egBDTIzwYFRHxydX7
         Z/EHc0t3CmABXTjJpCVwgUipnJELNHRQZYNbeVFfwBfKIGjrUb22r9T2QzVw7p6WqfCL
         4aiBz73YQOCkk8mxcZ05zcsSEl9M85kAdCVd9lzz1B4zVc/LtlHo8jIh2b0e/Mo1bd2/
         r0Cj4E7eZhFO5+7KqL9pfLVCjikgZtqBf4am6G5iYw4HZK90cZ9FgoWq0hvHb+6k98E+
         FZfG26VjJuNsRjZX0+/tTSGf0dJBDsOZLjhIgtdflM9KitLcSBTG3HN1bMPhD5Ydxsug
         o39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EczHpYbqWycw0zLiK9vhWozb2TOliE2KSZvZj/cDmg4=;
        b=vISgnNYvBjBUovMFHTUyBTvLTZ30Us90gcGGJvXAqW85cGmZtQNDSUMk6SBUD1C47X
         7QEHf5LfeD6VE3YfkXMlQSDtcJ41CFTbrT4dyq6P0YUN6keuCXKZkFdIh8F9rVuckdfr
         9MaanYlcXsIeDOUN8ksKpWuo4743mKZ5S6DLpHY46VEakffaOcFc0D/zvOYewK0j40jl
         s+b6Q6XS9DPZVPb1IWtfeIlbQbL5PILcmS3Wh262C1JO0EXUAZJzfngTYwbYLLzT2Ggw
         yZcnNXIzW2PL2Q0dzmVQOwe9PgCXW+75AB/nhgy0LS81FEOF7lL7ucK+8xZp6hTUW5rx
         CnpQ==
X-Gm-Message-State: ANoB5pngFKStE0QVKhSKNhxDg4RkBNGkfRxkNdhoxP/LWtkkRqKTxCFd
        UgzjPCZZm8kijUwfdSH9jDqaox9PcnKylj4cnqtLVtlAQ9o=
X-Google-Smtp-Source: AA0mqf4CJYKqR5Zpz8iBPGDcOcFEC7udJ4Ctsl64e2zbpx87vwN0mHlqBadmTpFlofAjLr5DUYHsxKwVksIaQPbQVa8=
X-Received: by 2002:a25:1843:0:b0:6dc:b9ec:7c87 with SMTP id
 64-20020a251843000000b006dcb9ec7c87mr3056269yby.322.1668983733564; Sun, 20
 Nov 2022 14:35:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668790226.git.geert+renesas@glider.be>
In-Reply-To: <cover.1668790226.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 20 Nov 2022 23:35:22 +0100
Message-ID: <CACRpkdZ7QFJApf4fbYeE+QEfowiMGvPsBChkXgjuSS+MUt3nPg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.2
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 18, 2022 at 5:54 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
>
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.2-tag1

Pulled into the pinctrl tree for v6.2!

Yours,
Linus Walleij
