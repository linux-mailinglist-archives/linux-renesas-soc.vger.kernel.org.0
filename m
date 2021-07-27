Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7D93D83EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 01:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbhG0XZJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 19:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbhG0XZJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 19:25:09 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AAAC061757
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 16:25:08 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso1481401pjf.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 16:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=riyUiBY4pbEas+Hx8lK7+qMzkYMErztbT6wuNdlW1+c=;
        b=0PvL27W3JW3PwP0TVV9rwfauzqvtCJfLrw01o2Hy+D7edwiOWZg5TQGWxK1GRNkS/f
         oDqC1yeRYDq7Dljtu/HRu+VII4It1CZAgmTA6mQy75N5k8n9rViUWqPnudTwEewKsL+M
         LDWeIk9A24CY2sI9FYWpJVcfpKfCD8aa+QQl0HU5fnkD3I93mcApb0c/Fo1ViO6wt4zZ
         52nnklUS17g3kzzC71momVJTU8aAkobHOqXpFyjCHMFYQeKbc5PiJoRazCVbHc9h9Elg
         2cVokR6iARZVnqjZkQF03RkMZ0+DJtc+nLAY6ZsDniAT4G6zlUXXEqcqxULAyLusMhzs
         qbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=riyUiBY4pbEas+Hx8lK7+qMzkYMErztbT6wuNdlW1+c=;
        b=FW529apM0vKePZ+mkq1x79KNGSLzWmKuslUuV2Eo+fsDzdTLsboZ5m/aOzH3TuuseE
         HLeThKBYZhp96Q6a6PmQjGz6k4P/cFSYGe69lsaT0lXrETG5q9FXpSo99USwHYkZRlQe
         /QOM9ZPUlSQKmfbGyevLL9XE3+MzEI+nQqCFTCsj79WopjbSWpieaK/A+N63zT5ghROa
         SS48Hb3+afonqGgoE+jTIWLAA4no9xFDRMAkUyfxKzU48bmVqRixtFj7WmrTwE6XQtKX
         iDV3igghtcplHZfsTZjNfdWADd8C4R16uXkVHTco9cfz+y8oVuMgDcb80GHzem/5auyZ
         kBjg==
X-Gm-Message-State: AOAM531O2xjMLKW4KOL6/3O4F+6rXzpUvD1SK31Tc2JUiRQZd/wwZDOh
        M6YG1MpJ6IPKK57w7vg1tztdhVyIAeHwn8sy
X-Google-Smtp-Source: ABdhPJzH8lbIK5crHNKBjFDeC/EQflrdusZs3IunMBZTOdToicNl+aKqIJRwiZUNdfdhv4XB5PLcBQ==
X-Received: by 2002:a17:90a:e56:: with SMTP id p22mr24541160pja.73.1627428307318;
        Tue, 27 Jul 2021 16:25:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m11sm1952856pgn.56.2021.07.27.16.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 16:25:06 -0700 (PDT)
Message-ID: <610095d2.1c69fb81.be21d.7e5e@mx.google.com>
Date:   Tue, 27 Jul 2021 16:25:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-07-27-v5.14-rc3
Subject: renesas/master ltp-ipc: 9 runs,
 1 regressions (renesas-devel-2021-07-27-v5.14-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 9 runs, 1 regressions (renesas-devel-2021-07-27-v5.=
14-rc3)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig        | reg=
ressions
----------------+-------+---------------+----------+------------------+----=
--------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto | 1  =
        =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-27-v5.14-rc3/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-27-v5.14-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f9fff2ace3df79f0bd941471e986f0890eb3a5de

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  c7f979b3d688b9dfbcb20cc541ddedfa9b60597f =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig        | reg=
ressions
----------------+-------+---------------+----------+------------------+----=
--------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/61008281dfc1c7be1b501975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-27-v5.14-rc3/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-27-v5.14-rc3/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210722.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/61008281dfc1c7be1b5019=
76
        new failure (last pass: renesas-devel-2021-07-26-v5.14-rc3) =

 =20
