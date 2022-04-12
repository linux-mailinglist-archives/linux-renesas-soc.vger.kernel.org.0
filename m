Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3374FCCD0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 05:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238878AbiDLDET (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Apr 2022 23:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiDLDER (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 23:04:17 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B45D65D3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 20:02:01 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id b15so16280042pfm.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jlUgtT7reJWAac2HtizPA7PpLvnXR6MBBdsHHN5m8i8=;
        b=rjjwNx8xYTzL7UwUIVXtvu5Ck1GaUCdFlUUgeofrBvp0o+RsuQCffRaqlDTMNxyRf2
         6+8RHvOUViIOL80fj9BfXBl7tbCpZPiKlETIaGRleWal0Iw22j0RQo/QBrD0f9nA/DIy
         bX/SiThkb9PfElpJQEqr98R8qqw3PTLuYWWrzAuElNNu7lB2oWzjzxadoPQBToaW1rP0
         +TOZl0pHQ2J3DQnoK1swiaUVb7CsLZ+LVr6UtmbNtPzhSDz6gVWjFUSWNi6JxgdYGY0V
         WuIf8oRA27I1axJMS5tkMVDfPlqSN6S3Q/xGwF47qcgtB4brbpnmsNGbrf7bYvBT5fyn
         sU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jlUgtT7reJWAac2HtizPA7PpLvnXR6MBBdsHHN5m8i8=;
        b=5ZLfs/Ib/m1WUeTYu16urWAjpEFxGFTJrNOt89XaR6c5DnquDmqBtrdlsAuEWpeyPN
         aoIHdnOhzTvzEPmcfe/HKabmPjjTg7gPXlNqzRcd3N7lXNbfo791acxrsGVsbMEPguSE
         aT+lmm2NOBkffv5waTJy13IeNkMxMYQD/lte9vXYy/vGLPmd0p2Qj9t/KQ1viflWTsJR
         EQmWH/HpB9/C5OQ9nQzeGzBWM5G54fV2xigkUSu5DQSagZFwpaqitg4l80hp+IqaANo7
         Fqv90T5TcYxxmMM3bfiHsF6V5Mp+t8l2FwwZforLPWjLrZemynObuMQFw5xL6LA3F5Ci
         jcCw==
X-Gm-Message-State: AOAM532mH6NGzqeGhBe095Ggl+wHeTMq1j+1V2yN0a+Nowk1xgCky5Wi
        IwMVSEh1klUPc4KUIO/9PKBwOMUT9T6oEAkw
X-Google-Smtp-Source: ABdhPJzlSdxtiaWXNb5RHcTQERFlWkE+PxIib8avY+pHW+zXGMPJ577rBrSgVkBd6h2/zHU5xIzmOw==
X-Received: by 2002:a05:6a00:1256:b0:4fb:1374:2f65 with SMTP id u22-20020a056a00125600b004fb13742f65mr36240278pfi.72.1649732520814;
        Mon, 11 Apr 2022 20:02:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l1-20020a17090a660100b001cb7cfd8bdbsm832479pjj.43.2022.04.11.20.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 20:02:00 -0700 (PDT)
Message-ID: <6254eba8.1c69fb81.e51d.37ba@mx.google.com>
Date:   Mon, 11 Apr 2022 20:02:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-04-11-v5.18-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 57 runs,
 1 regressions (renesas-next-2022-04-11-v5.18-rc1)
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

renesas/next baseline-nfs: 57 runs, 1 regressions (renesas-next-2022-04-11-=
v5.18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-04-11-v5.18-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-04-11-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      18b3b4968658b20ca316d07f1223223ab92cb072 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6254a7abcba0e867b6ae06ac

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-11-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-11-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220401.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/6254a7abcba0e867b6ae06ce
        failing since 6 days (last pass: renesas-next-2022-02-25-v5.17-rc1,=
 first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-04-11T22:11:40.228521  /lava-6066713/1/../bin/lava-test-case   =

 =20
