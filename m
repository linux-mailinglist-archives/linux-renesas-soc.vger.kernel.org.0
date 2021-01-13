Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5098A2F4C70
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 14:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbhAMNrv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 08:47:51 -0500
Received: from mail-oo1-f48.google.com ([209.85.161.48]:38656 "EHLO
        mail-oo1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbhAMNru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 08:47:50 -0500
Received: by mail-oo1-f48.google.com with SMTP id i18so522801ooh.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 05:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8tRB2PfmO/hozYhbhHcCSZIymk594Em+3lIhOaPNtgE=;
        b=TTJjivcmmA4XmSZf1LVBO0razaHlcPpHbHThqCmkkgULnMrsFsGz9Q7iIfp+bQE1i6
         N9mrdEvVm1SRMJIfj9Oh90hL73GSBxwHyn7oiSjT70/p+ASGjXVXfVID4s5ZgHeKc8Ep
         /knwJa3w93WNxjmO9Fzobwbf6VW/ajPbnhBji/Pm04/530F27P1PjQnCYhap8DHMw1Z1
         UgFLVOzOsGc6uYysB6nD62w40rW/Pnk1cOt8AJJCavCBxNVFkhnI9WJWtQpPdZX1ks4d
         Cfde9AgqZ9q3Xrix5wqyQsD3eVHWaQcW1QXqXdjvZ5QijJoKo55viFkYoEMgH/kqPxO8
         nMMA==
X-Gm-Message-State: AOAM5321Vsgq36ySlYYDFosMEomugbGNKUkIb40GbA3r38Hnjqmxo3KZ
        1Auf/rgTfL0S3Au30pIeqUTbzv+orMTdhTvc0dih+3iD
X-Google-Smtp-Source: ABdhPJx8qczk+NEfqR0qpVcpKetZ+YC1bwbk4u9aqdRUBtT7UoWD1YvRhy3+QU3T/E3S5Q35ugOkBqTmxrVbEzFYhQ0=
X-Received: by 2002:a4a:c191:: with SMTP id w17mr1302169oop.1.1610545630202;
 Wed, 13 Jan 2021 05:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20210112165929.31002-1-uli+renesas@fpond.eu> <20210112165929.31002-9-uli+renesas@fpond.eu>
In-Reply-To: <20210112165929.31002-9-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jan 2021 14:46:58 +0100
Message-ID: <CAMuHMdVK6h-AUJTPxkF+c-1u=WmO2378An8NUKsy0HH7SV2c7Q@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] pinctrl: renesas: r8a779a0: Add MSIOF pins,
 groups and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 12, 2021 at 5:59 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds MSIOF0-5 pins, groups and functions to R8A779A0 (V3U)
> SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

MSIOF1 and MSIOF2 external loopback work, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
