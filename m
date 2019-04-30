Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA50AFB64
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 16:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfD3OZq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 10:25:46 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:39445 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfD3OZq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 10:25:46 -0400
Received: by mail-vs1-f67.google.com with SMTP id g127so8099477vsd.6;
        Tue, 30 Apr 2019 07:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nhdJMQigqAKdCBM+sCCyBB3+5Qt19+4r6YRjT6VvCMg=;
        b=KGLV1G0ylCuxD+ECyH+DZuc0Iyi1xsX5Y+eEg4QF9WSrNJnZKhX3oZK7xh6zsbTcNY
         ulA4HkJRV65Qt2FcgCxZJ8kvEjX66g4sS1dKhh5kWHjxXVLJu7Lp9ePvFoSsJIfSX9dQ
         4x2Og/nYnOxPF9JQCLpbFSsahqd1Qg86aig3sCUO2fU6PePwDDFLaN+2ql/VarOhCADx
         BqhV3+njmyHBXWa5/x0oAyuQNDfQCld5DvyiNdxAUyyftlaWR8ZX1oaFXbgST/Xgafgy
         EIv4ITUa55QCu9sVUsJKw18uhPrOCTOmspYZN3t6bTSV0sXJo48085jd7qkejru5m0UZ
         es0w==
X-Gm-Message-State: APjAAAX2FgO0Y8drphpnyD5W5asRmnlSrqALgRMS1hTB8LWH/sYusGrc
        oaobyYsPfdpvECcy1MoC7kA1PwEKwcHSphkfj6o=
X-Google-Smtp-Source: APXvYqxvApVl1rNd0Tpc5deDycuBfahgeyZ/HO/nOcfCuo0Bcei03prJAbK2ozeZLEBmM01UD6UM0vrhB2xRRJ+xoaA=
X-Received: by 2002:a67:7d58:: with SMTP id y85mr5780944vsc.96.1556634345630;
 Tue, 30 Apr 2019 07:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp> <1554443049-25127-3-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554443049-25127-3-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 16:25:33 +0200
Message-ID: <CAMuHMdX500jXaX19LnsAxSpcvMV+pkWEsrn7XjayxnbUtCg4Rw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r8a77965: Add CMT device nodes
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 5, 2019 at 7:44 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a77965 SoC.
>
> Tested-by: Cao Van Dong <cv-dong@jinso.co.jp>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
