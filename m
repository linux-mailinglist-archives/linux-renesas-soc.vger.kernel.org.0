Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8FE4A7280
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 20:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbfICSXW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 14:23:22 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]:43581 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfICSXW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 14:23:22 -0400
Received: by mail-qk1-f169.google.com with SMTP id m2so16892463qkd.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2019 11:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zohwHGXzinCU41mjJruVh8wtJtm4yrTq0xVkiPolw/A=;
        b=A3rBBCMu5ekNzfPUxD2mj36vfhfHQQF9vc/0TEB9Se/iV6xMIGgp3m7ZLzxF0NPS3y
         STT79yGCXP/dafRU5mjrlDg7FhCuapEys9m/EiUMqg+Z2nez/69d7hxOzF12Ta4GLcva
         SK1fDtSPFEzXCA1zrROEiGPRofGMfGE0fKsBJ1zF3GOHr6KpbQDiE187C4AuPMPxBQ9H
         UUbxNAKCWJeHp6F+3q8YjaU0josF5gs360xmmT2dXiKBLs+XEUAjYPEBopdHkHQoBE3U
         KqjrDnwepo6ZrRu4xyFRPZRliiu9I5OqTGYmKwUlWFAax1QDUPL4g1QLdg8g62Nn0V0A
         k52Q==
X-Gm-Message-State: APjAAAWSNCMKpT7gPctzag0vCrVE+pkdt6Oa1Z/jzvUApLfwpLEUYr5r
        aGSGrcsoifZb9qYDWNYKWHpJ7Q5JsBgCPDao7oA=
X-Google-Smtp-Source: APXvYqw7Ni5Th0fUq9Ts0Bis2xXOIVgKfyPtSLvdjq4bso22oZrcJT9dIs87ponmUeiRohYMxOLBHx4CLql06nXW9bQ=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr34791307qka.3.1567535001049;
 Tue, 03 Sep 2019 11:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190802120355.1430-1-geert+renesas@glider.be> <20190802120355.1430-3-geert+renesas@glider.be>
In-Reply-To: <20190802120355.1430-3-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 3 Sep 2019 20:23:04 +0200
Message-ID: <CAK8P3a0S3axohc7iq_vx_5i+KGiC0fX=rctvY8uXdhwz6Z9YCQ@mail.gmail.com>
Subject: Re: [PULL 2/3] Renesas driver updates for v5.4
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 2, 2019 at 2:04 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Renesas driver updates for v5.4
>
>   - Fix a flexible array member definition in the R-Car SYSC driver.
>
I see I merged this earlier but forgot to reply.

     Arnd
