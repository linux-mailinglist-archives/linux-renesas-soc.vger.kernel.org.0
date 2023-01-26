Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0578667D880
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 23:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbjAZWfp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 17:35:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbjAZWfo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 17:35:44 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265F15CFCC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 14:35:04 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id v3so2089959pgh.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 14:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uWdQHr0lRKEqPbp8GV7oOrPoOZex+1WkD/wq3BBiPps=;
        b=qmP7kXzZr4mfRAmgENWIahRxBeI650N3RpunsYedXs15Qj2DzzOqSH/+eFcJy9g0HS
         fwjuIuOR8PQVNuV14dsYUn/wpvkOVQ73ohKXeBAchy/fLJqfdnDNHzmpFGINQRCULuKq
         FgDMaD/n0foTkrN7/IXn3DnaAIB4laM0dJe4Y9+QuOBDGFWqxWlBSOwAJuaXOLFUxW1P
         HYuBBaHN4/v8Tu2Qu5Pd6CeL8E0JzX38vlMYLhSvGe91hk9Brln5DFfNzafGckNaT3Cz
         KTyzIdm3ItBgOS/E1UYmHfjnV5d0Pb4tnWI8Qssw4XHNtQ0jGsQSNrNzqjjekYw1cYdr
         9DRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWdQHr0lRKEqPbp8GV7oOrPoOZex+1WkD/wq3BBiPps=;
        b=TNRpkLxpB40ztEKLZDb50aJNfdjSIMuE8JfH9iyacLbrjgZzEdIGc024zWda0BRtu0
         6/uJcdxl3mClbl63kmOHdI1HTmjK/hun48eyVSgwcE7qpxKiQRB5TEh8aFdQ73z4c8Bb
         wOY0ZVzQUKZi+8pDuqk+FVX4DKm1DqAwmVVWkmVL1FWOZWF69BEME0jq6bBnMS2dhhrs
         IhlQ4IoapyOdDNjw1Y0Pt+20qNwITfh6ZPnyI0GfDFhrfLjiyU04eQhCrr4H4e31lr0a
         0k96HPCE5bqCtMCHOrmbK6Wxc7uBiLxW9NUDdHGvLxNpO4bVlSYjWdiRb2bzK3ePFv0T
         /E0A==
X-Gm-Message-State: AFqh2kqlfMnYNVYeYVeCexMgn44QxYKYoKWNBe7WhQKqeYGzf2vQEIL1
        w3E2rB2CHHBznPcxn+5qRgAh9y3IJud1S/LBmcARQA==
X-Google-Smtp-Source: AMrXdXuT2FL30aO79mvGntOAxrne0juAARfmuo7LdaB3VZyqBJmDxzePlLd3SCTrYU3bFK1EGSBtrg==
X-Received: by 2002:aa7:972e:0:b0:58d:b330:6e7d with SMTP id k14-20020aa7972e000000b0058db3306e7dmr40477810pfg.26.1674772482994;
        Thu, 26 Jan 2023 14:34:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b25-20020a056a0002d900b0058bbe1240easm1289072pft.190.2023.01.26.14.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 14:34:42 -0800 (PST)
Message-ID: <63d30002.050a0220.5e84d.2654@mx.google.com>
Date:   Thu, 26 Jan 2023 14:34:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-01-26-v6.2-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master cros-ec: 10 runs,
 1 regressions (renesas-devel-2023-01-26-v6.2-rc5)
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

renesas/master cros-ec: 10 runs, 1 regressions (renesas-devel-2023-01-26-v6=
.2-rc5)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-26-v6.2-rc5/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-26-v6.2-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      635b2020aa8744f7174ce492c342357cb34c9e86

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


  Details:     https://kernelci.org/test/plan/id/63d2ff3afaaaeddde2915efe

  Results:     1 PASS, 1 FAIL, 14 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegr=
a124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegr=
a124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230120.0/armhf/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/63d2ff3=
afaaaeddde2915f0d
        failing since 29 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2022-12-26-v6.2-rc1)

    2023-01-26T22:31:12.913302  =

    2023-01-26T22:31:12.916596  test_cros_ec_chardev FAIL: /dev/cros_ec not=
 found
    2023-01-26T22:31:12.917055  =

    2023-01-26T22:31:12.923170    File "/usr/lib/python3.9/unittest/case.py=
", line 59, in testPartExecutor
    2023-01-26T22:31:12.924327      yield
    2023-01-26T22:31:12.929652    File "/usr/lib/python3.9/unittest/case.py=
", line 593, in run
    2023-01-26T22:31:12.933019      self._callTestMethod(testMethod)
    2023-01-26T22:31:12.939540    File "/usr/lib/python3.9/unittest/case.py=
", line 550, in _callTestMethod
    2023-01-26T22:31:12.940729      method()
    2023-01-26T22:31:12.941183   =

    ... (7 line(s) more)  =

 =20
