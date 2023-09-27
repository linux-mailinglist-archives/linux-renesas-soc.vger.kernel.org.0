Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46EFF7B0396
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Sep 2023 14:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbjI0MMT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 08:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbjI0MMT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 08:12:19 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DAEFC
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 05:12:18 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5789de5c677so7316297a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 05:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695816737; x=1696421537; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hyDOgL80NYI4w4UYrbW4loosDSnP0c+H/uNErWE6izA=;
        b=tsq6vYnWg2O320T/Duy+g1hVdPlIF5FPyOpcCBIq7huBa2mwGtD2blRQIBnaES9Dqr
         Di8LmTX7sW04PUbpEXRtLR7YIRWhGWRW1pbkG+M+QOjYLhDJRtMo1F/P8EB23ZgiuCau
         ZaTPs/e9lKijoXktWm4VaYejc2XMc5TPx8Wrj3fSOs9nXTYa6plVotoylyN4YHnMeB52
         siubfzRtjEdgFHak21Si2SHAsxr5NKd9IfW44u1Rp91mwmPDTstLFdRAD96QEhbk0Z0C
         u/YaGK/WfllEN6savs6ZRDtitkHu7XXqiAWfcYqU2YJWf3w003eCqoc0PBSAJoqLsVZz
         4fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695816737; x=1696421537;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyDOgL80NYI4w4UYrbW4loosDSnP0c+H/uNErWE6izA=;
        b=Rw+H0Bl9KfSj1vULCqM3Cz7QdtNbjxyJ9ZOuQPpccPbwpMFLc9wf4nCZfp7RTkfFVk
         hkd6pskgTD6UnWF4Lh0WzXKm5dOYBTVsGSIIaf+PoIcbCi6KLrCz5QCV5mX+F9I6KJMi
         /16wfMLpgTbu61hM9+2H6m0fNvUyDYV3j26P+om6ilUExP31gsy41cAJKUbQc6DEXQEt
         7s78oyB1gBJhlX52Ce5li/MHr1KTL7QcFPUdyQkf0r2z0hsMKvIDcYwdbgvdYz4oMGrh
         iDKpJ5BOJD41DktXhVfVAM2DJGJI59QSp9pnAaVX8wIauwIuhbdyBERssSqos0uPRXRZ
         iwJg==
X-Gm-Message-State: AOJu0Yx5HDqhHYtD/wxmKqKnL3oDTwtePJzjDfXWq45s3KIR21Y8KQT4
        32B6qxNzPyqG1G/RG19iy6SZPK550vLrIivibQUG7g==
X-Google-Smtp-Source: AGHT+IFG3K2Xn5U5XvmFl5IQ+FwRSgDwW3ZtUL6DYJz84whRRfgthzBhUUzZ2rjKeeZ+SVOhEhKH7w==
X-Received: by 2002:a05:6a20:948f:b0:161:3120:e865 with SMTP id hs15-20020a056a20948f00b001613120e865mr1456323pzb.52.1695816737202;
        Wed, 27 Sep 2023 05:12:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g11-20020a63b14b000000b00577cda166ffsm11286623pgp.35.2023.09.27.05.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:12:16 -0700 (PDT)
Message-ID: <65141c20.630a0220.3d5f4.d187@mx.google.com>
Date:   Wed, 27 Sep 2023 05:12:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-09-27-v6.6-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 6 runs,
 1 regressions (renesas-devel-2023-09-27-v6.6-rc3)
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

renesas/master ltp-ipc: 6 runs, 1 regressions (renesas-devel-2023-09-27-v6.=
6-rc3)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-09-27-v6.6-rc3/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-09-27-v6.6-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8ef2954909a55f94e5eb8777c18c1d8b0678e3e7

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  3f0b2176930cf15a26597e28abf4356050136bbe =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65140ffd4573a71f3c8a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-hihope-r=
zg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-hihope-r=
zg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230623.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/65140ffd4573a71f3c8a0a=
45
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =20
