Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA999CAB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2019 09:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbfHZHjM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Aug 2019 03:39:12 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:32807 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbfHZHjM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 03:39:12 -0400
Received: by mail-ot1-f65.google.com with SMTP id p23so10135031oto.0;
        Mon, 26 Aug 2019 00:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vEfCPAqY07dyrP06P0cvU/MY6k93mkpkoTihAOwUmHo=;
        b=j8Nhp81nRKaZMc70U8eTQSM8fpSv36ocE4nAR54jTQeAhNQHcT+Z/dthXbkgJobyxN
         JZnHPmDxVeTbi0mwu8TJPjtYI0G8pdR48jvWPbJBbJamIHh3rU1G8v/+NLUHLSZx2KQ/
         di7uQ7iQKgz2Bi7vCrUbLKlLOdWCNV8wCvjkcCxJxib1z0yxhdlsKM52fAJRvnbhQTwl
         H5gmrW/LiUNET6LjOvCWp2OBTjrZRJcR2s91JZZc0YPIX0c67Jb69bjoSfRxPP7xCp6e
         6WA+X95B4+4MQ92nh+J3/JlN/AExwD3AShGzdQgo10H6ey36K/4UFng2SMvpRn2f4oyn
         DkZw==
X-Gm-Message-State: APjAAAUJIZ58CYpNjW2ar8zRhvsQnKvTFFSY1kVMx8JhMaD3YZ0pibPR
        KVCt8eoq8LWag8nU9gXeTSfu29GX12qZCjty2E5V5Q==
X-Google-Smtp-Source: APXvYqwkoCxSbme4rYgbMRu647BIyPqfZXVwsghyk3qNEWMLpf7phOU9xHXwfihODfFW95DSCB1eMcQHrYOt9D8KD0M=
X-Received: by 2002:a9d:61c3:: with SMTP id h3mr14516217otk.39.1566805151674;
 Mon, 26 Aug 2019 00:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190825140135.12150-1-jacopo+renesas@jmondi.org> <20190825140135.12150-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20190825140135.12150-2-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Aug 2019 09:39:00 +0200
Message-ID: <CAMuHMdVjhjsHEEocBjRxf71DqVBSbT6AOHJnBmL79d7HuFa=Dg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: Add LIF channel indices to
 vsps property
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 25, 2019 at 4:00 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> According to the Renesas R-Car DU bindings documentation, the 'vsps'
> property should be composed of a phandle to the VSP instance and the
> index of the LIF channel assigned to the DU channel. Some SoC device
> tree source files do not specify any LIF channel index, relying on the
> driver defaulting it to 0 if not specified.
>
> Align all device tree files by specifying the LIF channel index as
> prescribed by the bindings documentation.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
