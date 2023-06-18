Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 721837344D4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jun 2023 05:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjFRDkS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 17 Jun 2023 23:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjFRDkQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 17 Jun 2023 23:40:16 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C38F1987
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Jun 2023 20:40:15 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-341d62e78d3so10965735ab.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Jun 2023 20:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687059614; x=1689651614;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wWTmMQSsiLodfdKu7C8lcuyX7WesZia949PML8BXbEI=;
        b=NNpqiyxs2hlSULaqmyN3l2oCcRngk4vT556qhvwMSTgKVG/GTeqMtFbCDCqDGIL9Ex
         d+/xQA0/FC80o24e6koEWtSqZ9Zu0tR9T3LGcjAiwmum6cZ3JelcRIryWbFX73vFtGvu
         r+kyZo4mmlqx25o0a/dL2Q7gr8V9orXGUcEZSyYtEAP6s42mxoY6ZT7MaCJDFPThHCpb
         W0XTAPF3HLUjYXJfn7qsbeTFwAEaEXOSZKnk3RNC8EgcFMPSa5BryNoPuJCgmoN2dszy
         OPXzwhMojyrcFT4fibO/ky3bUTN41z4xdaXHbiWtvRmChWKMn9+HhND1FnpRkSExj2re
         UYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687059614; x=1689651614;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWTmMQSsiLodfdKu7C8lcuyX7WesZia949PML8BXbEI=;
        b=ltyhwX8WfuKdNimXZxoAkwp1sIrC69ICtPW4LOhUKQ6ff+xYlY30zaWxaxm/03Pf99
         /fTI4WQeO0gvx5kKVTa4hH6yDDqdUTQLp4tSRt+V+mj2c2ifGvWrEHDV2Q+VgkuSZ0FF
         sABMuBnnsuYhk3h9pOceouWs/ktlyOqsrVPPnCZh5eJifE+sTJynZ45Yu9gVjZha7TMb
         g8zCAMC/MDJ8Navz2aca0uEgEcKdYbu6w9fzJvQwWqFPB/WnVZjqR0A9L6EB3vWZi7pu
         oegiqH2tESPdYLO2llawzFfGLjwyqzZTsxiEROqu5H51nIE4PwpPb/0r+3wSAWgqL377
         tfJw==
X-Gm-Message-State: AC+VfDxirgiZ6hXE5MmL8Bv34VAzEMPoB1MYp4oUGgKCf8TKSIhZKKxq
        xArfQ5us2sWnhCdtlQJCbJ1hToATkxtHnztXhWw=
X-Google-Smtp-Source: ACHHUZ5/JjUTRiYJTpm6bRlMJcXTOfU1/h65ae+hOxhAtA/NTgjY6DDv3xhcfj5uGsfa2RnbANr8NNBkai+pa4RnxWI=
X-Received: by 2002:a92:c60a:0:b0:340:8186:e377 with SMTP id
 p10-20020a92c60a000000b003408186e377mr5195386ilm.25.1687059614777; Sat, 17
 Jun 2023 20:40:14 -0700 (PDT)
MIME-Version: 1.0
Sender: ciissouf34@gmail.com
Received: by 2002:ac0:d884:0:b0:2dc:5e5d:14a6 with HTTP; Sat, 17 Jun 2023
 20:40:14 -0700 (PDT)
From:   "Mrs. Ruth Roberto" <robertoruth48@gmail.com>
Date:   Sat, 17 Jun 2023 19:40:14 -0800
X-Google-Sender-Auth: BvUeKp2qMrxWfJjTNjt4QU_HFqs
Message-ID: <CAFA2CT=jKjy=dCitg7EJSn9RnkSHTX+rB-Z08KuwRRDNAADMug@mail.gmail.com>
Subject: I trust in God
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_3,NA_DOLLARS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear,
It is true we do not know each other before but please bear with me,
I=E2=80=99m writing you this mail from a Hospital bed. My name is Mrs.
Ruth Roberto. I am a widow and very sick now. I am suffering from
Endometrial Cancer which my doctor has confirmed that I will not
survive it because of some damages. Now because of the condition of my
health I have decided to donate out my late husband hard earn money
the sum of ($3, 500,000.00) Three Million, Five Hundred Thousand Us
Dollars on Charity Purpose through your help.if you are interested get
back for more details.
Mrs. Ruth Roberto
