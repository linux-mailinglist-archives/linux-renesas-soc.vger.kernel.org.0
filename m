Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E706F6CA67D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 15:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbjC0NwR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 09:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbjC0NwB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 09:52:01 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A975E558E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 06:51:17 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id k2so8486433pll.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 06:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1679925077;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p/RxJZB137KewlP8yzbKIg7RCYyNntBjnE2nSG33q0o=;
        b=oY7AYAtDXE/z7b6PVZcJ6oVvb3t2cPQn82b/XXJ9MQl0o7a04XIFFgQgByed8QL4tm
         QOUAD7mZtdR+ALJLGxdKx1MJmM18tw2W7gF1LhExcksDP2Gx971M3OEKS6cGSiIo9Op4
         wihsXW3d2bY7H7l6j56vQqVw7p5/Bi3DTcUFrgw9TMu75ksqCQogyAkBsc3Xu0AHbCNf
         oK7TElr08+Kf1pJuyKMsW8wyy4AaFVIpX8cTzhfwUdW/rop9axJEJWYGXWE24qrG4k8A
         9s6y+V6AkTO6H9k1WYOQjpX9WqEEXb2KhaF9lUYO6TmO4W5m59gCBynxYHVbfdD0Cgsf
         Fv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679925077;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/RxJZB137KewlP8yzbKIg7RCYyNntBjnE2nSG33q0o=;
        b=AfWSm8q/5Twx6mKihVtriXNt3+9/Izt9OlGbPwjiKbsOP1u7ep5xcQYUrKtnvjk9cZ
         hhYzZcoNnFOmcDwHbX8OxbosjpUhh6mhfeGwCCUTTpjrqjCZGAGWiXt1/LmsLInYp38+
         OXQm0WX1TfPc5SN6dGgSPScuRrFzq6yqdFCt2Ss73q5byIZTE4bIOgWk+BDw4gGRpY48
         sMQPxE2HMGqmr7u5QKOBnLMKsgW6OIQ/V/wbdLRgYHx0Icv+NMzffqiyRTPCanmitf47
         bZwuyRWAH+oJeLryyul5sBvMJZnTZ4qAB6BgHcdSInpd9/EVhEQnGBCp3qgbvBbZx6rj
         fa/g==
X-Gm-Message-State: AAQBX9cGfdtSYYqScYyaDkfpF8IBfmrBrqwNJRJ0AFtuiu8bM1EpRN/H
        Xlt7CJOmc46muDvUIjejDZ9KpEC8D5qcphuGjOBhLw==
X-Google-Smtp-Source: AKy350bQm13IDKZt0jvGW79Zplg5TeGvwmeWElg6dKE8r8ccRu+/ytWlzxhmxSCusSrR6Q55ABtrVA==
X-Received: by 2002:a17:903:27ce:b0:19c:da7f:a234 with SMTP id km14-20020a17090327ce00b0019cda7fa234mr10113251plb.67.1679925076781;
        Mon, 27 Mar 2023 06:51:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x1-20020a1709029a4100b001a19bac463fsm1727131plv.42.2023.03.27.06.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:51:16 -0700 (PDT)
Message-ID: <64219f54.170a0220.fff29.2a2c@mx.google.com>
Date:   Mon, 27 Mar 2023 06:51:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-03-27-v6.3-rc4
Subject: renesas/master baseline: 202 runs,
 3 regressions (renesas-devel-2023-03-27-v6.3-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 202 runs, 3 regressions (renesas-devel-2023-03-27-=
v6.3-rc4)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
imx7ulp-evk         | arm  | lab-nxp       | gcc-10   | imx_v6_v7_defconfig=
          | 1          =

rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =

rk3288-veyron-jaq   | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-27-v6.3-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-27-v6.3-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7244cafb37b479232e3cc50acf74245ccab3c490 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
imx7ulp-evk         | arm  | lab-nxp       | gcc-10   | imx_v6_v7_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6421691b45c3df52129c9574

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-27-v6.3-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-27-v6.3-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6421691b45c3df52129c9=
575
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2) =

 =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6421655943262b477c9c9568

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-27-v6.3-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-27-v6.3-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6421655943262b477c9c9=
569
        failing since 83 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-veyron-jaq   | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6421644144c2e2dce89c9560

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-27-v6.3-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-27-v6.3-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6421644144c2e2dce89c9=
561
        failing since 83 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =20
