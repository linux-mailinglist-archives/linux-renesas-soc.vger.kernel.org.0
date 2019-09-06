Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32137AB717
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 13:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387559AbfIFLZi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 07:25:38 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34333 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfIFLZi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 07:25:38 -0400
Received: by mail-ot1-f66.google.com with SMTP id c7so5403464otp.1;
        Fri, 06 Sep 2019 04:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2seBUaTamfLoyqBNDay2Efqo3HYZp/hZHqTCucjSocc=;
        b=tqPw5Ipl/HZ2Hc1thtSguwDtMu2wwnCxEB/qklq2XN5EGuwQZ8peoWenz/hN9NMHmt
         yzipnImZTeFp2Kn9nxD0eZmbLDSluE+FCuo7WiSNp1J+wOjC8KhM+y3FIURQKpytsFQN
         k4eM8RpQoDDs1kzC9ajexKc0/65btzcdmp1Vi0GuZrGF5UWfsxt1GSKshL9garnfgtCi
         nMwEl5pt11hJJnyivq3u6TqIXb4dKbVTEJFG8n4QL9vqCWIfNYRBPY6mUFqDi9T6GzVU
         +Q+cuF/1pQjxOMz1MwPWquAUqFLZMyru6LrDw4owpqBy0O2TbYdD+L8l3Qc/0wILhm3I
         PJFA==
X-Gm-Message-State: APjAAAX0iwuI22MlPNkqqIdZWf5B5FMOB+MLpM+7fg8GsTUXd6djWX3P
        cETNzVTEvGaZRY6s8aUQPqjbGE4E+ApGVq1bFogNFQ==
X-Google-Smtp-Source: APXvYqxq09C0iDSIrlf84kwpJCJ+Wd/Jnq5TT7zXXFO67Jup4Sj/GnDkQvqs5YXO2wIwBMkFAn9ljbrHLbaA+2dJGU4=
X-Received: by 2002:a9d:2cc:: with SMTP id 70mr6682513otl.145.1567769137650;
 Fri, 06 Sep 2019 04:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190906111624.6820-1-horms+renesas@verge.net.au>
In-Reply-To: <20190906111624.6820-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Sep 2019 13:25:26 +0200
Message-ID: <CAMuHMdXxQf5801y8qNaPA_xAmJBj=rzOb8Tbwn8FbbaJp75eEg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Correct spelling in example schema
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 6, 2019 at 1:16 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Correct spelling of "identifier".
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
