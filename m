Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEAD31E9B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 10:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfEOICw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 04:02:52 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:43990 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfEOICv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 04:02:51 -0400
Received: by mail-vs1-f65.google.com with SMTP id d128so1077530vsc.10;
        Wed, 15 May 2019 01:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+mHqYN3auk8GZnQ52S6Ycmd1QTWcIjghTXl6+HXbvFU=;
        b=XIG4B/n236X/NYkLbf8xQ9E9LXxLz1ZHEnvnXV1qHf9fwRB8Sm3aSPi9AncT4e4nSe
         rZDjwps/pLkJizdnJmInMzIa1dC+crc4NVyZ7CfrMTFsmZTTky3W6hzmnjfICnA9QfxL
         jz2QzD6PCIlyfovsExowf6f5Lmpo8s4NnPQM2pPVgkf3HtB0nZLd7Org8WRIsuzgAHzd
         YcwM8O9TEpnMGJ3MtRkaHK8Zpg5ajIsQRxpmiFTGFWVkLH8KVcBnObWMnj4z979EJ1gW
         xUw1eLi2q0jrvqwCRXMsYP4/W7heh1C24H0uzfL+j81Cw4mJJExlI3CDyd5eUAdgmK5w
         jQiQ==
X-Gm-Message-State: APjAAAWZ0dS++qnMpoGggibQiBjXOfCaCiMv5+px+lsxZqEbEjKbK+jT
        S6tJA/t2w4FbPCSph6p7F/ElenA5Clzg4Po8s7U=
X-Google-Smtp-Source: APXvYqyrDGZNtapcY3vdADfMf9TTlHOnr729sk5O2OgjZSf2L+gqEvMASzm+NPekmoAUxZCj8ioOBSN2X7T2bWBMDZs=
X-Received: by 2002:a67:8e03:: with SMTP id q3mr19856307vsd.152.1557907370338;
 Wed, 15 May 2019 01:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-15-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-15-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 10:02:38 +0200
Message-ID: <CAMuHMdW4TXiGjAzjKPg5As8Ew2N7M-9tSf0Au-GAG_fFtypeCQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] ARM: dts: r7s9210: Add USB Device support
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 14, 2019 at 4:58 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add USB Device support for RZ/A2.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
