Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C95133AB3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 06:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbhCOFuA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 01:50:00 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:41900 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbhCOFtk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 01:49:40 -0400
Received: by mail-lj1-f182.google.com with SMTP id f26so14742733ljp.8;
        Sun, 14 Mar 2021 22:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=r4K0u/jpzmh8yUiz5MOhG3v0ej5UbQ2ZoYoYHKWsHpQ=;
        b=Qu7vMWhmilWVGpEGkHGC5V/yhuuakIg/cgztHNqvQBiPMe8ys06cKIDQSQxyn8rAcr
         aTmg6q9xyuoMVVvH+L+X2wCD58id1a0fI1QYbARLQuWNPEoxDxUnGhgBllI2Kmzi+U0o
         NTXr8IYLEigCJma+SFL/OBl1EDVacUg7pltmS6j8/A/e9bpWT5E+fX4dALWyXowgjndX
         KW+MAaA5r6M/X3D7bd+g5ltWyB8G1mbOnZIlOwYUXphEk7r2Zb78hdF9DKU6tEu08LR3
         MO1+amnTRF1MF3CgwXrj/x5sv9W6ZfmzOkwy9K8RXIsKfrT0vrfm2/bgoVRt+6Q7WTBk
         uZvA==
X-Gm-Message-State: AOAM533lnCLj3VjZjlC9tS1d5Pl98i4pVbhh9IDMSlQw5fyTCJo0KIIn
        m/Zen5LjgCaVKtWpXb2a4go=
X-Google-Smtp-Source: ABdhPJxbx9w3LbEVOVdcL5LmGhUsACM7HX9qmS6ShUJJBEtKu2zXZmtSm+JlpFqsroWHESrnUxvu5g==
X-Received: by 2002:a2e:7117:: with SMTP id m23mr9780547ljc.197.1615787378969;
        Sun, 14 Mar 2021 22:49:38 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id m24sm2569907lfq.184.2021.03.14.22.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 22:49:38 -0700 (PDT)
Message-ID: <53cd571332cd7e941589a25c284fc9e28c69725f.camel@fi.rohmeurope.com>
Subject: Re: [PATCH 2/3] regulator: bd9571mwv: Fix regulator name printed
 on registration failure
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20210312130242.3390038-3-geert+renesas@glider.be>
References: <20210312130242.3390038-1-geert+renesas@glider.be>
         <20210312130242.3390038-3-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Mon, 15 Mar 2021 07:49:32 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Fri, 2021-03-12 at 14:02 +0100, Geert Uytterhoeven wrote:
> If a regulator fails to register, the driver prints an error message
> like:
> 
>     bd9571mwv-regulator bd9571mwv-regulator.6.auto: failed to
> register bd9571mwv-regulator regulator
> 
> However, the platform device's name is already printed as part of
> dev_err(), and does not allow the user to distinguish among the
> various
> regulators that are part of the PMIC.
> 
> Fix this by printing regulator_desc.name instead, to change the
> message
> like:
> 
>     bd9571mwv-regulator bd9571mwv-regulator.6.auto: failed to
> register DVFS regulator
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>


