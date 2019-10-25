Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 333F9E4384
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 08:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392326AbfJYGWG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 02:22:06 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44390 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfJYGWF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 02:22:05 -0400
Received: by mail-vs1-f66.google.com with SMTP id j85so700762vsd.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Oct 2019 23:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oUL/r7QZtD5Ik+k2QRguXLUKLdY7EAed/NAwUT/KY9U=;
        b=YkJqbTmbOF5cohmL/g/+uoCAwxRXy1dQhsX1PJrYc6ElZ8izugxwmqt35fiIp8AqcL
         wOiGxbnliG6GzP0WPRZ2s4V+dOq+uRI5tY+C+Mm4LnoqjVCd/CGOepcsky7zo6cMaXCl
         uDSobeaCDFn5kRs03sTbj8x3yrW8ADJntp4xIiYPOVzpqhsOy23V57RnBjWzcI8K+hc8
         HLuGPhL9/FPvJBYaygHquxJGLTJswf1XRov/ecy5JC6D+xcwdPEv2XxTnWDVdxoX0Mzk
         ue07QJkhM2Tkqcenl8WeqMjvi9tw+lsyfkI6fUhrLmzj0e1UD9Woh0fl8ljoqRE1kLy+
         9NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oUL/r7QZtD5Ik+k2QRguXLUKLdY7EAed/NAwUT/KY9U=;
        b=Woa2z1i29mnGI2ukO5a9NtmY1W9UE2+Y+D9Kf1NSsWEhkOgmd8n6oByuTL+8p9dgKP
         KTM6V2Hj9PJhPoDqqJbW1lG05d2N1bqEl7FHNyR0TzqOh15uMc0m8sYXYB2ywp2BfWNZ
         8QziJdenghSK6MLBvwrBzG+UL7/RZEFihc9BJ4WM9m1KnOQXT7OkygIdat8FznvNHMIs
         LyI3/WBGJCw3pPmcAfxmsJMoYsnQ4so3MJg4NYlzwd/LI0ddDS/Xaz7Qa1+ClmF8dapX
         +mg19+wQ5IhFnx9wBZ24KwCtMMYTkVZl+h/HC8bnwnx0c/Jyp85V7IYgejThHFAbpCR1
         K0pA==
X-Gm-Message-State: APjAAAUuNVJBZSjfNWTUJLwc3I/UJQyA1OuOFuoOefscmSYHVDca8w7j
        2IX7R8rER32i9uylZL2d364uwE3RjKZG3+t0iwdlVLsH
X-Google-Smtp-Source: APXvYqw5kucyKKTM4IBkVmuVSkXxrf+2icqFYYo3E7o0rpC8KcPOlAdN91kDqK9Uvn+4QRgO8N4e4C44TueMtYXlkNI=
X-Received: by 2002:a67:7944:: with SMTP id u65mr1136558vsc.10.1571984524684;
 Thu, 24 Oct 2019 23:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191018101221.26483-1-geert+renesas@glider.be>
In-Reply-To: <20191018101221.26483-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Oct 2019 08:21:52 +0200
Message-ID: <CACRpkdYodPRSb0QKLaPQm6k8Bk_N2xMvuR4c9v6rvFAAOPodjQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.5
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 18, 2019 at 1:01 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.5-tag1
>   pinctrl: sh-pfc: pfc-r8a77965: Fix typo in pinmux macro for SCL3 (2019-10-14 12:11:12 +0200)

Pulled in to my devel branch, thanks! Sorry for the delay.

Yours,
Linus Walleij
