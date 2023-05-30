Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE5BE715D41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 13:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjE3Lbm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 07:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjE3Lbl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 07:31:41 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8434BFE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:34 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64d44b198baso2958706b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685446293; x=1688038293;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1tKbs254h6xLpRsVD/FS2WO7noQxpndCrrtC1RDto3A=;
        b=o1Dpe4c83em1xsJlm9r/WxdDp7ZFO0ZTvYqzpX1TlnRVNnSY7NXIBm6NHz/f3++Zi4
         cb12kwWZF5jRtkSiuAbTRnmfX9YTlEJqk/daKIzFFdEpkF9O1N17p4sKNA0evlxp9oKm
         JwnNKWQSTkpvFleO7RgowWfTt0EwEmOpriTjAmOSxIbEKJuZlyd5xTchY1o5c6qCcDvd
         EPhoXLnWQE9x+70ZFiOHZtWCi9hl38WQKz0mG2tNJwTLij6u+g3FXWnGoNa7HKGpZbxo
         1cj2YmCCTa9Z3uhylBPsjzTr0WGrPxtfm08v6YRosbaisyOhTRRJMRsq15bs6Fpd/EP0
         kBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446293; x=1688038293;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tKbs254h6xLpRsVD/FS2WO7noQxpndCrrtC1RDto3A=;
        b=JAboQThxna90RfpF3MRaSpxEWaInD8DzYn3OwOFJS88QOqYwahJUgEZUO7ACQpWH3d
         qzygzUn/jVuXyNBDFVrpmKxmAhR07MVc/Qfj1DFl/y8XKc2gX//ZZi8cUT+T7WmXNXlK
         Xx+DDxJRqsGRmSTkZYM3jRnvmxjlPYWDXAK4suM1l6Mi5UmWY/cupEkGstQoZ+kZpD7q
         kDBZsKttrzGOWCeTEFN3XWZFp4pMHtcAHhaIAfjI04mdICxJvogv5E9Rtmn1J/x0IFlH
         VFRtcy4iZK1DqaGVWND2jFVFVLCW1p4OEIhax6LiMBkfj+j0mvdKv7gWiEIYMQLK+oIh
         VGfw==
X-Gm-Message-State: AC+VfDyxHQSafIPegNIF1+rTCZoASa3b+T8pC4KNPh83CLNSIttCCp0Y
        PRyGioDiBcEsHo2Ts5UKJDi/suHDV5xXxlHx52D9Og==
X-Google-Smtp-Source: ACHHUZ73L9h+u2TRh3v+81EzKG7yfpvuh7QQ2VW97R003Sl+v/RzRXca90wvFiAK4n+YywzBGEPr0w==
X-Received: by 2002:a05:6a20:3d28:b0:10b:60c1:2999 with SMTP id y40-20020a056a203d2800b0010b60c12999mr2433565pzi.22.1685446293487;
        Tue, 30 May 2023 04:31:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l25-20020a62be19000000b0064858e255d1sm1455666pff.65.2023.05.30.04.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 04:31:32 -0700 (PDT)
Message-ID: <6475de94.620a0220.f974.27db@mx.google.com>
Date:   Tue, 30 May 2023 04:31:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-30-v6.4-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master cros-ec: 9 runs,
 2 regressions (renesas-devel-2023-05-30-v6.4-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 9 runs, 2 regressions (renesas-devel-2023-05-30-v6.=
4-rc4)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-30-v6.4-rc4/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-30-v6.4-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      520bf28625c74fdd976c6c37fb519ccad1cef65b

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475d01f3809d068952e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230527.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6475d01f3809d068952e85=
fb
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ccd63978a6bfb12e8726

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230527.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6475ccd63978a6bfb12e87=
27
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
