Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA4445FC73
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Nov 2021 04:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbhK0DuN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 22:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234249AbhK0DsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 22:48:13 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3023C061A28
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 18:46:02 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 28so9728420pgq.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 18:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KsCxMLS4/oKN8662+O7FBnbpA+uxsNE162kJutduvco=;
        b=2+RcXmKjpJQCbSKeYD/0pyksXs0TgozAHTiam8LUa9uzWUjvLfccPwS4PhFT/5cEeU
         Q1DOK23HljZlma7feANsA/zPIoKFdRkKd/1YBPlBXqXc84DQ9NCHkokExv0c/cFARwx8
         ryBWlroNc/i0miB7AGoo4Pq5R32l6B6YupzkQ6KXkJrURsyOVLTXFmEPiBhB2xz2+f3i
         66W8l8Ey6ymkJlFD15qF525AZa9KTHLwcc3joHp78AfOc/s3yUAH9n25ARDT5sGMpew7
         AkB4mS9wOR4RTKSR56ki7mAop8z9aGFBLlYVSYZQ/m1pDNkrPasBtZfDMLMoKn2iXn8V
         fZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KsCxMLS4/oKN8662+O7FBnbpA+uxsNE162kJutduvco=;
        b=qucPTYwPZhLl9GTfx43EZZDphys1MDCLfjde574aaY8DZuhduGHajiZyqGL4nyNkSx
         dLWSjtJgx0bf9rkARoyDGcfBQb5R0VA1OTfUFaq2WU5MbI7buYCiQDXiScPjPH+fXCAJ
         kl7Oivaz+wQUWTpGBqv3aKAvq6ToBK1SGfAKcKmn562FT7iwLoyD6gP7VN17/t9tgYw/
         pWMqqO5QGvcNl4Kz3zdvNb6kUKrKCkFkQ/c2kHGniEizy8bNelfudurGRF9LlJfMAg5/
         +G9Qn8TnCagi7txmPyO01fvQNHp6qehT4GKgl1+UAKXYKy2DaC6fseX0/seVhN5y0Yz/
         2trQ==
X-Gm-Message-State: AOAM532tyCOaUYiD0+utLr0dOfdtQuzQauuqtQ4SMAW/6rJqFOQqa6iJ
        r1X3ZicsCChgmbr3xJkMuOtrBveIZGyEv74W
X-Google-Smtp-Source: ABdhPJwVUdcKdwx3D2FYYM3KCAraIPFepzVWemBSOYQ3K+SXs5EpAmSTMLBOYircb491sifS1b64ww==
X-Received: by 2002:a05:6a00:a24:b0:4a7:ea06:5e7e with SMTP id p36-20020a056a000a2400b004a7ea065e7emr18713901pfh.41.1637981162412;
        Fri, 26 Nov 2021 18:46:02 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c2sm8868313pfv.112.2021.11.26.18.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 18:46:02 -0800 (PST)
Message-ID: <61a19bea.1c69fb81.1c700.9194@mx.google.com>
Date:   Fri, 26 Nov 2021 18:46:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-11-26-v5.16-rc2
Subject: renesas/master baseline: 428 runs,
 1 regressions (renesas-devel-2021-11-26-v5.16-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 428 runs, 1 regressions (renesas-devel-2021-11-26-=
v5.16-rc2)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig            =
     | regressions
------------------+------+---------------+----------+----------------------=
-----+------------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig+cr=
ypto | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-26-v5.16-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-26-v5.16-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e6857b805826e5d6f698ac92f4db69feb43afb4c =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig            =
     | regressions
------------------+------+---------------+----------+----------------------=
-----+------------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig+cr=
ypto | 1          =


  Details:     https://kernelci.org/test/plan/id/61a1725eb10f56673a18f74f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-26-v5.16-rc2/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/base=
line-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-26-v5.16-rc2/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/base=
line-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a1725eb10f56673a18f=
750
        new failure (last pass: renesas-devel-2021-11-19-v5.16-rc1) =

 =20
