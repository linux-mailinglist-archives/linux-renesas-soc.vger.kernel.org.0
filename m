Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E67204C0984
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Feb 2022 03:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237571AbiBWCmY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Feb 2022 21:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237270AbiBWCmS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 21:42:18 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BAD70F7D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 18:35:46 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id c9so5432353pll.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 18:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9xLe0HFXy6mHXG4By3gbo80KNJGXsXYkAiGnj+qXCB4=;
        b=oovET6J1XQWcFW12yZ08fYE+gveTSuhjH6X7oMiyAioOzfO9eec1MW9ZKl8x934IZo
         wDWLur3ElAuU9GbQXTVY1FMve4oP45flZu7sJkMP0A4ItDn0oi35saMwHLog0/9SVZfw
         /aveR5MlPte0Vnocotc/LTszUY4AbRbnJCBkNSy0wNM1KO6A381pscrDLGQlW9xfYGxI
         K55A2Oy5caSKHD6tVCKJ+VwJVV7u9//vGXS27+QTOfVluKd4i8DwF4o6BYWjNMZLVEYB
         +Kkg2MKjHcLmEeR0S41vrTok5okvZQnwZ1Cc7TK0v4eNed6yWnJjC7g6a1bmYJSeq6B5
         YXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9xLe0HFXy6mHXG4By3gbo80KNJGXsXYkAiGnj+qXCB4=;
        b=sbUv7tRzwHR5F0TNwcOUrfn8H4DUNkDKAWD/RiKzcNW8Rbf22HeGhwU3rXzoWlP9ix
         HkY9kbKICaNB680idxXMwijJY6rax/vQSocBeM5rABsFNIV7CxO0g/Efr0W2XoLJau7R
         jhh9CWxzwPxGFAOvriob9i4FFN40DewlED7u3oGx/Nn7vR/hXOQx4WdK2L1C3Athbg2K
         9sdfRvI2cG8PmtGPF02P1R++eizXWcgvOQAHvlnDLmLAjrDTHBkoxjW5dfKhgPIYNxCW
         BkEAPRcBC5A1O/8dRejiDCXt3IT5kIS7iaTIp+Gt7N76rthjUCmfccihrjBrQExq0X4P
         6Y0A==
X-Gm-Message-State: AOAM530JAlcnYWKwNs7rzre9lMIsC1SIeNDs1hAl4OEMrTCDaNW6hf+v
        efYRNPTETmL1F1epEvpLJ800VbS4pgRvp3/4
X-Google-Smtp-Source: ABdhPJxGfEzaH/9JtcvLmPUwMQi7uALtiZk+XvWCG34fxszDW2Ob3ek9nnNFaW9gQ9nJRkra2fya/w==
X-Received: by 2002:a17:90a:fe87:b0:1bc:6928:86c7 with SMTP id co7-20020a17090afe8700b001bc692886c7mr7028448pjb.129.1645583744691;
        Tue, 22 Feb 2022 18:35:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z13sm19376603pfe.20.2022.02.22.18.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 18:35:44 -0800 (PST)
Message-ID: <62159d80.1c69fb81.c92bb.4c61@mx.google.com>
Date:   Tue, 22 Feb 2022 18:35:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-02-22-v5.17-rc1
Subject: renesas/next igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-next-2022-02-22-v5.17-rc1)
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
22-v5.17-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-22-v5.17-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-22-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      77494b5c6a736414fb60a82e47e368b133443306

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


  Details:     https://kernelci.org/test/plan/id/62158bb650169f5180c629ca

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-22-v5.17-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-22-v5.17-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220218.1/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/62158bb650169f5180c629cd
        new failure (last pass: renesas-next-2022-02-21-v5.17-rc1)

    2022-02-23T01:10:59.833134  <8>[   23.633768] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2022-02-23T01:10:59.863818  <6>[   23.668298] Console: switching to col=
our dummy device 80x25
    2022-02-23T01:10:59.870241  <14>[   23.675285] [IGT] panfrost_submit: e=
xecuting
    2022-02-23T01:10:59.876470  IGT-Version: 1.26-g9cb64a7 (aarch64) (Linux=
: 5.17.0-rc1 aarch64)
    2022-02-23T01:10:59.895943  <14>[   23.698046] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-02-23T01:10:59.900038  Starting subtest: pan-unhandled-pagefault
    2022-02-23T01:11:00.017365  (panfrost_submit:337) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   23.818795] [IGT] panfrost_submit: exiting, ret=3D98
    2022-02-23T01:11:00.018257  :
    2022-02-23T01:11:00.031122  (panfrost_submit:337) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-02-23T01:11:00.032567  Stack trace: =

    ... (13 line(s) more)  =

 =20
