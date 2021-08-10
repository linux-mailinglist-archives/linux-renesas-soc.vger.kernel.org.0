Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18CF3E7EEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 19:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbhHJRgK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 13:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbhHJRfK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 13:35:10 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D918C0619D1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:33:24 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h14so27338177wrx.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=y3BZ+wT7TMDVjM2/WQcyPOhYkG/NWjvDbJIsMqFI2RA=;
        b=RsiBBdA9QKOcTCF5lGXKVsjmClQ3sMV8nYRHi5UzQ6RFRdaZ6t981j56diJ7q3WLiT
         dSrogDmRt6kwHS+J+pcIdphvlu5Vk62bOJudqb0dzEOf5Tr6sAVMWTY2NbEn++ZnSdaf
         F4yj6h4F7VBk6uVCXN4p2StSiBpSckLhr0NJoCtUTvVh+gCrpSdvA2dss+nT8Q4XWg+b
         4x9fMuBGMminOSzPCK8njOsWexpWsfb2omBFXa3GLhHqzUauC1r8oyB3fDvFuiS7qNjT
         fDqijYMWxjmP3EeBvtWaIUY7Z5YEma/9OhqmI5Ya7ZKqW/5hzlkm8xAdNsqyzESz/5Xj
         5sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=y3BZ+wT7TMDVjM2/WQcyPOhYkG/NWjvDbJIsMqFI2RA=;
        b=CJ1nQMz+nJ7cYl4O1D6Wty2MN6ifJ2aTzUvIbVd6tV5B1fpqIx71n6uuEgQauK/td9
         UPA9y9YBoV641/ZVkrpjR0zRmvpkwKMY7MjXiAINGs9WM/dRNvbed3hgmTGXxpayXYdb
         UaqqqYwuh/fMKuysSIDEYwEyfaWUddW8MhCJELwEwpIcip3gJOacwSAUZXoP7t44ceh2
         15ibhrll61Evm9aMO0Ghufanx96pulIFW2YJH/8aAo4mEx9+awnl/L5U3ok7ewNqJFZO
         o/ZQiHoXujIxy4uNphOL/RAhu9q5Q9k6veeL/4zRNI4pcNXuzG8O1Ca7PwgyIFCPhG2/
         2vgQ==
X-Gm-Message-State: AOAM531CKyOXG1xxHxmTlxpNg9PmvzuH1RD+T/mS/qfJkqBINio4IcKR
        PRzGwqitovbUeboj0Xif9wZyfEqCg0VHOsr/bC7V2H3UoAo=
X-Google-Smtp-Source: ABdhPJw+sC+pBQw0G+0ULVvin/r/jCVVb1V7XUqN67UCoWrnBzyIXnaSzK5br1SZrCupI/L0LIZWgMfi7vhpZK+Wcm0=
X-Received: by 2002:a05:651c:32c:: with SMTP id b12mr1745558ljp.198.1628616792032;
 Tue, 10 Aug 2021 10:33:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac2:5d2e:0:0:0:0:0 with HTTP; Tue, 10 Aug 2021 10:33:10
 -0700 (PDT)
Reply-To: majidmuzaffar8@gmail.com
From:   Majid Muzaffar <ing.abdullabin.rishid.me@gmail.com>
Date:   Tue, 10 Aug 2021 20:33:10 +0300
Message-ID: <CAFsu49XXzY7ugKhGzJm5OPKe2LG1R35c-Dkp83VgS3+u27y=sQ@mail.gmail.com>
Subject: Proposal
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Salam alaikum,

I am the investment officer of UAE based investment company who are
ready to fund projects outside UAE, in the form of debt finance. We
grant loan to both Corporate and private entities at a low interest
rate of 3% ROI per annum. The terms are very flexible and interesting.
Kindly revert back if you have projects that needs funding for further
discussion and negotiation.

Thanks

investment officer
