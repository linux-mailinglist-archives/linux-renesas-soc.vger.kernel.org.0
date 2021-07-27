Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE773D6B8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 03:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhG0Avb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 20:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhG0Avb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 20:51:31 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30340C061757
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:31:58 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so2691304pjd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jRIjDi4nJKf2z/bGkJWNr9kay5KWknseI3nMP1jqc3Y=;
        b=i55RP/i6ixEmgre5yEzaD6IRifM0V4zFg2ZZkEeJo0SJ30SCVzyucHZ3ApsfURogxA
         iJgh/NyWqJ3be093HzBQ9tyDcImHo8J4Nh7nvIUj2jJ3fk0ZpFgathHFGGRmf2gakB9S
         x8xIOBAa7DwT/BP16tl4YtkPpSa4+ENXwrzU7oswOulgLtz1ovXreTFV3cmmBbsXsMAc
         pEO2attL7CsGmfulp/EmUWiRlMwnAq17OIWS7rO2YEL4YaLWG4o059LOY1pY0jRgO3pC
         mzxzGvOQys2PG1iEwswyfpyybXZ7+YbtVocfh/4xttPpCqrYiN4krI7H3ERWW/Ddmrzw
         d9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jRIjDi4nJKf2z/bGkJWNr9kay5KWknseI3nMP1jqc3Y=;
        b=Sm2kbx1XbjMica1FcuG0haJJL2135LOcCswmpBQwe071mbIvkVN6z1dmy7PZXYYXjm
         d6PbCmaPAsEUczHj5pumAOHIjw703eQvOM7CsD7b9J0MNEeTjKaQLLDBziSIExCKo6Da
         wipBFA3o320ti3JM1QiDl/VyR4Bk3qr0+bDb66uLmYtuojfqLA5F4GGZj0QJEvgkMfwd
         w52e4rVa2nZx0VqyAfoJ1sLXNeXL2ALyc47iUj6zcdLMtxMVUM6jxnrwOq4XRdwq+bTU
         ZXu5FtJ3+saUE1YGJDjfsQoP5r5OOvFou6RrGyin+qjfCgR25MdZAKoNK+kFLYwOe4CQ
         /AXg==
X-Gm-Message-State: AOAM532XGvxWJoiTqEkMzUkVwxAsozIy9MS+sTteRPSzCPFxmf7TCFiD
        ThkxJW4gFIhVfNrnUu6sI85RczCc9ZjeUHwX
X-Google-Smtp-Source: ABdhPJxY+nGapNiWmuqRU5RImNRlyAdnNwvtrVoUShw7uk93HHKeJB1/I3WgP6RIJa8yRTpyBMy34A==
X-Received: by 2002:a05:6a00:180d:b029:331:bcb5:1589 with SMTP id y13-20020a056a00180db0290331bcb51589mr20628801pfa.27.1627349517539;
        Mon, 26 Jul 2021 18:31:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v27sm1337719pfi.166.2021.07.26.18.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 18:31:57 -0700 (PDT)
Message-ID: <60ff620d.1c69fb81.df901.5adc@mx.google.com>
Date:   Mon, 26 Jul 2021 18:31:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-07-26-v5.14-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 6 runs,
 1 regressions (renesas-devel-2021-07-26-v5.14-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 6 runs, 1 regressions (renesas-devel-2021-07-26-v5.=
14-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-26-v5.14-rc3/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-26-v5.14-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      42d1095acf6e228a6baeec100d31a57c0c4d7704

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  e4c91962f6e19466c1e43629a2c6cd04ff012e06 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/60ff49e27ef38ce9853a2f5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-26-v5.14-rc3/arm64/defconfig/gcc-8/lab-collabora/cros-ec-rk3399-gru-=
kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-26-v5.14-rc3/arm64/defconfig/gcc-8/lab-collabora/cros-ec-rk3399-gru-=
kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20210722.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/60ff49e27ef38ce9853a2f=
5c
        new failure (last pass: renesas-devel-2021-07-19-v5.14-rc2) =

 =20
