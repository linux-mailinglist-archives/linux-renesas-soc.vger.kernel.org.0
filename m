Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D45F154869
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2020 16:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgBFPrc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Feb 2020 10:47:32 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40214 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgBFPrc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Feb 2020 10:47:32 -0500
Received: by mail-oi1-f195.google.com with SMTP id a142so5013921oii.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Feb 2020 07:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1r/J3kUcwGfRO3Buj4q05X4tkzR/qr6+G5+Ji1bkrXM=;
        b=cvX6DT8ews91iZmj9YaYgyvGHlCz9t5JcdyG25kVrnEChTFVOMPYhhEqKaL0Ek9JW2
         zvVromIJFAEP+7x+Ca6toECRhLhC+QMb6TXkYTgpiM6W9ZjIaUeQuBFY41S9DPem7hYP
         08wjaTcWQGyow4thpT00O7mCcvNwgCugCzYaBh7kCcfhdRmoCJLSbJAQNgFphxNbzfnj
         tE6H3Fe5eF1vJyt28tUrjm2IpFPK3NeCIiTo4Jsl5jQgXUQvVFtlx7F4PiI9t9oSDl9H
         g9fHPCXMd4gdRMCTmFnt1XKa/Hr+AUrtudFE19jxkb2qowMIkuO98Ff0C8oEa24qkcz4
         ZP5g==
X-Gm-Message-State: APjAAAWGTI8s0UEbdLNM7i+BIFklW7QhV7wSdk1GLUA+deet6RryH6qX
        LGVuLxXfML0QBci4/QW829GrsIkBPdK559Iqmnc=
X-Google-Smtp-Source: APXvYqx74uUGJSwvKuUHU4ctC5eSQudwK10qnYyeknEU14+FDLlf+zRTe2V29OXoWd788liGkahYOntZ+bGZVLShAN8=
X-Received: by 2002:aca:3044:: with SMTP id w65mr7528653oiw.54.1581004051243;
 Thu, 06 Feb 2020 07:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20200203072901.31548-1-dirk.behme@de.bosch.com> <20200203072901.31548-2-dirk.behme@de.bosch.com>
In-Reply-To: <20200203072901.31548-2-dirk.behme@de.bosch.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Feb 2020 16:47:16 +0100
Message-ID: <CAMuHMdWMcPwHM_-FgfYuum5yfNh=FxBgMM6rKjQbajjC=ZQ05A@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r8a7796: Add RPC clocks
To:     Dirk Behme <dirk.behme@de.bosch.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dirk,

On Mon, Feb 3, 2020 at 8:29 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
> Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> as well as the RPC-IF module clock, in the R-Car M3 (R8A7796) CPG/MSSR
> driver.
>
> Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Before I queue this in clk-renesas-for-v5.7: given the fuzz with the RPC
driver, has this been tested successfully?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
