Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9801A2EB261
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 19:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbhAESUL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 13:20:11 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:41247 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbhAESUK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 13:20:10 -0500
Received: by mail-ot1-f45.google.com with SMTP id x13so556789oto.8;
        Tue, 05 Jan 2021 10:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mLDmkFDuqbDYj1G7znQagvP5MQGrjvz1ZtbFc7sI7Vw=;
        b=hHLfqAq9iY5o4DFZQQJnIoBucv2VJj8zflBo+tvECdVIME9yINgImwtbFzx55YmqBb
         46OOMQWuAaoWC4YgOv9Q0thwCc4q6ran/mNnoJRoRRtfpAvYY/2R4mLNnGhjNWL3wxDB
         lwsAcT8ePieY3np7hm2x/Q0EQ8yOaCL7goTm0KW/5YdPOu/C44dGIbNRY1ZTgTE+VrN0
         n8YYBw7rMziBrl/UiFDl/JtD/cDsUt9YZfpsrbCp6kH6aEgzyCMERYXHWhudDs6wASbW
         7Ga+1ODz5uBHlTBeohwmcVPexHzS0gHuaxWmiI1gucsLUmgMeugpm/1SYpGGYGkWApn9
         zf4Q==
X-Gm-Message-State: AOAM533DHska6+q6rlDozjBXiSJ6Zg3j3dRC8Ke4Qth23AuUvBBLZpFy
        w79VF2hkvt+lvxlKquD1uTSEMnXgZmaO/8Lf5ic=
X-Google-Smtp-Source: ABdhPJwdISUovk05672ZFZNTgEp/VEh0H+IhJDl4EbOWW7zKJITnIUadjXwUsiM9ASzIxTLq+mYl6UcGpwXD/4//rZg=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr539735otr.107.1609870769846;
 Tue, 05 Jan 2021 10:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com> <20201228112715.14947-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201228112715.14947-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 19:19:18 +0100
Message-ID: <CAMuHMdWwg2OfyT3Dis4Z0_Eex9r9k_4HxcOhgpA27tkbjpNszw@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: serial: renesas,hscif: Add r8a779a0 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 28, 2020 at 12:27 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
