Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 837A14D0E62
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 04:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234284AbiCHDjp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 22:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiCHDjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 22:39:44 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273E133A04
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Mar 2022 19:38:49 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id mr24-20020a17090b239800b001bf0a375440so1045256pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 19:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VvVKQ0xuMFwrLIZBShHsq9d26IHdBD29zkULBJa+UFk=;
        b=d9IJW/V+7vk2zigZajhopRr12GSIMkoTePW8DvOzn7t2DzI9+055H+an9UkIvC1PIV
         S8mmfgGw4tZ6REwq6tWN4hx64ZZfwLPnmRbv3mYSAxddjjygEgePi1X7OrE4H18smimB
         bYiPseFaIa3oiadyabRqZ/b34C4ifnyp2cwQk3vPSYy088bhuHONcbUW4Txb05eyiUDt
         WnFOXxnzqJcILNxs+u+yJkcuFu4xjwrfBpqO/GmnTPj4e1TXAmqfFgfQlCAVMxW5Jr0l
         eQ1YkXtKFVEubABJTx0i9NyTvU3EnTpdGrhgHXqKh9dt1pPe3yl4S1sXG62TJ+Zsem+4
         foCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VvVKQ0xuMFwrLIZBShHsq9d26IHdBD29zkULBJa+UFk=;
        b=GKNAnxASmzQCC7behT5xC9fsYaTD1/63rqo1xUBd38Z8y8fy63sg2ThVerVpgtJ5X9
         0Y8TB4vKde1EHdYh0uD6VwpikZX932/G2Ht/RCYz+rzynm8DWJ19z/oWE7KPYbLlLnC7
         3Ug4YsvUart3vuQPhUAVUufxzuJdk/QjF6VWXTLAFpwtooxi1gkXIfaYEmnjRch9XP8L
         N5fi4hOpGYvZfQhn8aG9Wm94S6M+E7/lEh1LN1daDABjsOjVtprsKgMDlx9GK2O1w81N
         mh1G0k79AnZrN87LFkUUOLy7h9suSs2+qXvoqk+mBsCh7aEAdCMatsRdGc5Xjsv9ftXD
         zXZw==
X-Gm-Message-State: AOAM5312f85wCLsCU4fqcz25WeP2jyAYxr0kdm2BxODRgJFubchLoGHR
        HdL4kSYUQ+M3BSRMI5i97mQI2GAkn2de2r8Rr1w=
X-Google-Smtp-Source: ABdhPJyUTAVLjKBB2OO5p+o5ejWHwWz9O5jvvvo5pYAU6uNXIDkFRTKcWklSGGECZrSAYv4OmLv7BQ==
X-Received: by 2002:a17:902:b945:b0:14e:e5c4:7bcd with SMTP id h5-20020a170902b94500b0014ee5c47bcdmr15534983pls.48.1646710728489;
        Mon, 07 Mar 2022 19:38:48 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l13-20020a056a00140d00b004e13da93eaasm17794456pfu.62.2022.03.07.19.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 19:38:48 -0800 (PST)
Message-ID: <6226cfc8.1c69fb81.2cbca.e2fd@mx.google.com>
Date:   Mon, 07 Mar 2022 19:38:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-03-07-v5.17-rc7
Subject: renesas/master baseline-nfs: 54 runs,
 2 regressions (renesas-devel-2022-03-07-v5.17-rc7)
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

renesas/master baseline-nfs: 54 runs, 2 regressions (renesas-devel-2022-03-=
07-v5.17-rc7)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | =
1          =

r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig        | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-03-07-v5.17-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-03-07-v5.17-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      09bb57453137ffbcb765c7dbb8f431a710096d59 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | =
1          =


  Details:     https://kernelci.org/test/plan/id/6226a08073684892b4c62a79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-07-v5.17-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-07-v5.17-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220228.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6226a08073684892b=
4c62a7a
        failing since 13 days (last pass: renesas-devel-2022-02-21-v5.17-rc=
5, first fail: renesas-devel-2022-02-22-v5.17-rc5) =

 =



platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig        | =
1          =


  Details:     https://kernelci.org/test/plan/id/6226abadac75af1177c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-07-v5.17-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-07-v5.17-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220228.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6226abadac75af117=
7c62969
        failing since 7 days (last pass: renesas-devel-2022-02-22-v5.17-rc5=
, first fail: renesas-devel-2022-02-28-v5.17-rc6) =

 =20
