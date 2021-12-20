Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50A7D47A4C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Dec 2021 06:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235275AbhLTF6b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Dec 2021 00:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231863AbhLTF6b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 00:58:31 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6CBC061574
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Dec 2021 21:58:30 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id z29so33664616edl.7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Dec 2021 21:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=8+uGp3bIOUYzpQ74A3QoHEvyTm1vHpJThhDODk8qS0o=;
        b=MBqMb3+lBGAXEGYML+qRW0VLrRbODT6A5/3tief7oA+goApelXm647A/SvG5wu/wQl
         W5IeBzVUexvyEIOzJeBX9OTLkwzGtP9XfDgO3uzxuKfeIRsLPWW4tBkZwXK6UWkipmNJ
         jVI+ieslyKLYGt1FdpGiAkPYLKzOgXDFgJlodBHv+KaPZRv7VNUgkkCRAlTt5u5/8jG2
         qbcQLvQDl81b/IP8H202ZBlhybtGygiOSThHCL46INKxj4tst/Z1EPbRxoDlF/YijcrQ
         DRUMht6vCyVkcA9VNocnLFiQFXOY31hduFB6yjk26NuVRS4KSuIPxecF4jrVy644KkwX
         6Sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=8+uGp3bIOUYzpQ74A3QoHEvyTm1vHpJThhDODk8qS0o=;
        b=HvLZQfFF1eEwAA15NRQlkruPnNHoOzOasUiX8QcyOMAb+i27YNRP7/NXVYPmsteFsg
         HFLB+jLEeYqXUp9vExfPRWrjEAIUbzpzKBbCFZtJNxOMlcI2CA2hYeGjpz+3yDfd+YHD
         tZkIQuKM4zPeiZoS/ka5NrpB/4OplY1IKMn9QwgvnSKRgC6PxUJd8HW6qlD8eBXuMKwf
         67q4PSIOTOztYmyYPtJJ+F1XtdhkO934q5zOzpy8rmVG2dSbkc6lVUGBvfEDt4a6kKKk
         qS4AX3IDnjyLd/2p289uoQ9oRL4LkPxdY9SmjlCELa0hnDborD49eTCSjZEFAhtQ4/0/
         EdMA==
X-Gm-Message-State: AOAM532FHYmIuLCxZ/T+bhWejQEilPZ9/eHtPkWzz3/RTyQ2CZnMy3FW
        tLVTKx82DtCeGrCC0MlITKy6z715Z/ODZrgmRjU=
X-Google-Smtp-Source: ABdhPJxn02lJVqdWygszl5BpvqOEcv2rojyTno/PUxMO+rnB+JwVGzPASN8I9lHdHxXEVV0U0Dlom91cSt3B/tj6i5Y=
X-Received: by 2002:a17:906:3456:: with SMTP id d22mr11608206ejb.655.1639979908927;
 Sun, 19 Dec 2021 21:58:28 -0800 (PST)
MIME-Version: 1.0
Sender: lisaragnvard@gmail.com
Received: by 2002:a17:907:7f15:0:0:0:0 with HTTP; Sun, 19 Dec 2021 21:58:28
 -0800 (PST)
From:   Jackie Fowler <jackiefowler597@gmail.com>
Date:   Mon, 20 Dec 2021 05:58:28 +0000
X-Google-Sender-Auth: do8l5xvA4IQANbY2gtwvxC20X70
Message-ID: <CAEtDg5BX7A8nN_WqUv9qb_WwLg1XQiTseyBC5+0vZixVi1azZg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Gooday my deares't,


 I sent this mail praying it will get to you in a good condition of
health, since I myself are in a very critical health condition in
which I sleep every night without knowing if I may be alive to see the
next day. I bring peace and love to you. It is by the grace of God, I
had no choice than to do what is lawful and right in the sight of God
for eternal life and in the sight of man, for witness of God=E2=80=99s merc=
y
and glory upon my life. I am Mrs.Jackie.Fowler,a widow and citizen of
Canada. I am suffering from a long time brain tumor, It has defiled
all forms of medical treatment, and right now I have about a few
months to leave, according to medical experts.

 The situation has gotten complicated recently with my inability to
hear proper, am communicating with you with the help of the chief
nurse herein the hospital, from all indication my conditions is really
deteriorating and it is quite obvious that, according to my doctors
they have advised me that I may not live too long, Because this
illness has gotten to a very bad stage. I plead that you will not
expose or betray this trust and confidence that I am about to repose
on you for the mutual benefit of the orphans and the less privilege. I
have some funds I inherited from my late husband, the sum of ($
12,500,000.00 Dollars).Having known my condition, I decided to donate
this fund to you believing that you will utilize it the way i am going
to instruct herein.
 I need you to assist me and reclaim this money and use it for Charity
works, for orphanages and gives justice and help to the poor, needy
and widows says The Lord." Jeremiah 22:15-16.=E2=80=9C and also build schoo=
ls
for less privilege that will be named after my late husband if
possible and to promote the word of God and the effort that the house
of God is maintained. I do not want a situation where this money will
be used in an ungodly manner. That's why I'm taking this decision. I'm
not afraid of death, so I know where I'm going.

 I accept this decision because I do not have any child who will
inherit this money after I die. Please I want your sincerely and
urgent answer to know if you will be able to execute this project for
the glory of God, and I will give you more information on how the fund
will be transferred to your bank account. May the grace, peace, love
and the truth in the Word of God be with you and all those that you
love and care for.
I'm waiting for your immediate reply.
May God Bless you,
Respectfully.
Mrs.Jackie.Fowler,
