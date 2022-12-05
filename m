Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB191642977
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 14:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiLENey (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 08:34:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiLENex (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 08:34:53 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C4110FC9
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 05:34:52 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id jn7so10788424plb.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Dec 2022 05:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yiOn87jg/Lshgvlug4Gif4vm09TQFjzKQ6VEQYaEoQM=;
        b=A5gW9dGEtnoOsNQ7EQYvJpI5A+1TE+/xe5MpDO/WWQJ6G8+NJr69jB8pO9zszz97Js
         YIYuAZTkPL+5ApPQd30Vb5TCKHO0KHCQxiDZQGiIAPVm/feq3fgx6NIbIM4Rvdno6TZH
         iI57b5t1O3ZN8sIfNb8dmdOY+8bGnS+ggqf/W4CX6kaSD61yDUCJpYk61PiOYyac0mnb
         imzxrqLmVnq3ieMqk4ePx9ArWZGVgAitZQbQPiTl8ItuBpJyaj7YSYz8KosC7MdevjYm
         P5Y/RsLytOqZVvZIealf83pn+ZiREG8DQsi65QTKDQ9hweO3i1xIEYDEpl8HEofaOTuN
         0dXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiOn87jg/Lshgvlug4Gif4vm09TQFjzKQ6VEQYaEoQM=;
        b=FSqzgyRI12U7/9V962vEiBXKT9UoYWsA2po+dFJBqWjMC1BT7c/Nl1nuqBxI1HddNL
         uIYK6o8t4GLOkBxHPbrf+fwc4YPSsD191Q8FdXTaQQuUkb1Mylmlg4WWHjHhXWpCRX4b
         84sE5h/N4oU7TSLQ5jjaOjKGALQe7hR1tPgxzhxKpz6CbX0wDcsR/DYD6YNpykLRuh2Q
         rmxm+zhciKYKULVViHaoJDPIb4gOcKC+n/jsYnJno8gtUnEKlVxLdKirW4Kmn6ua3LQE
         bB7fulwUp8yAKxryC9GHDW6shfRFXqTz2kwoyJU7fOurrzkwx6WhZgX5f3jBJs7uxu5x
         aftQ==
X-Gm-Message-State: ANoB5plw4W43su7jJWNp5VOK3OFteSkplWl8kuiS3KyamH68yA9afkJK
        MerIdsOC9fT1vqKiE76huIRUXV6L4bXkZw7N/wDc/A==
X-Google-Smtp-Source: AA0mqf7f2QwpYoZhrJXbE+N2rKFSCBVBB04yCdcyDP8OuCDDdr7IR94kDGkMD/nRweAuG3jI2FFdnQ==
X-Received: by 2002:a17:90a:ba81:b0:219:3e1b:3dc1 with SMTP id t1-20020a17090aba8100b002193e1b3dc1mr37988187pjr.60.1670247291435;
        Mon, 05 Dec 2022 05:34:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q5-20020a17090311c500b00178b6ccc8a0sm10643870plh.51.2022.12.05.05.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:34:50 -0800 (PST)
Message-ID: <638df37a.170a0220.80eac.2c84@mx.google.com>
Date:   Mon, 05 Dec 2022 05:34:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: v6.1-rc8-929-g112502470f50
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 5 runs,
 2 regressions (v6.1-rc8-929-g112502470f50)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 5 runs, 2 regressions (v6.1-rc8-929-g112502470f50)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v6.1=
-rc8-929-g112502470f50/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: v6.1-rc8-929-g112502470f50
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      112502470f50792e9df5df75de0090fbeb7b8500

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/638ddf3731fafa210a2abd16

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/cro=
s-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/cro=
s-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221125.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
8ddf3731fafa210a2abd27
        failing since 111 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
38ddf3731fafa210a2abd29
        failing since 111 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-12-05T12:08:01.441489  / # =

    2022-12-05T12:08:01.447522  =

    2022-12-05T12:08:01.553854  / # #
    2022-12-05T12:08:01.559875  #
    2022-12-05T12:08:01.662532  / # export SHELL=3D/bin/sh
    2022-12-05T12:08:01.668751  export SHELL=3D/bin/sh
    2022-12-05T12:08:01.770861  / # . /lava-8240384/environment
    2022-12-05T12:08:01.776502  . /lava-8240384/environment
    2022-12-05T12:08:01.878586  / # /lava-8240384/bin/lava-test-runner /lav=
a-8240384/0
    2022-12-05T12:08:01.884652  /lava-8240384/bin/lava-test-runner /lava-82=
40384/0 =

    ... (8 line(s) more)  =

 =20
