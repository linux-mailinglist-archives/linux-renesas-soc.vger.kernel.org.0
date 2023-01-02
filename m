Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BABE65B33A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jan 2023 15:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbjABOMj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Jan 2023 09:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjABOMi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jan 2023 09:12:38 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43282658D
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Jan 2023 06:12:37 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so28285690pjj.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jan 2023 06:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NGNEIoDtZJRgcZWUUK7cEeqn/GV+9HeXWHUaMQnG770=;
        b=Eh0HVk80A78BeAoOs5NQgm5M4M1LuflWmuSsE9iTcM17DC+ff+RjKReEiEKR/8E+O4
         EQSUEA32KeaNqrIhtx1i+vFUsTTPUGmFFqPl/x/Hxb51BpqQ2uevK9VyQj97LJXvBL6V
         +fZdaG/MVeuOT7pH1vbk/HRREXrhsizspgo7wzAqbLxccBT2tCiEUWWc4Cg+mpty3G8c
         bleBzJsM8G0bGn8s5uoQQcI9cvXOP23CdZUZMK+VTGIXhgHHUqRLWTCJuD0XdF4qjj2L
         PY0OMCQkOrE4lmMmhEn1nbdwwO6OBVswLjWj5zihVBCdHQSHiPC9V6tNeU8YHU9AXnGx
         mNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGNEIoDtZJRgcZWUUK7cEeqn/GV+9HeXWHUaMQnG770=;
        b=RONonsPhPF/UFDudPQ0LLWfORmHccatk0/LQCAzkc3xkJyDleTCpL0bpxekWNyyT9h
         cmMACfvLIQpsfGOKzVfBKbFEdWXUlj1cQVZHkrVg5wmCBEOx9XnCfK29Mbx7/tZqv4wc
         WWh43RuimrYbYjuG00XoEL10D8WPNe6jifRhpBeKynv0AX+J2RqVUISEieSdFP7ZQf+v
         YV5GWl75BL1Eyg6fFzyt+uc/cy2zqPlABg5+XVSoLc8EEjxuOAtXqiatN/T6MbFqtTP7
         gz/ojVEjlP2H09B90SO02O8fQC/cS8sOxZXPyenc84YMw7rxyhY/8cKUPpcc7SdiL9fG
         b4AQ==
X-Gm-Message-State: AFqh2kpIEoTWdMXXL0UVLqTT2kHrHHdws83gzIKKirLIuMYThfsYAM15
        M41ImuJzfdxrDqAj28admGx8uVf8ku7oHbsSID8=
X-Google-Smtp-Source: AMrXdXvCxsG2wjXIVOQ+WK642vjPoz/52gVxzZ6F5Ee7YqG37A+KXZ9qHSiGnyuMEgFOmZOmInBeIg==
X-Received: by 2002:a17:902:c102:b0:192:8e05:1505 with SMTP id 2-20020a170902c10200b001928e051505mr23826841pli.31.1672668756424;
        Mon, 02 Jan 2023 06:12:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i9-20020a170902cf0900b0018999a3dd7esm20138830plg.28.2023.01.02.06.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 06:12:36 -0800 (PST)
Message-ID: <63b2e654.170a0220.2d0b9.0b91@mx.google.com>
Date:   Mon, 02 Jan 2023 06:12:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-01-02-v6.2-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 140 runs,
 2 regressions (renesas-devel-2023-01-02-v6.2-rc2)
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

renesas/master baseline-nfs: 140 runs, 2 regressions (renesas-devel-2023-01=
-02-v6.2-rc2)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-02-v6.2-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-02-v6.2-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b61285fe1d0f3d98f4780d0889af30b13655c32e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63b2ce66c97da4d4434eee69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221216.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63b2ce66c97da4d44=
34eee6a
        new failure (last pass: renesas-devel-2022-12-12-v6.1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63b2af2ed11f5935374eee31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221216.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63b2af2ed11f59353=
74eee32
        failing since 6 days (last pass: v6.1-rc8-929-g112502470f50, first =
fail: renesas-devel-2022-12-26-v6.2-rc1) =

 =20
