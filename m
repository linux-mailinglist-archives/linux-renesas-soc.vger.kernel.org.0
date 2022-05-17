Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 734E552A0D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 13:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242695AbiEQLzl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 07:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344757AbiEQLzj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 07:55:39 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1464C421
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 04:55:38 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id x12so16721715pgj.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 04:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oTHWDWp11bTkEOfQ8fK+/USC4cdm+813pHDGZBzsSO8=;
        b=mW8xReIFPei7MO8CifVYJ34BKEBllyuKmNyKGMSIJUEb0+tDcliu6Uujzkb2ykTPdt
         OPoK8G9IGIVixdXJJ7omQc1Vs9yhrq+NIIYrUQZfZIgGNJlSTB9DbLcvl8Hmz90v5V2Z
         G2mKUBAcn1N/uYcbsPKUjS1KTT0JiB4O+AfGTxpwfhcS4CYgQcVTJ/sMqyF6zOsnPUvQ
         mR83yHaUeqOpCygSeJ7t/3LXIaKt8n8c+8cYMLaD2Gx2kDfyNwfhWL58dqdIHAiOpLKA
         gPBx+Q3vDQICS9GTG+HpK624LO8KlTncJy8FuNMxnm/UQ8bHaj3Vo29EMbS0t6KFUeLF
         2fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oTHWDWp11bTkEOfQ8fK+/USC4cdm+813pHDGZBzsSO8=;
        b=KmjuYwxdze2YuG6/HXokP42ifq+Ex6GLowv5S3xeez+5QRnbdgG+oKDa3rJDbMIJOw
         bg4VBJS1RQPB0YWcbxdOicDapkDBf1Aizr9bXNgekfSTr6Mb1GpYugZ/ZGBa1AukeurN
         TlNpR+YglYS2nBpu9JtV+ou4DSPnhUXCd2QxwJ/REqnv32OWT9aKsuBDlhkic8MVkCT9
         opdY7oIv8KEx9MKX5Kz8b5U1BTzxstzxuYMnlkr3zvn8qXceGQ2g+mHe/eGt8GkBuWg2
         qMGlnTuIiU1MxzfSpgBBmGq5ogmntqHCBHSwCLLXcH1y+skkZRb5Nh30kGQNxp6KxpfX
         a+OQ==
X-Gm-Message-State: AOAM5300pS3rAmmLTZrZ8s3M8ibRebemwL6aZkcpjX9t43Xj6cBrMV/L
        srmMsFm8RDw5BJkUXE3CJuEC9EBSWnlWKsR/zJc=
X-Google-Smtp-Source: ABdhPJzkNU0B+ork1XIpB2JmpCVuWSrUxspTfpSnDmbEJPmJZx32DPJZ/T72PXSdNoKdQ42sSe/hCg==
X-Received: by 2002:a63:f646:0:b0:3db:7288:9ab5 with SMTP id u6-20020a63f646000000b003db72889ab5mr19210665pgj.290.1652788537920;
        Tue, 17 May 2022 04:55:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b10-20020a170902650a00b0015e8d4eb269sm8718937plk.179.2022.05.17.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 04:55:37 -0700 (PDT)
Message-ID: <62838d39.1c69fb81.8ad8e.5c2e@mx.google.com>
Date:   Tue, 17 May 2022 04:55:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-05-17-v5.18-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 20 runs,
 1 regressions (renesas-devel-2022-05-17-v5.18-rc7)
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

renesas/master ltp-ipc: 20 runs, 1 regressions (renesas-devel-2022-05-17-v5=
.18-rc7)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-17-v5.18-rc7/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-17-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6bd98cbba53cd9f63aaf4d82982dff95c824b92a

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  17e9ae697a340242c49188ace12a60cd3bc95a53 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62837e6f6e9cc706d1a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/l=
tp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/l=
tp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220513.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62837e6f6e9cc706d1a39b=
cf
        failing since 0 day (last pass: renesas-devel-2022-05-09-v5.18-rc6,=
 first fail: renesas-devel-2022-05-16-v5.18-rc7) =

 =20
