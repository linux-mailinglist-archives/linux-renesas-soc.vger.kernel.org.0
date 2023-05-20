Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB7C270A4D4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 May 2023 05:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjETDND (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 23:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjETDNC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 23:13:02 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62004EA
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 May 2023 20:13:01 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ae4c5e12edso31113245ad.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 May 2023 20:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684552380; x=1687144380;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J8Y40lrBbVfk8kPi/ZJlDDf/jFXU/FknjxlFku6ubIE=;
        b=IwqpwGPrlSR4B0k3v3fezngvp+iZvN8hFJucAQuYTCuu10u4zpkrCuHTbE/6yB6rDg
         t329PWb2xM2u/Z4SDvHkcvrlv6SGQl8VYG/hoQVrnlCZmryByN0c32NiZtlTdYhomFGm
         C67D5ALTGp3sMKXAZyTOm5BT2gXuR8KSsj7rRx7lJG1ErpJJCYD3v1DpgxBxETiNa7o/
         VXxn9QN89i5wPcU8DxkHqvV7r7tUfLtpJ1mur2KVuE71losLDVJONIpWVh7qtny7+V/6
         ugONO/mzrTSRirhM3ZfoDEZlMKnEFC75hv+u3CLQ1jQuAZK5TO+SO0Pzb6tDxOYXZ5g3
         N0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684552380; x=1687144380;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8Y40lrBbVfk8kPi/ZJlDDf/jFXU/FknjxlFku6ubIE=;
        b=mAEKiJucrbF9+IedhIA0HFHWhQ3uiOPw7FArH+lhTC9lJWAPXwADczTM3rdly5AeZn
         C/wylk4Jtknr0yqM+Dhes/4nN2JWI09tWsJPUDdsO/0Ols7vcVuWOI+2O8RgV0AtNDog
         TrdlkQaJvYed82EvWYILLaYTY7Bj1oWuHBniMLUxW5eSIDM/6wSYEwP21D9BT0ACFpGh
         mOillAh9pjMGmFWb9SMv+Br0GWR50RbFyCkn6wjyGbVQkYg5/qa9wu1AYoTGycDgN7SV
         +K7jIgEwfAg0vcdr/iPPMTZmRgT2cewoJpCFafL6h5akIHwoHb+QcAtaHYdjWghTPoR+
         ymAQ==
X-Gm-Message-State: AC+VfDw8tPJzL2r9fN6TWCRK+VTifsoIuR206pKAxrvJivLv4kGYfV/s
        gsv5CIrSZSoJRnV57Zcg9VUTj6mzqrg/1GSJhdnxGGChU30=
X-Google-Smtp-Source: ACHHUZ5MrLQ1i7wGLNfscvWDXbbwRE8HfUEtGNLQlbxBZooH1CR07gKSZrBr0HvTaldVw8M5/1eTxWLWzNnUS9a7bIQ=
X-Received: by 2002:a17:902:684c:b0:1ae:1237:8754 with SMTP id
 f12-20020a170902684c00b001ae12378754mr4226332pln.68.1684552380327; Fri, 19
 May 2023 20:13:00 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 19 May 2023 22:12:48 -0500
Message-ID: <CAHCN7xKsejKgF5E+veu-G_1ygTF+gkV6uTJrU0AG3ohD2WiiuQ@mail.gmail.com>
Subject: RZ/G2M Power Domain Errors with GPU
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        cstevens@beaconembedded.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi all,

I am trying to see if the Open Source PowerVR driver [1]  for the 6250
can be made to work on the RZ/G2M, and I am having difficulty getting
the power domain to turn on.

In the GPU node, I set:
power-domains = <&sysc R8A774A1_PD_3DG_B>;

Unfortunately,  when it boots, I get the following error message:

[    8.313305] powervr fd000000.gpu: error -ENOENT: failed to add to
PM domain 3dg-b
[    8.320822] powervr: probe of fd000000.gpu failed with error -2

Is there something I need to do in order to use this?  it appears the
3DG_B starts 3DG_A if I understand this correctly.

Unfortunately, I don't see the parent child relationship between the
3DG_B and the GPU

root@beacon-rzg2m:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children
            performance
    /device                                             runtime status
----------------------------------------------------------------------------------------------
clock-controller                on
            0
3dg-b                           off-0
            0
3dg-a                           off-0
            0
                                                3dg-b

If anyone has any suggestions, I'd like to try to get this
operational.  I would also expect this to be similar for the
corresponding RCAR-GEN3 SoC as well.  It appears that Mesa has
mainline support for PowerVR 6250 as well and it looks like the Mesa
side looks like it's been merged about a year ago. [2]


adam

[1] - https://gitlab.freedesktop.org/frankbinns/powervr
[2] - https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
