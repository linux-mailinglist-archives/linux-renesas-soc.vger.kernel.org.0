Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E63AA69F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 15:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbfICNgW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 09:36:22 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:37080 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbfICNgV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 09:36:21 -0400
Received: by mail-qk1-f193.google.com with SMTP id s14so15957597qkm.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2019 06:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MQm/n4fmdwejgXomcQdi/U1plyqc35h60GF5knvLVoE=;
        b=e4qmt+Z70rL8u9pNnc9wGLDi/W/YjOGmLky+hUUbeXSr3LdQehNXMKDO2+Q16sQauE
         P59Nxmj/Hp5+qBxQfvNPzEFh0Mt7KTo4DRyIBzXiWr+mUEHpsBXeJ5QGrfRMJSKt2sH5
         pnsNp8XpNtvelb9gUk8+4aCDqQU3dL+QldaxPRLEL2UbAh5+U53O/bXlXkUNl3klZWoO
         u25F2MWLZiXSJ0UgxQqKinvV3Bvh6ECwGZJjJajjj/HF5q/Q4+tPxDz2IqJJ/GjwCDND
         BPovsiGYbT3QXyvsrPaA84e0XAswl+mJ62x6Mz5NBg/peBtcw1YMnYC8gRBemhrIgJCp
         lJDw==
X-Gm-Message-State: APjAAAVLBudMIX2iEfWEORxfmscsUgakJJdHZD3P0CWT8TLz+OwzYrIs
        0Y8RHzmoEW8MgqcYKz/AJDiBwfk4lr2Nc+obln0=
X-Google-Smtp-Source: APXvYqxokXZKK+xS38jl/NxfGQk74Kg+k//pCh5gYf3dLbVtd+b8DLQcxTLn4ucrzAyZb7ukIrYk9CEidFd7D4FvNio=
X-Received: by 2002:a05:620a:b:: with SMTP id j11mr34354390qki.352.1567517780844;
 Tue, 03 Sep 2019 06:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190823123643.18799-1-geert+renesas@glider.be> <20190823123643.18799-2-geert+renesas@glider.be>
In-Reply-To: <20190823123643.18799-2-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 3 Sep 2019 15:36:04 +0200
Message-ID: <CAK8P3a1H1eQzg0pF4rBeUyByYTBs5nNnit-L=B1hqMaK_P7S6g@mail.gmail.com>
Subject: Re: [PULL 1/5] Renesas ARM DT updates for v5.4
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 23, 2019 at 2:37 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.4-tag1
>
> for you to fetch changes up to 57012813f1ba82412cdcc3665b04d4353b357378:
>
>   ARM: dts: r8a77470: Add PMU device node (2019-08-21 10:28:57 +0200)
>
> ----------------------------------------------------------------
> Renesas ARM DT updates for v5.4
>
>   - Fix HSCIF PM Domain on R-Car H1,
>   - PMU support for RZ/G1C.
>

Pulled into arm/dt, thanks!

      Arnd
