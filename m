Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7353B56697E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 13:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiGELdR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 07:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbiGELdK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 07:33:10 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D38167DE
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 04:33:09 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id z27so1301564pff.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 04:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5SW2D5sY1OyoQZMEuVylib8dKJRMCaWtuFv1+kxSYCE=;
        b=6ZXZnXb5v/rwkt5AlzdUIKwixM7BY28vmHQORfM0COEq0J6FDZvKzsam0Nd36wA1zz
         8bMJvx7M0dk9Jl/eIGzChrVLrfn8CfeGmrkl66ViqqCAN5CAjSsG69zVTb4j3ty4+fL4
         tK5WneGBPMEQ7kigwxpYDrlQ6Nv56+vwiRKYJfwlKtHb5en5zQtScMcxz+xfs+S4/hBA
         /VLLn8667X9od6dcDKpy2Hga+C+zDKGV/0d46xL3IrGX9xFWFDBrEdXVMlGA5havvuBj
         jggFBnPQQ9y6nGpsk80I6a8ezOpP5Em1TTocupEsUq8/u/tfT1E9zYvFkiqUC5BK3UNE
         LnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5SW2D5sY1OyoQZMEuVylib8dKJRMCaWtuFv1+kxSYCE=;
        b=gNUwEYzqDv5Hedkc2qTXUeB0Y3dDN4ggZkuvF8bRQcsUOanOk3/O9nIZnvuppdsCtF
         E5YpnutwaU1n3uGzBRHdpYdQYW/NsAiZEVXyFwdx9305+qbutImdBQfHwaxCXZgHkEnN
         azZ3A0gwty/xlnrN/tzO0ZfICrrAstPFxX+i010BJkCI/2CNW69zyvtuDaXn9YAuQmEx
         MrG1u5QBWlau8sDOWKjwp912KvQeViyfk0YgthdLFtpxQOAJMlA8pbG9WBiPD7HcI27C
         Ye+/MJ2/jrYQPD5QJnKpC08dLqSKvkhwXFNatGHuy1ELksRnqQlmXQlsaJN7NjqLJUB3
         /4qA==
X-Gm-Message-State: AJIora/NMlU9dKd6QzE1Arj5RQ2mjGB+HZOcPfjjL0ogVEu/Nuc+BUUZ
        YCwuDMP1T2tDflwDU6ANW2VZ1sw/ABPcm9TQ
X-Google-Smtp-Source: AGRyM1tkHDgHWuKnachFQIpBaBZ8iobkwBm7w9KRBZAPZgzXoQwHiwaRcPRQJGoxKDQKwHHgYJRA/w==
X-Received: by 2002:a63:8bc7:0:b0:412:6f2e:9cf1 with SMTP id j190-20020a638bc7000000b004126f2e9cf1mr2930946pge.544.1657020788987;
        Tue, 05 Jul 2022 04:33:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 200-20020a6214d1000000b00524f29903e0sm22615093pfu.56.2022.07.05.04.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:32:55 -0700 (PDT)
Message-ID: <62c42167.1c69fb81.df97f.ff2b@mx.google.com>
Date:   Tue, 05 Jul 2022 04:32:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-05-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 21 runs,
 1 regressions (renesas-devel-2022-07-05-v5.19-rc5)
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

renesas/master ltp-ipc: 21 runs, 1 regressions (renesas-devel-2022-07-05-v5=
.19-rc5)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig         |=
 regressions
-------------------------+-------+---------+----------+-------------------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | renesas_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-05-v5.19-rc5/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-05-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b83d3c70c208b5154097ddfcf4be9a802b12966e

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  e98f9465925434349d0aa6eb71e81b5464e76df4 =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig         |=
 regressions
-------------------------+-------+---------+----------+-------------------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | renesas_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/62c40df9cf53cc3a54a39bff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/renesas_defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1=
-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm64/renesas_defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1=
-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220610.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62c40df9cf53cc3a54a39c=
00
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4) =

 =20
