Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19CCCF96D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 15:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfD3NA7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 09:00:59 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34596 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfD3NA7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 09:00:59 -0400
Received: by mail-vs1-f65.google.com with SMTP id b23so268410vso.1;
        Tue, 30 Apr 2019 06:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9QOEFLsFgJnxTaNjJU2PS++xm88cBNIEZ3czFwBZYgc=;
        b=nkbYzhVp9PwCBLr2EKscj7GRq7f7AOQdQQnwRLJ4clj89igbaVeUxcqaOH2LtITSSH
         a6QYahK2dA9SQGkTXSZbYxUB4zEPa6YWW//p2bddDNUpye754BtFvjt0/MfM7WIIMkue
         twUJ9A933f07CqqvNOwSePBYq1YvYTOjyE35nCcwlB6+hk71jnGjcNv74nuR7r3WeWpX
         bQRsAm6+/eA3BngtdaveSPF608qwvIxEWBy6G6oqyQ7QT6EmCvNPmAQZfi7guuyWPnjM
         wE9yQgScHWeXU4LItYDZH5RHS8Fy7qTdVy2p5M66lByvV8K9l3lADRm5vVIEKkWx2H1S
         9mkw==
X-Gm-Message-State: APjAAAWYQTrQS0LQV2TmRBRXozBWgGQqrsCXUX7gN5+tQz+bqkC4S0u6
        6+3vIxx0d9FwDu4TxCTBK51ISkSIf/yJ3V/RU8g=
X-Google-Smtp-Source: APXvYqxuW78M+W5f8lVJrxGVsoYcU+IYUT3Rx1VZilMRkz0HOfxHSEAOceyRrK0FmtALbzotZ1/gLxWKgyXFJt9NEKA=
X-Received: by 2002:a67:83cf:: with SMTP id f198mr6732876vsd.63.1556629258062;
 Tue, 30 Apr 2019 06:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp> <1554969262-15028-2-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554969262-15028-2-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 15:00:46 +0200
Message-ID: <CAMuHMdU8rHVBVuuQW5GqXr5qOK7Ln9Hz-6Y9B+8RPwbU9eojyQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] ARM: dts: r8a77470: Add HSCIF support
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 11, 2019 at 9:54 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> Add hscif{0|1|2} nodes to dtsi for HSCIF support on the RZ/G1C (r8a77470) SoC.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
