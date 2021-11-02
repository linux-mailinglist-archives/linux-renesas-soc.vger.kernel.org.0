Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4667E442F1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Nov 2021 14:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhKBNgT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Nov 2021 09:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbhKBNgT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 09:36:19 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B94C061714
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Nov 2021 06:33:44 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id n23so9512933pgh.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Nov 2021 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=x9bw8CxOAW5BFP9vRPJCvFi8eosKEd7p9JPmNcJzRRI=;
        b=sANVxWPBCGjZhLr6SXPBeFROpH7alZy/HZOzkpCingwE7TyJXGlNXZ+RT4TOV5bBz4
         6t5Kp+Eg/8lIxs73hdsJ5+RD88qUx0TihcK6nQYV9G/nskUIj6jN9CuRDtW9/Pmc7v4i
         rzzeJ/Ir7Zhfal0+MfRZOutYwcBnuYQtpGxjIO0GAKacRuklOIeYRS7ewN8hnOpLlAXt
         uIzrtZBHxhff11wkyhtkSskcy8r6dAlOYx4H23oQCpOkWEuOec/ynZipsmkE7OLefkv/
         id57hQsqZF78/r9aZUyHJWr610i0VbgCMh1NBWp5g71QjWEhlczHPcLkSNsib2zioRVb
         pwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=x9bw8CxOAW5BFP9vRPJCvFi8eosKEd7p9JPmNcJzRRI=;
        b=okNEzbJ1aTqUwKs7XoQxCNhWZlGJ7KVld5XIXtJFSWDbrwtn3eThQigHdJDg8TVvNd
         cM/1BS8vJS+zy8E1bN76wr201J5aJRhyQIAS2AzaHE/JRz1zKc+zdrBYWW9B+k8ue9ex
         6AACNKrhef3MwRUc05k138dUJBymG+8H0mMiHBhRJ5bcsbzOPc6qGmhxh8RQ6OXDdDKI
         Yv4e3IP6BiEYAZPoIW9SgQYYieOgAh20BjxNKMO8FJ9Iiq8qZF4Vp4Hk3uv+jNd5D3Cg
         4SLxX+o7tsvqw5F0u/3ya+sG6I7DE3Rop4TCKNg7tK0AGRX9VW+xOnvRuSfUR7hkkr6/
         VS2Q==
X-Gm-Message-State: AOAM530h3mT3iET/Q+GZvyIsW+2Mpj67ap35/wTBK+nqX9d8FhrKbjo0
        sk0UEnwWO4qjYLg0nzq+qwpmYxeEGgEWn5n9
X-Google-Smtp-Source: ABdhPJwj3/+Jf9udrV/7Io3CpbjGOkN2k6hkq34PJ/rY+lohWoXpOqRkGQ+4mV7pDzFv97TnZ9REzQ==
X-Received: by 2002:a05:6a00:1ad2:b0:47c:8125:4daa with SMTP id f18-20020a056a001ad200b0047c81254daamr36344047pfv.60.1635860023731;
        Tue, 02 Nov 2021 06:33:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id pc18sm3103971pjb.0.2021.11.02.06.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 06:33:43 -0700 (PDT)
Message-ID: <61813e37.1c69fb81.43664.8044@mx.google.com>
Date:   Tue, 02 Nov 2021 06:33:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-11-02-v5.15
X-Kernelci-Report-Type: test
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2021-11-02-v5.15)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-=
devel-2021-11-02-v5.15)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-02-v5.15/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-02-v5.15
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ee746325c55436cdf9cd64a0a06a190fe72678b5

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  9f1d1e0cf8dbdcfb8bc6d817734d85417960a054 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61812e1e42e8828fa43358f7

  Results:     47 PASS, 8 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-02-v5.15/arm64/defconfig/gcc-10/lab-collabora/v4l2-compliance-uvc-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-02-v5.15/arm64/defconfig/gcc-10/lab-collabora/v4l2-compliance-uvc-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20211022.1/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.Streaming-ioctls_Test-input-0.USERPTR-no-poll: http=
s://kernelci.org/test/case/id/61812e1e42e8828fa43358fc
        new failure (last pass: renesas-devel-2021-10-26-v5.15-rc7)

    2021-11-02T12:24:38.201649  		fail: v4l2-test-buffers.cpp(1629): buf.qb=
uf(node)
    2021-11-02T12:24:38.223991  		fail: v4l2-test-buffers.cpp(1732): setupU=
serPtr(node, q)
    2021-11-02T12:24:38.244852  	test USERPTR (no poll): FAIL   =

 =20
