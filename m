Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97B2311DF6
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Feb 2021 15:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhBFOwO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 6 Feb 2021 09:52:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhBFOwL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Feb 2021 09:52:11 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52F2C0617AA
        for <linux-renesas-soc@vger.kernel.org>; Sat,  6 Feb 2021 06:51:16 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id y18so12848089edw.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 06 Feb 2021 06:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=bW+7xwrBLNeAsnKI3oM6YbMn6dL315guD/d81S8+d0zrLjwpmmprzAzU/9WCMQxKJ1
         5N11bgsEJYs8KVU93Du3YZSdA6fFLWg0tHncu4ctYmHr5LmkpBNFoWP3DeW8LotC/YED
         hhGYYlRm/iRuDLC7KG06RLmUbNSwd4t5pAc+NDWNBqowRLUHV5kDWQY16CfgLqs4WKbo
         9JfYe7eirYHUOYCz+AwumbFLcKwjtq50RQrvpAFjqYfji5c3EQATHUTABmL0Xc+9mYy7
         nr/+GZNY9hPE6Clgzj4ySRo8gbJJ6Z1Q0OsoWd7WAwgjJtvSAWuo97D41juilbhVqnZT
         4KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=Zmb7SXucjvS081RHT2S+wTOxdprevNmD7U2NxAfelZckMlL+3fpCW+K7xedejlt331
         oVAgDfIoWFTmXlUCWTGLwIc220usH/0oS/MmLVBTu1JWE3O3qwTSoWq31SXfIN26MkNi
         +K8M6wdo0pTFUBIrmXrbpYsFQtmozFCMHqSnRAXmHXbOc3sC0UHkYuqBbcak/Jcl/Cqq
         1996H3ykFJLcW1xTw2Mz1bnESWhIy6R5Y350P9KQHQglEcjtMddA1Tw4BIoxVmWOhqdK
         fXhzOKoAyYbuH4ZPl+olFQ68DsMg/NkDw/Te5ms7OcJySw1VKv5NluOARHOhqgRMFuWz
         kUgQ==
X-Gm-Message-State: AOAM533rOEmywFd45xcARcLjHmn6Ta+63KkXJrMu6GxlVNgUzAsSbJ12
        7XBS+SsXM4ch2n/6Swsz1seeXK7VkVp+eVnDtcY=
X-Google-Smtp-Source: ABdhPJz96Lkp/KHOPqlGNNeA9ShR44wyS4FwcBqPdDMerDbXj+zEMEgsq8qacP0vgpOAmdTmPMryxGMjJ796oim9t0M=
X-Received: by 2002:a05:6402:558:: with SMTP id i24mr6547303edx.190.1612623075460;
 Sat, 06 Feb 2021 06:51:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:51:14
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:51:14 +0100
Message-ID: <CAGSHw-CBtZc3MJwNeQv4rJZzb727mdNbJH3TPi090NuQd9rFNw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
