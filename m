Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6125A2B7099
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 22:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgKQVEQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 16:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgKQVEQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 16:04:16 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BB4C0617A6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 13:04:15 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id v144so32026171lfa.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 13:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zgl6E2Ykw2oSQn1w28fmsugeMPZaQxHqS8oXF+f20co=;
        b=q2zdu4NoqBNyZHCKmy7C0hrKA3Mv9ZZvSpQzk05yDpf0tq/F898wVTkjyKiGI3X965
         URrsRDR6Uwaj0PRrPG7T5GAwKh/UWLhtMwYw9h0Am0Xs66ZaxGtmCs0jGfwwYsbeR74d
         yKWypHjJRqpCqpNp6B1NyN+LFAlNcGhkPjdp0hSoOFZ0z1/I7J2kzaS8ktF7bbBY6FLr
         kFNWdZvPGO68Dxi9m2XnRzV0bGPH0V36Dz/IKwjW/QsbJgYNYP7hhkBoAbR28e7/26UR
         tlHUlSMf/uEB8p46UwgUHBy54WEjVolgcZEoTlGFENLAb23zZw6GxINyLx1J++fnSrCS
         z1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zgl6E2Ykw2oSQn1w28fmsugeMPZaQxHqS8oXF+f20co=;
        b=WUaqcJeWhTljefFexCMulxR9gCdhz6P/n1DhuF44UhDdXfujip8YtD3BQlRf9sJgnl
         SFWPAC1M6J6tZc2E9mk2jibPggAc984sEz6wav8QZRuub7QkNUFAxfJ9ULJbh6aU2BPh
         Z8d9v2msxS4Fv2fs1dLsnIf4lIUkVyoudKArYb87YsyaRTul1JG/BqjSJ00W9ZkDp6St
         +gwUiJGFjtQQDzSRingAbPmx8EGvppSMHfaFYe2ZAjL0y8nEV1Tdmje+G6/XLFpr9509
         raeSAEDpN7vPIDAIA836m39BYIke0vEs0n2mpWEG4/3D/Fk5M8NueMSo4ggbMue3a0wi
         m81g==
X-Gm-Message-State: AOAM531vNkLTDwNVIgyO2jpLD0I/2/lrga198EJnw7YsTbiglxYnJGV9
        xc3hB3Mq73yk9lsIymf9yhwFV1Dsmd9SRCbEv+rkug==
X-Google-Smtp-Source: ABdhPJynjCbVNSZR7txIN1CNMuxzgyFSB3kNdjYDK2X7OxfCX5DONMDpJ99UxLL8MoDYnQbi75J9pOWRi00X+Qo1Id8=
X-Received: by 2002:a19:8686:: with SMTP id i128mr2298194lfd.333.1605647054194;
 Tue, 17 Nov 2020 13:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20201113151807.3924625-1-geert+renesas@glider.be>
In-Reply-To: <20201113151807.3924625-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Nov 2020 22:04:03 +0100
Message-ID: <CACRpkdZTuh-qR3PEr2y5nMnLj78WM8=2Zq+-v=xXercA6+JCNg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.11
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 13, 2020 at 4:18 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
>
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.11-tag1
>
> for you to fetch changes up to d4aac7d439c2d9307cb5137fc285464a36978107:
>
>   pinctrl: renesas: Constify sh73a0_vccq_mc0_ops (2020-11-13 15:37:41 +0100)

Pulled into my devel branch for v5.11. Thanks!

Yours,
Linus Walleij
