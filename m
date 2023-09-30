Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC457B4192
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Sep 2023 17:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234424AbjI3PYZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 30 Sep 2023 11:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234403AbjI3PYY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Sep 2023 11:24:24 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB33DE1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 Sep 2023 08:24:20 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59f6492b415so24760797b3.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 Sep 2023 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696087460; x=1696692260; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F+ldpTwf6SQ9qog9wE28rqIWOdtTFLr7RM6zYPnWQeQ=;
        b=TvehtCfks+UvuOOWMUiy/ten5DThBT4OirK7wvhRzD7zYO0GvqK/K0wTSosRS6uXRf
         7YG9mcO5K9ZDkbE1/FarG7nPckA60wFpFsmqLHmccAwq8d3jQIOxz621bQvZueKAd6BW
         wl1YBVmyIYntBLsN9VAUbV6XbU6bHpUcT2W0mzUP2+a60lPEG5r2dP0ruODTORsTZSmL
         Uc/PhqPQUbfcd414UNrTT8BXnMWWJxo+2fjMu2n8vfT5RHddqDzq/fi1VdkHrln6viWp
         dXtHEhRdy/zicRzcy0N7erWdfAywE/Vh+pg7eup6xi3kinvKfMqE9q3DRRajIunCtyqz
         K4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696087460; x=1696692260;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+ldpTwf6SQ9qog9wE28rqIWOdtTFLr7RM6zYPnWQeQ=;
        b=UIjsQI+2CapmXljByzjdHx+afX9vBSixqGbmXcqNYjaRpZJO7edIXdsXhvMqSAdHXS
         isUG1MQjtxHOWwZOflYsF19uIWabPn3MVV0avCVnjVhCYrVJFNZd+//6AroI+3GEwlnb
         1c3nwwhTIYhhFM93MCiCu+XMrjbgTqdYGN6c8jOf7MgGReN6Ab1v+/CbkjzGbY6NDYGz
         Gpzt9QYKl5Uee2A2BID4vHMce/X7ShPtP9e6aRgR9HC+02p+Xxnj8BmfKsqIihKv5TUK
         rV8mPP7WRE3utYeFLGURL0tmibEOJmYG6B7gYpKTGg1jZ6wyuSE/qRFLJ8F+qtYzH6BE
         MFig==
X-Gm-Message-State: AOJu0Yy5l2oyNLiLR3qoWYb1qZrAGw/g6dcmNkaA918/ZkOMlUgV9knw
        fXbdhT9/M3ViT1cgBEpMUPCCDQOOuzOzPNGYb6k=
X-Google-Smtp-Source: AGHT+IGw2lO9ruw9Cqwqbx5t8Gn3tlauKecvYmpr93cWEToBuRzawVk+YEo/GYC+9PDVDbWXtSNp9X51vkP7N9/+nOc=
X-Received: by 2002:a81:71c4:0:b0:59b:5255:4882 with SMTP id
 m187-20020a8171c4000000b0059b52554882mr7387963ywc.20.1696087459969; Sat, 30
 Sep 2023 08:24:19 -0700 (PDT)
MIME-Version: 1.0
Sender: mrs.kimhongyeoh55@gmail.com
Received: by 2002:a05:7010:a3a9:b0:385:c038:272e with HTTP; Sat, 30 Sep 2023
 08:24:19 -0700 (PDT)
From:   Stepan CHERNOVETSKY <s.chernovetskyi@gmail.com>
Date:   Sat, 30 Sep 2023 16:24:19 +0100
X-Google-Sender-Auth: WyLJQfCvQMT0siVgc4eIlY-N1hM
Message-ID: <CAPeJZ8C2ThwNfY1_aj=9iSxbNDaQbXO-7wek-jZ5k1_oK7VROQ@mail.gmail.com>
Subject: Investment Planning
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.6 required=5.0 tests=ADVANCE_FEE_5_NEW,BAYES_50,
        DEAR_SOMETHING,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:112d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5002]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrs.kimhongyeoh55[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrs.kimhongyeoh55[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  1.0 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Sir/Madam,

Please do not be embarrassed for contacting you through this medium; I
got your contact from Google people search and then decided to contact
you. My goal is to establish a viable business relationship with you
there in your country.

I am Mr. ;CHERNOVETSKYI Stepan, from Kyiv (Ukraine); I was a
businessman, Investor and Founder of Chernovetskyi Investment Group
(CIG) in Kyiv before Russia=E2=80=99s Invasion of my country. My business h=
as
been destroyed by the Russian military troops and there are no
meaningful economic activities going on in my country.

I am looking for your help and assistance to buy properties and other
investment projects, I consider it necessary to diversify my
investment project in your country, due to the invasion of Russia to
my country, Ukraine and to safeguard the future of my family.

Please, I would like to discuss with you the possibility of how we can
work together as business partners and invest in your country through
your assistance, if you can help me.

Please, if you are interested in partnering with me, please respond
urgently for more information.


Yours Sincerely,
CHERNOVETSKYI Stepan .
Chairman / CEO - Chernovetskyi Investment Group (CIG)
