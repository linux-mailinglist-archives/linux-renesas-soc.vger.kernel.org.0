Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE5833203A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2019 19:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfFARtE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Jun 2019 13:49:04 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44678 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfFARtE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Jun 2019 13:49:04 -0400
Received: by mail-lf1-f66.google.com with SMTP id r15so10440590lfm.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Jun 2019 10:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qo0+ueJv/aJTWlBAJydFHhGp+OjN3tsRRuz9/0epPIQ=;
        b=p7slmxGplfKpVqpg89DZmqNY3zX6aMXgXEo6pld3GgkCVTWHjXat8Tr+EZnVJkmFXz
         bPgHceCmVhDyK5x4b2UE+eD1/W+0btWiQY27OG9oaq/G8l4z810BzhjOWHGyqfXb893M
         ARJdFlMGmfx/Br2/XtGGTcgfFL5mQ5WLZOQoJhbKE1dUwbNCP59V9bhuASndyUYnNhwa
         8eZCBFRZKLbwaaAGjVlo2bxxwSKoF1I0l5QTiMyBvj22JjjK6DYS9VgjnlFDjF9SoE50
         r3DoXN5xt6scKG6FaHR0mNpgVIxbQMdkaih0jqN6iNgUKtRV1Ws8xgRy+Osjeik4K+vi
         jkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qo0+ueJv/aJTWlBAJydFHhGp+OjN3tsRRuz9/0epPIQ=;
        b=aZ0sEVsQJusy91OCWsSXhz6/C1DnTFGIEZOezxqqNaz6rOPuB/c1bUsy46z+TZtDSy
         PeaLK0xNcIqGV7nOthJmDx6ITHS/83uvdnLEqj8Wl+Qlq1hch4j0rJOpvaQydVb6m+NO
         Ro7Oi3zROJreTpqN2CMjpR3/2JIGyLYG3zW6fQ1XNgRuFcYE1iK2mWeyK8hsJpbcbzA2
         jFCs6E6cLLuKcZXXBGeelhgDUhxDLotNCJIWUBOrXhIZY25PXj1waVbAXrejCcmvKETP
         96l79V/A+CnrZGPZfBeOZLrakzZGorHQn8iwquF4nuFeVSDnP4Tu/LfQK8XSBjrEL8OQ
         uOPg==
X-Gm-Message-State: APjAAAVJ5VrJ0ENxsNBrR0TcSFSBYwpD6MHoyV8jenRlQC8v8gDHGyw+
        byyqT1F0PcQb0JHclhhDLt6cj3gzGziOM9WLt9lUQA==
X-Google-Smtp-Source: APXvYqwv0jWGV4BMtWQTcGLMEUlFaSUlJ/eW4uXxjl+y7Xj0xYXGg60k+K2V2O1AZftPbLrmQ9hmGHJI7cqMILC9PpQ=
X-Received: by 2002:a19:ae09:: with SMTP id f9mr9147805lfc.60.1559411342738;
 Sat, 01 Jun 2019 10:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190527124051.7615-1-geert+renesas@glider.be> <20190527124051.7615-3-geert+renesas@glider.be>
In-Reply-To: <20190527124051.7615-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:48:51 +0200
Message-ID: <CACRpkdbsfm-CU41Gj1b6-WhZBgkBDjtOUn8=W1YXe5p0EG=RAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: em: Return early on error in em_gio_probe()
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

> em_gio_probe() uses managed initializations for everything but creating
> the IRQ domain.  Hence in most failure cases, no cleanup needs to be
> performed at all.
>
> Make this clearer for the casual reviewer by returning early, instead of
> jumping to an out-of-sight label.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
