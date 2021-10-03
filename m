Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF00342041E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Oct 2021 23:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbhJCVuT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Oct 2021 17:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbhJCVuS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Oct 2021 17:50:18 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7421C061780
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Oct 2021 14:48:30 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y23so24090183lfb.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Oct 2021 14:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=voNTUJHRu2p0UrOJPaevC7glSoKCJY7cp+CEopXnX20=;
        b=e2jLdC8flb8LbQcSIxibdfPUHmn3/F7lbP3/na8/xQar0yZm433oYS0khqC7CxWZOy
         ixb7ouFnpABfjTA070mGjDq4TZE+wmZLmHDwOZL89EL0QH/CD7XBcRf+qkPmlJXm9oDY
         bF3tMUkAOIGFR2Qtl9fma8OrdF/Mv4PMs+0bve0EYY9Kb2XLtXodgENoMgcCrGgU2Fxn
         eQKVz+vspDgUFLY8WkWZ2uKhQ1DwumInig89rSNjDmjEd18EUrHDeQhhStW1NvYJFh1k
         cnVt0BS4Mi0cU8EIRPIahNa/yjnjlLPaMf4GQW0dKFF24aXF0nsW9QnJ5Ys+bfHbrY7i
         P6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=voNTUJHRu2p0UrOJPaevC7glSoKCJY7cp+CEopXnX20=;
        b=F1ODD98nkaOlBJ9MbeBxl+CYqCDbORBKd5SUPV4jAOkWOmEtUtSH/nSNxM0D7Q7O2Y
         7Mw+Rc4pc86b21CH6VgVLklHfXpNMFJ8+EF1yDBgCH7kNBR8iah4UNw+s505l2Xh+ka2
         9wfacpUQrlKnTJDXcRFp+3i6QvaFQ2qEI4MXt4m1Rb3YMmWVKfQ/DL3JcMc6dYukPoM8
         /su4w5fxLA4Mg6QJa78i4h8XE5WPeQIkp5J+QV1InrYIfC1XglMNRXiUI208Qeaumboy
         x8s+b0iYxuOBYeXs7EMve8FAOUWc2z5bxBfN+3F1M3amj4/CYBDNnGAWDO/S5so3khTw
         yIaw==
X-Gm-Message-State: AOAM531/e/XKWtMCm8pQqCmkg3ic9VbPaf8RWmlPfnzBC8OUZReSrRet
        0roicP7/SLJFjUhgngmbUpxZTEKSPZeMscgxaw7plA==
X-Google-Smtp-Source: ABdhPJwEgGAcpb775Cmq4Z4ILsnDI0eImSxuZGOBztzFK4T3jodRimaYgKJB02ynnI+EAvr3kgLgtmqriSzBRKtnsJc=
X-Received: by 2002:a2e:8011:: with SMTP id j17mr11603489ljg.145.1633297708485;
 Sun, 03 Oct 2021 14:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633081630.git.geert+renesas@glider.be>
In-Reply-To: <cover.1633081630.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 3 Oct 2021 23:48:17 +0200
Message-ID: <CACRpkdY0ZgsYKHpcRaFEVustfivt9V0UKQ1tuHgb5HXMmaYAXg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.16
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 1, 2021 at 11:48 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
>
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.16-tag1

Pulled in!

Thanks!
Linus Walleij
