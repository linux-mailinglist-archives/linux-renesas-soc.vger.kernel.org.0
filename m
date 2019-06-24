Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81D2E50A3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2019 13:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfFXL4a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jun 2019 07:56:30 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36679 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfFXL4a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 07:56:30 -0400
Received: by mail-oi1-f194.google.com with SMTP id w7so9532126oic.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2019 04:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ssDxcYuQL8NJg2GIEkvWAoxJsta0M/dWxnbnrXLKhg0=;
        b=aHpSpHPatNsaCfRszuYgf8HxPJeBDC4i7GN8pr2o3yyhz2B9VEy+6noeMapfHse/bA
         MNHu1Xgcxaw8F8Ly/8HdkXMZa/Qab5beJiNlSu7M1nnyDjyNcSZDdMNQGXkfPCGLHq0A
         4ULqvNJJ6QyS66TTgl0eBfPzXS62i/wBvQ/ixI045zH4spF5BmMt0WT767rhHBqBOK88
         tz5yFjGQe767IPxp5TDmIHK3gpr2c/mSyHFUEa1BL7bXuBxvRfW1Db3yeL7ylchM6Cit
         E6gjKCKb0OyVEg9yVrCB4eNDXMysc59aSqq6wCoytsyFXZ8urt1mec06+uuX+wHa/1Ct
         j1Zw==
X-Gm-Message-State: APjAAAVWaNQq9sbfiSgnCWyiAQYrjQYA1E0jd6RZxZQqLkDN+P+568SB
        Dg2LcmrP7jVTdXwpmXtHZVgHODnrjjrU2qfDxkI=
X-Google-Smtp-Source: APXvYqwkpMIzEvtGyaqXg8e8Y9ox6VuQNAT72hDi/EYBNNnR/+wFLrRSdpKFq8m8HjzJFRI5C5OUZs4HM9eZ8wPmc4Q=
X-Received: by 2002:aca:338a:: with SMTP id z132mr10936988oiz.54.1561377389323;
 Mon, 24 Jun 2019 04:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190624105224.23927-1-horms+renesas@verge.net.au> <20190624105224.23927-2-horms+renesas@verge.net.au>
In-Reply-To: <20190624105224.23927-2-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jun 2019 13:56:17 +0200
Message-ID: <CAMuHMdVHVqD82GFozrDgdRu0sveN4at7v7JY1CSwJophbzCvjQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a77990: Add cpg reset for DU
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 24, 2019 at 12:52 PM Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Add CPG reset properties to DU node of E3 (r8a77990) SoC.
>
> According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
> level so specifying one reset entry per group is sufficient.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
