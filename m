Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E04FC324EF
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Jun 2019 23:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfFBVQM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 2 Jun 2019 17:16:12 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43567 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbfFBVQM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Jun 2019 17:16:12 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so699572ljv.10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 02 Jun 2019 14:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8T1+dzGUPlJZVWoAd4z0z5Aw8+26WylLPddNn2kXCoc=;
        b=uDmeWBSvPWwY/Xcy/Wo9gAyyBjdAFFuYsO9c0BGFxjn5LQ53aVpbRpWvOXf2eWKg/F
         WUhTFNpxcWNpt9DVQ0UMRY6VxeBiGh0NPAQYnNwVp27n9t0j/MhEwrOPGtSpyPaeZTKe
         JfAgAFZbQQ5UBl+6WW04X/JPFkDciPAmEiR4yhvm2TbtLBobUPk9jcDwlssE9Pu5MDtx
         Q75i6qPb1T/sQv5ZTTvZvP6zZ648T9f0YE7vCRMciSW+flIP4FD6Dw/rX9R1Tuy7Ujkn
         MDdphixEgYky8kpKG92NdNZDS7j6TkNj3jz5S1ue8edGTX8v5t31GzchhxmLc5953KxH
         to9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8T1+dzGUPlJZVWoAd4z0z5Aw8+26WylLPddNn2kXCoc=;
        b=AtFCJ3jw4yycdXN3qUXvSo/6a928UvS8dhzZF3ycDC9744oSAwvkalns/5eOs0BYc3
         OpmKb1oL0KsFY7c6D1fHJNOexE5qjktciyeAb0ch9Kggw6FC3EAlLn/SxBupH5tSng6i
         B8DR4/GRm03xxyefTKGE7WettvhjeBKXMrws5VS5WRnX11WieNe6VQ20vhyWOPystJo7
         98yESU4uYlU/ziOromDdr8yJ/mCTSUxknc6mZugBXpEVODZ9mi6IzpcLuxtLej/CWXFb
         xYS3f+c4rN8tXymNZQ5hLZfD+LfE9a0TxgWrKhFhyTc6XMi8tX4Q6oMAUqNAHZ3+LMzQ
         kfbg==
X-Gm-Message-State: APjAAAWDWrH2UREcIPn/AZWfLbRWETIxTXEeORzW/ZW84KP3sSy1ndoA
        CSwqOAwrTkhWgOLe9V53bzPMuJIVCH2JK4oChxvAKA==
X-Google-Smtp-Source: APXvYqzEv3XI8HR3NBUpLPPC95bB8sLdUXohJYVJ3o43AIA9+P/PValMvXaa/HUyGeWYox7xSBnMajlmovu45mYeBLk=
X-Received: by 2002:a2e:984a:: with SMTP id e10mr4201055ljj.113.1559510170002;
 Sun, 02 Jun 2019 14:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190527124051.7615-1-geert+renesas@glider.be>
In-Reply-To: <20190527124051.7615-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 2 Jun 2019 23:15:55 +0200
Message-ID: <CACRpkdborVXy+DF=PkAUqwF3XpbHtBTVJdd-_jPRXBQU9Ob_zQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: em: Miscellaneous probe cleanups
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 27, 2019 at 2:40 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This small series contains two cleanups for the GPIO driver for the
> venerable Renesas EMMA Mobile EV2 SoC.

Ooops I missed that Bartosz already applied these, took them
out of my tree again and wait for his pull request instead.

Yours,
Linus Walleij
