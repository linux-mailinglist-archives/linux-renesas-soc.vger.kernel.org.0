Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C817C7AFC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 02:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjJMAxs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Oct 2023 20:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjJMAxq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 20:53:46 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967F7B7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 17:53:44 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c9e95aa02dso5852555ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 17:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697158424; x=1697763224; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K+QdU1IM6rYduz8q/1Fg0/2TOpP+95iG2S3K/KLP5pQ=;
        b=n6NQ+zPIXS6ApCrOQPItKVqD7KMCZ+Zq+x4jTPZWPbOdeLqito9ekLZp1ECL1APRRo
         me5WOsZCIGojBvhWGQtlVwNE6Ca3R6P8rgWcRrOj5NWyZhGadyy/gjFERcjJ9wohPaEm
         7q+JHGcNTE4azuz0D/I7+T0OkVbKjmbJywmbe5FqwP8RKVGJS/sFFFqzuuNnsStdSJcy
         ExSADeppHjv2yCQLwSlFIf9QnGq7Nk5QXe5ZAxHKRdPd4rO45qtMFmI1zK2QTgRRjx8v
         tC+QXFTaDpL3oASOhT9ta49n+6Uf5jLlPrGnnXLQItYKSxBs59px5GSpmEx3d8C7wzQE
         EUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697158424; x=1697763224;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+QdU1IM6rYduz8q/1Fg0/2TOpP+95iG2S3K/KLP5pQ=;
        b=bQHjDaYUg5nIujy8wAoRauejqJPrFdOev7xlCjNvNt9od7aeO/Doje/23pVC95C9K+
         yHJEs4tVD0jVEoSZI6Pmw+K4egazQKgZ6Ah+wTMzT2UFVwx0elnQKg34X1mnR34/ZoM1
         Xx6yhGDaGUkXjfSztqmQE57CtMvBDaDt+U/2JaCNqzj7GYVlDBy27pGqQlB3+2LRQBXw
         V5J/s8GuqjFB7VkaJRUg4Fr4B7swQ042nR2qqnX2uyDd8rYGrpfADMGkn+lStFJtffSO
         zLeI41mSWUUSbDgtO1+dJ88S+VjvG7zzn0uPyw1sRnlvot+vXiuYnZo2zMDPktZKqxU+
         8MQg==
X-Gm-Message-State: AOJu0Yx7rAJeWfiBO5B9SMb3mGdXidqKJRn0VZtyzEJfLvBiFcgST8mL
        6Xw0V/gtYBX503oJHK9NPJxnrDnki7qPSVcqFpfsqA==
X-Google-Smtp-Source: AGHT+IHj2Z3kDzToMACr+X9RCowefALmsD5mEzWZOKe1sNjCZ0eUD/cRryJSeJcGtiN04aAZt9bC/g==
X-Received: by 2002:a17:902:a411:b0:1bc:4415:3c1 with SMTP id p17-20020a170902a41100b001bc441503c1mr27366610plq.7.1697158423642;
        Thu, 12 Oct 2023 17:53:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id it19-20020a056a00459300b0069305627494sm12415379pfb.165.2023.10.12.17.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 17:53:43 -0700 (PDT)
Message-ID: <65289517.050a0220.1ad2a.3c67@mx.google.com>
Date:   Thu, 12 Oct 2023 17:53:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-10-05-v6.6-rc1-7-g11476f31ceafc
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 48 runs,
 4 regressions (renesas-next-2023-10-05-v6.6-rc1-7-g11476f31ceafc)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 48 runs, 4 regressions (renesas-next-2023-10-05-v6.6=
-rc1-7-g11476f31ceafc)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =

r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-10-05-v6.6-rc1-7-g11476f31ceafc/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-10-05-v6.6-rc1-7-g11476f31ceafc
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      11476f31ceafc77476a853d48a145978af65b04b =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/652888a8b1c250cbebefcf09

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-10-05-v6.6-rc1-7-g11476f31ceafc/arm64/defconfig/gcc-10/lab-broonie/baselin=
e-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-10-05-v6.6-rc1-7-g11476f31ceafc/arm64/defconfig/gcc-10/lab-broonie/baselin=
e-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652888a8b1c250cbebefcf12
        failing since 31 days (last pass: renesas-next-2023-07-27-v6.5-rc1,=
 first fail: renesas-next-2023-09-11-v6.6-rc1)

    2023-10-13T00:00:20.099913  + set<8>[   28.552965] <LAVA_SIGNAL_ENDRUN =
