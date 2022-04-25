Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54DBE50E50C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 18:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243150AbiDYQEV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 12:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243138AbiDYQEU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 12:04:20 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48F6C04
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 09:01:14 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id i24so15187366pfa.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=krGVdnBqCS2/16AP+dVKOa0B+FUQcZN4ulpooJwiyQ4=;
        b=cSzUcmnHQ6yhaYwRqth5NIjMiuCag1XkkA3j/Ax/9UFwcOZJIfIDm5qPdXK8qm8rFt
         3cqplzVHpWNRzDiqZcLParlTdL6r2MEv/IAa9RH29buF04aDrnfLtEh+CEZ6ATsMNRMk
         Di4NQ3/L+yrwbSAXmpzLY++ja11Js6ykOcJn3PRk2QNfYROKG5or3mAsB8hqIT5aDuhP
         v8uX9HzDyfhX/l7B2bnde13+Qktm46vFlYfG+4GIfk625R+Mrbr94xntX+SO8KjSRvgB
         Glu68ST2/G6jOzMyyTPrDiCVwbGMrLdtm1jBl4o7JRaxK4n5g7yYyJo5DlaXGrbXzxfP
         pg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=krGVdnBqCS2/16AP+dVKOa0B+FUQcZN4ulpooJwiyQ4=;
        b=UM5/mZjcXnb2/7/gY9v57m+8jcvgUwPviPoP5Ct9iPNLdn8it6g0nRErgosbrTcuDE
         CqEW7TdrBHy00M73u2qOVAzYI0nFphkyAU7d0i0vhes06b0mg/VxLBOT0TkJ50r8ncP3
         xQ7tPOB+LbZSB0KsD8uf6DBbZoNkdNTrWm9srtJd1J2WI5XLtNJL2nzqg9s+gJoc24HU
         LtYrl7b3PNo6sHU5tfA7kzUrK6X6T+S0S0rvJou4GlZ8JG2LLOp77mlA1UNw9Kuqk+LU
         cSzNjCg03Y6/Uz/Fl617QC2pwtuyo7A+5dGWEV/Pq6tytfTACc86fpfPXV2cvYrxQnC8
         hqgg==
X-Gm-Message-State: AOAM533LdjfNNUbwKcifBpj2/fOwNYDzXZqTDLXEmNgnDHbULPxpvu8f
        fLDK5QkmzhNkOUerJfcfSZAC82Yl0Pox/vYKTQg=
X-Google-Smtp-Source: ABdhPJx9e9jwLT4PHO3+5HcBBgk1mJ4YW0Ud6RJSqr0czKR+LXYWwx9YLu7OALhqthL1K0K7n4Npdg==
X-Received: by 2002:a63:5b14:0:b0:39c:d7d5:722e with SMTP id p20-20020a635b14000000b0039cd7d5722emr15634056pgb.478.1650902473489;
        Mon, 25 Apr 2022 09:01:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 19-20020aa79113000000b00505d5d15d80sm12371692pfh.14.2022.04.25.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 09:01:13 -0700 (PDT)
Message-ID: <6266c5c9.1c69fb81.bf73b.db04@mx.google.com>
Date:   Mon, 25 Apr 2022 09:01:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-04-25-v5.18-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master sleep: 5 runs,
 1 regressions (renesas-devel-2022-04-25-v5.18-rc4)
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

renesas/master sleep: 5 runs, 1 regressions (renesas-devel-2022-04-25-v5.18=
-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-25-v5.18-rc4/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-25-v5.18-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      478f2e469bfe9bc7010e78ab874415b0f8549427 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6266b375641106aac2ff945b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-25-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-25-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220422.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6266b375641106aac2ff945c
        new failure (last pass: renesas-devel-2022-04-13-v5.18-rc2) =

 =20
