Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5344B5E5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Feb 2022 00:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiBNXlx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Feb 2022 18:41:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbiBNXlw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Feb 2022 18:41:52 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED60DEEA7C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Feb 2022 15:41:43 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id g1so12100529pfv.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Feb 2022 15:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ri4+DRhXaRTi1dH57FxzpdmcluvcGWdSu0qQH8A6CIo=;
        b=xfiwEMBrXg6miQ7qG1bGM+n1iIThl8n/GEPt/xTz7k2fqmV+nWQc4BGMGtySQe678Q
         arI3ZijN4rvHlXhZtUpGFtrsoRhkkYTPQRA+ptiJSpUyknPRcVBoc3c8BquNsjDq9jhj
         iaE7HJFVSbZHPIAWl1v7qdALas/KiitwJ/spLZdPU8wJD7yvQukeN79LAngthlr3M/Fz
         WTmOFZCeDmCe7BulrBT8K2ZSbjcHxYF9T0dY7AzdS45l+J+MqC5XNt1AwPizsJYpq8Y3
         9umqbU/KtNyB9Kwkc6i4kqxhXYLgllJn2PG88Q0l9GBDn11FlIy3PSyaT5RPqzP3SIDT
         oH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ri4+DRhXaRTi1dH57FxzpdmcluvcGWdSu0qQH8A6CIo=;
        b=Y4rRxFqT0R5/RDuj+uXPQOKgKCrCoIMft5Dl7y3qp0vne4b8Nnjf/HPph1FFFUcQjf
         IUtb04pwHcgmYjSURYTafWrv0JkzgMCQb3KIkRAZU0PLWB872gWprjuF7kMH/jnn+hV5
         v/zXVItcuHC9imKROdXnnx8xQXR+jsmRlRgDCurgR45hOhWLzsg7p36uMZluTjyenSQe
         MLLIGrDpZZWxD7hTkzsXCRDU/kHtGE7vhRrmDtV1X6Xa/2xRCe4RcPYVoNny6YqWMC98
         8pdCy1ZL54Ir+9lpHI+tuqXGglPsuuSUgQqK6B7a+VuryYa1CxF7F1qdBeVt42y9RwBf
         LNFw==
X-Gm-Message-State: AOAM531JH6nsiVCvCjDkU8UrUtFQH8gAU6gdC7rbo/oPNf3nm7ZvXdbv
        WEbFgMHSf0JCVrfSRIWuYXgR/pXgWdElBR7u
X-Google-Smtp-Source: ABdhPJzpkcYwN+Ovfb2kY/vyac5RFfLIPcwEGwTw3oZQmri8RSAUrY6mcBBmsSyWxZ/bI2J2ucngKw==
X-Received: by 2002:a62:e115:: with SMTP id q21mr1148663pfh.40.1644882103287;
        Mon, 14 Feb 2022 15:41:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l2sm14787724pju.52.2022.02.14.15.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 15:41:43 -0800 (PST)
Message-ID: <620ae8b7.1c69fb81.82990.4d50@mx.google.com>
Date:   Mon, 14 Feb 2022 15:41:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-02-14-v5.17-rc4
Subject: renesas/master baseline-nfs: 65 runs,
 1 regressions (renesas-devel-2022-02-14-v5.17-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 65 runs, 1 regressions (renesas-devel-2022-02-=
14-v5.17-rc4)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-14-v5.17-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-14-v5.17-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9fdc161c399720260bca91447c338042a2153996 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/620ab08114a4350586c6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-14-v5.17-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/baseline-nfs-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-14-v5.17-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/baseline-nfs-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220204.0/amd64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/620ab08114a435058=
6c6296d
        new failure (last pass: renesas-devel-2022-02-07-v5.17-rc3) =

 =20
