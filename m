Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAD5135DAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 15:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfFENTV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 09:19:21 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43765 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbfFENTU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 09:19:20 -0400
Received: by mail-lf1-f65.google.com with SMTP id j29so5145454lfk.10;
        Wed, 05 Jun 2019 06:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TkLFUGvAiyctjxGne0f3rGDrqNO6/lJ8CwtDsQQnQVI=;
        b=R9eOJYxV0RT7UPW4bnDdRX3n4xWGryrEqX/20hkYarAJnCVej9U30q1T9zk/ygl6nA
         1vzSPLOl1OzlD/tMXzVZlzBVH0QHibcexJpTZz1z7MNbaVstZSQRjg2dLzszz+qQ6d8i
         eea/pkY28HeTwoKRKpSCy6H0Lnc2z0rY9F74iWWx+UGitezmIhbuQL2IjN/S62aq5l3G
         TG0ikntYASK4Iaq03zoYjE5WSZ+jb38zjcjZtPCgIbaa32Pr63KwssWeJDXmPvjgK9NF
         FRgCwJXV54IKH2jC7Q/tkAa4awngdTzM1rPPYY/AXzDnqhFKxJ014mIGpbUjb56Za9z6
         43Lg==
X-Gm-Message-State: APjAAAWiUdut55DZI7pzRBUxQ6EAyYSYuoDM0avyfcDXmZJVwG7gubc0
        NZhDeWJ/shyxgOkGvjdB1NNqwTKVF+gd/zb5dbc=
X-Google-Smtp-Source: APXvYqw9ar5Lm3NHnPfdRlgoAGwuMpuYML+GDFcPpA0le48oE/VWdx5uyjckLvPHs3IWYYeOo2dG4N1s7sjzVddVCWE=
X-Received: by 2002:ac2:5467:: with SMTP id e7mr20045151lfn.23.1559740758824;
 Wed, 05 Jun 2019 06:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190604200914.64896-1-chris.brandt@renesas.com> <20190604200914.64896-3-chris.brandt@renesas.com>
In-Reply-To: <20190604200914.64896-3-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jun 2019 15:19:06 +0200
Message-ID: <CAMuHMdXd=BSUbOYm1tshZBd76m=k3+tBeM62Z9Z7YN=_fJnGqw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: rza2mevb: Add input switch
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 4, 2019 at 10:09 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for input switch SW3 on the Renesas RZ/A2M EVB
> development board.
>
> Note that this uses the IRQ interrupt, as the RZ/A2 GPIO controller
> does not include interrupt support
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
