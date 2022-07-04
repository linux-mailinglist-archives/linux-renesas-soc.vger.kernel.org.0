Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F754565685
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 15:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbiGDNHF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 09:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234643AbiGDNHA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 09:07:00 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059FADF22
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jul 2022 06:06:41 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id r1so8517278plo.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2022 06:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8DNo7ij4co0VdvwYRf4d61rx/BlNn90kl7xtOUpC3PY=;
        b=x6hEFTO9Vt7Kcw8wMZEWX+M7+1M+ARbW2S0RHKeFm3Ho+M2XD6VP2/Prk8F75412dG
         Gv+ZDwFsPZ8l+o8LF6rhvv+uGjheZCs96Fy47QuBGL1Hjl47JTOV6PXQIHkra70OA0SN
         +DK/236a2krnzfvzsu2h9N/WlMwCdCPHBwkaeeMrvr6/qYjpxaB+SqqGK4T/LADOz9nT
         zYCQZBu01Kd89kPIuYoyoUhFBTR8ZSL8L6Q0m0hAoB/5/fDXauNaaXX2IS/LaeJeAgHY
         56u0zb9A4rDeO5E5CiSFyBbY7f6APDQY1CsR/KgwEXfzmCDT86/r1gd1xxPtxzxj5nKo
         vI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8DNo7ij4co0VdvwYRf4d61rx/BlNn90kl7xtOUpC3PY=;
        b=huiLdc3EgTeqIGRwt4Udqj8PPYsXrDrWCJho0bYwBUPTAD6/XI4+QhE8cnKGreWlcH
         DPcI+js37KDESm1RjbKMKvcrRwlnHRSmEseKn8hpdPV7PH+1hyIsxU6kzR8FAt8gjqtU
         UOo1bEcCy5wfbrZVQfEgQmZ5Po9mkrIjxBwcy8PlizjrbmjGjk3oWf1OZdDhzjpGdDUq
         ULsZ4vgGGWmejtENBBKi9qlAYRlYWmm6GWtPe/3wRJwzDoNvCMIRKH8Xna7zD7iUxPz5
         8FM5M49/AK5LylQ8seOS4b26haLZAU13Itg0ZvLxXNlKM5y5GvjMQw0vyDN3TKFW6EVL
         kxdA==
X-Gm-Message-State: AJIora/OBRSWyqiBB+0om9sRJZN7HPSLno+NhK/TBq0twDrS6Lbjuz+t
        X3PNN0r59HHuYlDmuQ6+ZBHVIK4/g3JtzfhX
X-Google-Smtp-Source: AGRyM1uSMKRqMpcJGX5x217EuluWhysSCsBeFCEMw6ihL3zqVAhNGO3SWjA5T4aMy1YAel6GnrX3aQ==
X-Received: by 2002:a17:902:e052:b0:16a:1257:152e with SMTP id x18-20020a170902e05200b0016a1257152emr35542409plx.172.1656940001113;
        Mon, 04 Jul 2022 06:06:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c10-20020a170903234a00b0016b9b6d67a2sm11849659plh.155.2022.07.04.06.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 06:06:40 -0700 (PDT)
Message-ID: <62c2e5e0.1c69fb81.3622c.0c01@mx.google.com>
Date:   Mon, 04 Jul 2022 06:06:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-04-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 7 runs,
 1 regressions (renesas-devel-2022-07-04-v5.19-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 7 runs, 1 regressions (renesas-devel-2022-07-04-v5.=
19-rc5)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig        | =
regressions
-------------------------+-------+---------+----------+------------------+-=
-----------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig+crypto | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-04-v5.19-rc5/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-04-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      53f4b75e60cf6c4bedcc6638ff37f56eab20dc19

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  e98f9465925434349d0aa6eb71e81b5464e76df4 =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig        | =
regressions
-------------------------+-------+---------+----------+------------------+-=
-----------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig+crypto | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c2dace307173614ba39c07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+crypto/gcc-10/lab-cip/ltp-ipc-r8a774a1-=
hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+crypto/gcc-10/lab-cip/ltp-ipc-r8a774a1-=
hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220610.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62c2dace307173614ba39c=
08
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4) =

 =20