0_dmesg 167280_1.5.2.4.1>
    2023-10-13T00:00:20.100395   +x
    2023-10-13T00:00:20.210595  =

    2023-10-13T00:00:21.371624  / # #export SHELL=3D/bin/sh
    2023-10-13T00:00:21.377650  =

    2023-10-13T00:00:22.871319  / # export SHELL=3D/bin/sh. /lava-167280/en=
vironment
    2023-10-13T00:00:22.877297  =

    2023-10-13T00:00:25.598229  / # . /lava-167280/environment/lava-167280/=
bin/lava-test-runner /lava-167280/1
    2023-10-13T00:00:25.604916  =

    2023-10-13T00:00:25.618202  / # /lava-167280/bin/lava-test-runner /lava=
-167280/1 =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6528642f806b2cc147efcf2c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-10-05-v6.6-rc1-7-g11476f31ceafc/arm64/defconfig/gcc-10/lab-collabora/basel=
ine-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-10-05-v6.6-rc1-7-g11476f31ceafc/arm64/defconfig/gcc-10/lab-collabora/basel=
ine-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6528642f806b2cc147efcf35
        failing since 77 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-10-12T21:29:07.419514  / # #

    2023-10-12T21:29:07.520364  export SHELL=3D/bin/sh

    2023-10-12T21:29:07.521092  #

    2023-10-12T21:29:07.622505  / # export SHELL=3D/bin/sh. /lava-11754632/=
environment

    2023-10-12T21:29:07.623239  =


    2023-10-12T21:29:07.724644  / # . /lava-11754632/environment/lava-11754=
632/bin/lava-test-runner /lava-11754632/1

    2023-10-12T21:29:07.725918  =


    2023-10-12T21:29:07.734132  / # /lava-11754632/bin/lava-test-runner /la=
va-11754632/1

    2023-10-12T21:29:07.793192  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-12T21:29:07.793696  + cd /lav<8>[   20.414612] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11754632_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6528645aa9cdc62388efcefd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-10-05-v6.6-rc1-7-g11476f31ceafc/arm64/defconfig/gcc-10/lab-collabora/basel=
ine-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-10-05-v6.6-rc1-7-g11476f31ceafc/arm64/defconfig/gcc-10/lab-collabora/basel=
ine-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6528645aa9cdc62388efcf06
        failing since 77 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-10-12T21:28:06.384220  / # #

    2023-10-12T21:28:07.462432  export SHELL=3D/bin/sh

    2023-10-12T21:28:07.464145  #

    2023-10-12T21:28:08.952455  / # export SHELL=3D/bin/sh. /lava-11754647/=
environment

    2023-10-12T21:28:08.954271  =


    2023-10-12T21:28:11.673751  / # . /lava-11754647/environment/lava-11754=
647/bin/lava-test-runner /lava-11754647/1

    2023-10-12T21:28:11.675855  =


    2023-10-12T21:28:11.678445  / # /lava-11754647/bin/lava-test-runner /la=
va-11754647/1

    2023-10-12T21:28:11.744474  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-12T21:28:11.744972  + cd /lav<8>[   29.550086] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11754647_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65286443efa85ca2e7efcef6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-10-05-v6.6-rc1-7-g11476f31ceafc/arm64/defconfig/gcc-10/lab-collabora/basel=
ine-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-10-05-v6.6-rc1-7-g11476f31ceafc/arm64/defconfig/gcc-10/lab-collabora/basel=
ine-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65286443efa85ca2e7efceff
        failing since 77 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-10-12T21:29:20.418408  / # #

    2023-10-12T21:29:20.520777  export SHELL=3D/bin/sh

    2023-10-12T21:29:20.521503  #

    2023-10-12T21:29:20.622882  / # export SHELL=3D/bin/sh. /lava-11754650/=
environment

    2023-10-12T21:29:20.623609  =


    2023-10-12T21:29:20.725191  / # . /lava-11754650/environment/lava-11754=
650/bin/lava-test-runner /lava-11754650/1

    2023-10-12T21:29:20.726509  =


    2023-10-12T21:29:20.742271  / # /lava-11754650/bin/lava-test-runner /la=
va-11754650/1

    2023-10-12T21:29:20.810306  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-12T21:29:20.810814  + cd /lava-11754650/1/tests/1_boot<8>[   17=
.769412] <LAVA_SIGNAL_STARTRUN 1_bootrr 11754650_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
