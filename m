Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15F9F723FA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 12:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236184AbjFFKf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 06:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237056AbjFFKfC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 06:35:02 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8243210DE
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 03:34:46 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-53063897412so5472938a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686047685; x=1688639685;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HG0jJirEZWjA543TLLXMqs0/ZLZOYDfEaWn16jW6YRg=;
        b=gF3MHU13y/9BlXxR9EcWvn1XZzu2T5EV3SQusLh359CwFOt5mE5UyFCA33jpYrHZGJ
         USk7dMAZMRotyyFR9ZzibCvePlOiQWrgrvotY/4AwxOwoObx7vFgTlq19etx5EcaHEPc
         /2V4WbAFWT6SO0wQduvcJRBLDpanHOi/cYUE8LrsKyZ0+LHnxYCqkmXKQkCdzRtQggIw
         BuCjIiho1n47skhNqV6uwx8aPy4D6CnZQE/isoQl1QEhEiZRMVzGR28w73Kf4MKlivb/
         ODaHZwDep74dMyQQXrcHXhmdMXSLmAF7pR5G+tp5OlDAD13vCfVLu+ERyvwLBiZKFzwz
         3d1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686047685; x=1688639685;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HG0jJirEZWjA543TLLXMqs0/ZLZOYDfEaWn16jW6YRg=;
        b=Kg9E4Wzfu5b3jTB5xp7IupHYiWNdBnFKWric2NY26cZex7wFZA+rSR09pStILG1FSW
         EItklA7DljH4e74Cd6nMqg8fgnz3m0C4IOl9JhEw89kPtR4pJqdergDl+ssQv9SF9oFq
         Nnm7nR73VesE1zgkXE5pZD2o7Dkaqt5BsIOz1gzmz8uFfN7tKSijGWMCu0KtzVleclUS
         z0t+EIsLJL4s6TilK0x0lX7U2ngp2vxFb1LNwAReCJxnVYPm7sbkxGfhXs3pXu88rpPL
         g0su3p8M6a0vAeLUDEZPFXHLRxzeh9bKeNY7u6UA49Lwho8bZXrhwYu1kpTyqYIPYf2F
         RS5A==
X-Gm-Message-State: AC+VfDxMAb53kyM4SFfLxr9PeZD+em3xdpPStq9FfqhUjjOm6rA+Bj2Q
        JTGfCDPo9Qs31u9rxxAV/XzF+V0JaRWsEfu/n6gOfg==
X-Google-Smtp-Source: ACHHUZ42J/Jjce5anfO7YvfOq3/G/+D1azrNJgEOsShr5zEZf68AYOafhT/Wt7g3jqvPrKaOCCCl6g==
X-Received: by 2002:a17:902:8a94:b0:1b0:5c0a:3f80 with SMTP id p20-20020a1709028a9400b001b05c0a3f80mr1569336plo.44.1686047685461;
        Tue, 06 Jun 2023 03:34:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902748a00b001b050df0a93sm8158594pll.93.2023.06.06.03.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 03:34:43 -0700 (PDT)
Message-ID: <647f0bc3.170a0220.f218f.f1b0@mx.google.com>
Date:   Tue, 06 Jun 2023 03:34:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-06-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next usb: 2 runs,
 1 regressions (renesas-next-2023-06-06-v6.4-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 2 runs, 1 regressions (renesas-next-2023-06-06-v6.4-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-06-v6.4-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-06-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7762defcdaf029da668d5af3304d3d940d43199e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef61bf85f673f80f5debf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/usb-s=
c7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/usb-s=
c7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/647ef61bf85f673f80f5dec0
        new failure (last pass: renesas-next-2023-06-02-v6.4-rc1) =

 =20
