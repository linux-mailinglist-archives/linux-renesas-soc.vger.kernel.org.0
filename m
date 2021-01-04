Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731202E9D23
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jan 2021 19:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbhADSgR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jan 2021 13:36:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:45894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbhADSgR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jan 2021 13:36:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DEC3422273
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jan 2021 18:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609785337;
        bh=NsMJtfyjfFf8t2oznLe+xlCtgVKH4JII+ZGGiF/eUAs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jx9+X96vVmKXaqSBc2oxgtzghxgaFNfS3Qolqj5t8mlSDUGCAXnZqrVsrc7/+ostI
         oG58JfhVwZH97yVM1RrEDZ4bMmS1mD1x2Br/INKB+lVJVY1oaA4yFZmmUHKNU2wX/i
         ZSBb7kNrI5EoWocmAEaNBrRJjzMUJvhM4IzCbGh7o4YCg4vzuo7SmiLLvH5dd0KkE6
         meT1f4iCcbouzk5wDfgvHKtw8BfQ2zD2kfjIalzZA9Q9kZKaF0MGsQirzw5fpsIB0P
         8IQvhMfqFgzIwz9YtzU4TphN4wCUGl3fgyMVOOcBkvH7dX3qO0+G/x4+OiJjHWdfGt
         NFf6gz5U+dWng==
Received: by mail-ed1-f47.google.com with SMTP id b2so28428348edm.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jan 2021 10:35:36 -0800 (PST)
X-Gm-Message-State: AOAM5305ghr1X7xEiaSenZYhfEdTFL8AaWf/p0kafExEBumFnnkhc2F2
        ssU+ZqluPgp7aYwl8m59reWHPFpEY5kBxZ395g==
X-Google-Smtp-Source: ABdhPJyiAwX81V587mWQ6K37emEHsZmIP2mZ1ElHpEbVNqSfWDy89pwPgcfB7Gw6Ob3+wbTWAnPOaoXFgm7R6EQBXNI=
X-Received: by 2002:a05:6402:ca2:: with SMTP id cn2mr71984086edb.137.1609785335489;
 Mon, 04 Jan 2021 10:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 4 Jan 2021 11:35:23 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJ6bL3rnTO+gMDdbuceikv4X9J=mAEGXAQs+riWj3XV2g@mail.gmail.com>
Message-ID: <CAL_JsqJ6bL3rnTO+gMDdbuceikv4X9J=mAEGXAQs+riWj3XV2g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] dt-bindings: display: Convert DWC HDMI TX bindings
 to YAML
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sandy Huang <hjc@rock-chips.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Mark Yao <mark.yao@rock-chips.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 20, 2020 at 12:50 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Hello,
>
> This patch series attempts a conversion of the DWC HDMI TX DT bindings
> to YAML.

Please resend to DT list.

Rob
