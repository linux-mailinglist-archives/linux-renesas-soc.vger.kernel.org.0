Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E75A1321D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2020 10:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbgAGJDj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jan 2020 04:03:39 -0500
Received: from mail-io1-f43.google.com ([209.85.166.43]:36187 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGJDj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jan 2020 04:03:39 -0500
Received: by mail-io1-f43.google.com with SMTP id d15so8377220iog.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jan 2020 01:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gj7J+/hEyeRK4BnoKtzoxr09YQuNhvHYUJt19aqFDpk=;
        b=rCQ72smI0DeWhto4Sdmg+g3DY80KqgNn96Sod2Bue/c4qK+Y2AWvn1/SKK0jdm3uMy
         4OWncNlPthi60+f6sTGrp8rrYPvKwtxNVE9q20Fone5ubfhDjcoDdqDxDEQToIC91W19
         1MVc8vTRmZbJ50sao+hrdDQ6lVbXLTX/7vT5BJWxxIBEeAFbgdIfsd/GZdCMEtBd/9XW
         w/H6CWiDdCHqLtmpvq1SBiQSd6pm40ProtZ5QnDcHg1DjzsNfg/SH0EFcbZVvQ/7Uyww
         dtkSLL0pOjU3mdP9zeAlTeJT3ui9xN4Vqsimo4y4KrTLY/1HDnct8cCDJuH61tYEXyMC
         9K4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gj7J+/hEyeRK4BnoKtzoxr09YQuNhvHYUJt19aqFDpk=;
        b=SOfzQe3DWz9bukgNmBs6/WebPNp0bsDZfDLTE/Gnm+FDi117FZBgmCWfcmxzHTL8Q8
         lTRpehBq4M1rdgLPncC9vdRNtqQL9M/SD8tjwl+RK+gWxRCMNXVDFJ2YD7QfuhCO0qEh
         XhE+mYJdfR1hjXZUDao5HKJSNm4XQX42SqUb/+tCQ+hLT4BQOYVLbGdZFTn3Z3mZ7Hxm
         iK9vgvmW4mmzqxWNeHeK1RIwpHUj9FIAk+3i3u+4Z5FyrsMyYk7dcEq/hYQpmIySJEmH
         1UdsfuvEpwxPgWW2F7wknnc9BnxTYDb5l36fPy38PMWomMVLkCAxTLfHIXy2jU09MRai
         4z/A==
X-Gm-Message-State: APjAAAWEe4DodRgTsvmg5569v1bM9NDjWDsBav3Cs5T5GHS6GFwzdHWI
        E0V0YjXVe9RLyZ8Wb50vvuAA2HVd59LEeTxuHR3wlA==
X-Google-Smtp-Source: APXvYqyUtDB0HoymsX65YpI76/mEkEWx0c+eKzafBa4vfpoPil7ziDgesHwZmWXrZmHNbTMZb+waD2Dwo254bAv1VmM=
X-Received: by 2002:a6b:fb19:: with SMTP id h25mr72537201iog.40.1578387818317;
 Tue, 07 Jan 2020 01:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20191230133852.5890-1-geert+renesas@glider.be>
 <CAMpxmJVN3f5vWZoUpgsM0kocmBYSO=T0OeoG--5rQi9=jk2t2g@mail.gmail.com> <CAMuHMdVo7bvCKjn2-SD4j7EPwDPeTWn2Sh2e-Moj+RkqudZGuQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVo7bvCKjn2-SD4j7EPwDPeTWn2Sh2e-Moj+RkqudZGuQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 7 Jan 2020 10:03:27 +0100
Message-ID: <CAMRc=Mf6CpsMpqwXjzC7jF0rxchSop+q7GQ2xgooKVRuC52VPQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/2] gpio: of: Add DT overlay support for GPIO hogs
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

wt., 7 sty 2020 o 08:46 Geert Uytterhoeven <geert@linux-m68k.org> napisa=C5=
=82(a):
>
> I'm happy with a (static) GPIO hog.
>
> BTW, what exactly do you mean with "mux framework"? Pinctrl/pinmux?
>

No, I meant the multiplexer subsystem under drivers/mux. I thought we
could call mux_control_select() from pm_runtime_get_*() or something
similar. This is just an idea though, and I see Frank already did an
in-depth analysis so never mind my comment.

Bart
