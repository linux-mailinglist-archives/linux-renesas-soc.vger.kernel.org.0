Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61FE27BAC2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 09:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbfGaHde (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 03:33:34 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34542 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfGaHdd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 03:33:33 -0400
Received: by mail-wm1-f65.google.com with SMTP id w9so639542wmd.1;
        Wed, 31 Jul 2019 00:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EJpdEs0Y/iKBAR0s7maiN7L6lAFR9Ak7SsJNj35d3J0=;
        b=GJCqlU89QKyE1TCEYEaW9MRDDemIaOZLiOT6FvkGUSW63WdXFxUP93D4KGBuv1uP6n
         C1zxP/6Rrl3R3mPShPBgSuRUgfzlXwnWZ5/pagoKNgPlDTE1NA+hs+mSl1epA7xkhxdZ
         L0OI+cv5H9KOMqDeid5QGVmI9sKtBYa92qg92nGfrNliQibHxX9RcTg+kimAKSXusDo8
         J9Pzzn9odxz5Y7tdW7FitXYv6jypbxoRbF1iP15IoeA7aGoM7IBKEUq9Cxde5uHBsPBd
         ZGr9XQ7cn6fMITprF97/fgtfUkyj2FD/MpGsogsBgyX5EpA9HHkE2Uk4axq64NX/UaKS
         KB2w==
X-Gm-Message-State: APjAAAXz/jDkbarepNpr45SrYCzt+M94skWD/5V/oOxlsEHE3HN27Euc
        gk7EPqCbQfBtBjkPLbt+W1yhsNt/NVPjRL9rCypu4g==
X-Google-Smtp-Source: APXvYqxdjX7Ynuepc4FG8+RzFEwARyA/ZVMVrjdrylPwmVSnS9Cv+//GVf6/Dw9BF49EnZLRnfidzYApIlvDEcIy1Ug=
X-Received: by 2002:a7b:c310:: with SMTP id k16mr68511863wmj.133.1564558411362;
 Wed, 31 Jul 2019 00:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190729175658.13672-1-geert+renesas@glider.be>
In-Reply-To: <20190729175658.13672-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 Jul 2019 09:33:19 +0200
Message-ID: <CAMuHMdV1zXCq6dbcg6=YmHgYqE5tfc1e7DbB3UgTVPm-5rU2Bw@mail.gmail.com>
Subject: New Renesas SoC tree for linux-next (was: [PATCH] MAINTAINERS: Add
 Geert as Renesas SoC Co-Maintainer)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux-Next <linux-next@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

Apparently Gmail marked my previous email as spam, so probably that's
why I don't see my branch in linux-next.

Can you please add it?
Thanks a lot!

---------- Forwarded message ---------
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Mon, Jul 29, 2019 at 7:57 PM
Subject: [PATCH] MAINTAINERS: Add Geert as Renesas SoC Co-Maintainer
To: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell
<sfr@canb.auug.org.au>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm
<magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman
<khilman@kernel.org>, Olof Johansson <olof@lixom.net>,
<linux-renesas-soc@vger.kernel.org>,
<linux-arm-kernel@lists.infradead.org>,
<linux-kernel@vger.kernel.org>, Geert Uytterhoeven
<geert+renesas@glider.be>


At the end of the v5.3 upstream kernel development cycle, Simon will be
stepping down from his role as Renesas SoC maintainer.  Starting with
the v5.4 development cycle, Geert is taking over this role.

Add Geert as a co-maintainer, and add his git repository and branch.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Stephen: Can you please add my branch to linux-next, after Simon's
         branch, which may still receive fixes for v5.3?

         Thanks!
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6426db5198f05377..6de667021591fb52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2155,10 +2155,12 @@ F:
Documentation/devicetree/bindings/arm/realtek.txt

 ARM/RENESAS ARM64 ARCHITECTURE
 M:     Simon Horman <horms@verge.net.au>
+M:     Geert Uytterhoeven <geert+renesas@glider.be>
 M:     Magnus Damm <magnus.damm@gmail.com>
 L:     linux-renesas-soc@vger.kernel.org
 Q:     http://patchwork.kernel.org/project/linux-renesas-soc/list/
 T:     git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
+T:     git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
next
 S:     Supported
 F:     arch/arm64/boot/dts/renesas/
 F:     Documentation/devicetree/bindings/arm/renesas.yaml
@@ -2269,10 +2271,12 @@ F:      drivers/media/platform/s5p-mfc/

 ARM/SHMOBILE ARM ARCHITECTURE
 M:     Simon Horman <horms@verge.net.au>
+M:     Geert Uytterhoeven <geert+renesas@glider.be>
 M:     Magnus Damm <magnus.damm@gmail.com>
 L:     linux-renesas-soc@vger.kernel.org
 Q:     http://patchwork.kernel.org/project/linux-renesas-soc/list/
 T:     git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
+T:     git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
next
 S:     Supported
 F:     arch/arm/boot/dts/emev2*
 F:     arch/arm/boot/dts/gr-peach*
--
2.17.1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
