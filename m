Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA216AC99B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Mar 2023 18:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjCFRRF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 12:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjCFRRD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 12:17:03 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 155FDE3A9
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 09:16:37 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id h8so11148752plf.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Mar 2023 09:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678122926;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wyHcIlrucCQpTasZLFT2s3jikCFbda+X1KjUlTEM3cQ=;
        b=X2kbyYSL3V34rBZJMRSsM/EcgYB85rX2NqipbKWWBvOQnEB0tZTcs1Rd/cbQW6G73E
         IjAYaKestAd7aS9+63v47UsVJT/pKSGzAEvfmZCTWKkuCO9DnM2O9UL0WFSrobngGoeM
         XMvJFeGtKfil2UjBWRaCTX6URJyKwVuQoYIEPLUIQynszBOmBt7iaFAVRfsx4Lb+LV1g
         OSGzF1JwdMZKdVFQBf6gUzA0I0ezFEiJgL2KVTWXACe9yhoVtQ+TyCyvppmM6BjQQ+KU
         171XfDzWG7R8H8gqBIm1R5T3mEwrbdGmreqHBZofJvvihlc6YtlQ9D/hiD5kmnLLTXX9
         K38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678122926;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyHcIlrucCQpTasZLFT2s3jikCFbda+X1KjUlTEM3cQ=;
        b=cyJCpajghU9ERUjJzlti+A3wUDRIdpFEKvjmnu6+A0twHUCD+/XNwcBSh4sh6psP8c
         uM44CBNVePjQwWC0nSHvPsS4u42cax/ojcIX7m0zOJnBGJvZStXIJVrAjiuB5jXvIkWf
         bkpTlohknL2XmlUvPXcnnKJbsBBpT91YOLhRivSSG/nhwzkN1qYHKhpuWM+zGl72U8nj
         ZTmbRqeGIfYGErqO+aOKVOAoGvEb28bFHtWJ7Oqunrd1Uigr8ni43v7ZG47N7eeRN90p
         giYs8lUhqPl74QtFgAgw6qB+ye41KzFcogylvqmiFHv4tRADVPXHp9s3nD+f7oDI5QkA
         FUZA==
X-Gm-Message-State: AO0yUKVvcyedOGP2OVFRj3/wFH/FkLbYU/x/L7X0nQUVXTPDcvIM2NI2
        hQ8iYbnp0WaDa4Wstfe3kG97eL+T+zwf/m9FiDTxU0iN
X-Google-Smtp-Source: AK7set81RuY5Q0NSweFmBtHW44fW6vUvQ4X5/0RhPJQUa7ooNjHnn30wBmu39b8MWivjbIDjZBj5pQ==
X-Received: by 2002:a05:6a20:430f:b0:cd:1367:3b69 with SMTP id h15-20020a056a20430f00b000cd13673b69mr11686198pzk.17.1678122926200;
        Mon, 06 Mar 2023 09:15:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j6-20020aa78dc6000000b005938f5b7231sm6496539pfr.201.2023.03.06.09.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 09:15:25 -0800 (PST)
Message-ID: <64061fad.a70a0220.86564.b344@mx.google.com>
Date:   Mon, 06 Mar 2023 09:15:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-03-06-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master cros-ec: 12 runs,
 1 regressions (renesas-devel-2023-03-06-v6.3-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 12 runs, 1 regressions (renesas-devel-2023-03-06-v6=
.3-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-06-v6.3-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-06-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8b20ccdf60a58fb8e57af56ff0fb030a25a59871

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/hardboprobot/cros-ec-tests.git
      SHA:  f6c0dbf63842d5751000c5527808aca38354db55 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/640611c7685d2af1558c864b

  Results:     1 PASS, 1 FAIL, 14 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegr=
a124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegr=
a124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230224.0/armhf/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/640611c=
7685d2af1558c865a
        failing since 68 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2022-12-26-v6.2-rc1)

    2023-03-06T16:15:43.728592  test_cros_ec_chardev FAIL: /dev/cros_ec not=
 found

    2023-03-06T16:15:43.735438    File "/usr/lib/python3.9/unittest/case.py=
", line 59, in testPartExecutor

    2023-03-06T16:15:43.736162      yield

    2023-03-06T16:15:43.741743    File "/usr/lib/python3.9/unittest/case.py=
", line 593, in run

    2023-03-06T16:15:43.745093      self._callTestMethod(testMethod)

    2023-03-06T16:15:43.751960    File "/usr/lib/python3.9/unittest/case.py=
", line 550, in _callTestMethod

    2023-03-06T16:15:43.752797      method()

    2023-03-06T16:15:43.762133    File "/usr/local/lib/python3.9/dist-packa=
ges/cros/tests/cros_ec_mcu.py", line 28, in test_cros_ec_chardev

    2023-03-06T16:15:43.766846      self.assertTrue(os.path.exists("/dev/cr=
os_ec"),

    2023-03-06T16:15:43.773260    File "/usr/lib/python3.9/unittest/case.py=
", line 682, in assertTrue
 =

    ... (1 line(s) more)  =

 =20
