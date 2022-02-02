Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAAAB4A735A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 15:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbiBBOjq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 09:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiBBOjp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 09:39:45 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD5CC061714
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 06:39:45 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id o16-20020a17090aac1000b001b62f629953so7022329pjq.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 06:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Yp7Y5F/7BDpoC6/FVWTQjjsX7yZ1wqvNzLr/tJPassA=;
        b=5bSthY4SauVCA/ltBnJYgSPWO9XunCbExFkvboy+3iJx9kraFOwG3jc/rg85bMaL9p
         6udG1VTXtkNRWlbEiAFreMsMy1UtBdkJsbREqpTrFKmU/QyyZT6DC5dg4myy72xL5job
         +boWynZJxmiX4J1qT48HQcQ5Gq3I5kD512CYMzBslATGm8Ry6ZnU1rPnE33OLzrjX6+N
         6ndOcw0RooGKOgx3ODsiE15DjTkXpCnKw/DT1gNCEfgWcpqw1WAom+cJcEZeLaZ5OwYP
         sToLBwnoTiRDyzMQu9rYddHq9/MjjFounfO8c/ysqDu79eHR4vDzXnNvC+W+JumGZQIF
         k/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Yp7Y5F/7BDpoC6/FVWTQjjsX7yZ1wqvNzLr/tJPassA=;
        b=UIu2W3b1QErn9D/iX4GUvcCcEoGc4zIpJ+MmdoEiBRO82mKBV+C/O3jywkaiCj5SEZ
         aRkQ/dnzeN2H8wtRGUAjVuYbSQEMLCBoWGTO9cD3Y3PCeHhEfJSWBXnwLc2dX88EP0Ja
         vQWRaAUYlIzc62fFn44DzAtGNDHZw0eF91w7yiDzOWF//GsTuio/Kt0Z1kCCIEgUMg8h
         hmp5yqxON53jFWSUM03/uZWOP4b8yxdeo6qvVWknd7YvHbNkCSM5F5dxsZaYH/NTKkXy
         5VsMwrNwpcRsBh1Ftir2ISQOXtHHMpgIVAFa7G6yareWcDHUYv2EkFNhP2lvvQHgJ1X5
         NHjg==
X-Gm-Message-State: AOAM531770JyJDxhWSlqUjSeOHfJTcOAmsSevl6VVR3qVBE5xeM+fhgf
        9oaGglbm1f3xl6c4Tfk93g9xVckd2X4j+wLF
X-Google-Smtp-Source: ABdhPJyhCNJcz0bgPZp/7pcBZxhKA2xNICUS/MwFn37C/5MUjWLb5UYqV05xBxDNqsUtzD7n6Cmr4w==
X-Received: by 2002:a17:902:d904:: with SMTP id c4mr30522659plz.67.1643812785097;
        Wed, 02 Feb 2022 06:39:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id pc4sm7860712pjb.3.2022.02.02.06.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 06:39:44 -0800 (PST)
Message-ID: <61fa97b0.1c69fb81.3746.2d7a@mx.google.com>
Date:   Wed, 02 Feb 2022 06:39:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-02-02-v5.17-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 47 runs,
 1 regressions (renesas-devel-2022-02-02-v5.17-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 47 runs, 1 regressions (renesas-devel-2022-02-=
02-v5.17-rc2)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig     | reg=
ressions
--------------------+-------+--------------+----------+---------------+----=
--------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+ima | 1  =
        =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-02-v5.17-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-02-v5.17-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3e49e95eb7db25785124b3ea8ed31fecee9381fc =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig     | reg=
ressions
--------------------+-------+--------------+----------+---------------+----=
--------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+ima | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/61fa67840e91d5aab15d6ef6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-02-v5.17-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-02-v5.17-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220128.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61fa67840e91d5aab=
15d6ef7
        new failure (last pass: renesas-devel-2022-01-31-v5.17-rc2) =

 =20
