Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C99B6AF872
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 23:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjCGWT5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Mar 2023 17:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjCGWTr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 17:19:47 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859741A493
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2023 14:19:12 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id a7so9029936pfx.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2023 14:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678227552;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sl6c6ZgNxawHiP5lfL6O8RYSNftJ9shldUNWlLp8JTc=;
        b=eFpRy7X/LzUCssfBAqs5iTcFz7wTmwygZVTjAIAkprixi9xdZA6RFzm7HTtci4xaor
         ImY0q0d0bEnJuAlnlNUetnzI9cN3+GWw71ZuvbtN+UEG2zYH91mXimG+0wzVPnE4ojFZ
         VdCoM0JBvsNfKjIgFgRPdTwCfUzQiIOORiZOkRXPvqkqQ9IOhmS6PwAcbl4pVZSjglJq
         lYWhY5n/Yl8mutc2Hg+L9p+X9CjfRpPj2wspTZ/QmUHzan3G85rbVmrdRBQOwA8Gdl7W
         +XJfL4+tgVv3qkUiuwK6eLvW6GD/MNmwxIiJveogG+EmZonsDfKqLOZMEOHlz9B0qdTI
         FiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678227552;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sl6c6ZgNxawHiP5lfL6O8RYSNftJ9shldUNWlLp8JTc=;
        b=RcMYMhI8LPCXabsdvhfuhT0ex7BP+lH0B5KrZ5i1HOgBYEgonfVaJBrcxflsc8xBEt
         JNkiKVULirpzZugAVyIrCMEQYxQEZa8I6ooSF6QR9r/vucuLVuBd1kpbbovvdmXOvIne
         ZvnjF2HzKItnV556KtfJo1yADL/bslQKsWggkDCYCn47/5BN+tGAt0t7ODjQTNLxYv8P
         AG+BK+mB31u3okNIOLUbL1tq22ZNMb7fAPDNhh4zz7dkB/YDkWVl10BxIdSKb4jzPP6/
         QO0u6XRCZDY3TlSFTCR/kiUCYzOxIBPr+iTO98OZ+Z5M16x03vM1cxRhN2oeGnH7tadF
         bp3g==
X-Gm-Message-State: AO0yUKW+2OafD9Vg7FNIhDwUV1z2+wW8v+d2g9s5+g+fvqoWhKZfpmmX
        ib+Oi+g0qtod3QMCLPto+kH4yPHi8VX1G7vhDyv58c90
X-Google-Smtp-Source: AK7set8HsDtkYmbVKAahNod7sv2zUnfRVYNTf1w+eCHLDRn5/Af8mHa71BjhAG0HAlDB6yWF/OYMnA==
X-Received: by 2002:a05:6a00:c8:b0:5d4:e4c8:23ac with SMTP id e8-20020a056a0000c800b005d4e4c823acmr14691956pfj.21.1678227551784;
        Tue, 07 Mar 2023 14:19:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u19-20020a62ed13000000b005b0853a1a3esm8323799pfh.159.2023.03.07.14.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:19:11 -0800 (PST)
Message-ID: <6407b85f.620a0220.e24a6.f4cb@mx.google.com>
Date:   Tue, 07 Mar 2023 14:19:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-03-07-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master v4l2-compliance on uvcvideo: 4 runs,
 1 regressions (renesas-devel-2023-03-07-v6.3-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 4 runs, 1 regressions (renesas-=
devel-2023-03-07-v6.3-rc1)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-07-v6.3-rc1/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-07-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      525eb92e46b94fe4a641aa2f6cc0481874cff436

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  c7823a3f5f8846561d91e7ae77fea82fab63fff1 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6407a5dfeae6eebe6e8c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-07-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230303.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/6407a5dfea=
e6eebe6e8c8658
        new failure (last pass: renesas-devel-2023-03-06-v6.3-rc1) =

 =20
