Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F025AD87F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 14:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387569AbfIIMHP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 08:07:15 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45872 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387548AbfIIMHP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 08:07:15 -0400
Received: by mail-oi1-f193.google.com with SMTP id o205so1052127oib.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Sep 2019 05:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GcWN6JoSzPdT2YQasnvkoiTiuyv6YpP5jkVBAOWJ7wU=;
        b=faHNM2zaz7557/ivNPBl8+kdk3Zokh+rVB6z03I+LK7BkkxnGw/60+HCC4H+149kb6
         5ZSkD0z0dGQzr396CH2wp6hranbhdElonVDCztA2hoVZjHRcTCMsZq/P/vG17TnKoLHr
         4sKyK5pxyj24PgZE5Z/zMyW0v7D3Yd5fh8QgiudtTF6/cYaFSuxewZbSmcPiDeaOBrgN
         KGHimoQceo4YHAPjiYl459fkqJIa756e8fmsWdpPNMqZIVclOp4UtXQR4/NGtHzAdU8P
         1Jr+B4/QrS2g9S3gOR7pJg+5wtyisfAf+mHOSnQy07BPYPp3vLPdJke2JKPUSiFOc0qO
         OQEA==
X-Gm-Message-State: APjAAAUpncgS7HOG7Y8k4OiWJIn7hhKquPsFraW0r8q0iDo1qc8Wsy+v
        EMQIl7wuGBZ2JjwsrK1fu77iBtdlbWvWlxVFmhusEQ==
X-Google-Smtp-Source: APXvYqz6CQJdwW36jaVREq8gWS/vDse54eOV9TvdJEy0+ytD4t3GVhCOTgftvg8/XtED78+gA6uRAvFF5JCo+NWLX3A=
X-Received: by 2002:aca:cdc7:: with SMTP id d190mr16221290oig.148.1568030834856;
 Mon, 09 Sep 2019 05:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190904120114.1894-1-geert+renesas@glider.be>
 <20190904120114.1894-2-geert+renesas@glider.be> <20190905084252.2y2ivmtwepsobbkr@verge.net.au>
In-Reply-To: <20190905084252.2y2ivmtwepsobbkr@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Sep 2019 14:07:03 +0200
Message-ID: <CAMuHMdUP5=71u4ORQp7rOJhbidX+1aa_bTP4=SqMYS_4sVX86g@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: gose: Replace spaces by TABs
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 5, 2019 at 10:42 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Sep 04, 2019 at 02:01:13PM +0200, Geert Uytterhoeven wrote:
> > Make it easier to compare the file with other similar files.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, queued in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
