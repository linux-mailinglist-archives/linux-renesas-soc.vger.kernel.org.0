Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA0959AB12
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Aug 2022 05:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbiHTDw2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Aug 2022 23:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239183AbiHTDw1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2022 23:52:27 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DC2B2DA5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Aug 2022 20:52:26 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id h78so4636876iof.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Aug 2022 20:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc;
        bh=BsGUiEeFf8ug2npRmcQm2WWjtyThvxWkF3QSf2osg7s=;
        b=kkEn1qANy3/Lc7DZ549aBVXTg910gl4y2JJ69xgvde8o35spDY1wdsILbro3FrVM9B
         BOB6fvdDx+zzCrlSgrcY7suVvMc3Ua56niR30wwZEISyrAXfhHDJQIm+vQ+oquerKvd9
         XYUhQq1zXtP7ENZ8afBMKrugY4CQOMCOfch+Yfr0Y/y2JStwyauOf0GTb9xKq02YiZoB
         u28lciCsv/pl/RHmKxQOnEYxizDnbqVEde5DwxuAL56fIlG6JKp3TLEQRlTxw0nViaIH
         7xPi0yaAUUOoFBov+3tPCzq2jmupBNXKQCISv7KyLqn2gq8K4t0eRrN0dcL4imgsuLpJ
         mtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc;
        bh=BsGUiEeFf8ug2npRmcQm2WWjtyThvxWkF3QSf2osg7s=;
        b=JX4f08izL0cT52kajXJdOTXVY6GyI/6wEUexp8W08XoLUzoDogw6bg53/5RtkLixZ0
         5prMW+NoyVhic/uZ7TQS7ES2RZftq02CcyM2nyZPJZDtJzQ7mEMrSubWwUc6QFOwcABU
         2XhT14N419tlWccjx5uIhmOYtdjQRUtkErq8T9lSragGgQOOTF30ZCONTQWU373xCPuZ
         Yxju4bravd/eBl0d+Kj143nfiX7tApsqEt6q3Ot1TOADsFZC6Kz9ac6b6fHGQInF5PMD
         PiYDGMONBK3LKf5BezhjDB0aBZP2xOzZSH1wgYTBA1fOCwtwGylNW2ws1/yCsRcEY/qO
         1nIg==
X-Gm-Message-State: ACgBeo2Y/aBOCvWAgBNR2D9UEj8dPSHjV2QH7BEVPttBcFF4F3EkFubX
        VBuqxjV0LmjrihMVkme9NDp9mDs/YDhbFuIvm6Y=
X-Google-Smtp-Source: AA6agR7X1qy209dSYmCxoQBnmPQ9/v7t8Iojhj0HUI8pphjUv5ROwj2UgO3H1m/Sv4n1xhXsGEoPMOzjCylGv5zFWJA=
X-Received: by 2002:a02:3f01:0:b0:343:7750:7e57 with SMTP id
 d1-20020a023f01000000b0034377507e57mr4726620jaa.252.1660967544314; Fri, 19
 Aug 2022 20:52:24 -0700 (PDT)
MIME-Version: 1.0
Sender: ivvone.balakiwal01@gmail.com
Received: by 2002:a05:6602:2b0e:0:0:0:0 with HTTP; Fri, 19 Aug 2022 20:52:23
 -0700 (PDT)
From:   Mrs Evelyn Richardson <evelynrichards10@gmail.com>
Date:   Fri, 19 Aug 2022 20:52:23 -0700
X-Google-Sender-Auth: VZu7IfaNNB_U5eJ0W9lTSGI7Urs
Message-ID: <CAFzdLj93Us=2ep4A0KsKvVW3duQay8oN96kCMa6cxyCD=xqtqw@mail.gmail.com>
Subject: Dear Beneficiary
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_50,DEAR_BENEFICIARY,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HK_SCAM,LOTS_OF_MONEY,
        MONEY_FRAUD_5,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Beneficiary.

This is to inform you that the United Nation Organization in
conjunction with the World Bank has released the 2022 compensation
Fund which you are one of the lucky 40 winners that the committee has
resolved to compensate with the sum of ( =E2=82=AC2,000,000.00 Euro ) Two
Million Euro after the 2022 general online compensation raffle draw
held last WEEK during the UNCC conference this year with the

Secretary-General of the United Nations Mr. Ant=C3=B3nio Guterres in Geneva
Switzerland. This payment program is aimed at charities / fraud
victims and their development to help individuals to establish their
own private business/companies.

However, your Compensation Fund of =E2=82=AC2,000,000.00 Euro has been
credited into an  DISCOVER CARD which you are entitled to be
withdrawing =E2=82=AC3000 Euro each day from the DISCOVER CARD in any
DISCOVER CARD of your choice in your country or anywhere in the World.

Therefore, contact Engineer Account Mrs Kristalina Georgieva, he is
our representative and also United Nation`s Coordinator in United
State of America that will organize with you in Dispatch or handling
your DISCOVER CARD to your Destination. You are to make sure that you
received the UN Approved DISCOVER CARD in your names which is in list
founds in names of U.N world list to receive this UN Guest
Compensation.

We are at your service.
Many Thanks,
Mrs. Evelyn Richardson
United Nations Liaison Office
Directorate for International Payments
United States of America  USA.
