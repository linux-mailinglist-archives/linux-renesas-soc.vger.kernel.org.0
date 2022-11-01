Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36AF7614ADF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Nov 2022 13:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbiKAMjZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 08:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbiKAMjN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 08:39:13 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FF65FFC
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 05:39:12 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u6so13417252plq.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq4eGMapV0MrOZsKruP5H0jYulhcJ6bMiL7W7bh7jgQ=;
        b=38MBwKPdAN6VrwkTB21RWN8MALPZCEifMAfySM3/F0oGnsHTIHTKTfo1Urt+c9XWDV
         6DH5HHJPVM/Uu61pwmhtCzSZpTPjJJ607KYBRupkcRawtlIijscXBH7wyl1waID2GByx
         0LAp5JouwoFxhu5oBaefAIjpCxZEfQkfPQYFPz8uCgaD1ACxkwH8taN4o7qUzqVM9erW
         C2m1n7BmrOWOJNYKhIywWS+SoPbrSfSkt8n342wKMAccOkBwY2Q5RKenqvDCyuWvRv+O
         jNRmw8F9tslQQdES7aIyFGdSwb8xToFEaxBv0RhwAYgOTk9z5luKR9Kr62XF423xAiCn
         GQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sq4eGMapV0MrOZsKruP5H0jYulhcJ6bMiL7W7bh7jgQ=;
        b=R3LWiO5Y5Za33HjCATLwe8/Ym0kFCLFNdrdm4yXTAUiBaBiEB2kEcp263YqZ/0r19C
         1lT7k4i7KiwlCoi4mMdmQG7nOWRuf7SIfpkwZecNF4g5ryJKPCalm+E7RiTEfnF1U/cW
         UTsAFzXp3XCUUNmUNq+Aa400OqWLNTABx0bG0t4KzQQfNZNsJFr8vhMVx6KlOD7vh/8i
         9vOzO5ARbdPb3Tk9RqtD4RKgBXmM36uk4bdFzZ4bvhwZaQ+v/gaoBVkHJdyEMT35UZJa
         /OQemZFEOLD644hTxD8AcCCiQsiUCKuwliiC47TUmaqr1uarzRx/MM+pyDk59KhbXIkD
         Ramw==
X-Gm-Message-State: ACrzQf2rlGVW1ejKU4fsb6czxEOwZNRKgMrtyIWTItIz/N5GsG5/etJH
        kv44p8hWq+RwY1l64BHOnaneLlAvegqooI+P
X-Google-Smtp-Source: AMsMyM6EC83u5GLk50LFGBl2MpemIDohhuFxYnG3xT+7k7xkXSINJEgTXlYG0ldQsiIPVxEFMERXwA==
X-Received: by 2002:a17:90b:180e:b0:213:4abf:ed0a with SMTP id lw14-20020a17090b180e00b002134abfed0amr37751545pjb.119.1667306351750;
        Tue, 01 Nov 2022 05:39:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j11-20020a170902690b00b00186ac812ab0sm6277622plk.83.2022.11.01.05.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:39:11 -0700 (PDT)
Message-ID: <6361136f.170a0220.e18f8.b453@mx.google.com>
Date:   Tue, 01 Nov 2022 05:39:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-11-01-v6.1-rc3
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2022-11-01-v6.1-rc3)
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

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2022-=
11-01-v6.1-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-01-v6.1-rc3/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-01-v6.1-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      484e5fc34235bd38f3d58742e7af8455e2699205

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  82b2b1e8987c182d14fcaf5a3a3b8ee1b4d5e1df
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  9eff5fba09403bf1df3a1edd655b66fa1b60de2e =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6360ffdd67d931d535e7dbd5

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221024.1/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/6360ffdd67d931d535e7dbd8
        new failure (last pass: renesas-devel-2022-10-28-v6.1-rc2)

    2022-11-01T11:15:29.091559  <8>[   34.907928] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2022-11-01T11:15:29.162055  <6>[   34.980877] Console: switching to col=
our dummy device 80x25
    2022-11-01T11:15:29.167531  <14>[   34.988107] [IGT] panfrost_submit: e=
xecuting
    2022-11-01T11:15:29.174851  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc3 aarch64)
    2022-11-01T11:15:29.182508  <14>[   34.999750] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-11-01T11:15:29.186967  Starting subtest: pan-unhandled-pagefault
    2022-11-01T11:15:29.305790  (panfrost_submit:355) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   35.124464] [IGT] panfrost_submit: exiting, ret=3D98
    2022-11-01T11:15:29.306124  :
    2022-11-01T11:15:29.318780  (panfrost_submit:355) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-11-01T11:15:29.320854  Stack trace: =

    ... (18 line(s) more)  =

 =20
