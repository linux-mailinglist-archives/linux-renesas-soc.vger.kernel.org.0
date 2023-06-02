Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC2E72055A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 17:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236253AbjFBPHI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 11:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236320AbjFBPHH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 11:07:07 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F06FE48
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 08:07:05 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-65055aa4ed7so1288876b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Jun 2023 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685718424; x=1688310424;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3fNL1BVw6T82A0KtpNu7+DPjJ75pL6NLelWwL8108AY=;
        b=hAXe9eieqzedZelseZc5w28DJYN8E0W4Eicvqqcn3EcH0aGZZGPTvU6TzbdPblbtah
         6dp2e2trzJqqOg+BVVqeM1uJpvSZq6Dmw9zsyIQB9FdVEm6eMk71oBrzb0vz0l95ld+n
         MM8+v/dm1awFQP/O54lmDszBCl2EQImWKfnDIV2OMwQwCDm27ql8AUiO99C6H7+3U8GT
         5fdsdmzXdj/oJeGjXXpDIHe5t1qs9hOeogUZjM8Ui/jEsm7OJdjyYlFFKXJQZaWFjHoH
         yxZkTxMjm69dZ+HD2VYUyT+ErlYwSgYjS13q6gbOZ5IpsD+nRdhhLvNKV47GlMRNL85b
         tcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685718424; x=1688310424;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fNL1BVw6T82A0KtpNu7+DPjJ75pL6NLelWwL8108AY=;
        b=fb1IbaOfXr4q9r+N9BYwjE2cqLgnIPK3uItFkqEbQYs8WIFeZsSiZkpNHtZ7UvaI4S
         hDgFMTT5JOauZgE0pPTmzlehBjPwT8uaO/6x7jrhfniU4HY0FTUnAwYZKlxtMVKu6p6I
         NUTdkfci5aQjoIsF3UGafO0tkx6uhW4QiUQsRx5zbg4xlh1MGw6ts13jHjMdXol2Vs+u
         oWqTcygYVZPWaNVckRwzsIPp1yl4fOHHK2aZblHRLAHulgpakh/+s4XaLZrj6FnyBGOg
         JM/SYwnUiqoXRHO1SYflNia9D5jWRcejZwlO8wWovkf+g8eGsKNgcJYfe5yFM+NnpIzT
         SyFw==
X-Gm-Message-State: AC+VfDzW4fVwMpYUt1Qle72XDmzPu0bGS0yUAf8Vh683y0k6unnkwD3t
        6MlUBz3j8oPPwS3CnCCh9DWY0FDqig6ailW30QS/lw==
X-Google-Smtp-Source: ACHHUZ7nk74vJRYZexF2WXhK1lDpvT6fVLIrwEZm/q8Rj9/ap0+mXANwqrDJhJzsjx2QSmDjfImL0w==
X-Received: by 2002:a05:6a20:918b:b0:105:c456:ab99 with SMTP id v11-20020a056a20918b00b00105c456ab99mr10153370pzd.9.1685718424276;
        Fri, 02 Jun 2023 08:07:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q30-20020a631f5e000000b0051b4a163ccdsm1343210pgm.11.2023.06.02.08.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 08:07:03 -0700 (PDT)
Message-ID: <647a0597.630a0220.6c9a5.2357@mx.google.com>
Date:   Fri, 02 Jun 2023 08:07:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-02-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next sleep: 7 runs,
 3 regressions (renesas-next-2023-06-02-v6.4-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 7 runs, 3 regressions (renesas-next-2023-06-02-v6.4-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-02-v6.4-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-02-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      256ba57a94d64c7d95e8f620dc8d1299c15fbc35 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f69434cb9d919af5de5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6479f69434cb9d919af5de60
        new failure (last pass: renesas-next-2023-05-15-v6.4-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f39122a0c432c2f5de52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep=
-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep=
-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6479f39122a0c432c2f5de53
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f37e0ce8c7ededf5de2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep=
-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep=
-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6479f37e0ce8c7ededf5de2e
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =20
