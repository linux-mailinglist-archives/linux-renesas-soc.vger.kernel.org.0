Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED7A6FC8E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 16:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235684AbjEIO0Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 10:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235909AbjEIO0U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 10:26:20 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753C94EF2
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 07:26:02 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1ab267e3528so41987035ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683642361; x=1686234361;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h+4To0yu67jTHaOBEsarwipVXSsQT1oaNZ/y32YBtNk=;
        b=4MZ5BMAv0RaGtGzf9iSkW30zwADeO2rHKq+Tnug0H2tDr4JHyQwZMERkF9EEuoIK4B
         eo4DIXRg7uGePm5VUmv/Hw9q9A/JqAmkKQ9KL0hGJ/CmwO8AEVFks1JugR/Db9Y8/6uv
         SWNtCge2WecE8+5t8/CDXHE3VywvNKMRAJTGGrwBBX1f1gcJo4BV5U+bCuP0YGD/u/op
         v0FZ5brVMVDMEsdZ/MDztmErXP+WpwowYpS5OcHcBaDfpWGfZWhWgPtiPRX1YRga1OKm
         SCTpuFcvgX0iAswq7L06eDTbZnPxaYZX91vdV7L7Uvtuc6r9Z+NuQqlwzta3Oh3aQWqJ
         kwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683642361; x=1686234361;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+4To0yu67jTHaOBEsarwipVXSsQT1oaNZ/y32YBtNk=;
        b=lXfsCP9oSvXtYWRF2Yz8TygvKFJWAikOEqD1HC+JczRHvTOxiGsuXjsB3+cLeKSfCF
         fCxOkLB4F1p0lhPDT56uXv3IkHq3WFEalFpaTvYD/oUu/w9dJs0CJvtw6D4k0nqbuGLV
         DnWirkaPm9gGXgtjEZTT19E6xll40tuvBAYEsxgqZ/ouEf6yfONOD12RCH9vKQBwuAwW
         1TdM4oJfLEwuNRl3nGf2WRsgR69P1EbyVc1o5AE4MwFY+EVgBCNqTqB3mk0YoD1JkA0W
         oz+xTIK/wT+wUWfI31l+eyNCleVFFhLxq5+1mFWEkMr7v7b4+2Tco0XyjH0EYdqpTIdi
         ynYQ==
X-Gm-Message-State: AC+VfDyNkp32vfvYPmyEgJxEY5+O5G3pda+TARmyK1tG2qcyfU5hHCOu
        ooJ2l8e+080mn3N/zsuOst+x6NfjJ6rpzjQDnT326g==
X-Google-Smtp-Source: ACHHUZ4MUl/CzoH1ME1lxj+zoJczmE9S16IOudzca/oOUZPlJSzn7HP6B1aarEIDPRC+mhluquQAYQ==
X-Received: by 2002:a17:902:9694:b0:1a9:8769:36bd with SMTP id n20-20020a170902969400b001a9876936bdmr14597857plp.36.1683642360750;
        Tue, 09 May 2023 07:26:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902bd8d00b001a285269b70sm1610258pls.280.2023.05.09.07.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 07:25:59 -0700 (PDT)
Message-ID: <645a57f7.170a0220.303f3.3061@mx.google.com>
Date:   Tue, 09 May 2023 07:25:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-09-v6.4-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 23 runs,
 1 regressions (renesas-devel-2023-05-09-v6.4-rc1)
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

renesas/master ltp-ipc: 23 runs, 1 regressions (renesas-devel-2023-05-09-v6=
.4-rc1)

Regressions Summary
-------------------

platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
asus-C436FA-Flip-hatch | x86_64 | lab-collabora | gcc-10   | x86_64_defcon.=
..ebook+amdgpu | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-09-v6.4-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-09-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dce70215cdd5598b16b34f41c88d168ad124cd45

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  ec58cf9bfb5588e6f831ee55aa6b10ebd790a826 =



Test Regressions
---------------- =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
asus-C436FA-Flip-hatch | x86_64 | lab-collabora | gcc-10   | x86_64_defcon.=
..ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a462c0be4ef3f552e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/ltp-ipc-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/ltp-ipc-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230421.0/amd64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/645a462c0be4ef3f552e85=
fa
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =20
