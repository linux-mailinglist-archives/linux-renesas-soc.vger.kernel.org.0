Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FF82CB07D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Dec 2020 23:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgLAWy6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Dec 2020 17:54:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgLAWy6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Dec 2020 17:54:58 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F7AC0613D6
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Dec 2020 14:54:17 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id u19so8070964lfr.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Dec 2020 14:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=45I+KRWHBK+Vr07RlSXVPasVxsr9ozqxGBN8hOtxRDU=;
        b=TUmUE3F+1aJGQ/P3nVATcrDL5cUtvZRcLeXCMbSwq3qYojsQDpL98VKqqFBl6icIQw
         GOxhQfUii3s+vUPUHct7fnMD+vWP69eVfuUhD3cp1rgLXdzqYvDgABJThnsYucrQZRHE
         0lRu958V4xe8/hmw17iWcqWQvfdUe8k1rq/0QFJYaMlwF4xIl1cceC8KGObWWjW9BEnU
         q+X4z/vLDDAzTzFty2jFX35ytAj4TYwSWFoJ2F72E9aWsaLI3HuRTVe2my2x/DOuGl54
         dET+AcfDi8HU84Z9CEd7AmyPpbVZE0aVvpIb9ah9JyRZqRmAc+i2i0Bemnv0nbZaehc1
         +iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=45I+KRWHBK+Vr07RlSXVPasVxsr9ozqxGBN8hOtxRDU=;
        b=RV1sqhLRnG7XKOLUdV9kq0HYD6pt8oPdH9d7KzO5lNdPGjgMQLdhIJTBHXsvccI/06
         fu5cYPaWReT8Zz9CoQMyI9v1eeoeDo0ezBeSMdY3deWZ2YD/zfG+tm7r9tjwkeA+k7fu
         eNhGyRV7lVOCZTuF31Hh/rNn1A0mIsRQTRRS0c5dVg9wsFEVK2s+qwC5dot2L/Ic9ois
         xXHk+KI0uR0i9yfxQe06jTlO5V1XFGhE0buAqFDrR0upKKYyEXuWXp7ZmlRB72wVwW/G
         wGaZ+4GBv2CBysp6qM/uGpQyvPS79gQJbsJXWDYoxqT99bW8L0aqe/osyvWDX8fbGBlM
         xD/g==
X-Gm-Message-State: AOAM530CNSrNQRQNBs089hHNaxouCYkGwVEG+heu1z1PWBv6mI3Is7pa
        lrjsWJ57ynTEMleYXJ/rlkitbzoY4ud8O8isfwGYPAau+Wx8Bw==
X-Google-Smtp-Source: ABdhPJxUqueuUaPCq+IKxWlkCkvRIEkV0PoS/X0pg5bjz8xSrPI0GnkXI/YA5nIiLtt4Jo2dMrQ+2n8GKbyvf7kl0QI=
X-Received: by 2002:ac2:4578:: with SMTP id k24mr2225682lfm.502.1606863256350;
 Tue, 01 Dec 2020 14:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20201127134304.79252-1-geert@linux-m68k.org>
In-Reply-To: <20201127134304.79252-1-geert@linux-m68k.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Dec 2020 23:54:05 +0100
Message-ID: <CACRpkdabsDER3_OxmLg4g8fjU7eOVFQDit=A5OKqPL_QLyTyMA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.11 (take two)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 27, 2020 at 2:43 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> The following changes since commit d4aac7d439c2d9307cb5137fc285464a36978107:
>
>   pinctrl: renesas: Constify sh73a0_vccq_mc0_ops (2020-11-13 15:37:41 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.11-tag2
>
> for you to fetch changes up to 7ba4a9591a8ac058bf976485975f78128c273800:
>
>   pinctrl: renesas: Fix fall-through warnings for Clang (2020-11-23 09:47:28 +0100)

Pulled in for v5.11!

Thanks!
LInus Walleij
