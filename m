Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3D987EA78D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 01:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjKNAhX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 19:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjKNAhW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 19:37:22 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C4FD5F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 16:37:18 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc5b705769so45996555ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 16:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699922237; x=1700527037; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7i5agcpW53hvvZZUHdXjNFJsCUD86ZoIgZeou1TuxyU=;
        b=sC1J2vNiD964F+SL0xh57QTSuZPfHrmG0acm/dk/snY9Wr4Vqq7YVNyP+NBYjC1J5X
         Lv7on8RO3Gikp/QJ7m0wMoiDFtzgEmTRNZxZ1YjMlSZUUayW8nizjguFjBd6RdluiA3v
         itzxBgfqqYeit8A4itAfryHPpcbUSJk3V7O6brYP6W76K4C71JxA1SUlRVJfj6uFFqba
         RCvzGFbVwLEjcaqyf/+lASa2B46IF0uZ2kkpoXksYybimh93a+Y7ws3/ZancYg7J2ILD
         UEUWtDpd1rx8Hu1pdAgLQVSLLPD1VVdjbfu0tPzxYvxKAjYSrrfYspJ4t8S3KovtwbSu
         02XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699922237; x=1700527037;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7i5agcpW53hvvZZUHdXjNFJsCUD86ZoIgZeou1TuxyU=;
        b=nB4tMMnxItuZ1Fo0S/92fXZHHPXqomdcQ+nsltttfmVZDsazD13LL2MXKVLq1M5Ghp
         jonN2ysHa+HsGuXPLeIJnl+9jc+Pydm5inTqAYyd2GjtwFW5zwL4MOjgEnukY/GG8Txd
         8HmsoxL32O9e4NjLsuFPc/JiLbwJanbGaTkU8//XfJDbqi/V7pF26r3GeaKhDOaQX2fi
         S9AiU6/PyUbkxvjyBJoZRO1FrpQDlVA4JTPWirpngz1yTzYPueamxFJqYAbvv/xU7drM
         TEEWV62+xQ5KDdzMA8ZE2PVRqwS7mmXvJ0mHN+DiV5WS6V+4Nmel3szb+tFz+0uJveWO
         VJTQ==
X-Gm-Message-State: AOJu0YzAa5+vTU6FQ6U638W7X6DlDd6DfCab8J8gjJ1630c6N/b1C9Jq
        NiscMITElsGdWnj5oh4eQfVH2GgZhtk4tjvY/e68eA==
X-Google-Smtp-Source: AGHT+IGZHFjpeI1AMvNMPWRpKPpDEjLHkqb5GOyBiEzZRSYaW38A83nS7X04CHquJDOZzbZI6mFajA==
X-Received: by 2002:a17:902:dac6:b0:1cc:5833:cf4f with SMTP id q6-20020a170902dac600b001cc5833cf4fmr846544plx.55.1699922237314;
        Mon, 13 Nov 2023 16:37:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b20-20020a170902b61400b001c582de968dsm4588782pls.72.2023.11.13.16.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 16:37:16 -0800 (PST)
Message-ID: <6552c13c.170a0220.914e8.aa64@mx.google.com>
Date:   Mon, 13 Nov 2023 16:37:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-11-13-v6.7-rc1
Subject: renesas/master baseline-nfs: 22 runs,
 2 regressions (renesas-devel-2023-11-13-v6.7-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 22 runs, 2 regressions (renesas-devel-2023-11-=
13-v6.7-rc1)

Regressions Summary
-------------------

platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
dove-cubox       | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =

imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-11-13-v6.7-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-11-13-v6.7-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2cbe2219523d8ff9bc5d81dfd3bb6cf97807ab2d =



Test Regressions
---------------- =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
dove-cubox       | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/655290c1b5a1d2c5237e4a84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-13-v6.7-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-13-v6.7-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/655290c1b5a1d2c52=
37e4a85
        new failure (last pass: renesas-devel-2023-06-26-v6.4) =

 =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/655290992abb9c30c97e4af0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-13-v6.7-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-13-v6.7-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/655290992abb9c30c97e4af9
        new failure (last pass: renesas-devel-2023-06-26-v6.4)

    2023-11-13T21:09:36.038254  + set[   27.858131] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1008593_1.6.2.3.1>
    2023-11-13T21:09:36.038470   +x
    2023-11-13T21:09:36.146323  / # #
    2023-11-13T21:09:36.248037  export SHELL=3D/bin/sh
    2023-11-13T21:09:36.248633  #
    2023-11-13T21:09:36.349919  / # export SHELL=3D/bin/sh. /lava-1008593/e=
nvironment
    2023-11-13T21:09:36.350424  =

    2023-11-13T21:09:36.451694  / # . /lava-1008593/environment/lava-100859=
3/bin/lava-test-runner /lava-1008593/1
    2023-11-13T21:09:36.452409  =

    2023-11-13T21:09:36.455241  / # /lava-1008593/bin/lava-test-runner /lav=
a-1008593/1 =

    ... (12 line(s) more)  =

 =20
