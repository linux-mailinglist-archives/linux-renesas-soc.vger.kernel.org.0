Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A2D2159F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 16:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbgGFOuC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 10:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729454AbgGFOuA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 10:50:00 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D68C08C5DF
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2020 07:50:00 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id h190so8635141vkh.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2020 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cS0UGykJG5S9ONR4xGpHa+s4l1jjOkyocdkJ+48d1fo=;
        b=U2gB/rlPLjqZKu46T/JhoNrdkri9PVo5hFShbezqsEs8dApjiFvZbZT/DBmX6pnABx
         9sWR3YMMULHm0opDG/kF71HQC6JVOMicIKDyLRYH/c4wIphxDS/8dyj7jes+0VMnrFAN
         wzZ4ewTQxKn4YCooAaq/KGbSrLHk6E6uUGl29caFi4VA+2hBYXDnja0H6SRhmCS934Z/
         /xJtzLygIGIwaI/mQxrMvnSt/rQN/TZCkDN8xA2xhRrZmUacgK2TNXcUrIzn+AXH0oV2
         +3qvN89dlA5vd5B5UpRWsiEKn4iV8BonLViU7WfnZWJICLKW+8W92OpIlG6NwdZ6H70A
         a49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cS0UGykJG5S9ONR4xGpHa+s4l1jjOkyocdkJ+48d1fo=;
        b=ildm6N8puemiY406jxf7VtsQ3tmCPpeF1lr8p1K4lHOFGd82ZPBvy7TjTeUWnR1XQa
         0NE6A5hr794GdfdIiY4ZKPIRg16quBhQUVOpM3NZxXmOh+ugBzwXpV528v6BMsZ4rSIw
         l8zEJHbbxajWMY8zfeFUwOzure418k1AAIw2A+f6CoUOEhazk64wotOS+Y0qPwES2hgj
         9TWFFmddtGEiKNe8ABAQTQczZPHakA8ktERw1a9vK4qFJsAPWfhoUqvre12gN8+aakBH
         /Voc7sBGJui2pK4f+Hw0HNXiHZeG+pXWwXCS1C0iFbEKtXrMv7fNteXM7dv+G91tzESV
         N+qA==
X-Gm-Message-State: AOAM532jkgSYLqP7XXHfP8vp+vaShofj+UvKnWRi7PZRN+5zvkqWGDO6
        V19GWCTHQh+YJ+s2Zl2DNP1459Hpm/XgynFUh7YjDQ==
X-Google-Smtp-Source: ABdhPJw5LCXlg5p88FMT/PnsnfIwwxz8F/zH0kuw+9vugiDGmpY2/NpMAybQbLXmtjilNX9lay0+cTNjxUNqttyO4zk=
X-Received: by 2002:a1f:1889:: with SMTP id 131mr26203707vky.59.1594046999513;
 Mon, 06 Jul 2020 07:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB36921D805C79B829563698D6D8B70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200602125131.GA1318@ninjato> <TY2PR01MB36926A830866FEA2C49735E0D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAPDyKFpzZG-LFbCDZYZx7J9sH536dcyHvoatCD4F-AvzM1kaZw@mail.gmail.com> <20200706140008.GD1046@ninjato>
In-Reply-To: <20200706140008.GD1046@ninjato>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 6 Jul 2020 16:49:20 +0200
Message-ID: <CAPDyKFoUdJLc+CzXNjQa7Er1oYmC-bqNszhPYya9ov=-THcfEQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] mmc: tmio and renesas_sdhi_internal_dmac: fix dma unmapping
To:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 6 Jul 2020 at 16:00, wsa+renesas@sang-engineering.com
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Just wanted to check if this is ready to go or more tests are needed?
>
> From my tests, this patch series fixes the issue. I'd just like to avoid
> the extra callback. However, my tries to do that failed so far. And now
> I'll be away for two weeks.
>
> Dunno, maybe we merge the series and if I come up with something else
> that works, we can add it incrementally?

Sounds reasonable to me.

So, applied for next, thanks!

Kind regards
Uffe
