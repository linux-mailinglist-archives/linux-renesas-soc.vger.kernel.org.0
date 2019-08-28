Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A521A00F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 13:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfH1LsA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 07:48:00 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42070 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfH1LsA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 07:48:00 -0400
Received: by mail-oi1-f194.google.com with SMTP id o6so1813543oic.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2019 04:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=frj+XKKwyqwU6iAnIPlEbpQMfAgLYdlEvFvCt5kB5SY=;
        b=IAcqr+Jt7XtsCvfN4cc+wLnh1je0BIb1Xiaj2wYrmiJ7kLCA9U8NP/1xKPUU3wqdTl
         0R/E60aHgyLCJ98GQMvuxG0xD4gWNk+3lQE/q2t5lZF0O7tX200cP6NhOUNT8TPG+QlY
         NY4gfeVcEIj6bSPA1hmcaciJYxY+AWzRfB1kmX3yTl5LBwE4borTYit4ScU9rpD86ENE
         uLqb4R1k95nvuLECwq0RyIrj63zwxPFm//GBK/cWzaPPSw9OZfI++kVRmg/XlK3Y1qwJ
         aY/6VP6iCMv9E2gzQNep2EdVIX+qhndoYu+Eg/rY4rL28NhbEtZN4BwYBNkwnLn/awFI
         IEQA==
X-Gm-Message-State: APjAAAXx8OBeJU44ir848Mzcss49Ran8qvHAC0flgAGCK5cintlXy4ap
        a580Zppa53Da7sqcONGDGWCpPn87SY8VyfPEItA6AQ==
X-Google-Smtp-Source: APXvYqz4Zc8QnngmSt0O8wLlRtgXFaDZ4ZTXwIQrHaCAxFA2phBpgeKuBb0n9/YdUlTpNzgkCKsx5Qz48iEofJZdO2k=
X-Received: by 2002:aca:f4ca:: with SMTP id s193mr2233603oih.131.1566992879124;
 Wed, 28 Aug 2019 04:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu> <1547808474-19427-2-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1547808474-19427-2-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Aug 2019 13:47:48 +0200
Message-ID: <CAMuHMdXcoh7vXNNRE9sZjG=5705SyhrSPZu-9trrbUwjxxyxAg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: r8a7795: Add cpuidle support for CA57 cores
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        dien.pham.ry@renesas.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 18, 2019 at 11:48 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
>
> Enable cpuidle (core shutdown) support for R-Car H3 CA57 cores.
>
> Parameters were found after evaluation by gaku.inami.xw@bp.renesas.com; they
> help to keep the performance and reduce the power consumption.
>
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> [dien.pham.ry: Apply new cpuidle parameters]
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
