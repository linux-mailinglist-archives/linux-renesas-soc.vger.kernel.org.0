Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7069515637
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 22:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381116AbiD2VBd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 17:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235476AbiD2VBc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 17:01:32 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31755D39BC
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 13:58:13 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id i62so7372908pgd.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 13:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Hq1Z1P1amcMx1f66FwKRPciOcR9PatM0l3lbjEsWXE8=;
        b=T0RrTRktX3yocU61AmLbtNC1TP5kCYUm2+RUwx4McnRQSAffJhc4iJgm+485t3tvHw
         NkewNI21bGmp2DlHT0oh9779/hoOds+dvIn0w0QPBbnK82LkKjZAicwdCOD0jDEVj2rv
         0na7fHzX4k44Td0fvZ8SGArfg44uBUXSU4p97t04jmW6tP3kaeWhnLWt6wDfMayM/kpa
         qDlJbcrWWFBltjKdOzFAQvMg8EzpdgBcAYwNbmSAeqj6zJWv2/Xoxz6fmzWA/TsVNwPW
         1dvQngdTcVnENWCmxijaSe+/qVwW9cKkE+RoxcaaNBdv35J3HUcwcRUfqkmYnUWvW6Pd
         9xlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Hq1Z1P1amcMx1f66FwKRPciOcR9PatM0l3lbjEsWXE8=;
        b=q+kawNEKjYb+8AltbKxQR5UWhlLjHdqMIbCNWMZ11z3aCkQHG9GHL9P659Pt/ecbBh
         8pT4WCsN3w25gj4eWnTt0vhIGRu/87OA/ktug/4H9bu15itZdjx3icqeKGz9hbhMqPP/
         Vv+3RDgk3DPI/IYJNi/+ykrmoKe3IR9a9msKMuG2G3C0MkwoBzGjsKOdQkWgq2EdlfRa
         O3RoiNgZreL1+8Ep0N6QwpMUp27fh2HpL2pHJ/UQsGOc67AhCZNobreSbgMDmibvw6Fu
         NWv0ER1MqF1nZzQ4DydP/07mHx67+AE9BYwgk+alk9gV+IZVIh/Z9Id6kQSDAhvpMAvI
         89Cw==
X-Gm-Message-State: AOAM530oNX8Dqw2mKr2rulQsJ4n+WdQU0DKmF7akEwcZm7QJmi0TVk8Z
        rXR2apgsdy89XowQnmPubGUVgJXIX6s+mOTimeE=
X-Google-Smtp-Source: ABdhPJx0JKwvc6oPsN52T3m2IsSlhMwBixTmDTgs4hC/6TWs2LW4AzGEIDU2eQXHJozezE+E8k27mw==
X-Received: by 2002:a62:1a0d:0:b0:50a:cf43:d757 with SMTP id a13-20020a621a0d000000b0050acf43d757mr680354pfa.5.1651265892507;
        Fri, 29 Apr 2022 13:58:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e25-20020a656899000000b003c14af5062csm6828290pgt.68.2022.04.29.13.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 13:58:12 -0700 (PDT)
Message-ID: <626c5164.1c69fb81.bbc6d.0b22@mx.google.com>
Date:   Fri, 29 Apr 2022 13:58:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-04-29-v5.18-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 2 runs,
 1 regressions (renesas-devel-2022-04-29-v5.18-rc4)
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

renesas/master igt-kms-rockchip: 2 runs, 1 regressions (renesas-devel-2022-=
04-29-v5.18-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-29-v5.18-rc4/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-29-v5.18-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      32b87add13fcbd8b384a969924720c0f2b30893a

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  d95b12e7e3ed6a22f284afbc5d2356365b820ea8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  44db0d842c30b59dd88ea1ebcd7106504303eccb =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/626c414500aea3cf14bf6063

  Results:     74 PASS, 15 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220422.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
26c414600aea3cf14bf6109
        new failure (last pass: renesas-devel-2022-04-28-v5.18-rc4)

    2022-04-29T19:46:51.304338  <8>[   45.351971] <LAVA_SIGNAL_TESTSET STOP>
    2022-04-29T19:46:51.340507  <8>[   45.386959] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-04-29T19:46:51.374016  <6>[   45.419931] Console: switching to col=
our dummy device 80x25
    2022-04-29T19:46:51.379412  <14>[   45.426598] [IGT] kms_setmode: execu=
ting
    2022-04-29T19:46:51.391688  IGT-Version: 1.26-g44db0d8 (aarch64) (Linux=
: 5.18.0-rc4 aarch64)<14>[   45.432231] [IGT] kms_setmode: starting subtest=
 basic
    2022-04-29T19:46:51.392782  =

    2022-04-29T19:46:51.394642  Starting subtest: basic
    2022-04-29T19:46:51.398588  Testing: basic 1 connector combinations
    2022-04-29T19:46:51.508628  <14>[   45.553502] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
    2022-04-29T19:46:51.513015  Starting dynamic subtest: pipe-A-eDP-1 =

    ... (141 line(s) more)  =

 =20
