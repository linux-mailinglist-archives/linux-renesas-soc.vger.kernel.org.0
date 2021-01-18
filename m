Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89B12FA447
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jan 2021 16:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393243AbhARPNL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jan 2021 10:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393119AbhARPNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 10:13:07 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC7FC061575
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jan 2021 07:12:26 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id 6so24157561ejz.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jan 2021 07:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZmXMj6tFKE8O/qXvV9RqSTfoZj1tErBM1YvyS8NSRYQ=;
        b=rSKd/+kQhKHKvCzCBh+bDSZaqvcd3n6A8x36pafF19Bqvr1Ssokw2zVnNNuecpVUnZ
         hIvJ2PY5lmtAH07hYNk4KiFRcLQxQZ/4fEpWyYchZZSIR0gqBKzGjVYMffT8M0ayXNwJ
         vHij/uYX3va2Fwoy57ZU3+U7+W5LCSD8Woc4ruFMoHn3e3RP+lRmDD0vYm9b+0ON+GEH
         Kd6/JJg8TPd80zLk/6dsYzMAPB78tKHQ7SrVKnZJZqgPpfiIUeGLdkI7fU6OtrmSYOGM
         zQwNxtucHHdZuTPfwEyU57JQUBuESnEiRT3+3tjFGqDzsZmaKnHt7qDDy2Vr4Uaf0C7g
         3TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZmXMj6tFKE8O/qXvV9RqSTfoZj1tErBM1YvyS8NSRYQ=;
        b=GjuTiFHEOXZ8OXNVegA0OesXvNuJFJYlYwgCUpQwFjSVCXwaKmdbobi65BaAieREaj
         KIFS3pKPKjBE0x+4bscCBH3AokOaKouII6vuZlpcLsaMsCJJcRAU21Zh1zQtcW+mRAMR
         UKEfBeSa/LY8kBvmpEs+2QaWtz0IcwK/jqAdA1Na6+ZYfPXKmZo6o8aRyeOlTeEP743i
         IpWjoZnKWg8sJta6+SgU8KABcmQzDxX8PlXb6KDdaV7yumQPrDYXTn695BydJZDF/WWn
         RdS4lkimz4ifM2INrCRVNCgGvhG3dr2Rcj9u2XDiby9nE3SJ4xygyNBvQUPTCGj0f/Uu
         llRA==
X-Gm-Message-State: AOAM531ovYiIPI95eXgg3gMKhh7uL7yXNFBVvHgIlbbk4u3ByETxJtXU
        OVynjcBq4oKfC2VmTpG/Co6k0XcqFjBhIgEQAo05pg==
X-Google-Smtp-Source: ABdhPJweZGFoaO6uQEfZVRheP1p7oFTT5JiICmWMpMlLwDagcrJsBxmLSovHoJthz83/Az6ydq9fXiF6RTWwlWplxxg=
X-Received: by 2002:a17:907:2705:: with SMTP id w5mr83892ejk.505.1610982745601;
 Mon, 18 Jan 2021 07:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20210115095313.2334693-1-geert+renesas@glider.be>
In-Reply-To: <20210115095313.2334693-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 16:12:14 +0100
Message-ID: <CACRpkdYyP=2Rkoxz4ce0R3O_zG9kgqJVZk2mjGaFGRL-amGzpw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.12
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 15, 2021 at 10:53 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
>
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.12-tag1
>
> for you to fetch changes up to a5cda861ed57710837bc560a3c715160da710555:

Pulled into my "devel" branch for v5.12!

Yours,
Linus Walleij
