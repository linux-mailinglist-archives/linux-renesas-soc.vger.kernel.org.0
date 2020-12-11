Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6183D2D75DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 13:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405411AbgLKMnR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 07:43:17 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45768 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395477AbgLKMnI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:43:08 -0500
Received: by mail-oi1-f196.google.com with SMTP id f132so9628619oib.12;
        Fri, 11 Dec 2020 04:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p/OaLDg+rzJFWI/MCfE2RjwOLQEVRy46YaeS102PzME=;
        b=WnOWLRCSSyYD+gE19UH+xmrI7pG3txTxg4GvS35Ld4077Rts/cfviw7jth+jZppFux
         LhYPz5bXecm09VVVk5rN3LDjz51wYp7hZeByL+HifoDGr4j1r0qOu4bp/1kaxS66xfIt
         3M4AAwNLaY3Ad976zt2cBJ3ejJ/3gL1tCzVBfO8BfoAh7FTem2HEU56iqoNRoa4gDfe3
         LvE+zU5jgkDBuF2GrLaOTkMy5YIUUXZ965fwQcnYF/d9ogd4BdQXjU1jpikBIcFeflUH
         BknrmjNGnx+Q+kZWcnaRvZPko0uvsS2NSUe8IW5QqkQQwdJmJP7LYUqhSC9Hh4JKxELH
         DvMQ==
X-Gm-Message-State: AOAM531DdkEAYKpoXxIB9I7h5q3NXqs+mnVFWIL+A7BblNbbBk9ZXTm8
        rpj/AO3bFw882JzS9QQzEAbos6pbzXkig+ghODuvnQLRVmQ=
X-Google-Smtp-Source: ABdhPJxiiU49fjyHGrVe6lcqxwSETIx9zzaJ7SSqdaF/rwKbWLBzUwG8CyVYetonRY6GjCsX2kmuZllEAN5jj88jR7s=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr8984583oia.148.1607690548082;
 Fri, 11 Dec 2020 04:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20201210152705.1535156-1-niklas.soderlund+renesas@ragnatech.se> <20201210152705.1535156-7-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201210152705.1535156-7-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:42:16 +0100
Message-ID: <CAMuHMdXSV=e4LQMuXwC7v+JRE=4AQ=XTH5UW+V88=vcC-paxmw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a77995: Add TMU nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 4:27 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device nodes for the Timer Unit (TMU) on the Renesas R-Car D3
> (r8a77995) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
