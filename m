Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 222134E079
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 08:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfFUGQw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 02:16:52 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64994 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfFUGQw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 02:16:52 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x5L6GlEk022160;
        Fri, 21 Jun 2019 15:16:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x5L6GlEk022160
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561097808;
        bh=a1r/AXdPUfjndw8LmQLErWaw7Q5y8shtAXjWlzQTg3c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S6BOnd4yTHvHwyp562WmDpcw6/IC4++QneQdjjlMP/28zko30KZpGq1c/wQ4rjKzF
         DlMfkNnXteCuOK32TW7OTIqjD3t6384lscW3hhn1OHd440kpT7AQKUpwyEePs5iqpi
         hEIljDYCq426yhPZL7C4SgkiYvOY4+U2dJ7a1GG0WoIHA32Oc5fkxq9VWAJKWfBRx/
         6cKX9drWwZZlTmKFgYI4i6ts2f/EAVWZCDBBs0tQibZjA56A1o9T5fl8BOfI4ggZ0J
         wg4hTo2PabQOYNkvH+Zxh6OX/lCBZCpin9gqsQnRAeM2psWO9J73taAFdEVF6u3xb4
         KVhpuUjtLw5oQ==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id k9so3129763vso.5;
        Thu, 20 Jun 2019 23:16:48 -0700 (PDT)
X-Gm-Message-State: APjAAAVRNTHUosTbPQs3caKa1ctEz1bKKi/zUAbE1w+fOouiLUBS15gO
        BPA5br6mp+2cmr0vO4zMJuAV6y9UleH9s0qDyrQ=
X-Google-Smtp-Source: APXvYqwHdZIoIyJd+Mcw4P98HkdWmF2Q+PRm9NDtqftuDYgMf/FC7vKJHlCsVLajZw6+wNIrhdv2yhD9KlimPQ5/H0A=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr3990201vsd.215.1561097807250;
 Thu, 20 Jun 2019 23:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190621060511.29609-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190621060511.29609-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 21 Jun 2019 15:16:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNASGVbkGgu7psy4DfCxmr-AxSQ3fmGJ=aDAiuSkJ5hrDwA@mail.gmail.com>
Message-ID: <CAK7LNASGVbkGgu7psy4DfCxmr-AxSQ3fmGJ=aDAiuSkJ5hrDwA@mail.gmail.com>
Subject: Re: [PATCH] mmc: remove another TMIO MMC variant usdhi6rol0.c
To:     linux-mmc <linux-mmc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rabin Vincent <rabin.vincent@axis.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

(Added Lars Persson, Guennadi Liakhovetski)

On Fri, Jun 21, 2019 at 3:06 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

This needs Ack from Renesas.
But, I do not know if TMIO folks are sure about this driver, though.
(If they had been sure about it, they should not have duplicated the driver
in the first place.)

-- 
Best Regards
Masahiro Yamada
