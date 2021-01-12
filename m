Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943C62F3160
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 14:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730772AbhALNSj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 08:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387948AbhALNSg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 08:18:36 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9E2C061786
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 05:17:56 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id v1so1574916pjr.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wffNNAwk4jv0gPgqkywPVKwA21ahCkE4NlfvyXpP7IY=;
        b=169hUC9K0caTTp5UMmpbfuwXafXSiHk1OrlIMcpgJb5L3z6cMWnSYKa7zVCxmjgGho
         C35XOv6rYnH7u+2zx7G85W630vziZT55IZ784yzbfvEwYtyAmwEvXZukWEGNQ9/Mw+gt
         5pSJZtYPq3SC1Zl4xRp/3ZJNFuaVurmTWhTVEF89jM0Bre7xQ55lELWPqJi0GlEqDJqd
         grysU9D+Lchdv/Ti9kifDYCfeVKxh5dJeGDxQnERj3Lq/AEG/kLt6BJSESlfkTfTqaTC
         GZHEbzi/Xd9vH64A1Nc523NKGYLJrLIyp58jEfggn7Vb04CT8s7MsWzk10Cj5C8cN8Bc
         IlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wffNNAwk4jv0gPgqkywPVKwA21ahCkE4NlfvyXpP7IY=;
        b=rLK6U869J2yPZlsAS9N01nlNPPu00dm0swWXM5rkGZHv1mzUMnYuMYbIv6ONITpIRX
         ELFbDO0PTESG2nIR/qtSrjzCtSU+4YGQlb4ht5G5Uu/UeflfTNr+E5o2A6awLr8i77HH
         ciVWn4gvCXyxLaYuTrsJF/tgpufuxYGIxpNUpJpNEgJvJIQT97jWkyCjaNBBprbZm0lw
         Qp4DRh7keSIMcU5IeWJS8VK6aE55SEGKltet+Ie3J+A/Cl2jojILk8e51/hSzO/5MBWU
         PWaSXxF0Mrd/Ja4BN7Af+uebZb+6T2XYiY2Nny6WXTkYebVepzZM5/nOppYjvZinhCQB
         clTg==
X-Gm-Message-State: AOAM531Y6dNmrp6HXy3UgDOwuJ3Ngb/4cl+9F2Fd0EeRzI/kYY/+XKcL
        SXxYZ+CU4RZ5HtSSWko3A7VrDZcQIiGWfQ==
X-Google-Smtp-Source: ABdhPJwANbZT7biElWjwPQqZzp4Ysu8iwsXRTPT0Y0pET4HtXCwAZ5l3h/LvXa9o40VKr66hjjyPUw==
X-Received: by 2002:a17:902:6103:b029:da:c46c:b3d6 with SMTP id t3-20020a1709026103b02900dac46cb3d6mr5149599plj.46.1610457475223;
        Tue, 12 Jan 2021 05:17:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q2sm3236412pjd.33.2021.01.12.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 05:17:54 -0800 (PST)
Message-ID: <5ffda182.1c69fb81.7d878.6258@mx.google.com>
Date:   Tue, 12 Jan 2021 05:17:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-01-11-v5.11-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next sleep: 5 runs,
 2 regressions (renesas-next-2021-01-11-v5.11-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 5 runs, 2 regressions (renesas-next-2021-01-11-v5.11-rc=
1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-01-11-v5.11-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-01-11-v5.11-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ffb284986e56791dcd815b16c03adad3e2f36cbf =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 2          =


  Details:     https://kernelci.org/test/plan/id/5ffd91be5eddecc484c94cba

  Results:     2 PASS, 11 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ro=
ck2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ro=
ck2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1221.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/5ffd91be5eddecc4=
84c94cbd
        new failure (last pass: renesas-next-2020-12-28-v5.11-rc1)

    2021-01-12 12:10:34.361000+00:00  ake: assuming RTC uses UTC ...
    2021-01-12 12:10:34.361000+00:00  rtcwake: read rtc time failed: Invali=
d argument
    2021-01-12 12:10:34.361000+00:00  1 RESULT=3Dfail>
    2021-01-12 12:10:34.362000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-01-12 12:10:34.362000+00:00  rtcwake: read rtc time failed: Invali=
d argument
    2021-01-12 12:10:34.363000+00:00  CASE_ID=3Drtcwake-mem-2 RESULT=3Dfail>
    2021-01-12 12:10:34.363000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-01-12 12:10:34.409000+00:00  rtcwake: read rtc time failed: Invali=
d argument
    2021-01-12 12:10:34.410000+00:00  IGNAL_TESTCASE TEST_CASE_ID=3Drtcwake=
-mem-3 RESULT=3Dfail>
    2021-01-12 12:10:34.410000+00:00  rtcwake: assuming RTC uses UTC ... =

    ... (2 line(s) more)  =


  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/5ffd91be5eddecc4=
84c94cbe
        new failure (last pass: renesas-next-2020-12-28-v5.11-rc1) =

 =20
