Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E580D0F01
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729699AbfJIMmq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:42:46 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42900 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbfJIMmq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:42:46 -0400
Received: by mail-oi1-f194.google.com with SMTP id i185so1582102oif.9;
        Wed, 09 Oct 2019 05:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cBfAD750pnPHdkDA3FXKrBrUC37mCD/kmwSQTQIfDYQ=;
        b=Rj+VK3cHv41+9jPEh4T+UPATjcGKIYybVIrHadeSq0Gv8YYOuuvdQJvf9W2mz8UyEq
         356Y75Ptmr3gf4B+MTzcwP2ISNv9L7Aw3mn5p7s30GfGwi8edvKvzjPUpXL3wbU8jvVD
         V12wrCgAPwbOEQhLjsXGPx+Cojw1mcR+hdNhHvx/vnFOw2w+0XwjaxC4sxZuBwt8/y4b
         gb66vC7G9Gb2+k9z/j7A0gjjMQTx+9le0TfwHy/brt1eBNSKMdJWUubVqiOn7j3iqhPi
         cUNgKZbO/9lhnZLWcLr8KnNVwH0m6MN71X48x3bKgP3WZJOJhkDOlW0NmoDQMqFg6pRe
         8A7g==
X-Gm-Message-State: APjAAAWlkeDIDCRBzngXqIRTuNDgx9flTZ93g2xsy1aBhdeBpv+m+jFh
        ntMuOSEJyhcMfjzEi5WfnCrUGlV7dxqWlKUchOk=
X-Google-Smtp-Source: APXvYqwxU+pwr9Xo7Oc7GxwIcW8/MXwe4JAheXnbvG9XLFxCG1T4gCCpcFaWgkGPFsA6p6jRmFOfoKmZNvqK8VplDCI=
X-Received: by 2002:a54:4e89:: with SMTP id c9mr1963807oiy.148.1570624964208;
 Wed, 09 Oct 2019 05:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com> <1570029619-43238-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570029619-43238-5-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:42:33 +0200
Message-ID: <CAMuHMdUoX4V_-k-nwYb6bgRBkL6Kv2029vqoG=b0LKPNoynFDQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] arm64: dts: renesas: r8a774b1-hihope-rzg2n: Add
 display clock properties
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 2, 2019 at 5:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add display clock properties for the HiHope RZ/G2N board.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
