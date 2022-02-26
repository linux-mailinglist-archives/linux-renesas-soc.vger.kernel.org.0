Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE7C4C53C1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Feb 2022 05:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbiBZE67 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Feb 2022 23:58:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiBZE66 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 23:58:58 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD9B13CA3F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 20:58:25 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id u16so6436972pfg.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 20:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UjcxdlD6uxUIQh47a6vhrGeqiocOxTChqSKXD2uEdbc=;
        b=hzBI/RUefKcGC+sfR4nbH1SF3xnxVt4dj49irpPVByWkxn1psxcxx2UxWFwYHdaKhj
         aSd4GSSrcYEE9Wer1QjDYsNSch6bsjAQmHY6ZHGkNGSL04cFkXYXifsQ5mkNmB+B/CYB
         7KNfKrm1veHv9L4s4NrpQIeOW0PZvWzxr0paNIQjlNck8xkgmasjUeOp2woZ/XGvnsl8
         3oovOSnuYqzsfBs6UCxTizdHVMfaT1Py/mhWVwFG64KCApe/E/eVjVBEXtS9opvFyIS/
         zxF7bbmDCiLjMr5tktD4uPM4//ktbprUhQVTnQ+c4n/tvjAo7MujAErspquOzV1b+Dsl
         SnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UjcxdlD6uxUIQh47a6vhrGeqiocOxTChqSKXD2uEdbc=;
        b=0PAfJ7Ea0PA823MhJfqdTOdkDYv+LWsS1qy6WKHmr7iDQoKR4uFxJsPubdHPeYhgt0
         saLZJP+c3L7Xpk13Gy9zfff6Rd/uCh+h720rnGwa3VtWBbOa71VE7XNJ4annSaN++pYr
         RX77otLeEg8SfgzYUzMpuU/ORB/92MLrkvF7fh8FojGvjm91WT7t8VSxpx2d1nnlkMGU
         hnnavjAshhrqMkqWmRpiwcKwWQEHJbbSXiadkz4q1LU+s7lj9JDTSPmUOnFuRkpPB2OC
         Nw2UknmhAh7Ld8GLhjOwF9LgsDysxni5XyLIbAGHST456p0w6Xl1uouXrrdDARmW6bUq
         yN9Q==
X-Gm-Message-State: AOAM533HnaNqbybaFQajwjrBMJbxEcHgREF9KRjR0QBJ1J6Wenni12hx
        qEAsJYyfPoI//OelH9+stQPGuYx8gMXWVPbqYTQ=
X-Google-Smtp-Source: ABdhPJyxPSCYmHIFo5uECGsaN2M+svpP0Tn97hhFaZ/yxBCaDTqAt+sDk0s39IdvCzhx/jDec/w2uQ==
X-Received: by 2002:a63:1456:0:b0:373:c08c:124d with SMTP id 22-20020a631456000000b00373c08c124dmr8963010pgu.363.1645851504745;
        Fri, 25 Feb 2022 20:58:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h12-20020a056a00218c00b004c3a2450acasm5423240pfi.147.2022.02.25.20.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 20:58:24 -0800 (PST)
Message-ID: <6219b370.1c69fb81.40d0d.f35a@mx.google.com>
Date:   Fri, 25 Feb 2022 20:58:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-02-25-v5.17-rc1
Subject: renesas/next igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-next-2022-02-25-v5.17-rc1)
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

renesas/next igt-gpu-panfrost: 1 runs, 1 regressions (renesas-next-2022-02-=
25-v5.17-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-25-v5.17-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-25-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dff7b84b4d2a5df4fb98714257adbb539807d7b9

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  9cb64a757d2ff1e180b1648e611439d94afd697d =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62199d4ddfac16b12fc62976

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220218.1/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/62199d4ddfac16b12fc62979
        failing since 3 days (last pass: renesas-next-2022-02-21-v5.17-rc1,=
 first fail: renesas-next-2022-02-22-v5.17-rc1)

    2022-02-26T03:23:38.600468  <8>[   23.554352] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2022-02-26T03:23:38.633093  <6>[   23.589307] Console: switching to col=
our dummy device 80x25
    2022-02-26T03:23:38.638300  <14>[   23.595974] [IGT] panfrost_submit: e=
xecuting
    2022-02-26T03:23:38.653325  IGT-Version: 1.26-g9cb64a7 (aarch64) (Linux=
: 5.17.0-rc1 aarch64)<14>[   23.602308] [IGT] panfrost_submit: starting sub=
test pan-unhandled-pagefault
    2022-02-26T03:23:38.653817  =

    2022-02-26T03:23:38.659385  Starting subtest: pan-unhandled-pagefault
    2022-02-26T03:23:38.777741  (panfrost_submit:338) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   23.730756] [IGT] panfrost_submit: exiting, ret=3D98
    2022-02-26T03:23:38.778379  :
    2022-02-26T03:23:38.790824  (panfrost_submit:338) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-02-26T03:23:38.792559  Stack trace: =

    ... (15 line(s) more)  =

 =20
